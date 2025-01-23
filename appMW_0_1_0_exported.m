classdef appMW_0_1_0_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                    matlab.ui.Figure
        DISCONNECTButton            matlab.ui.control.Button
        CONNECTButton               matlab.ui.control.StateButton
        TabGroup                    matlab.ui.container.TabGroup
        CWTab                       matlab.ui.container.Tab
        PowerdBmEditFieldLabel      matlab.ui.control.Label
        PowerdBmEditField           matlab.ui.control.NumericEditField
        FreqGHzEditFieldLabel       matlab.ui.control.Label
        FreqGHzEditField            matlab.ui.control.NumericEditField
        RFSwitchLabel               matlab.ui.control.Label
        RFSwitch                    matlab.ui.control.ToggleSwitch
        SWEEPTab                    matlab.ui.container.Tab
        SWEEPButton                 matlab.ui.control.StateButton
        FreqStartGHzEditFieldLabel  matlab.ui.control.Label
        FreqStartGHzEditField       matlab.ui.control.NumericEditField
        FreqStopGHzEditFieldLabel   matlab.ui.control.Label
        FreqStopGHzEditField        matlab.ui.control.NumericEditField
        DTimemsEditFieldLabel       matlab.ui.control.Label
        DTimemsEditField            matlab.ui.control.NumericEditField
        PointsEditFieldLabel        matlab.ui.control.Label
        PointsEditField             matlab.ui.control.NumericEditField
        RepetitionsEditFieldLabel   matlab.ui.control.Label
        RepetitionsEditField        matlab.ui.control.NumericEditField
        TRIGGERButton               matlab.ui.control.StateButton
        Lamp                        matlab.ui.control.Lamp
        SAVECOUNTSButton            matlab.ui.control.StateButton
        UIAxes                      matlab.ui.control.UIAxes
    end

    
    properties (Access = private)
        anapicoSession = [] % Description
        
        
        rfState = false % Variable to track the current state of RF
        
        daqTriggerSesion = [] % Daq session that handles the trigger that activates sweep
        triggerOutput = [] % variable to store the trigger output for the mw
        
        daqClockSession = [] % Daq clock session that synchronizes to the others 
        
        daqCountsSession = [];
        countsListener = [];
        timeCounts = [];
        dataCounts = [];
        
        daqMwPulseSession = [];
        mwPulseListener = [];
        timePulse = [];
        dataPulse = [];
        
        ctasSweep = [];
        freqSwep = [];
        
    end
    
    methods (Access = private)
        
        function initClockSession(app)
            
            % Create session for the clock
            sClk = daq.createSession('ni');
            % add channel to pulse generation
            ch1Clk = addCounterOutputChannel(sClk, 'Dev1', 'ctr1', 'PulseGeneration');
            
            % Configure pulse generation
            ch1Clk.IdleState = "High";
            ch1Clk.InitialDelay = 1E-3;
            ch1Clk.DutyCycle = 0.5;
            ch1Clk.Frequency = 5E4;
            
            % Set the generation of pulses as continuous
            sClk.IsContinuous = true;
            
            % save the session in the global variable
            app.daqClockSession = sClk;
            
            % start the clock
            startBackground(app.daqClockSession);
            
        end
        
        function initTriggerSession(app)
            
            if isempty(app.daqTriggerSesion)
                % Create session to trrigger the sweep
                sTrg = daq.createSession('ni');
                
                % add channel to release the trigger
                addDigitalChannel(sTrg, 'Dev1', 'port0/line0', 'OutputOnly'); % USER1
                addDigitalChannel(sTrg, 'Dev1', 'port0/line1', 'OutputOnly'); % PFI9
                addDigitalChannel(sTrg, 'Dev1', 'port0/line2', 'OutputOnly'); % PFI10
                
                % synchronise with the clock session
                sTrg.addClockConnection('External', 'Dev1/PFI13', 'ScanClock');
                
                % create the pulse that triggers the mw
                triggerCounters = [zeros(4,1); ones(2,1); zeros(100,1)];
                triggerMwGen = [zeros(102,1); ones(2,1); zeros(2,1)];
                app.triggerOutput = [triggerMwGen, triggerCounters, triggerCounters];
                assignin("base","triggerOut", app.triggerOutput)
                
                % save trigger session as a global variable
                app.daqTriggerSesion = sTrg;
                
            end
        end
        
        function triggerSweep(app)
            if ~isempty(app.daqTriggerSesion)
                disp(3)
                
                % add the trigger output to the queue
                queueOutputData(app.daqTriggerSesion, app.triggerOutput);
                
                % trigger
                startForeground(app.daqTriggerSesion)
            else
                initTriggerSession(app)
                triggerSweep(app)
            end
        end
        
        function initCountsSession(app)
            d = app.anapicoSession;
            % Sesion para cuentas
            sCts = daq.createSession('ni');
            
            % Agregar un canal de entrada para contador APD
            addCounterInputChannel(sCts, 'Dev1', 'ctr0', 'EdgeCount');
            
            % Agregar reloj
            sCts.addClockConnection('External', 'Dev1/PFI13', 'ScanClock');
            
            % Agregar trigger
            addTriggerConnection(sCts,'External','Dev1/PFI9','StartTrigger');
            
            % 2 Min de tiempo de espera maximo para el trigger
            sCts.ExternalTriggerTimeout = 120;
            
            % Configurar rate a la frecuencia del reloj
            sCts.Rate = 5E4;
            
            % Configurar cantidad de datos que activan el listener
            nPoints = app.PointsEditField.Value;
            nRep = app.RepetitionsEditField.Value;
            dTime = (app.DTimemsEditField.Value)/1000;
            
            % Adquirir datos de forma continua
            sCts.IsContinuous = true;
            %sCts.DurationInSeconds = ceil(dTime*nPoints*nRep+1);
            
            sCts.NotifyWhenDataAvailableExceeds = ceil(dTime*nPoints*nRep+1E-3)*5E4;
            
            % Guardar sesion en variable global
            app.daqCountsSession = sCts;
            
            % Listener para guardar datos brutos de cuentas
            app.countsListener = addlistener(app.daqCountsSession, 'DataAvailable', @(src, event) countsProcessing(app, event));
            
            
            
            
            assignin("base","ctsSession",app.daqCountsSession)
            assignin("base","ctsListener",app.countsListener)
            
            disp("Sesión de adquisición de cuentas creada.")
            
        end
        
        function initPulseCountSession(app)
            % iniciar sesion que recibe pulsos desde el generador de funciones
            sPul = daq.createSession('ni');
            
            % Agregar un canal de entrada para contador APD
            addCounterInputChannel(sPul, 'Dev1', 'ctr2', 'EdgeCount');
            
            % Agregar reloj
            sPul.addClockConnection('External', 'Dev1/PFI13', 'ScanClock');
            
            % Agregar trigger
            addTriggerConnection(sPul,'External','Dev1/PFI10','StartTrigger');
            
            % 2 Min de tiempo de espera maximo para el trigger
            sPul.ExternalTriggerTimeout = 120;
            
            % Configurar rate a la frecuencia del reloj
            sPul.Rate = 5E4;
            
            % Tener cuidado con 
            nPoints = app.PointsEditField.Value;
            nRep = app.RepetitionsEditField.Value;
            dTime = (app.DTimemsEditField.Value)/1000;
            
            % Adquirir datos de forma continua
            sPul.IsContinuous = true;
            disp("La sesión de adquisición espera " + ceil(dTime*nPoints*nRep+1E-3)*5E4 + " datos.")
            %sPul.DurationInSeconds = ceil(dTime*nPoints*nRep+1);
            sPul.NotifyWhenDataAvailableExceeds = ceil(dTime*nPoints*nRep+1E-3)*5E4;
            % Guardar sesion en variable global
            app.daqMwPulseSession = sPul;
            
            % Listener para guardar datos brutos de cuentas
            app.mwPulseListener = addlistener(app.daqMwPulseSession, 'DataAvailable', @(src, event) pulsesProcessing(app, event));
            
            
            
            
            assignin("base","pulSession",app.daqMwPulseSession)
            assignin("base","pulListener",app.mwPulseListener)
            
            disp("Sesión de adquisición de pulsos creada.")
            
        end
        
        function countsProcessing(app, event)
            timeCtas = event.TimeStamps;
            dataCtas = event.Data;

            
             app.timeCounts = timeCtas;
             app.dataCounts = diff(dataCtas);
             
             delete(app.countsListener)
            
            
        end
        
        function pulsesProcessing(app, event)
            timeCtasP = event.TimeStamps;
            dataCtasP = diff(event.Data);
            
            app.timePulse = timeCtasP;
            app.dataPulse = dataCtasP;
            
            delete(app.mwPulseListener)
            
            
        end
        
        function getCounts(app)
            
            % Cuentas obtenidas en bruto
            ctasBruto = app.dataCounts;
            
            % Indices en los que se recibe pulso desde MW Gen. para cambiar de frecuencia
            idxCtas = find(app.dataPulse);
            
            % Variables del sweep
            dwellTime = (app.DTimemsEditField.Value)/1000;
            nPoints = app.PointsEditField.Value;
            nReps = app.RepetitionsEditField.Value;
            
            % Crear secuencia de indices para obtener cuentas
            totalElementos = nReps*nPoints;
            
            sequence = repelem((2:totalElementos),2);
            sequence = [1, sequence, totalElementos+1];
            
            % Obtener intervalos de ctas
            intervaloCtas = reshape(idxCtas(sequence),2,[])';
            
            ctasEff = zeros(totalElementos,1);
            
            for i=1:totalElementos
                ctasEff(i) = sum(ctasBruto(intervaloCtas(i,1):intervaloCtas(i,2)));
            end
            
            app.ctasSweep = ctasEff/dwellTime;
            
            
            
        end
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            % create the session for the clock
            initClockSession(app)
            
            % create the session to trigger the mw generator
            initTriggerSession(app)
        end

        % Value changed function: CONNECTButton
        function CONNECTButtonValueChanged(app, event)
            % Create the session
            d = visa('ni', 'USB0::0x03EB::0xAFFF::111-333600000-2111::INSTR')
            % Open the session
            fopen(d)
            % Configure the way you interact
            set(d, 'EOSMode', 'read&write');
            % Display de IDN
            query(d, '*IDN?')
            
            % Update the configuration of CW based on fields of the app
            freqCW = num2str(app.FreqGHzEditField.Value);
            powerCW = num2str(app.PowerdBmEditField.Value);
            
            fprintf(d, 'FREQ %s Ghz\n', freqCW);
            pause(0.2)
            fprintf(d, 'POW %s dBm\n', powerCW);
            pause(0.2)
            
            % Display the current configuration of CW
            disp("The CW frequency is ")
            query(d, 'FREQ?')
            disp("\nThe CW power is ")
            query(d, 'POW?')
            
            % Save the visa object on a global variable
            app.anapicoSession = d;
            
            % activate the lamp and the disconnect button
            app.CONNECTButton.Enable = 'Off';
            app.DISCONNECTButton.Enable = 'on';
            app.TRIGGERButton.Enable = 'on';
            app.Lamp.Enable = 'on';
            
            app.RFSwitch.Enable = 'on';
            app.SWEEPButton.Enable = 'on';
            
            
        end

        % Button pushed function: DISCONNECTButton
        function DISCONNECTButtonPushed(app, event)
            % Get the session
            d = app.anapicoSession;
            
            if ~(isempty(d))
                % Set teh frequency to fixed mode
                fprintf(d, 'FREQ:MODE FIX\n');
                pause(0.1)
                
                % Turn the RF off
                fprintf(d, 'OUTP OFF\n');
                pause(0.1)
                
                % Turn the trigero output off
                fprintf(d, 'LFO:STAT OFF \n');
                pause(0.1)
                
                % Close the session
                fclose(d);
                
                % delete the object associated to the session
                delete(app.anapicoSession)
                app.anapicoSession = [];
                
                % Turn off the lamp and enable the connect button
                app.Lamp.Enable = 'off';
                app.CONNECTButton.Enable = 'on';
                app.DISCONNECTButton.Enable = 'off';
                
                app.RFSwitch.Value = 'Off';
                app.RFSwitch.Enable = 'off';
                app.SWEEPButton.Enable = 'off';
                app.TRIGGERButton.Enable = 'off';
            end
            
            if ~(isempty(app.daqClockSession))
                stop(app.daqClockSession);
                release(app.daqClockSession);
                delete(app.daqClockSession)
                app.daqClockSession = [];
            end
            
            if ~(isempty(app.daqCountsSession))
                stop(app.daqCountsSession);
                release(app.daqCountsSession);
                delete(app.daqCountsSession)
                app.daqCountsSession = [];
                
                if ~(isempty(app.countsListener))
                    delete(app.countsListener);
                    app.countsListener = [];
                end
            end
            
            if ~(isempty(app.daqMwPulseSession))
                stop(app.daqMwPulseSession);
                release(app.daqMwPulseSession);
                delete(app.daqMwPulseSession)
                app.daqMwPulseSession = [];
                
                if ~(isempty(app.mwPulseListener))
                    delete(app.mwPulseListener);
                    app.mwPulseListener = [];
                end
            end
            
            if ~(isempty(app.daqTriggerSesion))
                stop(app.daqTriggerSesion);
                release(app.daqTriggerSesion);
                delete(app.daqTriggerSesion)
                app.daqTriggerSesion = [];
            end
            
            
        end

        % Value changed function: FreqGHzEditField
        function FreqGHzEditFieldValueChanged(app, event)
            % Value registered by user
            value = num2str(app.FreqGHzEditField.Value);
            
            % get the session of the device
            d = app.anapicoSession;
            
            if ~(isempty(d))
                if app.rfState
                    fprintf(d, 'FREQ %s Ghz\n', value);
                end
            end
            
        end

        % Value changed function: PowerdBmEditField
        function PowerdBmEditFieldValueChanged(app, event)
            % Value registered by user
            value = app.PowerdBmEditField.Value;
            
            % get the session of the device
            d = app.anapicoSession;
            
            if ~(isempty(d))
                if app.rfState
                    fprintf(d, 'POW %s Ghz\n', value);
                end
            end
            
        end

        % Value changed function: RFSwitch
        function RFSwitchValueChanged(app, event)
            % Value registered by user
            valueSwitch = app.RFSwitch.Value;
            
            % get the session of the device
            d = app.anapicoSession;
            
            switch valueSwitch
                case 'On'
                    app.rfState = true;
                    
                    % Update the values of freq and pow on the device
                    freqCW = num2str(app.FreqGHzEditField.Value);
                    powerCW = num2str(app.PowerdBmEditField.Value);
                    
                    fprintf(d, 'FREQ %s Ghz\n', freqCW);
                    pause(0.2)
                    fprintf(d, 'POW %s dBm\n', powerCW);
                    pause(0.2)
                    
                    % Activate the rf
                    fprintf(d, 'OUTP ON\n');
                    
                case 'Off'
                    app.rfState = false;
                    
                    % Deactivate rf
                    fprintf(d, 'FREQ:MODE FIX\n');
                    pause(0.2)
                    fprintf(d, 'OUTP OFF\n');
            end
            
        end

        % Value changed function: SWEEPButton
        function SWEEPButtonValueChanged(app, event)
            
            % get the session
            d = app.anapicoSession;
            
            % Sweep Conf.
            freqStart = app.FreqStartGHzEditField.Value;
            freqStop = app.FreqStopGHzEditField.Value;
            dwellTime = (app.DTimemsEditField.Value)/1000;
            nPoints = app.PointsEditField.Value;
            nReps = app.RepetitionsEditField.Value;
            
            app.freqSwep = linspace(freqStart, freqStop, nPoints);
            
            % Freq. start
            fprintf(d, 'FREQ:STAR %s GHz\n', num2str(freqStart));
            pause(0.2)
            % Freq. stop
            fprintf(d, 'FREQ:STOP %s GHz\n', num2str(freqStop));
            pause(0.2)
            % Dwell time
            fprintf(d, 'SWE:DWEL %s s\n', num2str(dwellTime));
            pause(0.2)
            % Points
            fprintf(d, 'SWE:POIN %s \n', num2str(nPoints));
            pause(0.2)
            % Repetitions
            fprintf(d, 'SWE:COUN %s \n', num2str(nReps));
            pause(0.2)
            % disable RF output blanking while waiting for the trigger signal
            fprintf(d, 'SWE:BLAN OFF \n');
            pause(0.2)
            
            
            % Trigger input configuration
            % Source
            fprintf(d,'TRIG:SOUR EXT \n');
            pause(0.2)
            % Trigger type
            fprintf(d,'TRIG:TYPE NORM \n');
            pause(0.2)
            
            % Trigger output configuration
            fprintf(d,'LFO:SOUR TRIG \n');
            pause(0.2)
            fprintf(d,'TRIG:OUTP:MODE POIN \n');
            pause(0.2)
            
            % Handle the RF
            if ~app.rfState
                app.RFSwitch.Value = 'On';
                RFSwitchValueChanged(app)
            end
            
            initCountsSession(app)
            pause(0.2)
            initPulseCountSession(app)
            pause(0.2)
            
            % Iniciar en segundo plano sesion contadores
            startBackground(app.daqCountsSession);
            startBackground(app.daqMwPulseSession);
            
            % set sweep
            pause(0.2)
            fprintf(d, 'FREQ:MODE SWE\n');
            pause(0.2)
            % activate trigger output
            fprintf(d, 'LFO:STAT ON \n');
            
            % send the trigger
            pause(0.2)
            disp("Esperando Trigger")
            
            
        end

        % Value changed function: TRIGGERButton
        function TRIGGERButtonValueChanged(app, event)
            triggerSweep(app)
            disp("TRIGGER")
            
        end

        % Value changed function: SAVECOUNTSButton
        function SAVECOUNTSButtonValueChanged(app, event)
            
            assignin("base","timeCtas",app.timeCounts)
            assignin("base","dataCtas",app.dataCounts)
            
            assignin("base","timePulses", app.timePulse)
            assignin("base","dataPulses", app.dataPulse)
            
            getCounts(app);
            
            assignin("base","ctasSweep",app.ctasSweep)
            
            assignin("base","freqSweep", app.freqSwep)
                        
            % Cerrar sesiones de adquisicion
            stop(app.daqCountsSession)
            release(app.daqCountsSession)
            delete(app.daqCountsSession)
            app.daqCountsSession = [];
            
            if ~(isempty(app.countsListener))
                delete(app.countsListener);
                app.countsListener = [];
            end
            
            stop(app.daqMwPulseSession)
            release(app.daqMwPulseSession)
            delete(app.daqMwPulseSession)
            app.daqMwPulseSession = [];
            
            if ~(isempty(app.mwPulseListener))
                delete(app.mwPulseListener);
                app.mwPulseListener = [];
            end
            
            disp("Sesiones de adquisición de cuentas cerradas.")
            
            
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 1141 764];
            app.UIFigure.Name = 'UI Figure';

            % Create DISCONNECTButton
            app.DISCONNECTButton = uibutton(app.UIFigure, 'push');
            app.DISCONNECTButton.ButtonPushedFcn = createCallbackFcn(app, @DISCONNECTButtonPushed, true);
            app.DISCONNECTButton.BackgroundColor = [0.651 0.1412 0.1686];
            app.DISCONNECTButton.FontSize = 18;
            app.DISCONNECTButton.FontWeight = 'bold';
            app.DISCONNECTButton.FontColor = [1 1 1];
            app.DISCONNECTButton.Enable = 'off';
            app.DISCONNECTButton.Position = [250 634 150 71];
            app.DISCONNECTButton.Text = 'DISCONNECT';

            % Create CONNECTButton
            app.CONNECTButton = uibutton(app.UIFigure, 'state');
            app.CONNECTButton.ValueChangedFcn = createCallbackFcn(app, @CONNECTButtonValueChanged, true);
            app.CONNECTButton.Text = 'CONNECT';
            app.CONNECTButton.BackgroundColor = [0 0 0];
            app.CONNECTButton.FontSize = 18;
            app.CONNECTButton.FontWeight = 'bold';
            app.CONNECTButton.FontColor = [1 1 1];
            app.CONNECTButton.Position = [50 634 150 71];

            % Create TabGroup
            app.TabGroup = uitabgroup(app.UIFigure);
            app.TabGroup.Position = [50 293 465 256];

            % Create CWTab
            app.CWTab = uitab(app.TabGroup);
            app.CWTab.Title = 'CW';

            % Create PowerdBmEditFieldLabel
            app.PowerdBmEditFieldLabel = uilabel(app.CWTab);
            app.PowerdBmEditFieldLabel.HorizontalAlignment = 'right';
            app.PowerdBmEditFieldLabel.FontSize = 18;
            app.PowerdBmEditFieldLabel.FontWeight = 'bold';
            app.PowerdBmEditFieldLabel.Position = [23 135 117 22];
            app.PowerdBmEditFieldLabel.Text = 'Power (dBm)';

            % Create PowerdBmEditField
            app.PowerdBmEditField = uieditfield(app.CWTab, 'numeric');
            app.PowerdBmEditField.Limits = [-35 -9];
            app.PowerdBmEditField.ValueDisplayFormat = '%.3f';
            app.PowerdBmEditField.ValueChangedFcn = createCallbackFcn(app, @PowerdBmEditFieldValueChanged, true);
            app.PowerdBmEditField.FontSize = 18;
            app.PowerdBmEditField.FontWeight = 'bold';
            app.PowerdBmEditField.Position = [155 134 100 23];
            app.PowerdBmEditField.Value = -20;

            % Create FreqGHzEditFieldLabel
            app.FreqGHzEditFieldLabel = uilabel(app.CWTab);
            app.FreqGHzEditFieldLabel.HorizontalAlignment = 'right';
            app.FreqGHzEditFieldLabel.FontSize = 18;
            app.FreqGHzEditFieldLabel.FontWeight = 'bold';
            app.FreqGHzEditFieldLabel.Position = [23 181 97 22];
            app.FreqGHzEditFieldLabel.Text = 'Freq (GHz)';

            % Create FreqGHzEditField
            app.FreqGHzEditField = uieditfield(app.CWTab, 'numeric');
            app.FreqGHzEditField.Limits = [0.001 5.9];
            app.FreqGHzEditField.ValueChangedFcn = createCallbackFcn(app, @FreqGHzEditFieldValueChanged, true);
            app.FreqGHzEditField.FontSize = 18;
            app.FreqGHzEditField.FontWeight = 'bold';
            app.FreqGHzEditField.Position = [155 180 100 23];
            app.FreqGHzEditField.Value = 0.001;

            % Create RFSwitchLabel
            app.RFSwitchLabel = uilabel(app.CWTab);
            app.RFSwitchLabel.HorizontalAlignment = 'center';
            app.RFSwitchLabel.FontSize = 24;
            app.RFSwitchLabel.FontWeight = 'bold';
            app.RFSwitchLabel.Position = [375 130 37 30];
            app.RFSwitchLabel.Text = 'RF';

            % Create RFSwitch
            app.RFSwitch = uiswitch(app.CWTab, 'toggle');
            app.RFSwitch.ValueChangedFcn = createCallbackFcn(app, @RFSwitchValueChanged, true);
            app.RFSwitch.Enable = 'off';
            app.RFSwitch.FontSize = 24;
            app.RFSwitch.FontWeight = 'bold';
            app.RFSwitch.Position = [334 107 34 77];

            % Create SWEEPTab
            app.SWEEPTab = uitab(app.TabGroup);
            app.SWEEPTab.Title = 'SWEEP';

            % Create SWEEPButton
            app.SWEEPButton = uibutton(app.SWEEPTab, 'state');
            app.SWEEPButton.ValueChangedFcn = createCallbackFcn(app, @SWEEPButtonValueChanged, true);
            app.SWEEPButton.Enable = 'off';
            app.SWEEPButton.Text = 'SWEEP';
            app.SWEEPButton.BackgroundColor = [0 0 0];
            app.SWEEPButton.FontSize = 18;
            app.SWEEPButton.FontWeight = 'bold';
            app.SWEEPButton.FontColor = [1 1 1];
            app.SWEEPButton.Position = [304 100 150 71];

            % Create FreqStartGHzEditFieldLabel
            app.FreqStartGHzEditFieldLabel = uilabel(app.SWEEPTab);
            app.FreqStartGHzEditFieldLabel.HorizontalAlignment = 'right';
            app.FreqStartGHzEditFieldLabel.FontSize = 18;
            app.FreqStartGHzEditFieldLabel.FontWeight = 'bold';
            app.FreqStartGHzEditFieldLabel.Position = [16 185 144 22];
            app.FreqStartGHzEditFieldLabel.Text = 'Freq Start (GHz)';

            % Create FreqStartGHzEditField
            app.FreqStartGHzEditField = uieditfield(app.SWEEPTab, 'numeric');
            app.FreqStartGHzEditField.Limits = [0.0001 5.9];
            app.FreqStartGHzEditField.FontSize = 18;
            app.FreqStartGHzEditField.FontWeight = 'bold';
            app.FreqStartGHzEditField.Position = [175 184 100 23];
            app.FreqStartGHzEditField.Value = 0.0008;

            % Create FreqStopGHzEditFieldLabel
            app.FreqStopGHzEditFieldLabel = uilabel(app.SWEEPTab);
            app.FreqStopGHzEditFieldLabel.HorizontalAlignment = 'right';
            app.FreqStopGHzEditFieldLabel.FontSize = 18;
            app.FreqStopGHzEditFieldLabel.FontWeight = 'bold';
            app.FreqStopGHzEditFieldLabel.Position = [18 142 142 22];
            app.FreqStopGHzEditFieldLabel.Text = 'Freq Stop (GHz)';

            % Create FreqStopGHzEditField
            app.FreqStopGHzEditField = uieditfield(app.SWEEPTab, 'numeric');
            app.FreqStopGHzEditField.Limits = [0.0001 5.9];
            app.FreqStopGHzEditField.FontSize = 18;
            app.FreqStopGHzEditField.FontWeight = 'bold';
            app.FreqStopGHzEditField.Position = [175 141 100 23];
            app.FreqStopGHzEditField.Value = 0.001;

            % Create DTimemsEditFieldLabel
            app.DTimemsEditFieldLabel = uilabel(app.SWEEPTab);
            app.DTimemsEditFieldLabel.HorizontalAlignment = 'right';
            app.DTimemsEditFieldLabel.FontSize = 18;
            app.DTimemsEditFieldLabel.FontWeight = 'bold';
            app.DTimemsEditFieldLabel.Position = [19 79 113 22];
            app.DTimemsEditFieldLabel.Text = 'D. Time (ms)';

            % Create DTimemsEditField
            app.DTimemsEditField = uieditfield(app.SWEEPTab, 'numeric');
            app.DTimemsEditField.Limits = [0.05 9000000];
            app.DTimemsEditField.FontSize = 18;
            app.DTimemsEditField.FontWeight = 'bold';
            app.DTimemsEditField.Position = [147 78 100 23];
            app.DTimemsEditField.Value = 50;

            % Create PointsEditFieldLabel
            app.PointsEditFieldLabel = uilabel(app.SWEEPTab);
            app.PointsEditFieldLabel.HorizontalAlignment = 'right';
            app.PointsEditFieldLabel.FontSize = 18;
            app.PointsEditFieldLabel.FontWeight = 'bold';
            app.PointsEditFieldLabel.Position = [19 51 61 22];
            app.PointsEditFieldLabel.Text = 'Points';

            % Create PointsEditField
            app.PointsEditField = uieditfield(app.SWEEPTab, 'numeric');
            app.PointsEditField.Limits = [1 9990];
            app.PointsEditField.FontSize = 18;
            app.PointsEditField.FontWeight = 'bold';
            app.PointsEditField.Position = [147 50 100 23];
            app.PointsEditField.Value = 50;

            % Create RepetitionsEditFieldLabel
            app.RepetitionsEditFieldLabel = uilabel(app.SWEEPTab);
            app.RepetitionsEditFieldLabel.HorizontalAlignment = 'right';
            app.RepetitionsEditFieldLabel.FontSize = 18;
            app.RepetitionsEditFieldLabel.FontWeight = 'bold';
            app.RepetitionsEditFieldLabel.Position = [19 22 104 22];
            app.RepetitionsEditFieldLabel.Text = 'Repetitions';

            % Create RepetitionsEditField
            app.RepetitionsEditField = uieditfield(app.SWEEPTab, 'numeric');
            app.RepetitionsEditField.FontSize = 18;
            app.RepetitionsEditField.FontWeight = 'bold';
            app.RepetitionsEditField.Position = [147 22 100 23];
            app.RepetitionsEditField.Value = 2;

            % Create TRIGGERButton
            app.TRIGGERButton = uibutton(app.SWEEPTab, 'state');
            app.TRIGGERButton.ValueChangedFcn = createCallbackFcn(app, @TRIGGERButtonValueChanged, true);
            app.TRIGGERButton.Enable = 'off';
            app.TRIGGERButton.Text = 'TRIGGER';
            app.TRIGGERButton.BackgroundColor = [1 0.7608 0.051];
            app.TRIGGERButton.FontSize = 18;
            app.TRIGGERButton.FontWeight = 'bold';
            app.TRIGGERButton.Position = [304 9 150 71];

            % Create Lamp
            app.Lamp = uilamp(app.UIFigure);
            app.Lamp.Enable = 'off';
            app.Lamp.Position = [52 716 20 20];

            % Create SAVECOUNTSButton
            app.SAVECOUNTSButton = uibutton(app.UIFigure, 'state');
            app.SAVECOUNTSButton.ValueChangedFcn = createCallbackFcn(app, @SAVECOUNTSButtonValueChanged, true);
            app.SAVECOUNTSButton.Text = 'SAVE COUNTS';
            app.SAVECOUNTSButton.BackgroundColor = [0.9608 0.9608 0.9608];
            app.SAVECOUNTSButton.FontSize = 18;
            app.SAVECOUNTSButton.FontWeight = 'bold';
            app.SAVECOUNTSButton.FontColor = [0.1294 0.1294 0.1294];
            app.SAVECOUNTSButton.Position = [100 100 150 71];

            % Create UIAxes
            app.UIAxes = uiaxes(app.UIFigure);
            title(app.UIAxes, 'Title')
            xlabel(app.UIAxes, 'X')
            ylabel(app.UIAxes, 'Y')
            app.UIAxes.Position = [545 260 544 457];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = appMW_0_1_0_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end