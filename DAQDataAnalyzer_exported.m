classdef DAQDataAnalyzer_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                     matlab.ui.Figure
        GridLayout                   matlab.ui.container.GridLayout
        Panel_2                      matlab.ui.container.Panel
        UIAxes                       matlab.ui.control.UIAxes
        Panel_3                      matlab.ui.container.Panel
        TabGroup                     matlab.ui.container.TabGroup
        SAMPLEINFOTab                matlab.ui.container.Tab
        SampleNameEditFieldLabel     matlab.ui.control.Label
        SampleNameEditField          matlab.ui.control.EditField
        FilterNameEditFieldLabel     matlab.ui.control.Label
        FilterNameEditField          matlab.ui.control.EditField
        PoweruWEditFieldLabel        matlab.ui.control.Label
        PoweruWEditField             matlab.ui.control.NumericEditField
        WavelengthnmEditFieldLabel   matlab.ui.control.Label
        WavelengthnmEditField        matlab.ui.control.NumericEditField
        ScanFreqEditFieldLabel       matlab.ui.control.Label
        ScanFreqEditField            matlab.ui.control.NumericEditField
        Count1DropDownLabel          matlab.ui.control.Label
        Count1DropDown               matlab.ui.control.DropDown
        Count2DropDownLabel          matlab.ui.control.Label
        Count2DropDown               matlab.ui.control.DropDown
        TRACETab                     matlab.ui.container.Tab
        StartTraceButton             matlab.ui.control.Button
        StopTraceButton              matlab.ui.control.StateButton
        IntTimemsEditFieldLabel      matlab.ui.control.Label
        IntTimemsEditField           matlab.ui.control.NumericEditField
        NBufferEditFieldLabel        matlab.ui.control.Label
        NBufferEditField             matlab.ui.control.NumericEditField
        NotifyScansSpinnerLabel      matlab.ui.control.Label
        NotifyScansSpinner           matlab.ui.control.Spinner
        SavingDataSwitchLabel        matlab.ui.control.Label
        SavingDataSwitch             matlab.ui.control.Switch
        StartOptButton               matlab.ui.control.StateButton
        XYRangeEditFieldLabel        matlab.ui.control.Label
        XYRangeEditField             matlab.ui.control.NumericEditField
        ZRangeEditFieldLabel         matlab.ui.control.Label
        ZRangeEditField              matlab.ui.control.NumericEditField
        SwitchCounterOptimization    matlab.ui.control.ToggleSwitch
        SCANTab                      matlab.ui.container.Tab
        StopscanButton               matlab.ui.control.Button
        SaveScanButton               matlab.ui.control.Button
        ScanButton                   matlab.ui.control.Button
        ScanSizeumEditFieldLabel     matlab.ui.control.Label
        ScanSizeumEditField          matlab.ui.control.NumericEditField
        XoffsetEditFieldLabel        matlab.ui.control.Label
        XoffsetEditField             matlab.ui.control.NumericEditField
        YoffsetEditFieldLabel        matlab.ui.control.Label
        YoffsetEditField             matlab.ui.control.NumericEditField
        ScanNpixelsEditFieldLabel    matlab.ui.control.Label
        ScanNpixelsEditField         matlab.ui.control.NumericEditField
        CtimemsEditFieldLabel        matlab.ui.control.Label
        CtimemsEditField             matlab.ui.control.NumericEditField
        StimemsEditFieldLabel        matlab.ui.control.Label
        StimemsEditField             matlab.ui.control.NumericEditField
        ZoffsetEditFieldLabel        matlab.ui.control.Label
        ZoffsetEditField             matlab.ui.control.NumericEditField
        ZOOMTab                      matlab.ui.container.Tab
        ZoomButton                   matlab.ui.control.StateButton
        SavezoomButton               matlab.ui.control.StateButton
        ZoomSizeumEditFieldLabel     matlab.ui.control.Label
        ZoomSizeumEditField          matlab.ui.control.NumericEditField
        ZoomNpixelsEditFieldLabel    matlab.ui.control.Label
        ZoomNpixelsEditField         matlab.ui.control.NumericEditField
        TRACKINGTab                  matlab.ui.container.Tab
        TrackerSwitchLabel           matlab.ui.control.Label
        TrackerSwitch                matlab.ui.control.Switch
        DownToleranceEditFieldLabel  matlab.ui.control.Label
        DownToleranceEditField       matlab.ui.control.NumericEditField
        NBufferOptLabel              matlab.ui.control.Label
        NBufferOptEditField          matlab.ui.control.NumericEditField
        UpToleranceEditFieldLabel    matlab.ui.control.Label
        UpToleranceEditField         matlab.ui.control.NumericEditField
        SaveCoordsButton             matlab.ui.control.StateButton
        CWTab                        matlab.ui.container.Tab
        PowerdBmEditField_2Label     matlab.ui.control.Label
        PowerdBmEditField_2          matlab.ui.control.NumericEditField
        FreqGHzEditFieldLabel        matlab.ui.control.Label
        FreqGHzEditField             matlab.ui.control.NumericEditField
        RFSwitchLabel                matlab.ui.control.Label
        RFSwitch                     matlab.ui.control.ToggleSwitch
        DISCONNECTMWButton           matlab.ui.control.Button
        CONNECTMWButton              matlab.ui.control.StateButton
        LampMW                       matlab.ui.control.Lamp
        ESRTab                       matlab.ui.container.Tab
        SWEEPButton                  matlab.ui.control.StateButton
        FreqStartGHzEditFieldLabel   matlab.ui.control.Label
        FreqStartGHzEditField        matlab.ui.control.NumericEditField
        FreqStopGHzEditFieldLabel    matlab.ui.control.Label
        FreqStopGHzEditField         matlab.ui.control.NumericEditField
        DTimemsEditFieldLabel        matlab.ui.control.Label
        DTimemsEditField             matlab.ui.control.NumericEditField
        PointsEditFieldLabel         matlab.ui.control.Label
        PointsEditField              matlab.ui.control.NumericEditField
        RepetitionsEditFieldLabel    matlab.ui.control.Label
        RepetitionsEditField         matlab.ui.control.NumericEditField
        CyclesEditFieldLabel         matlab.ui.control.Label
        CyclesEditField              matlab.ui.control.NumericEditField
        PowerdBmEditFieldLabel       matlab.ui.control.Label
        PowerdBmEditField            matlab.ui.control.NumericEditField
        STOPSWEEPButton              matlab.ui.control.Button
        SAVESWEEPButton              matlab.ui.control.Button
        LOADSWEEPButton              matlab.ui.control.StateButton
        STDC2EditFieldLabel          matlab.ui.control.Label
        STDC2EditField               matlab.ui.control.NumericEditField
        MeanC2EditFieldLabel         matlab.ui.control.Label
        MeanC2EditField              matlab.ui.control.NumericEditField
        MeanC1EditFieldLabel         matlab.ui.control.Label
        MeanC1EditField              matlab.ui.control.NumericEditField
        STDC1EditFieldLabel          matlab.ui.control.Label
        STDC1EditField               matlab.ui.control.NumericEditField
        TimeScansEditFieldLabel      matlab.ui.control.Label
        TimeScansEditField           matlab.ui.control.NumericEditField
        StepnmEditField              matlab.ui.control.NumericEditField
        UpYButton                    matlab.ui.control.StateButton
        DownYButton                  matlab.ui.control.StateButton
        RightXButton                 matlab.ui.control.StateButton
        LeftXButton                  matlab.ui.control.StateButton
        IncZButton                   matlab.ui.control.StateButton
        DecZButton                   matlab.ui.control.StateButton
        ZSlider                      matlab.ui.control.Slider
        MinZEditFieldLabel           matlab.ui.control.Label
        MinZEditField                matlab.ui.control.NumericEditField
        MaxZEditFieldLabel           matlab.ui.control.Label
        MaxZEditField                matlab.ui.control.NumericEditField
        XEditFieldLabel              matlab.ui.control.Label
        XEditField                   matlab.ui.control.NumericEditField
        YEditFieldLabel              matlab.ui.control.Label
        YEditField                   matlab.ui.control.NumericEditField
        ZEditFieldLabel              matlab.ui.control.Label
        ZEditField                   matlab.ui.control.NumericEditField
        TabGroup2                    matlab.ui.container.TabGroup
        PositionsTab                 matlab.ui.container.Tab
        Goto000Button                matlab.ui.control.StateButton
        SetoffsetButton              matlab.ui.control.StateButton
        RecPos1Button                matlab.ui.control.Button
        RecPos2Button                matlab.ui.control.Button
        AdjustPosButton              matlab.ui.control.Button
        Panel                        matlab.ui.container.Panel
        LoadFigureButton             matlab.ui.control.Button
        ActPanelButton               matlab.ui.control.Button
        SetFigButton                 matlab.ui.control.StateButton
        PrevFigButton                matlab.ui.control.StateButton
        CleanFigButton               matlab.ui.control.StateButton
        SwitchCountPLMap             matlab.ui.control.ToggleSwitch
        MinEditFieldLabel            matlab.ui.control.Label
        MinEditField                 matlab.ui.control.NumericEditField
        MaxEditFieldLabel            matlab.ui.control.Label
        MaxEditField                 matlab.ui.control.NumericEditField
        ZoomSwitchLabel              matlab.ui.control.Label
        ZoomSwitch                   matlab.ui.control.Switch
        Lamp                         matlab.ui.control.Lamp
    end

    
properties (Access = private)
        % VARIABLES ASOCIADAS A LA TRAZA
        
        DAQSessionTrace = [] % Sesion principal de traza
        
        DAQSessionTrace2 = [] % Traza secundaria con reloj externo
        
        TraceAvailableListener % Listener para traza principal al evento 'DataAvailable' 
        
        TraceAvailableListener2  % Listener para traza secundaria al evento 'DataAvailable' 
        
        DataFIFOBufferTraceCount1  % FIFO buffer para recopilar datos de la traza principal
        
        DataFIFOBufferTraceCount2 % FIFO buffer para recopilar datos de la traza secundaria
        
        bufferSizeCount1 % Tamaño del buffer de la traza asociado a la sesion principal
        
        bufferSizeCount2 % Tamaño del buffer de la traza asociado a la sesion secundaria
        
        traceFigure % Handle a figura externa que plotea la traza primaria y secundaria
        
        axesTraceCount1 % Handle de los ejes de figura que plotea traza principal
        
        axesTraceCount2 % Handle de los ejes de figura que plotea traza secundaria
        
        lineTraceCount1 % Handle a la linea del gráfico de traza principal
        
        lineTraceCount2 % Handle a la linea del gráfico de traza secundaria
        
        DAQClkTraceSession = [] % Sesion para reloj interno asociado a traza principal
        %==================================================================================
        %==================================================================================
        
        % VARIABLES ASOCIADAS AL SCAN
        
        DAQScanSession = [] % Sesion para realizar scan
        
        scanListener = []; % Listener que recopila datos del scan
        
        CountdownTimer % Timer pare cuenta regresiva de scan
        
        DAQScanTrace = [] % sesion de traza a ejecutar durante scan
        
        scanTraceListener = []; % Listener para datos recopilados en traza asociada a scan
        
        DataFIFOBufferScanTrace % FIFO buffer para traza asociada a scan
        
        scanTraceFigure % Handle a figura externa que plotea la traza
        
        axesScanTrace % Handle de los ejes de figura que plotea traza
        
        lineScanTrace % Handle a la linea del gráfico
        
        showScanCount1 = true; % Por defecto se muestran datos de contador 1
        
        xCoordCts % Coordenadas de scan en X
        
        yCoordCts % Coordenadas de scan en Y
        
        xCoordsZoom % Coordenadas X recorridas en zoom
        
        yCoordsZoom % Coordenadas Y recorridas en zoom
        
        xOffSetZoom % Centro en X del zoom
        
        yOffSetZoom % Centro en Y del zoom
        
        zOffSetZoom % Centro en Z del zoom
        
        sizeZoom % Tamaño del scan en el zoom
        
        countsMatrixCount1 = [] % Matriz con cuentas de scan en contador 1
        
        countsMatrixCount2 = [] % Matriz con cuentas de scan en contador 2
        
        countsZoomCount1 = [] % Matriz con cuentas de zoom en contador 1
        
        countsZoomCount2 = [] % Matriz con cuentas de zoom en contador 2
        
        isZoom = false; % Variable para distinguir entre zoom y scan
        
        matrixPlot % Variable que almacena gráfico asociado a scan (count. 1 o count. 2)
        
        isClickedDown = false % Variable que controla interacción con mapa PL
        
        hXLine  % Handle para la línea vertical en mapa PL
        
        hYLine  % Handle para la línea horizontal en mapa PL
        
        minColorbar % Valor minimo para escala de color en mapa PL
        
        maxColorbar % Valor máximo para escala de color en mapa PL
        
        % Variables para corregir shift en mapa PL
        Ximg % Coord. X falsa en mapa PL
        
        Yimg % Coord. Y falsa en mapa PL
        
        Xreal % Coord. X real según optimización
        
        Yreal % Coord. Y real según optimización
        %==================================================================================
        %==================================================================================
        
        % VARIABLES ASOCIADAS AL MOVIMIENTO DEL PIEZO
        
        DAQSesionCoordX = [] % Sesion para manejar entrada y salidas de voltajes asociadas a coordenada X
        
        DAQSesionCoordY = [] % Sesion para manejar entrada y salidas de voltajes asociadas a coordenada Y
        
        DAQSesionCoordZ = [] % Sesion para manejar entrada y salidas de voltajes asociadas a coordenada Z
        
        currentVoltX  % Voltaje asociado a posicion actual X
        
        currentVoltY  % Voltaje asociado a posicion actual Y
        
        currentVoltZ  % Voltaje asociado a posicion actual Z
        
        maxVoltPiezo = 0.25 % Voltaje máximo a aplicar al piezo
        
        % Variables auxiliares para desplazar piezo
        voltFinalX = 0
        
        voltFinalY = 0
        
        voltFinalZ = 0
        %==================================================================================
        %==================================================================================
        
        % OPTIMIZACIÓN Y TRACKING
        
        collectCounts = false; % Bandera lógica para dar paso a optimizacion
        
        collectedCountsOpt = []; % variable para acumular cuentas
        
        DataFIFOBufferOptCount1 = []; % Buffer para acumular cuentas durante el tracking con contador 1
        
        DataFIFOBufferOptCount2 = []; % Buffer para acumular cuentas durante el tracking con contador 2
        
        meanTracking; % Variable que actualiza valor medio durante tracking
        
        trackedCoordX = []; % Arreglo que guarda coordenada X optimizada durante el tracking
        
        trackedCoordY = []; % Arreglo que guarda coordenada Y optimizada durante el tracking
        
        trackedCoordZ = []; % Arreglo que guarda coordenada Z optimizada durante el tracking
        
        figTrackedCoords % Handle al gráfico con coordenadas optimizadas durante tracking
        
        axesTrackedCoordX % Handle a los ejes del grafico con coordenadas X optimizadas durante tracking
        
        lineTrackedCoordX % Handle a línea del grafico con coordenadas X optimizadas durante tracking
        
        axesTrackedCoordY % Handle a los ejes del grafico con coordenadas Y optimizadas durante tracking
        
        lineTrackedCoordY % Handle a línea del grafico con coordenadas Y optimizadas durante tracking
        
        axesTrackedCoordZ % Handle a los ejes del grafico con coordenadas Z optimizadas durante tracking
        
        lineTrackedCoordZ % Handle a línea del grafico con coordenadas Z optimizadas durante tracking
        
        axesTrackedCoordXY % Handle a los ejes del grafico con coordenadas XY optimizadas durante tracking
        
        lineTrackedCoordXY % Handle a línea del grafico con coordenadas XY optimizadas durante tracking
        
        timerOptimization % Variable a timer que evalua condiciones para optimizar posicion durante tracking
        
        umbralDownTracker = 1; % Variable que actualiza tolerancia a la caída de cuentas durante tracking
        
        umbralUpTracker = 1; % Variable que actualiza tolerancia a la subida de cuentas durante tracking
        
        optimizeCounter1 = true; % Bandera logica que permite optimizar en contador 1 o 2
        
        ctaMaxZ % Variable que almacena valor máximo de las cuentas en Coord. Z usada como referencia en tracking
        
        figOptX = []; % Figura con cuentas de la optimizacion en coord. X
        
        figOptY = []; % Figura con cuentas de la optimizacion en coord. Y
        
        figOptZ = []; % Figura con cuentas de la optimizacion en coord. Z
        %==================================================================================
        %==================================================================================
        
        LogRequested % Logical value, indicates whether user selected to log data to file from the UI (set by LogdatatofileSwitch)
        LogSaveScan % Valor booleano para guardar datos tomados del scan
        TriggerTime % Acquisition start time stored as datetime
        TempFilename % Temporary binary file name, acquired data is logged to this file during acquisition
        TempFile % Handle of opened binary file, acquired data is logged to this file during acquisition
        Filename = datestr(datetime('now'), 'yyyy-mm-dd_HHMMSS_TRA') % Default MAT file name at app start
        Filepath = pwd % Default folder for saving the MAT file at app start
        %==================================================================================
        %==================================================================================
        
        % VARIABLES ASOCIADAS A GENERADOR DE FUNCIONES
        
        anapicoSession = []; % Variable to store the session of the MW Gen.
        
        daqTriggerSesion = []; % Session to trigger the MW Gen.
        
        DAQScanSweepSession = []; %Session to handle the sweep and scan
        
        freqSwep % List of swept frequencies
        
        triggerOutput % Set of voltage to triggers the daq session and MW Gen.
        
        sweepCountsListener = []; % Listener associated to sweeps
        
        ctasSweep = []; % counts received during the sweep
        
        lineNumber = 0; % Variable to control the number of repetitions did by the MW generator
        
        ctasMeanSweep = [];
        rawData = []
        
        cycleNumber = 1;
        
        axesMeanTrace = []; % media movil
        lineMeanTrace = []; % media movil sublot
        
        movingAverageBuffer = []; % Buffer para media movil
        
        
        rfState = false % Variable to track the current state of RF
        DAQRFSession = []; % Daq session to handle counts acquired while RF is on
        
        RFCountsListener = []; 
        
        DataFIFOBufferRF = [];
        RFFigure = [];
        axesRF = [];
        lineRF = [];
        
        
       
    end
    
    
    
    
    
    
    methods (Access = private)
        
        function processTrace(app, ~, event)
            
        %processTrace Executes on DAQ session DataAvailable event
        %  This callback function gets executed periodically as more data is acquired.
        %  For a smooth live plot update, it stores the latest N seconds
        %  (specified time window) of acquired data and relative timestamps in FIFO
        %  buffers. A live plot is updated with the data in the FIFO buffer.
        %  If data logging option is selected in the UI, it also writes data to a
        %  binary file.
            
            % Verificar si se están guardando los datos
            
            if app.LogRequested
                % If Log data to file switch is on
                data = [event.TimeStamps, event.Data]' ;
                fwrite(app.TempFile, data, 'double');
                if event.TimeStamps(1)==0
                    app.TriggerTime = event.TriggerTime;
                end
            end
        
            %===================================================
            %================== TRAZA APD ======================
        
        
            % Store continuous acquisition data in FIFO data buffers
            app.bufferSizeCount1 = round(abs(app.NBufferEditField.Value));
        
            % Definir variables que determinan tiempo de integración
            timeMs = app.IntTimemsEditField.Value;
            dT = timeMs/(1000*2);
        
            data = mean(diff(event.Data(:,1)))/(2*dT);
        
            if app.collectCounts && app.optimizeCounter1
            app.collectedCountsOpt = [app.collectedCountsOpt; data];
            end
            
            
            app.DataFIFOBufferTraceCount1 = storeDataInFIFO(app, app.DataFIFOBufferTraceCount1, app.bufferSizeCount1, data);
            
            if numel(app.DataFIFOBufferTraceCount1) == app.bufferSizeCount1
                app.MeanC1EditField.Value = mean(app.DataFIFOBufferTraceCount1(1:end));
                app.STDC1EditField.Value = std(app.DataFIFOBufferTraceCount1(1:end));
                
            end
            
            % Update plot data
            %yyaxis(app.axesTraceCount1, 'left');
            set(app.lineTraceCount1 ,'YData', app.DataFIFOBufferTraceCount1);
            drawnow limitrate;
            
            bufferTracker = ceil(app.bufferSizeCount1 * app.NBufferOptEditField.Value/100);
            app.DataFIFOBufferOptCount1 = storeDataInFIFO(app, app.DataFIFOBufferOptCount1, bufferTracker, data);
            
        end
        
        function conditionsOptCount1(app)
            
            % Si las cuentas suben por sobre un umbral actualizar el valor
            % de referencia
            if (numel(app.DataFIFOBufferTraceCount1) == app.bufferSizeCount1) && (app.MeanC1EditField.Value > app.meanTracking * app.umbralUpTracker)
                
                app.meanTracking = app.MeanC1EditField.Value;
                disp("Se ha actualizado la tolerancia de subida " + app.meanTracking * app.umbralUpTracker)
                disp("Tolerancia de bajada " + app.meanTracking * app.umbralDownTracker)
            end
            
            
            % Solo evalúa las condiciones lógicas cuando el tracker está activo
            if (numel(app.DataFIFOBufferTraceCount1) == app.bufferSizeCount1) && (mean(app.DataFIFOBufferOptCount1) < app.meanTracking * app.umbralDownTracker)
                
                % Ejecuta la acción que se desea realizar sin bloquear el flujo de datos
                StartOptButtonValueChanged(app, []);
                
                % Actualizar referencia de trackeo
                app.meanTracking = app.ctaMaxZ;
                
                % Guardar coordenadas trackeadas
                app.trackedCoordX = [app.trackedCoordX; app.XEditField.Value];
                app.trackedCoordY = [app.trackedCoordY; app.YEditField.Value];
                app.trackedCoordZ = [app.trackedCoordZ; app.ZEditField.Value];
                
                set(app.lineTrackedCoordX ,'YData', app.trackedCoordX);
                set(app.lineTrackedCoordY ,'YData', app.trackedCoordY);
                set(app.lineTrackedCoordZ ,'YData', app.trackedCoordZ);
                set(app.lineTrackedCoordXY , 'XData', app.trackedCoordX, 'YData', app.trackedCoordY);
                
                
                disp("Tamaño buffer tracking " + length(app.DataFIFOBufferOptCount1))
                disp("Referencia Opt. " + app.meanTracking)
                disp("Valor tolerancia subida " + app.meanTracking * app.umbralUpTracker)
                disp("Valor tolerancia bajada " + app.meanTracking * app.umbralDownTracker)
                pause(2)
            end
        end
        
        function conditionsOptCount2(app)
            
            % Si las cuentas suben por sobre un umbral actualizar el valor
            % de referencia
            if (numel(app.DataFIFOBufferTraceCount2) == app.bufferSizeCount2) && (app.MeanC2EditField.Value > app.meanTracking * app.umbralUpTracker)
                
                app.meanTracking = app.MeanC2EditField.Value;
                disp("Se ha actualizado la tolerancia de subida " + app.meanTracking * app.umbralUpTracker)
                disp("Tolerancia de bajada " + app.meanTracking * app.umbralDownTracker)
            end
            
            
            % Solo evalúa las condiciones lógicas cuando el tracker está activo
            if (numel(app.DataFIFOBufferTraceCount2) == app.bufferSizeCount2) && (mean(app.DataFIFOBufferOptCount2) < app.meanTracking * app.umbralDownTracker)
                
                % Ejecuta la acción que se desea realizar sin bloquear el flujo de datos
                StartOptButtonValueChanged(app, []);
                app.meanTracking = app.ctaMaxZ;
                
                % Guardar coordenadas trackeadas
                app.trackedCoordX = [app.trackedCoordX; app.XEditField.Value];
                app.trackedCoordY = [app.trackedCoordY; app.YEditField.Value];
                app.trackedCoordZ = [app.trackedCoordZ; app.ZEditField.Value];
                
                set(app.lineTrackedCoordX ,'YData', app.trackedCoordX);
                set(app.lineTrackedCoordY ,'YData', app.trackedCoordY);
                set(app.lineTrackedCoordZ ,'YData', app.trackedCoordZ);
                set(app.lineTrackedCoordXY , 'XData', app.trackedCoordX, 'YData', app.trackedCoordY);
                
                
                disp("Tamaño buffer tracking " + length(app.DataFIFOBufferOptCount2))
                disp("Referencia Opt. " + app.meanTracking)
                disp("Valor tolerancia subida" + app.meanTracking * app.umbralUpTracker)
                disp("Valor tolerancia bajada" + app.meanTracking * app.umbralDownTracker)
                pause(2)
            end
        end

        
        function processTraceCount2(app, ~, event)
            %==========================================================
            %================== TRAZA INFRARROJO ======================
            
            % Store continuous acquisition data in FIFO data buffers
            buffersize = round(abs(app.NBufferEditField.Value));
        
            % Definir variables que determinan tiempo de integración
            timeMs = app.IntTimemsEditField.Value;
            dT = timeMs/(1000*2);
            
            dataInfra = mean(diff(event.Data(:,1)))/(2*dT);
            
            if app.collectCounts && ~(app.optimizeCounter1)
            app.collectedCountsOpt = [app.collectedCountsOpt; dataInfra];
            end
            
            app.DataFIFOBufferTraceCount2 = storeDataInFIFO(app, app.DataFIFOBufferTraceCount2, buffersize, dataInfra);
            
            if numel(app.DataFIFOBufferTraceCount2) == buffersize
                app.MeanC2EditField.Value = mean(app.DataFIFOBufferTraceCount2(1:end));
                app.STDC2EditField.Value = std(app.DataFIFOBufferTraceCount2(1:end));
                
            end
            
            % Update plot data
            %yyaxis(app.axesTraceCount2, 'right');
            set(app.lineTraceCount2 ,'YData', app.DataFIFOBufferTraceCount2);
            drawnow limitrate;
        end
        
        function scanTraceCallback(app, ~, event)
        
            % Store continuous acquisition data in FIFO data buffers
            buffersize = round(abs(app.NBufferEditField.Value));
            
            % Definir variables que determinan tiempo de integración
            timeMs = 2;
            dT = timeMs/(1000*2);
            
            data = mean(diff(event.Data(:,1)))/(2*dT);
            
            
            app.DataFIFOBufferScanTrace = storeDataInFIFO(app, app.DataFIFOBufferScanTrace, buffersize, data);
            
            
            % Update plot data
            set(app.lineScanTrace ,'YData', app.DataFIFOBufferScanTrace);
            drawnow limitrate;
            
        end
        
        % Callback que se ejecuta al cerrar la figura externa
        function closeTraceCallback(app, src, event)
            % Cerrar la sesión de DAQ
            StopTraceButtonValueChanged(app,[])
            % Cerrar la figura
            %delete(src);
        end
        
        function closeScanTraceCallback(app, src, event)
            % Detener adquisición de datos
            stop(app.DAQScanTrace)
            
            % Eliminar e inicializar listener a array vacío
            delete(app.scanTraceListener);
            app.scanTraceListener = [];
            
            % Setear handles de gráfico de traza a array vacios
            delete(app.scanTraceFigure)
            app.scanTraceFigure = [];
            app.axesScanTrace = [];
            app.lineScanTrace = [];
            
            app.DataFIFOBufferScanTrace = [];
            
            
        end
        
        function closeFigRFCallback(app, src, event)
            % Detener adquisición de datos
            stop(app.DAQRFSession)
            
            % Eliminar e inicializar listener a array vacío
            delete(app.RFCountsListener);
            app.RFCountsListener = [];
            
            % Setear handles de gráfico de traza a array vacios
            delete(app.RFFigure)
            app.RFFigure = [];
            app.axesRF = [];
            app.lineRF = [];
            
            app.DataFIFOBufferRF = [];
            
            
        end
        
        function data = storeDataInFIFO(~, data, buffersize, datablock)
        %storeDataInFIFO Store continuous acquisition data in a FIFO data buffer
        %  Storing data in a finite-size FIFO buffer is used to plot the latest "N" seconds of acquired data for
        %  a smooth live plot update and without continuously increasing memory use.
        %  The most recently acquired data (DATABLOCK) is added to the buffer and if the amount of data in the 
        %  buffer exceeds the specified buffer size (BUFFERSIZE) the oldest data is discarded to cap the size of
        %  the data in the buffer to BUFFERSIZE.
        %  input DATA is the existing data buffer (column vector Nx1).
        %  BUFFERSIZE is the desired buffer size (maximum number of rows in DATA buffer) and can be changed.
        %  DATABLOCK is a new data block to be added to the buffer (column vector Kx1).
        %  output DATA is the updated data buffer (column vector Mx1).
        
        % If the data size is greater than the buffer size, keep only the
        % the latest "buffer size" worth of data
        % This can occur if the buffer size is changed to a lower value during acquisition
            if size(data,1) > buffersize
                data = data(end-buffersize+1:end,:);
            end
            
            if size(datablock,1) < buffersize
                % Data block size (number of rows) is smaller than the buffer size
                if size(data,1) == buffersize
                    % Current data size is already equal to buffer size.
                    % Discard older data and append new data block,
                    % and keep data size equal to buffer size.
                    shiftPosition = size(datablock,1);
                    data = circshift(data,-shiftPosition);
                    data(end-shiftPosition+1:end,:) = datablock;
                elseif (size(data,1) < buffersize) && (size(data,1)+size(datablock,1) > buffersize)
                    % Current data size is less than buffer size and appending the new
                    % data block results in a size greater than the buffer size.
                    data = [data; datablock];
                    shiftPosition = size(data,1) - buffersize;
                    data = circshift(data,-shiftPosition);
                    data(buffersize+1:end, :) = [];
                else
                    % Current data size is less than buffer size and appending the new
                    % data block results in a size smaller than or equal to the buffer size.
                    % (if (size(data,1) < buffersize) && (size(data,1)+size(datablock,1) <= buffersize))
                    data = [data; datablock];
                end
            else
                % Data block size (number of rows) is larger than or equal to buffer size
                data = datablock(end-buffersize+1:end,:);
            end
            
        end
        
        function setAppViewState(app, state)
        %setAppViewState Sets the app in a new state and enables/disables corresponding components
        %  STATE can be 'deviceselection', 'configuration', or 'acquisition'
        
            switch state              
                case 'configuration'
                    
                    % Panel Scan
                    app.ScanButton.Enable = 'on';
                    app.SaveScanButton.Enable = 'on';
                    app.StopscanButton.Enable = 'off';
                    app.XoffsetEditField.Enable = 'on';
                    app.YoffsetEditField.Enable = 'on';
                    app.ZoffsetEditField.Enable = 'on';
                    app.ScanSizeumEditField.Enable = 'on';
                    
                    app.Count1DropDown.Enable = 'on';
                    app.Count2DropDown.Enable = 'on';
                    
                    app.ScanNpixelsEditField.Enable = 'on';
                    app.StimemsEditField.Enable = 'on';
                    app.CtimemsEditField.Enable = 'on';
                    app.ScanFreqEditField.Enable = 'on';
                    app.SampleNameEditField.Enable = 'on';
                    app.FilterNameEditField.Enable = 'on';
                    app.PoweruWEditField.Enable = 'on';
                    app.WavelengthnmEditField.Enable = 'on';
                    
                    % Panel coordenadas y traza lasercomp
                    app.XEditField.Enable = 'on';
                    app.YEditField.Enable = 'on';
                    app.ZEditField.Enable = 'on';
                    app.MeanC2EditField.Enable = 'on';
                    app.STDC2EditField.Enable = 'on';
                    
                    % Panel Piezo
                    app.ActPanelButton.Enable = 'off';
                    app.Goto000Button.Enable = 'on';
                    app.RecPos1Button.Enable = 'on';
                    app.RecPos2Button.Enable = 'on';
                    app.StepnmEditField.Enable = 'on';
                    app.UpYButton.Enable = 'on';
                    app.DownYButton.Enable = 'on';
                    app.LeftXButton.Enable = 'on';
                    app.RightXButton.Enable = 'on';
                    app.MinZEditField.Enable = 'on';
                    app.MaxZEditField.Enable = 'on';
                    app.ZSlider.Enable = 'on';
                    app.DecZButton.Enable = 'on';
                    app.IncZButton.Enable = 'on';
                    app.SwitchCountPLMap.Enable = 'on';
                    
                    % Panel Zoom
                    app.LoadFigureButton.Enable = 'on';
                    app.SetoffsetButton.Enable = 'on';
                    app.ZoomButton.Enable = 'on';
                    app.SetFigButton.Enable = 'on';
                    app.PrevFigButton.Enable = 'on';
                    app.SavezoomButton.Enable = 'on';
                    app.CleanFigButton.Enable = 'on';
                    app.ZoomSizeumEditField.Enable = 'on';
                    app.ZoomSwitch.Enable = 'on';
                    app.MinEditField.Enable = 'on';
                    app.MaxEditField.Enable = 'on';
                    app.Panel_2.Visible = 'on';
                    
                    % Paneles de Traza y Optimizacion
                    if ~(isempty(app.DAQSessionTrace)) && app.DAQSessionTrace.IsRunning % Sila traza está funcionando
                        
                        % Panel Traza
                        app.StartTraceButton.Enable = 'off';
                        app.StopTraceButton.Enable = 'on';
                        app.SavingDataSwitch.Enable = 'off';
                        app.NotifyScansSpinner.Enable = 'off';
                        app.IntTimemsEditField.Enable = 'off';
                        app.NBufferEditField.Enable = 'off';
                        app.MeanC1EditField.Enable = 'on';
                        app.STDC1EditField.Enable = 'on';
                        
                        % Paneles Optimizacion
                        app.StartOptButton.Enable = 'on';
                        app.TrackerSwitch.Enable = 'on';
                        app.SwitchCounterOptimization.Enable = 'on';
                        app.NBufferOptEditField.Enable = 'on';
                        app.UpToleranceEditField.Enable = 'on';
                        app.DownToleranceEditField.Enable = 'on';
                        app.XYRangeEditField.Enable = 'on';
                        app.ZRangeEditField.Enable = 'on';
                        app.SaveCoordsButton.Enable = 'on';
                        
                    else
                        
                        % Panel Traza
                        app.StartTraceButton.Enable = 'on';
                        app.StopTraceButton.Enable = 'off';
                        app.SavingDataSwitch.Enable = 'on';
                        app.NotifyScansSpinner.Enable = 'on';
                        app.IntTimemsEditField.Enable = 'on';
                        app.NBufferEditField.Enable = 'on';
                        app.MeanC1EditField.Enable = 'on';
                        app.STDC1EditField.Enable = 'on';
                        
                        % Paneles Optimizacion
                        app.StartOptButton.Enable = 'off';
                        app.TrackerSwitch.Enable = 'off';
                        app.SwitchCounterOptimization.Enable = 'off';
                        app.NBufferOptEditField.Enable = 'on';
                        app.UpToleranceEditField.Enable = 'on';
                        app.DownToleranceEditField.Enable = 'on';
                        app.XYRangeEditField.Enable = 'on';
                        app.ZRangeEditField.Enable = 'on';
                        app.SaveCoordsButton.Enable = 'off';
                        
                    end
                    
                    
                case 'acquisition'
                    app.SavingDataSwitch.Enable = 'off';
                    app.NotifyScansSpinner.Enable = 'off';
                    app.IntTimemsEditField.Enable = 'off';
                    app.NBufferEditField.Enable = 'off';
                    app.StartTraceButton.Enable = 'off';
                    app.StopTraceButton.Enable = 'on';
                    % Optimización
                    app.StartOptButton.Enable = 'on';
                    app.TrackerSwitch.Enable = 'on';
                    app.SwitchCounterOptimization.Enable = 'on';
                    app.NBufferOptEditField.Enable = 'on';
                    app.UpToleranceEditField.Enable = 'on';
                    app.DownToleranceEditField.Enable = 'on';
                    app.XYRangeEditField.Enable = 'on';
                    app.ZRangeEditField.Enable = 'on';
                    
                case 'scanning'
                    % Panel Scan
                    app.ScanButton.Enable = 'off';
                    app.SaveScanButton.Enable = 'off';
                    app.StopscanButton.Enable = 'on';
                    app.XoffsetEditField.Enable = 'off';
                    app.YoffsetEditField.Enable = 'off';
                    app.ZoffsetEditField.Enable = 'off';
                    app.ScanSizeumEditField.Enable = 'off';
                    app.ScanNpixelsEditField.Enable = 'off';
                    
                    app.Count1DropDown.Enable = 'off';
                    app.Count2DropDown.Enable = 'off';
                    
                    app.StimemsEditField.Enable = 'off';
                    app.CtimemsEditField.Enable = 'off';
                    app.ScanFreqEditField.Enable = 'off';
                    app.SampleNameEditField.Enable = 'off';
                    app.FilterNameEditField.Enable = 'off';
                    app.PoweruWEditField.Enable = 'off';
                    app.WavelengthnmEditField.Enable = 'off';
                    
                    % Panel Traza
                    app.StartTraceButton.Enable = 'off';
                    app.StopTraceButton.Enable = 'off';
                    app.SavingDataSwitch.Enable = 'off';
                    app.NotifyScansSpinner.Enable = 'off';
                    app.IntTimemsEditField.Enable = 'off';
                    app.NBufferEditField.Enable = 'off';
                    app.MeanC1EditField.Enable = 'off';
                    app.STDC1EditField.Enable = 'off';
                    
                    % Paneles Optimizacion
                    app.StartOptButton.Enable = 'off';
                    app.TrackerSwitch.Enable = 'off';
                    app.SwitchCounterOptimization.Enable = 'off';
                    app.NBufferOptEditField.Enable = 'off';
                    app.UpToleranceEditField.Enable = 'off';
                    app.DownToleranceEditField.Enable = 'off';
                    app.XYRangeEditField.Enable = 'off';
                    app.ZRangeEditField.Enable = 'off';
                    
                    % Panel coordenadas y traza lasercomp
                    app.XEditField.Enable = 'off';
                    app.YEditField.Enable = 'off';
                    app.ZEditField.Enable = 'off';
                    app.MeanC2EditField.Enable = 'off';
                    app.STDC2EditField.Enable = 'off';
                    
                    % Panel Piezo
                    app.ActPanelButton.Enable = 'off';
                    app.Goto000Button.Enable = 'off';
                    app.RecPos1Button.Enable = 'off';
                    app.RecPos2Button.Enable = 'off';
                    app.AdjustPosButton.Enable = 'off';
                    app.StepnmEditField.Enable = 'off';
                    app.UpYButton.Enable = 'off';
                    app.DownYButton.Enable = 'off';
                    app.LeftXButton.Enable = 'off';
                    app.RightXButton.Enable = 'off';
                    app.MinZEditField.Enable = 'off';
                    app.MaxZEditField.Enable = 'off';
                    app.ZSlider.Enable = 'off';
                    app.DecZButton.Enable = 'off';
                    app.IncZButton.Enable = 'off';
                    app.SwitchCountPLMap.Enable = 'off';
                    
                    % Panel Zoom
                    app.LoadFigureButton.Enable = 'off';
                    app.SetoffsetButton.Enable = 'off';
                    app.ZoomButton.Enable = 'off';
                    app.SetFigButton.Enable = 'off';
                    app.PrevFigButton.Enable = 'off';
                    app.SavezoomButton.Enable = 'off';
                    app.CleanFigButton.Enable = 'off';
                    app.ZoomSizeumEditField.Enable = 'off';
                    app.ZoomSwitch.Enable = 'off';
                    app.MinEditField.Enable = 'off';
                    app.MaxEditField.Enable = 'off';
                    
                    app.Panel_2.Visible = 'off';
                    
                case 'scannerFinished'
                    % Panel Scan
                    app.ScanButton.Enable = 'on';
                    app.SaveScanButton.Enable = 'on';
                    app.StopscanButton.Enable = 'off';
                    app.XoffsetEditField.Enable = 'on';
                    app.YoffsetEditField.Enable = 'on';
                    app.ZoffsetEditField.Enable = 'on';
                    app.ScanSizeumEditField.Enable = 'on';
                    app.ScanNpixelsEditField.Enable = 'on';
                    
                    app.Count1DropDown.Enable = 'on';
                    app.Count2DropDown.Enable = 'on';
                    
                    app.StimemsEditField.Enable = 'on';
                    app.CtimemsEditField.Enable = 'on';
                    app.ScanFreqEditField.Enable = 'on';
                    app.SampleNameEditField.Enable = 'on';
                    app.FilterNameEditField.Enable = 'on';
                    app.PoweruWEditField.Enable = 'on';
                    app.WavelengthnmEditField.Enable = 'on';
                    
                    % Dejar disponible boton de activar panel
                    app.ActPanelButton.Enable = 'on';
                    
                    % Temporal hasta arreglar interaccion con MW
                    app.StartTraceButton.Enable = 'on';
                    
                    
                    
                case 'scannerStopped'
                    app.SavingDataSwitch.Enable = 'on';
                    app.NotifyScansSpinner.Enable = 'on';
                    app.IntTimemsEditField.Enable = 'on';
                    app.NBufferEditField.Enable = 'on';
                    app.StartTraceButton.Enable = 'off';
                    app.ScanButton.Enable = 'on';
                    app.StopTraceButton.Enable = 'off';
                    app.StopscanButton.Enable = 'off';
                    app.ActPanelButton.Enable = 'off';
                    app.SaveScanButton.Enable = 'off';
                    
                    app.ZoomButton.Enable = 'on';
                    app.ZoomSizeumEditField.Enable = 'on';
                    
                    app.XoffsetEditField.Enable = 'on';
                    app.YoffsetEditField.Enable = 'on';
                    app.ScanFreqEditField.Enable = 'on';
                    app.ScanSizeumEditField.Enable = 'on';
                    app.ScanNpixelsEditField.Enable = 'on';
                    app.StimemsEditField.Enable = 'on';
                    app.CtimemsEditField.Enable = 'on';
                    
                    app.LoadFigureButton.Enable = 'off';
                    app.Goto000Button.Enable = 'off';
                    app.SetoffsetButton.Enable = 'off';
                    app.UpYButton.Enable = 'off';
                    app.DownYButton.Enable = 'off';
                    app.LeftXButton.Enable = 'off';
                    app.RightXButton.Enable = 'off';
                    app.MinZEditField.Enable = 'off';
                    app.MaxZEditField.Enable = 'off';
                    app.ZSlider.Enable = 'off';
                    app.DecZButton.Enable = 'off';
                    app.IncZButton.Enable = 'off';
                    app.StepnmEditField.Enable = 'off';
                    app.XEditField.Enable = 'off';
                    app.YEditField.Enable = 'off';
                    app.ZEditField.Enable = 'off';
                    
                    app.Panel_2.Visible = 'off';
                    
                    
            end
        end
        
        function binFile2MAT(~, filenameIn, filenameOut, numColumns, metadata)
        %BINFILE2MAT Loads 2-D array of doubles from binary file and saves data to MAT file
        % Processes all data in binary file (filenameIn) and saves it to a MAT file without loading
        % all data to memory.
        % If output MAT file (filenameOut) already exists, data is overwritten (not appended).
        % Input binary file is a matrix of doubles with numRows x numColumns
        % MAT file (filenameOut) is a MAT file with the following variables
        %   timestamps = a column vector ,  the first column in the data from binary file
        %   data = a 2-D array of doubles, includes 2nd-last columns in the data from binary file
        %   metatada = a structure, which is provided as input argument, used to provide additional
        %              data information
        %
            
            % If filenameIn does not exist, error out
            if ~exist(filenameIn, 'file')
                error('Input binary file ''%s'' not found. Specify a different file name.', filenameIn);
            end
            
            % If output MAT file already exists, delete it
            if exist(filenameOut, 'file')
                delete(filenameOut)
            end
            
            % Determine number of rows in the binary file
            % Expecting the number of bytes in the file to be 8*numRows*numColumns
            fileInfo = dir(filenameIn);
            numRows = floor(fileInfo.bytes/(8*double(numColumns)));
            
            % Create matfile object to save data loaded from binary file
            matObj = matfile(filenameOut);
            matObj.Properties.Writable = true;
            
            % Initialize MAT file
            matObj.timestamps(numRows,1) = 0;
            matObj.data(numRows,1) = 0;
            
            % Open input binary file
            fid = fopen(filenameIn,'r');
            
            % Specify how many rows to process(load and save) at a time
            numRowsPerChunk = 10E+6;
            
            % Keeps track of how many rows have been processed so far
            ii = 0;
            
            while(ii < numRows)
                
                % chunkSize = how many rows to process in this iteration
                % If it's the last iteration, it's possible the number of rows left to
                % process is different from the specified numRowsPerChunk
                chunkSize = min(numRowsPerChunk, numRows-ii);
                
                data = fread(fid, [numColumns,chunkSize], 'double');
                
                matObj.timestamps((ii+1):(ii+chunkSize), 1) = data(1,:)';
                matObj.data((ii+1):(ii+chunkSize), 1) = data(2:end,:)';
                
                ii = ii + chunkSize;
            end
            
            fclose(fid);
            
            % Save provided metadata to MAT file
            matObj.metadata = metadata;
        end
        
        % Función para guardar scan y zoom
        
        function saveScanBackup(app)
            
            %DATOS INDEPENDIENTES DE LA TAREA
            metadataScanStruct.nPixels = app.ScanNpixelsEditField.Value;
            metadataScanStruct.frecuencia = app.ScanFreqEditField.Value;
            metadataScanStruct.settlingTime = app.StimemsEditField.Value;
            metadataScanStruct.countsTime = app.CtimemsEditField.Value;
            
            % Metadata correspondiente a la muestra
            metadataMuestraStruct.muestra = app.SampleNameEditField.Value;
            metadataMuestraStruct.filtro = app.FilterNameEditField.Value;
            metadataMuestraStruct.detector1 = app.Count1DropDown.Value;
            metadataMuestraStruct.detector2 = app.Count2DropDown.Value;
            metadataMuestraStruct.potencia = app.PoweruWEditField.Value;
            metadataMuestraStruct.longOnda = app.WavelengthnmEditField.Value;
            
            % Obtener la fecha y hora actual
            timestamp = datetime('now', 'Format', 'yyyy-MM-dd');
            timestampStr = datestr(timestamp, 'yyyy-mm-dd');  % Fecha solo con día, mes y año
            
            
            % Obtener la carpeta actual
            currentFolder = pwd;
            
            % Definir nombre de archivo de respaldo (con solo día, mes y año)
            backupFilename = ['respaldo_', timestampStr, '.mat'];
            backupFullPath = fullfile(currentFolder, backupFilename);
            
            %DATOS DEPENDIENTES DE LA TAREA
            % Definir los datos a guardar
            dataStruct.count1 = app.countsMatrixCount1;
            dataStruct.count2 = app.countsMatrixCount2;
            dataStruct.x = app.xCoordCts;
            dataStruct.y = app.yCoordCts;
            
            % Metadata correspondiente al scan
            metadataScanStruct.posX = app.XoffsetEditField.Value;
            metadataScanStruct.posY = app.YoffsetEditField.Value;
            metadataScanStruct.posZ = app.ZoffsetEditField.Value;
            metadataScanStruct.scanSize = app.ScanSizeumEditField.Value;
            
            % Guardar datos y metadata en una estructura
            scan.data = dataStruct;
            scan.metadataMuestra = metadataMuestraStruct;
            scan.metadataScan = metadataScanStruct;
            
            % Guardar archivo de respaldo (sin hora)
            save(backupFullPath, 'scan');
            disp(['Respaldo guardado en: ', backupFullPath]);
            
        end
        
        
        function saveSweepBackup(app)
            
            
            % Metadata correspondiente a la muestra
            metadataMuestraStruct.muestra = app.SampleNameEditField.Value;
            
            % Obtener la fecha y hora actual
            timestamp = datetime('now', 'Format', 'yyyy-MM-dd');
            timestampStr = datestr(timestamp, 'yyyy-mm-dd');  % Fecha solo con día, mes y año
            
            
            % Obtener la carpeta actual
            currentFolder = pwd;
            
            % Definir los datos a guardar
            
            dataStruct.PL = app.ctasSweep;
            dataStruct.accumCts = app.movingAverageBuffer;
            dataStruct.frequencies = app.freqSwep;
            
            % Metadata correspondiente al sweep
            
            metadataSweepStruct.freqStartGHz = app.FreqStartGHzEditField.Value;
            metadataSweepStruct.freqStopGHz = app.FreqStopGHzEditField.Value;
            metadataSweepStruct.powdBm = app.PowerdBmEditField.Value;
            
            metadataSweepStruct.dwellTime = (app.DTimemsEditField.Value)/1000;
            metadataSweepStruct.nPoints = app.PointsEditField.Value;
            metadataSweepStruct.nReps = app.RepetitionsEditField.Value;
            metadataSweepStruct.totalCycles = app.CyclesEditField.Value;
            
            metadataSweepStruct.posX = app.XEditField.Value;
            metadataSweepStruct.posY = app.YEditField.Value;
            metadataSweepStruct.posZ = app.ZEditField.Value;
            
            
            
            % Guardar datos y metadata en una estructura
            sweep.data = dataStruct;
            sweep.metadataMuestra = metadataMuestraStruct;
            sweep.metadataSweep = metadataSweepStruct;
            
            % Definir nombre de archivo de respaldo (con solo día, mes y año)
            backupFilename = ['respaldoSweep_', timestampStr, '.mat'];
            backupFullPath = fullfile(currentFolder, backupFilename);
            
            
            % Guardar archivo de respaldo (sin hora)
            save(backupFullPath, 'sweep');
            disp(['Respaldo del sweep guardado en: ', backupFullPath]);
            
        end

        
        
        function saveScanData(app, tipoScan)
            
            
            %DATOS INDEPENDIENTES DE LA TAREA
            
            
            
            % Metadata correspondiente a la muestra
            metadataMuestraStruct.muestra = app.SampleNameEditField.Value;
            metadataMuestraStruct.filtro = app.FilterNameEditField.Value;
            metadataMuestraStruct.detector1 = app.Count1DropDown.Value;
            metadataMuestraStruct.detector2 = app.Count2DropDown.Value;
            metadataMuestraStruct.potencia = app.PoweruWEditField.Value;
            metadataMuestraStruct.longOnda = app.WavelengthnmEditField.Value;
            
           
            
            % Obtener la fecha y hora actual
            timestamp = datetime('now', 'Format', 'yyyy-MM-dd_HHmmss');
            timestampStr = datestr(timestamp, 'yyyy-mm-dd_HHMMSS');
            
            % Generar el nombre del archivo
            usrName = app.SampleNameEditField.Value;
            
            % Obtener la carpeta actual
            currentFolder = pwd;
            
            
            
            %DATOS DEPENDIENTES DE LA TAREA
            
            switch tipoScan
                case 'scan'
                    % Definir los datos a guardar
                    dataStruct.count1 = app.countsMatrixCount1;
                    dataStruct.count2 = app.countsMatrixCount2;
                    dataStruct.x = app.xCoordCts;
                    dataStruct.y = app.yCoordCts;
                    
                    % Metadata correspondiente al scan
                    
                    metadataScanStruct.nPixels = app.ScanNpixelsEditField.Value;
                    metadataScanStruct.frecuencia = app.ScanFreqEditField.Value;
                    metadataScanStruct.settlingTime = app.StimemsEditField.Value;
                    metadataScanStruct.countsTime = app.CtimemsEditField.Value;
                    
                    metadataScanStruct.posX = app.XoffsetEditField.Value;
                    metadataScanStruct.posY = app.YoffsetEditField.Value;
                    metadataScanStruct.posZ = app.ZoffsetEditField.Value;
                    metadataScanStruct.scanSize = app.ScanSizeumEditField.Value;
                    
                    
                    
                    % Guardar datos y metadata en una estructura
                    scan.data = dataStruct;
                    scan.metadataMuestra = metadataMuestraStruct;
                    scan.metadataScan = metadataScanStruct;
                    
                    filename = [timestampStr, '_', usrName, '_SCAN.mat'];
                    
                    % Generar la ruta completa del archivo
                    fullPath = fullfile(currentFolder, filename);
                    
                    % Guardar los datos en un archivo .mat
                    save(fullPath, 'scan');
                    
                    % Mostrar un mensaje de confirmación
                    disp(['Scan guardado en: ', fullPath]);
                    
                case 'zoom'
                    % Definir los datos a guardar
                    dataStruct.count1 = app.countsZoomCount1;
                    dataStruct.count2 = app.countsMatrixCount2;
                    dataStruct.x = app.xCoordsZoom;
                    dataStruct.y = app.yCoordsZoom;
                    
                    % Metadata correspondiente al scan
                    
                    metadataZoomStruct.nPixels = app.ScanNpixelsEditField.Value;
                    metadataZoomStruct.frecuencia = app.ScanFreqEditField.Value;
                    metadataZoomStruct.settlingTime = app.StimemsEditField.Value;
                    metadataZoomStruct.countsTime = app.CtimemsEditField.Value;
                    
                    metadataZoomStruct.posX = app.xOffSetZoom;
                    metadataZoomStruct.posY = app.yOffSetZoom;
                    metadataZoomStruct.posZ = app.zOffSetZoom;
                    metadataZoomStruct.scanSize = app.sizeZoom;
                    
                    % Guardar datos y metadata en una estructura
                    zoom.data = dataStruct;
                    zoom.metadataMuestra = metadataMuestraStruct;
                    zoom.metadataScan = metadataZoomStruct;
                    
                    filename = [timestampStr, '_', usrName, '_ZOOM.mat'];
                    
                    % Generar la ruta completa del archivo
                    fullPath = fullfile(currentFolder, filename);
                    
                    % Guardar los datos en un archivo .mat
                    save(fullPath, 'zoom');
                    
                    % Mostrar un mensaje de confirmación
                    disp(['Zoom guardado en: ', fullPath]);
            end
            
            
            
        end
        
        function saveTrackingBackup(app)
            
            % Metadata correspondiente a la muestra
            metadataMuestraStruct.muestra = app.SampleNameEditField.Value;
            metadataMuestraStruct.filtro = app.FilterNameEditField.Value;
            metadataMuestraStruct.detector1 = app.Count1DropDown.Value;
            metadataMuestraStruct.detector2 = app.Count2DropDown.Value;
            metadataMuestraStruct.potencia = app.PoweruWEditField.Value;
            metadataMuestraStruct.longOnda = app.WavelengthnmEditField.Value;
            
            % Obtener la fecha y hora actual
            timestamp = datetime('now', 'Format', 'yyyy-MM-dd_HHmmss');
            timestampStr = datestr(timestamp, 'yyyy-mm-dd_HHMMSS');
            
            % Obtener la carpeta actual
            currentFolder = pwd;
            
            % Definir nombre de archivo de respaldo (con solo día, mes y año)
            backupFilename = ['respaldoTracking_', timestampStr, '.mat'];
            backupFullPath = fullfile(currentFolder, backupFilename);
            
            % Definir los datos a guardar
            dataStruct.x = app.trackedCoordX;
            dataStruct.y = app.trackedCoordY;
            dataStruct.y = app.trackedCoordZ;
            
            tracking.coords = dataStruct;
            tracking.metadata = metadataMuestraStruct;
            
            % Guardar archivo de respaldo (sin hora)
            save(backupFullPath, 'tracking');
            disp(['Respaldo guardado en: ', backupFullPath]);
        end
        
        function saveTrackingData(app)
            
            % Obtener la fecha y hora actual
            timestamp = datetime('now', 'Format', 'yyyy-MM-dd_HHmmss');
            timestampStr = datestr(timestamp, 'yyyy-mm-dd_HHMMSS');
            
            % Generar el nombre del archivo
            usrName = app.SampleNameEditField.Value;
            
            % Obtener la carpeta actual
            currentFolder = pwd;
            
            % Metadata correspondiente a la muestra
            metadataMuestraStruct.muestra = app.SampleNameEditField.Value;
            metadataMuestraStruct.filtro = app.FilterNameEditField.Value;
            metadataMuestraStruct.detector1 = app.Count1DropDown.Value;
            metadataMuestraStruct.detector2 = app.Count2DropDown.Value;
            metadataMuestraStruct.potencia = app.PoweruWEditField.Value;
            metadataMuestraStruct.longOnda = app.WavelengthnmEditField.Value;
            
            % Definir los datos a guardar
            dataStruct.x = app.trackedCoordX;
            dataStruct.y = app.trackedCoordY;
            dataStruct.y = app.trackedCoordZ;
            
            tracking.coords = dataStruct;
            tracking.metadata = metadataMuestraStruct;
            
            % Guardar datos
            filename = [timestampStr, '_', usrName, '_TRACKING.mat'];
            
            % Generar la ruta completa del archivo
            fullPath = fullfile(currentFolder, filename);
            
            % Guardar los datos en un archivo .mat
            save(fullPath, 'tracking');
            
            % Mostrar un mensaje de confirmación
            disp(['Tracking guardado en: ', fullPath]);
            
        end
        
        function closeApp_Callback(app, ~, event, isAcquiring)
        %closeApp_Callback Executes after "Close Confirm" dialog window
        %  "Close Confirm" dialog window is launched from LiveDataAcquisitionCloseRequest.
        %   before closing app if acquisition is currently on (isAcquiring=true) clean-up 
        %   DAQ session and close file if logging.
        
            switch event.SelectedOption
                case 'OK'
                    
                    if ~(isempty(app.anapicoSession))
                        DISCONNECTMWButtonPushed(app, event)
                    end
                    
                    if isAcquiring
                        closeTraceCallback(app, [], [])
                        
                        % Acquisition is currently on
                        stop(app.DAQSessionTrace)
                        stop(app.DAQSessionTrace2)
                        stop(app.DAQClkTraceSession)
                        
                        
                        
                        delete(app.TraceAvailableListener)
                        delete(app.TraceAvailableListener2)
                        delete(app.DAQSessionTrace)
                        delete(app.DAQClkTraceSession)
                        
                        
                        if ~(isempty(app.DAQScanSession))
                            stop(app.DAQScanSession)
                            delete(app.DAQScanSession)
                        end
                        
                        
                        if app.LogRequested
                            fclose(app.TempFile);
                        end
                    else
                        % Acquisition is stopped
                    end

                    delete(app)
                case 'Cancel'
                    % Continue
            end
            
        end
        
        function updateLogdatatofileSwitchComponents(app)
            value = app.SavingDataSwitch.Value;
            switch value
                case 'Off'
                    app.LogRequested = false;
                case 'On'
                    app.LogRequested = true;
            end
        end
        
        function updateSliderZ(app, newValue)
            
            limSlider = app.ZSlider.Limits;
            
            % Ajustar valroes en slider
            app.ZSlider.Limits = [min(limSlider(1), newValue), max(limSlider(2), newValue)];
            
            app.ZSlider.Value = newValue;
        end
        
        % Función que lee y actualiza voltajes del piezo
        
        function updatePiezoVoltage(app)
            
            % Leer voltajes
            
            voltajes = inputSingleScan(app.DAQScanSession);
            % Asignar voltajes leidos a variables de clase
            
            app.currentVoltX = recortarVoltaje(app, voltajes(2), 0.0, 10.0);
            app.currentVoltY = recortarVoltaje(app, voltajes(3), 0.0, 10.0);
            
            
            
            
            % Actualizar valores actuales de voltaje en UI
            app.XEditField.Value = app.currentVoltX * 8;
            app.YEditField.Value = app.currentVoltY * 8;
            app.ZEditField.Value = app.currentVoltZ * 8;
            
            updateSliderZ(app, app.ZEditField.Value)
            
        end
        
        % FUNCIONES ASOCIADAS A MAPA PL
        
        % Callback para greaficar matriz y setear listeners de interacción
        % con imagen
        
        function dataLoadedCallback(app)
            % Usar imagesc para graficar amtriz y setear límites
            app.matrixPlot = imagesc(app.UIAxes,app.xCoordCts, app.yCoordCts, app.countsMatrixCount1);
            xlim(app.UIAxes, [min(app.xCoordCts), max(app.xCoordCts)]);
            ylim(app.UIAxes, [min(app.yCoordCts), max(app.yCoordCts)]);
            colormap(app.UIAxes,"jet")
            colorbar(app.UIAxes)
            
            % Inicializar líneas de coordenadas
            posX = app.currentVoltX * 8;
            posY = app.currentVoltY * 8;
            hold(app.UIAxes, 'on');
            app.hXLine = xline(app.UIAxes, posX, 'k');
            app.hYLine = yline(app.UIAxes, posY, 'k');
            hold(app.UIAxes, 'off');
            
            % Obtener la barra de herramientas del axes
            tb = axtoolbar(app.UIAxes);
            
            % Eliminar herramientas específicas
            delete(tb.Children);
            
            
            % Crear lsiteners de interaccion con figura para establecer
            % coordenadas
            set(app.matrixPlot, 'ButtonDownFcn', @(src, event)clickDown(app, src, event));
            % Configurar las funciones de liberación del click
            set(app.UIFigure, 'WindowButtonUpFcn', @(src, event)clickUp(app, src, event));
        end
        
       function clickDown(app, src, event)
            
            
            
           % Obtener la posición del click down
           pos = get(app.UIAxes, 'CurrentPoint');
           x = round(pos(1,1),4);
           y = round(pos(1,2),4);
           app.isClickedDown = true;
           actualizarVoltajes(app)
           
           
           % Verificar que el click se haya hecho dentro de los límites de la figura
           
           if x >= min(app.xCoordCts) && x <= max(app.xCoordCts) && y >= min(app.yCoordCts) && y <= max(app.yCoordCts)
               
               
               % Verificar si las líneas son válidas antes de modificarlas
               if ishandle(app.hXLine) && ishandle(app.hYLine)
                   % Actualizar las líneas de coordenadas
                   set(app.hXLine, 'Value', x);
                   set(app.hYLine, 'Value', y);
               else
                   beep;
                   disp('Las líneas hXLine o hYLine no son válidas para desplazarse por UIAxes.');
               end
               
                % Actualizar la posición clickeada como voltaje final
                
                app.voltFinalX = x/8;
                app.voltFinalY = y/8;
                
                
                % Desplazar piezo desde posición anterior hasta donde se
                % hace click
                
                desplazarCoordenada(app, 'x')
                desplazarCoordenada(app, 'y')
                
                actualizarVoltajes(app)
                
            end
            pause(0.01)
            % Configurar las funciones de movimiento y liberación del click
            set(app.UIFigure, 'WindowButtonMotionFcn', @(src, event)whileClickDown(app, src, event));
        end
        
        function whileClickDown(app, src, event)
            
            % Obtener posiciones mientras se mantiene presionado el click
            
             if(app.isClickedDown==true)
                
                % Posición dad por el mouse
                
                pos = get(app.UIAxes, 'CurrentPoint');
                x = round(pos(1,1),4);
                y = round(pos(1,2),4);
                
                % Verificar que el mouse esté dentro de los límites de la figura
            
                if x >= min(app.xCoordCts) && x <= max(app.xCoordCts) && y >= min(app.yCoordCts) && y <= max(app.yCoordCts)
                    
                    % Mostrar en UI posición del mouse
                    
                    app.XEditField.Value = x;
                    app.YEditField.Value = y;
                    
                    % Actualizar la posición del mouse como voltaje final
                    
                    app.voltFinalX = x/8;
                    app.voltFinalY = y/8;
                    
                    % Desplazar piezo por coordenada considerando voltaje
                    % final
                    desplazarCoordenada(app,'x')
                    desplazarCoordenada(app,'y')
                    
                    % Actualizar voltajes del piezo
                    actualizarVoltajes(app);
                    
                end
                
            end
            
        end
        
        function clickUp(app, src, event)
            
            % Dejar de arrastar coordenadas
            app.isClickedDown = false;
            
            % Obtener las posiciones cuando se deja de presionar el click
            
            pos = get(app.UIAxes, 'CurrentPoint');
            x = round(pos(1,1),4);
            y = round(pos(1,2),4);
            
            
            
            % Verificar que el click se haya levantado dentro de los límites de la figura
            % y el tiempo que estuvo presionado
            
            if x >= min(app.xCoordCts) && x <= max(app.xCoordCts) && y >= min(app.yCoordCts) && y <= max(app.yCoordCts)
                
                % Verificar si las líneas son válidas antes de modificarlas
               if ishandle(app.hXLine) && ishandle(app.hYLine)
                   % Actualizar las líneas de coordenadas
                   set(app.hXLine, 'Value', x);
                   set(app.hYLine, 'Value', y);
               else
                   beep;
                   disp('Las líneas hXLine o hYLine no son válidas para desplazarse por UIAxes.');
               end
                
                % Mostrar en UI posición del mouse al levantr click
%                 actualizarVoltajes(app)
                
            end
            
        end
        

        
        % Iguala el largo de los vectores de voltaje de salida
        
        function [outVectorX, outVectorY] = equalizeVectorLength(app, vectorVoltX, vectorVoltY)
            
            % Obtener tamaño de los vectores
            
            sizeVoltX = length(vectorVoltX);
            sizeVoltY = length(vectorVoltY);
            
            % Crear vector con los tamaños calculados
            
            largoVoltajes = [sizeVoltX, sizeVoltY];
            
            % Encontrar el tamaño del vector mas largo de voltajes
            
            maxLength = max(largoVoltajes);
            
            % Calcular cantidad de veces a repetir ultimo elemento para
            % cada salida de voltaje
            
            numRepVoltX = maxLength - sizeVoltX;
            numRepVoltY = maxLength - sizeVoltY;
            
            % Homogeneizar el largo de las salidas de voltaje
            
            if numRepVoltX > 0
                outVectorX = [vectorVoltX, repelem(vectorVoltX(end), numRepVoltX)];
            else
                outVectorX = vectorVoltX;
            end
            
            if numRepVoltY > 0
                outVectorY = [vectorVoltY, repelem(vectorVoltY(end), numRepVoltY)];
            else
                outVectorY = vectorVoltY;
            end
            
        end
        
        
        % Desplaza el piezo de un punto a otro
        
        function movePiezoScan(app)
            
            
            s = app.DAQScanSession;
            
            
            if ~(isempty(s))
                % Crear vector con voltajes iniciales actuales y voltajes
                % finales
                
                voltInicial = [app.currentVoltX, app.currentVoltY];
                
                voltFinal = [app.voltFinalX, app.voltFinalY];
                
                % Calcular distancia en cada coordenada
                
                distPorCoord = abs(voltFinal - voltInicial);
                
                % Verificar si hay saltos de voltaje por sobre umbral
                
                idxUmbral = find(distPorCoord > app.maxVoltPiezo);
                
                if( isempty(idxUmbral) )
                    
                    % Si todos los saltos de voltaje estan por debajo del
                    % umbral se hace output con voltajes finales
                    
                    outputSingleScan(s, voltFinal);
                    
                else
                    
                    % Si existen saltos de voltaje por sobre el umbral
                    % crearemos cola de voltaje del largo asociado al máximo
                    % salto
                    
                    % Calcular el vector con los voltajes de cada coordenada
                    
                    vectorVoltX = voltVector(app, app.currentVoltX, app.voltFinalX);
                    vectorVoltY = voltVector(app, app.currentVoltY, app.voltFinalY);
                    
                    % Igualar el largo de los vectores de voltajes de salida
                    
                    [vectorVoltX, vectorVoltY] = equalizeVectorLength(app, vectorVoltX, vectorVoltY);
                    
                    % Darle salida a los voltajes
                    for i = 1 : length(vectorVoltX)
                        outputSingleScan(s, [vectorVoltX(i), vectorVoltY(i)]);
                    end
                    
                    
                end
                
            else
                iniciarSesionScan(app)
                movePiezoScan(app)
            end
            
        end
        
        function scanProcessData(app, event, idxNoCts, idxCts, tarea)
            
            try
                
                

                %=================== APD ===================
                
                preDataAPD = event.Data(:,1);
                preDataLas = event.Data(:,2);
%                 assignin('base','ctasBrutoExc',preDataAPD)
%                 assignin('base','idxNoCts',idxNoCts)
%                 assignin('base','idxCts',idxCts)
                
                for i=1:length(idxNoCts)
                    preDataAPD(idxNoCts(i,1):idxNoCts(i,2)) = [];
                    preDataLas(idxNoCts(i,1):idxNoCts(i,2)) = [];
                end
                
                dataAPD = diff(preDataAPD);
                dataLas = diff(preDataLas);
                
                nPuntos = app.ScanNpixelsEditField.Value;
                integrationTime = (app.CtimemsEditField.Value)/1000;
                bufferCuentasAPD = zeros(nPuntos * nPuntos,1);
                bufferCuentasLas = zeros(nPuntos * nPuntos,1);
                
                for i=1:length(idxCts)
                    bufferCuentasAPD(i) = sum(  dataAPD(idxCts(i,1):idxCts(i,2))  )/integrationTime;
                    bufferCuentasLas(i) = sum(  dataLas(idxCts(i,1):idxCts(i,2))  )/integrationTime;
                end
                %assignin('base','cuentasExc',bufferCuentasAPD)
                switch tarea
                    case 'scan'
                        
                        app.countsMatrixCount1 = reshape(bufferCuentasAPD, nPuntos, nPuntos)';
                        % Crear figura con scan en el infrarrojo
                        figure('Name','APD')
                        imagesc(app.countsMatrixCount1)
                        colormap jet
                        
                        app.countsMatrixCount2 = reshape(bufferCuentasLas, nPuntos, nPuntos)';
                        % Crear figura con scan en el infrarrojo
                        figure('Name','INFRARROJO')
                        imagesc(app.countsMatrixCount2)
                        colormap jet
                        
                    case 'zoom'
                        
                        app.countsZoomCount1 = reshape(bufferCuentasAPD, nPuntos, nPuntos)';
                        % Crear figura con scan en el infrarrojo
                        figure('Name','APD ZOOM')
                        imagesc(app.countsZoomCount1)
                        colormap jet
                        
                        app.countsZoomCount2 = reshape(bufferCuentasLas, nPuntos, nPuntos)';
                        % Crear figura con scan en el infrarrojo
                        figure('Name','INFRARROJO ZOOM')
                        imagesc(app.countsZoomCount2)
                        colormap jet
                        
                end
                
                
                setAppViewState(app, 'scannerFinished')
                
            catch ME
                disp('Error in scanProcessData:');
                disp(ME.message);
            end
            
        end
        
        
        function figureGUIScan(app, event, tarea)
            
            if app.showScanCount1
                switch tarea
                    case 'scan'
                        
                        app.matrixPlot = imagesc(app.UIAxes,app.xCoordCts, app.yCoordCts, app.countsMatrixCount1);
                        colormap(app.UIAxes, "jet")
                        colorbar(app.UIAxes)
                        xlim(app.UIAxes, [min(app.xCoordCts), max(app.xCoordCts)]);
                        ylim(app.UIAxes, [min(app.yCoordCts), max(app.yCoordCts)]);
                        
                        actualizarBarraColor(app, 'scan')
                        
                        
                    case 'zoom'
                        app.matrixPlot = imagesc(app.UIAxes,app.xCoordsZoom, app.yCoordsZoom, app.countsZoomCount1);
                        xlim(app.UIAxes, [min(app.xCoordsZoom), max(app.xCoordsZoom)]);
                        ylim(app.UIAxes, [min(app.yCoordsZoom), max(app.yCoordsZoom)]);
                        colormap(app.UIAxes, "jet")
                        colorbar(app.UIAxes)
                        
                        actualizarBarraColor(app,'zoom')
                end
                
            else
                
                switch tarea
                    case 'scan'
                        
                        app.matrixPlot = imagesc(app.UIAxes,app.xCoordCts, app.yCoordCts, app.countsMatrixCount2);
                        colorbar(app.UIAxes)
                        xlim(app.UIAxes, [min(app.xCoordCts), max(app.xCoordCts)]);
                        ylim(app.UIAxes, [min(app.yCoordCts), max(app.yCoordCts)]);
                        
                        actualizarBarraColor(app, 'scan')
                        
                        
                    case 'zoom'
                        
                        app.matrixPlot = imagesc(app.UIAxes,app.xCoordsZoom, app.yCoordsZoom, app.countsZoomCount2);
                        xlim(app.UIAxes, [min(app.xCoordsZoom), max(app.xCoordsZoom)]);
                        ylim(app.UIAxes, [min(app.yCoordsZoom), max(app.yCoordsZoom)]);
                        
                        colorbar(app.UIAxes)
                        
                        actualizarBarraColor(app,'zoom')
                end
                
            end
            
            % Obtener la barra de herramientas del axes
            tb = axtoolbar(app.UIAxes);
            % Eliminar herramientas específicas
            delete(tb.Children);
            
        end
        
        % Funciones para crear sesiones
        
        function iniciarSesionReloj(app, tarea)
            % Si la sesión ya fue creada cambiamos la frecuencia y se
            % inicia. En caso contrario se crea desde 0.
            
            if ~(isempty(app.DAQClkTraceSession))
                
                % Detener sesion
                stop(app.DAQClkTraceSession)
                
                % Cambiar frecuencia según tarea a realizar
                switch tarea
                    case 'traza'
                        % Obtener tiempo de integración para la traza
                        timeMs = app.IntTimemsEditField.Value;
                        dT = timeMs/(1000*2);
                        app.DAQClkTraceSession.Channels.Frequency = 1/(2*dT);
                    case 'scan'
                        % Obtener frecuencia ingresada por usuario
                        app.DAQClkTraceSession.Channels.Frequency = app.ScanFreqEditField.Value;
                        
                end
                
                % Ejecutar en 2do plano generación de pulsos
                startBackground(app.DAQClkTraceSession)
                
            else
                % Crear sesion para generar pulsos como reloj externo
                s_clk = daq.createSession('ni');
                ch_clk = addCounterOutputChannel(s_clk, 'Dev1', 'ctr1', 'PulseGeneration');
                
                
                
                % Setear delay del pulso, duty cycle y que en estado de reposo esté al
                % máximo
                ch_clk.IdleState = "High";
                ch_clk.InitialDelay = 1E-3;
                ch_clk.DutyCycle = 0.5;
                
                % Frecuencia según tarea a realizar
                switch tarea
                    case 'traza'
                        % Obtener tiempo de integración para la traza
                        timeMs = app.IntTimemsEditField.Value;
                        dT = timeMs/(1000*2);
                        ch_clk.Frequency = 1/(2*dT);
                    case 'scan'
                        % Obtener frecuencia ingresada por usuario
                        ch_clk.Frequency = app.ScanFreqEditField.Value;
                end
                
                
                % Generar pulsos continuamente
                s_clk.IsContinuous = true;
                
                % Guardar sesion como variable de la clase
                app.DAQClkTraceSession = s_clk;
                
                % Ejecutar en 2do plano generación de pulsos
                startBackground(app.DAQClkTraceSession)
            end
            
        end

        
        function iniciarSesionTraza(app)
            
            if ~(isempty(app.DAQScanSweepSession))
                stop(app.DAQScanSweepSession)
                release(app.DAQScanSweepSession)
                delete(app.DAQScanSweepSession)
                
                % Eliminar listener
                delete(app.sweepCountsListener);
                app.sweepCountsListener = [];
                
                app.DAQScanSweepSession = [];
                
                % Si está abierta la sesion del sweep habrá una traza en
                % ctr3
                
                stop(app.DAQScanTrace)
                release(app.DAQScanTrace)
                delete(app.DAQScanTrace)
                
                % Eliminar listener
                delete(app.scanTraceListener);
                app.scanTraceListener = [];
                
                app.DAQScanTrace = [];
                
            end
            
            if ~(isempty(app.DAQScanSession))
                
                % Si hay una sesion asociada al scan estará usando los
                % canales de la traza.
                
                stop(app.DAQScanSession)
                release(app.DAQScanSession)
                delete(app.DAQScanSession)
                
                % Eliminar listener
                delete(app.TraceAvailableListener);
                app.TraceAvailableListener = [];
                
                app.DAQScanSession = [];
            end
            
            
            %Crear sesion principal para adquisición de cuentas
            s_in = daq.createSession('ni');
            
            % Agregar un canal de entrada para contador APD
            addCounterInputChannel(s_in, 'Dev1', 'ctr0', 'EdgeCount');
            
            % Configurar reloj para medir traza
            iniciarSesionReloj(app, 'traza')
            
            % Agregar reloj a sesion de traza
            s_in.addClockConnection('External', 'Dev1/PFI13', 'ScanClock');
            
            % Configurar la tasa de muestreo igual a frec. del reloj
            s_in.Rate = app.DAQClkTraceSession.Channels.Frequency;
            
            % Recibir datos de manera continua
            s_in.IsContinuous = true;
            
            % Configurar cantidad de datos para llamar al listener
            s_in.NotifyWhenDataAvailableExceeds = app.NotifyScansSpinner.Value;
            
            % Guardar sesion como variable de la clase
            app.DAQSessionTrace = s_in;
            
            % Inicializar listener como arreglo vacío.
            app.TraceAvailableListener = [];
            
            %========================================================
            %Crear sesion principal para adquisición de cuentas
            s_in2 = daq.createSession('ni');
            
            % Detector infrarojo
            addCounterInputChannel(s_in2, 'Dev1', 'ctr3', 'EdgeCount');
            
            % Agregar reloj a sesion de traza
            s_in2.addClockConnection('External', 'Dev1/PFI13', 'ScanClock');
            
            % Configurar la tasa de muestreo igual a frec. del reloj
            s_in2.Rate = app.DAQClkTraceSession.Channels.Frequency;
            
            % Recibir datos de manera continua
            s_in2.IsContinuous = true;
            
            % Configurar cantidad de datos para llamar al listener
            s_in2.NotifyWhenDataAvailableExceeds = app.NotifyScansSpinner.Value;
            
            % Guardar sesion como variable de la clase
            app.DAQSessionTrace2 = s_in2;
            
            % Inicializar listener como arreglo vacío.
            app.TraceAvailableListener2 = [];
            
            
        end
        
        
        function figureTrazaScan(app, task, name)
            
            % Setear buffers como arreglos vacíos previo a usarlos
            app.DataFIFOBufferScanTrace = [];
            
            switch task
                case 'scan'
                    
                    % Crear figura externa a la app para mostrar traza
                    app.scanTraceFigure = figure('Name',name, 'Position', [910, 50, 1000, 800], ...
                        'CloseRequestFcn', @(src, event) closeScanTraceCallback(app, src, event));
                    
                    
                    % Obtener el handle a los ejes de la figura
                    app.axesScanTrace = axes(app.scanTraceFigure);
                    %Hacer plot sin datos
                    app.lineScanTrace = plot(app.axesScanTrace, NaN, 'LineWidth',3,"Color",'k');
                    
                    % Conf. título y etiquetas
                    title(app.axesScanTrace, name);
                    xlabel(app.axesScanTrace, 'u.a');
                    ylabel(app.axesScanTrace, 'cuentas/s');
                    
                    xlim(app.axesScanTrace,[0, app.NBufferEditField.Value]);
                    set(app.axesScanTrace, 'FontSize', 32);
                    
                case 'sweep'
                    % Crear figura externa a la app para mostrar traza
                    app.scanTraceFigure = figure('Name',name, 'Position', [910, 50, 1000, 800], ...
                        'CloseRequestFcn', @(src, event) closeScanTraceCallback(app, src, event));
                    
                    
                    % Obtener el handle a los ejes de la figura
                    app.axesScanTrace = subplot(2, 1, 1, 'Parent', app.scanTraceFigure);
                    %Hacer plot sin datos
                    app.lineScanTrace = plot(app.axesScanTrace, NaN, 'LineWidth',3,"Color",'k');
                    
                    % Conf. título y etiquetas
                    title(app.axesScanTrace, name);
                    xlabel(app.axesScanTrace, 'u.a');
                    ylabel(app.axesScanTrace, 'Cts/s');
                    
                    xlim(app.axesScanTrace,[0, app.NBufferEditField.Value]);
                    set(app.axesScanTrace, 'FontSize', 32);
                    
                    % Crear el segundo subplot para el gráfico de media
                    % movil
                    app.axesMeanTrace = subplot(2, 1, 2, 'Parent', app.scanTraceFigure);
                    app.lineMeanTrace = plot(app.axesMeanTrace, NaN, 'LineWidth', 3, "Color", 'b');
                    ylabel(app.axesMeanTrace, 'Cts/Línea', 'Color', 'k');
                    xlabel(app.axesMeanTrace, 'Freq. (GHz)');
                    xlim(app.axesMeanTrace, [min(app.freqSwep), max(app.freqSwep)]);
                    set(app.axesMeanTrace, 'FontSize', 32);
            end
            
            
            % Iniciar sesion de traza
            iniciarTrazaScan(app, task)
            
            % Crear listener e iniciar en 2do plano sesion de adquisición
            app.scanTraceListener = addlistener(app.DAQScanTrace, 'DataAvailable', ...
                @(src,event) scanTraceCallback(app, src, event));
            
            startBackground(app.DAQScanTrace);
        end
        
        
        function iniciarSesionScan(app)
            
            if ~(isempty(app.DAQSessionTrace))
                % Detener sesion de traza para usar sus canales
                stop(app.DAQSessionTrace)
                release(app.DAQSessionTrace)
                delete(app.DAQSessionTrace)
                
                app.DAQSessionTrace = [];
                
                %=========================
                % detener y eliminar apd2
                stop(app.DAQSessionTrace2)
                release(app.DAQSessionTrace2)
                delete(app.DAQSessionTrace2)
                
                app.DAQSessionTrace2 = [];
            end
            
            % Verificar si se estan usando los canales del piezo
            
            if ~(isempty(app.DAQSesionCoordX))
                % Detener sesion de coordenada X
                stop(app.DAQSesionCoordX)
                release(app.DAQSesionCoordX)
                delete(app.DAQSesionCoordX)
                
                app.DAQSesionCoordX = [];
            end
            
            if ~(isempty(app.DAQSesionCoordY))
                % Detener sesion de coordenada Y
                stop(app.DAQSesionCoordY)
                release(app.DAQSesionCoordY)
                delete(app.DAQSesionCoordY)
                
                app.DAQSesionCoordY = [];
            end
            
            % Si la sesión del scan está activa solo necesitamos actualizar
            % frecuencia
            if ~(isempty(app.DAQScanSession))
                % Actualizar frecuencia del reloj
                iniciarSesionReloj(app, 'scan')
                
            else
                % Actualizar frecuencia del reloj
                iniciarSesionReloj(app,'scan')
                
                %Crear sesion principal para el scan
                s_scan = daq.createSession('ni');
                
                % Agregar un canal de entrada para contador Excelitas
                addCounterInputChannel(s_scan, 'Dev1', 'ctr0', 'EdgeCount');
                
                % Agregar un canal de entrada para contador Lasercomp
                addCounterInputChannel(s_scan, 'Dev1', 'ctr3', 'EdgeCount');
                
                % Configurar reloj
                s_scan.addClockConnection('External', 'Dev1/PFI13', 'ScanClock');
                
                % Configurar la tasa de muestreo igual a frec. del reloj
                s_scan.Rate = app.ScanFreqEditField.Value;
                
                % Recibir datos de manera continua
                s_scan.IsContinuous = true;
                
                % Configuración de salidas de voltaje
                
                % El orden de las coordenadas va como X, Y, Z.
                % Crear salidas analógicas
                addAnalogOutputChannel(s_scan, 'Dev1', 'ao0', 'Voltage');
                addAnalogOutputChannel(s_scan, 'Dev1', 'ao1', 'Voltage');
                
                % Agregar entradas analógicas
                addAnalogInputChannel(s_scan, 'Dev1', 'ai0', 'Voltage');
                addAnalogInputChannel(s_scan, 'Dev1', 'ai4', 'Voltage');
                
                % Guardar sesion como variable de la clase
                app.DAQScanSession = s_scan;
                
                % ==============================================================
                
            end
            
            
        end
        
        function iniciarSesionScanSweep(app)
            
            if ~(isempty(app.DAQSessionTrace))
                
                StopTraceButtonValueChanged(app,[])
                % Detener sesion de traza para usar sus canales
                stop(app.DAQSessionTrace)
                release(app.DAQSessionTrace)
                delete(app.DAQSessionTrace)
                
                app.DAQSessionTrace = [];
                
                %=========================
                % detener y eliminar apd2
                stop(app.DAQSessionTrace2)
                release(app.DAQSessionTrace2)
                delete(app.DAQSessionTrace2)
                
                app.DAQSessionTrace2 = [];
            end
            
            % Verificar si se estan usando los canales del piezo
            
            if ~(isempty(app.DAQSesionCoordX))
                % Detener sesion de coordenada X
                stop(app.DAQSesionCoordX)
                release(app.DAQSesionCoordX)
                delete(app.DAQSesionCoordX)
                
                app.DAQSesionCoordX = [];
            end
            
            if ~(isempty(app.DAQSesionCoordY))
                % Detener sesion de coordenada Y
                stop(app.DAQSesionCoordY)
                release(app.DAQSesionCoordY)
                delete(app.DAQSesionCoordY)
                
                app.DAQSesionCoordY = [];
            end
            
            % Detener sesión de scaneo
            if ~(isempty(app.DAQScanSession))
                stop(app.DAQScanSession)
                release(app.DAQScanSession)
                delete(app.DAQScanSession)
                
                app.DAQScanSession = [];
            end
            
            if ~(isempty(app.DAQScanTrace))
                
                % Si hay una sesion asociada a la traza del scan estará usando los
                % canales.
                
                stop(app.DAQScanTrace)
                release(app.DAQScanTrace)
                delete(app.DAQScanTrace)
                
                % Eliminar listener
                delete(app.scanTraceListener);
                app.scanTraceListener = [];
                
                app.DAQScanTrace = [];
            end
            
            
            % Actualizar frecuencia del reloj
            iniciarSesionReloj(app,'scan')
            
            %Crear sesion principal para el scan
            s_scanSweep = daq.createSession('ni');
            
            % Agregar un canal de entrada para contador Excelitas
            addCounterInputChannel(s_scanSweep, 'Dev1', 'ctr0', 'EdgeCount');
            
            % Agregar un canal de entrada para contar pulsos de cada
            % frequencia
            addCounterInputChannel(s_scanSweep, 'Dev1', 'ctr2', 'EdgeCount');
            
            % Configurar reloj
            s_scanSweep.addClockConnection('External', 'Dev1/PFI13', 'ScanClock');
            
            % Create trigger
            addTriggerConnection(s_scanSweep,'External','Dev1/PFI9','StartTrigger');
            
            % Session waits a maximum of 2 min. for the trigger
            s_scanSweep.ExternalTriggerTimeout = 120;
            
            % Configurar la tasa de muestreo igual a frec. del reloj
            s_scanSweep.Rate = app.ScanFreqEditField.Value;
            
            % Recibir datos de manera continua
            s_scanSweep.IsContinuous = true;
            
            % Sweep parameters that define data notification
            nPoints = app.PointsEditField.Value;
            nRep = app.RepetitionsEditField.Value;
            dTime = (app.DTimemsEditField.Value)/1000;
            cycles = app.CyclesEditField.Value;
            
            % Adding a point to avoid errors associated to delay time
            s_scanSweep.NotifyWhenDataAvailableExceeds = ((nPoints+1)*dTime*cycles)*5E4;
            
            % Guardar sesion como variable de la clase
            app.DAQScanSweepSession = s_scanSweep;
            
            % Listener to process collected data
            app.sweepCountsListener = addlistener(app.DAQScanSweepSession, 'DataAvailable', @(src, event) sweepCountsProcessing(app, event));
            
            % Create matrix that will store the effective counts
            
            % Here we use the 'effective' number of points registered by
            % user
            app.ctasSweep = zeros(nRep,nPoints);
            
            app.movingAverageBuffer = zeros(1,nPoints);
            
            imagesc(app.UIAxes, app.freqSwep, (1:1:nRep),app.ctasSweep)
            xlim(app.UIAxes, [min(app.freqSwep), max(app.freqSwep)]);
            ylim(app.UIAxes, [1, nRep]);
            colormap(app.UIAxes,"jet")
            colorbar(app.UIAxes)
            
            disp("Listener added")
            
            
            
            disp("Sesión de adquisición de cuentas creada.")
                
                % Configuración de salidas de voltaje
                
%                 % El orden de las coordenadas va como X, Y, Z.
%                 % Crear salidas analógicas para mover piezo
%                 addAnalogOutputChannel(s_scanSweep, 'Dev1', 'ao0', 'Voltage');
%                 addAnalogOutputChannel(s_scanSweep, 'Dev1', 'ao1', 'Voltage');
%                 
%                 % Agregar entradas analógicas para leer posicion piezo
%                 addAnalogInputChannel(s_scanSweep, 'Dev1', 'ai0', 'Voltage');
%                 addAnalogInputChannel(s_scanSweep, 'Dev1', 'ai4', 'Voltage');
                
                % Guardar sesion como variable de la clase
                %app.DAQScanSweepSession = s_scanSweep;
                
                % ==============================================================
                
            
        end
        
        function sweepCountsProcessing(app, event)
            
            % Increse the line counter
            app.lineNumber = app.lineNumber + 1;
            
            % Sweep variables
            dwellTime = (app.DTimemsEditField.Value)/1000;
            %effTimeLastFreq = (app.DTimemsEditField.Value - 2)/1000;
            nPoints = (app.PointsEditField.Value) * app.CyclesEditField.Value + 1;
            nReps = app.RepetitionsEditField.Value;
            totalCycles = app.CyclesEditField.Value;
            
            rawDataCycle = event.Data;
            
            % Data processing
            rawCts = diff(rawDataCycle(:,1));
            rawPulses = diff(rawDataCycle(:,2));
            
            % Verify that we are in the range of repetitions
            
            if app.lineNumber <= nReps
                
                
                % Last idx considered with counts
                finalIdx = length(rawDataCycle)-1;
                % Get the indices at which the pulses are received to change frequencies
                idxPulses = [find(rawPulses); finalIdx];
                
                % Create the sequence that follows the counts interval
                sequence = repelem((2:nPoints),2);
                sequence = [1, sequence, nPoints+1];
                
                % Create the counts interval
                intervals = idxPulses(sequence);
                intervals = reshape(intervals,2,[])';
                
                % Assign counts into the matrix
                % discard the last point
                effNPoints = nPoints-1;
                ctasEff = zeros(effNPoints,1);
                
                
                for i = 1:effNPoints
                    ctasEff(i) = sum(rawCts(intervals(i,1):intervals(i,2)));
                end
                
                ctasEff = ctasEff/dwellTime;
                %ctasEff(1:nPoints-1) = ctasEff(1:nPoints-1)/dwellTime;
                %ctasEff(nPoints) = ctasEff(nPoints)/effTimeLastFreq;
                
                switch totalCycles
                    case 1
                        app.ctasSweep(app.lineNumber,:) = ctasEff;
                        
                    otherwise
                        %app.movingAverageBuffer = (app.movingAverageBuffer + ctasEff)/(app.lineNumber*app.CyclesEditField.Value);
                        ctasEff = reshape(ctasEff, app.PointsEditField.Value, totalCycles)';
                        app.ctasSweep(app.lineNumber,:) = mean(ctasEff);
                end
                
                
                % Get the moving average
                app.movingAverageBuffer = (app.movingAverageBuffer + app.ctasSweep(app.lineNumber,:));
                
                % Update plot data
                %set(app.lineMeanTrace ,'YData', app.movingAverageBuffer);
                set(app.lineMeanTrace, 'XData', app.freqSwep, 'YData', app.movingAverageBuffer)
                drawnow limitrate;
                
                % Update the PL map by only changing the matrix of counts
                set(app.UIAxes.Children, 'CData', app.ctasSweep);
                
                
                % Update min and max of the colorbar
                if min(app.ctasSweep(1:app.lineNumber,:)) ~= max(app.ctasSweep(1:app.lineNumber,:))
                    caxis(app.UIAxes, [min(app.ctasSweep(1:app.lineNumber,:), [], 'all'), max(app.ctasSweep(1:app.lineNumber,:), [], 'all')]);
                end
                
                
                % update colorbar
                colorbar(app.UIAxes);
                
                
            else
                
                % Delete listener once we have reached the total number of repetitions
                delete(app.sweepCountsListener)
                app.lineNumber = 0;
                disp("Sweep Terminado.")
                
                saveSweepBackup(app)
                
                app.StartTraceButton.Enable = 'on';
                
                
                
                % Enable the fields to configure sweep
                app.FreqStartGHzEditField.Enable = 'On';
                app.FreqStopGHzEditField.Enable = 'On';
                app.PowerdBmEditField.Enable = 'On';
                
                app.FreqGHzEditField.Enable = 'On';
                app.PowerdBmEditField_2.Enable = 'On';
                
                app.DTimemsEditField.Enable = 'On';
                app.PointsEditField.Enable = 'On';
                app.RepetitionsEditField.Enable = 'On';
                app.CyclesEditField.Enable = 'On';
                
                app.SWEEPButton.Enable = 'On';
                app.STOPSWEEPButton.Enable = 'Off';
                
                app.LOADSWEEPButton.Enable = 'On';
                app.SAVESWEEPButton.Enable = 'On';
                
            end
        end
        
        function initTriggerSession(app)
            
            if isempty(app.daqTriggerSesion)
                % Create session to trrigger the sweep
                sTrg = daq.createSession('ni');
                
                % add channel to release the trigger
                addDigitalChannel(sTrg, 'Dev1', 'port0/line0', 'OutputOnly'); % USER1
                addDigitalChannel(sTrg, 'Dev1', 'port0/line1', 'OutputOnly'); % PFI9
                
                % synchronise with the clock session
                sTrg.addClockConnection('External', 'Dev1/PFI13', 'ScanClock');
                
                
                % create the pulse that triggers the counters
                triggerCounters = [zeros(4,1); ones(2,1); zeros(100,1)];
                % pulse that triggers the MW gen. with a delay of 2 ms               
                triggerMwGen = [zeros(102,1); ones(2,1); zeros(2,1)];
                app.triggerOutput = [triggerMwGen, triggerCounters];
                
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
        
        function prepareMWGen(app)
            
            % get the session
            d = app.anapicoSession;
            
            % Unable the fields to configure sweep
            app.FreqStartGHzEditField.Enable = 'Off';
            app.FreqStopGHzEditField.Enable = 'Off';
            app.PowerdBmEditField.Enable = 'Off';
            
            app.FreqGHzEditField.Enable = 'Off';
            app.PowerdBmEditField_2.Enable = 'Off';
            
            app.DTimemsEditField.Enable = 'Off';
            app.PointsEditField.Enable = 'Off';
            app.RepetitionsEditField.Enable = 'Off';
            app.CyclesEditField.Enable = 'Off';
            
            app.SWEEPButton.Enable = 'Off';
            app.STOPSWEEPButton.Enable = 'On';
            
            app.LOADSWEEPButton.Enable = 'Off';
            app.SAVESWEEPButton.Enable = 'Off';
            
            
            % Turn on the CW with freq. start as its frequency
            freqCW = num2str(app.FreqStartGHzEditField.Value);
            powerCW = num2str(app.PowerdBmEditField.Value);
            
            fprintf(d, 'FREQ %s Ghz\n', freqCW);
            pause(0.1)
            fprintf(d, 'POW %s dBm\n', powerCW);
            pause(0.1)
            
            % Display the current configuration of CW
            disp("The CW frequency is ")
            query(d, 'FREQ?')
            disp("\nThe CW power is ")
            query(d, 'POW?')
            
            % Activate the rf
            fprintf(d, 'OUTP ON\n');
            
            
            % Sweep Conf.
            frqStart = app.FreqStartGHzEditField.Value;
            freqStop = app.FreqStopGHzEditField.Value;
            dwellTime = (app.DTimemsEditField.Value)/1000;
            nPoints = app.PointsEditField.Value;
            nReps = app.RepetitionsEditField.Value;
            nCycle = app.CyclesEditField.Value;
            
            % Original list of frequencies provided by the user
            app.freqSwep = linspace(frqStart, freqStop, nPoints);
            
            
            % Adding a point to the sweep to discard and avoid errors associated with delay time
            deltaFreq = (frqStart - freqStop)/(nPoints - 1);
            
            % Change the stop frequency and number of points
            freqStop = freqStop + deltaFreq;
            nPoints = nPoints + 1;
          
            
            
            % Freq. start
            fprintf(d, 'FREQ:STAR %s GHz\n', num2str(frqStart));
            pause(0.1)
            % Freq. stop
            fprintf(d, 'FREQ:STOP %s GHz\n', num2str(freqStop));
            pause(0.1)
            % Dwell time
            fprintf(d, 'SWE:DWEL %s s\n', num2str(dwellTime));
            pause(0.1)
            % Points
            fprintf(d, 'SWE:POIN %s \n', num2str(nPoints));
            pause(0.1)
            % Repetitions
            fprintf(d, 'SWE:COUN %s \n', num2str(nReps*nCycle));
            pause(0.1)
            % disable RF output blanking while waiting for the trigger signal
            fprintf(d, 'SWE:BLAN OFF \n');
            pause(0.1)
            
            
            % Trigger input configuration
            % Source
            fprintf(d,'TRIG:SOUR EXT \n');
            pause(0.1)
            % Trigger type
            fprintf(d,'TRIG:TYPE NORM \n');
            pause(0.1)
            
            % Trigger output configuration
            fprintf(d,'LFO:SOUR TRIG \n');
            pause(0.1)
            fprintf(d,'TRIG:OUTP:MODE POIN \n');
            pause(0.1)
            
            % Handle the RF
            if ~app.rfState
                app.RFSwitch.Value = 'On';
                RFSwitchValueChanged(app)
            end
            
            % set sweep
            fprintf(d, 'FREQ:MODE SWE\n');
            pause(0.1)
            % activate trigger output
            fprintf(d, 'LFO:STAT ON \n');
        end
        
        
        
        function iniciarSesionRF(app)
            if ~(isempty(app.DAQSessionTrace))
                % Detener sesion de traza para usar sus canales
                stop(app.DAQSessionTrace)
                release(app.DAQSessionTrace)
                delete(app.DAQSessionTrace)
                
                app.DAQSessionTrace = [];
                
                %=========================
                % detener y eliminar apd2
                stop(app.DAQSessionTrace2)
                release(app.DAQSessionTrace2)
                delete(app.DAQSessionTrace2)
                
                app.DAQSessionTrace2 = [];
            end
            
            % Verificar si se estan usando los canales del piezo
            
            if ~(isempty(app.DAQSesionCoordX))
                % Detener sesion de coordenada X
                stop(app.DAQSesionCoordX)
                release(app.DAQSesionCoordX)
                delete(app.DAQSesionCoordX)
                
                app.DAQSesionCoordX = [];
            end
            
            if ~(isempty(app.DAQSesionCoordY))
                % Detener sesion de coordenada Y
                stop(app.DAQSesionCoordY)
                release(app.DAQSesionCoordY)
                delete(app.DAQSesionCoordY)
                
                app.DAQSesionCoordY = [];
            end
            
            if ~(isempty(app.DAQScanSession))
                % Detener sesion de coordenada Y
                stop(app.DAQScanSession)
                release(app.DAQScanSession)
                delete(app.DAQScanSession)
                
                app.DAQScanSession = [];
            end
            
            if ~(isempty(app.DAQScanSweepSession))
                % Detener sesion de coordenada Y
                stop(app.DAQScanSweepSession)
                release(app.DAQScanSweepSession)
                delete(app.DAQScanSweepSession)
                
                app.DAQScanSweepSession = [];
            end
            
            if ~(isempty(app.DAQScanTrace))
                % Detener sesion de coordenada Y
                stop(app.DAQScanTrace)
                release(app.DAQScanTrace)
                delete(app.DAQScanTrace)
                
                app.DAQScanTrace = [];
            end
            
            % Si la sesión del scan está activa solo necesitamos actualizar
            % frecuencia
            if ~(isempty(app.DAQRFSession))
                % AGREGAR LISTENER PARA VOLVER A HACER FIGURA Y CONTAR
                % CUENTAS
                % Listener to process collected data
                app.RFCountsListener = addlistener(app.DAQScanSweepSession, 'DataAvailable', @(src, event) RFCountsProcessing(app, event));
            else
                % Actualizar frecuencia del reloj
                iniciarSesionReloj(app,'scan')
                
                %Crear sesion principal para el scan
                s_RF = daq.createSession('ni');
                
                % Agregar un canal de entrada para contador Excelitas
                addCounterInputChannel(s_RF, 'Dev1', 'ctr0', 'EdgeCount');
                
                % Agregar un canal de entrada para contador Lasercomp
                addCounterInputChannel(s_RF, 'Dev1', 'ctr3', 'EdgeCount');
                
                % Configurar reloj
                s_RF.addClockConnection('External', 'Dev1/PFI13', 'ScanClock');
                
                % Configurar la tasa de muestreo igual a frec. del reloj
                s_RF.Rate = app.ScanFreqEditField.Value;
                
                % Recibir datos de manera continua
                s_RF.IsContinuous = true;
                
                s_RF.NotifyWhenDataAvailableExceeds = 5E3;
                
                % Guardar sesion como variable de la clase
                app.DAQRFSession = s_RF;
                
                % Listener to process collected data
                app.RFCountsListener = addlistener(app.DAQRFSession, 'DataAvailable', @(src, event) RFCountsProcessing(app, event));
                
                % ==============================================================
                
                % Crear figura externa a la app para mostrar traza
                app.RFFigure = figure('Name','CW', 'Position', [910, 50, 1000, 800], ...
                    'CloseRequestFcn', @(src, event) closeFigRFCallback(app, src, event));
                
                
                % Obtener el handle a los ejes de la figura
                app.axesRF = axes(app.RFFigure);
                %Hacer plot sin datos
                app.lineRF = plot(app.axesRF, NaN, 'LineWidth',3,"Color",'k');
                
                % Conf. título y etiquetas
                title(app.axesRF, 'CW');
                xlabel(app.axesRF, 'u.a');
                ylabel(app.axesRF, 'Cts');
                
                xlim(app.axesRF,[0, 1E4]);
                set(app.axesRF, 'FontSize', 32);
                
            end
        end
        
        function RFCountsProcessing(app, event)
            
            dataAPD = diff(event.Data(:,1));
            dataLas = diff(event.Data(:,2));
            
            data = dataAPD + dataLas;
            
            app.DataFIFOBufferRF = storeDataInFIFO(app, app.DataFIFOBufferRF, 1E4, data);
            
            set(app.lineRF ,'YData', app.DataFIFOBufferRF);
            drawnow limitrate;
        end
        
        
        
        function iniciarTrazaScan(app, task)
            if ~(isempty(app.DAQScanTrace))
                
                % Si hay una sesion asociada al scan estará usando los
                % canales de la traza. 
                
                stop(app.DAQScanTrace)
                release(app.DAQScanTrace)
                delete(app.DAQScanTrace)
                
                % Eliminar listener
                delete(app.scanTraceListener);
                app.scanTraceListener = [];
                
                app.DAQScanTrace = [];
                
                iniciarTrazaScan(app, task)
                
            else
                %Crear sesion principal para adquisición de cuentas
                s_in = daq.createSession('ni');
                
                % Agregar un canal de entrada para contador
                switch task
                    case 'scan'
                        addCounterInputChannel(s_in, 'Dev1', 'ctr2', 'EdgeCount');
                    case 'sweep'
                        addCounterInputChannel(s_in, 'Dev1', 'ctr3', 'EdgeCount');
                end
                
                
                % TRAZA DEL SCAN USA RELOJ EXTERNO
                
                % Agregar reloj a sesion de traza
                s_in.addClockConnection('External', 'Dev1/PFI7', 'ScanClock');
                
                % Configurar la tasa de muestreo igual a frec. del reloj
                frecGenerador = 5E2; %500 hz en keysight wave gen.
                s_in.Rate = frecGenerador;
                
                % Recibir datos de manera continua
                s_in.IsContinuous = true;
                
                % Configurar cantidad de datos para llamar al listener
                s_in.NotifyWhenDataAvailableExceeds = app.NotifyScansSpinner.Value;
                
                % Guardar sesion como variable de la clase
                app.DAQScanTrace = s_in;
                
                
                % Inicializar listener como arreglo vacío.
                app.scanTraceListener = [];
            end
        end
        
        
        function actualizarCountdown(app)
            
            % diminuir el valor en 1
            currentTime = app.TimeScansEditField.Value - 1;
            
            % Actualizar el valor en GUI
            app.TimeScansEditField.Value = currentTime;
            
            % Verificar si la cuenta regresiva ha llegado a 0
            if currentTime <= 0
                stop(app.CountdownTimer);  % Detener el timer
                delete(app.CountdownTimer);  % Eliminar el timer
                app.CountdownTimer = [];
            end
        end
        
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%% F U N C I O N E S  D E S A C O P L E %%%%%%%%%%%%%%%%%%%%%%%
        
        function iniciarSesionCoordenada(app, valor)
            
            
            switch(valor)
                case 'x'
                    if isempty(app.DAQSesionCoordX)
                        % Crear sesion para entrada y salida de voltajes X
                        s = daq.createSession('ni');
                        addAnalogOutputChannel(s, 'Dev1', 'ao0', 'Voltage');
                        addAnalogInputChannel(s, 'Dev1', 'ai0', 'Voltage');
                        app.DAQSesionCoordX = s;
                    end
                    
                case 'y'
                    if isempty(app.DAQSesionCoordY)
                        % Crear sesion para entrada y salida de voltajes Y
                        s = daq.createSession('ni');
                        addAnalogOutputChannel(s, 'Dev1', 'ao1', 'Voltage');
                        addAnalogInputChannel(s, 'Dev1', 'ai4', 'Voltage');
                        app.DAQSesionCoordY = s;
                    end
                    
                case 'z'
                    if isempty(app.DAQSesionCoordZ)
                        % Crear sesion para entrada y salida de voltajes Y
                        s = daq.createSession('ni');
                        addAnalogOutputChannel(s, 'Dev1', 'ao2', 'Voltage');
                        addAnalogInputChannel(s, 'Dev1', 'ai16', 'Voltage');
                        app.DAQSesionCoordZ = s;
                    end
            end
        end
        
        
        % Entregar voltajes dentro de rango específico
        function voltajeActual = recortarVoltaje(app, voltaje, minVal, maxVal)
            voltajeActual = max(min(voltaje, maxVal), minVal);
        end
        
        
        % Actualizar oltajes considerando sesion de cada cordenada
        function actualizarVoltajes(app)
            % Leer voltaje actual en cada coordenada
            voltajeX = inputSingleScan(app.DAQSesionCoordX);
            voltajeY = inputSingleScan(app.DAQSesionCoordY);
            voltajeZ = inputSingleScan(app.DAQSesionCoordZ);
            
            
            app.currentVoltX = recortarVoltaje(app, voltajeX, 0, 10);
            app.currentVoltY = recortarVoltaje(app, voltajeY, 0, 10);
            app.currentVoltZ = recortarVoltaje(app, voltajeZ, 0, 10);
            
            % Actualizar valores actuales de voltaje en UI
            app.XEditField.Value = app.currentVoltX * 8;
            app.YEditField.Value = app.currentVoltY * 8;
            app.ZEditField.Value = app.currentVoltZ * 8;
            
            updateSliderZ(app, app.ZEditField.Value)
        end
        
        
        % Actualizar voltajes desde sesion de Scan
        function actualizarVoltajeScan(app)
            
            % Vector asociado con voltajes de cada entrada
            voltajes = inputSingleScan(app.DAQScanSession);
            
            % Guardar voltajes en variables de app
            app.currentVoltX = recortarVoltaje(app, voltajes(1), 0.0, 10.0);
            app.currentVoltY = recortarVoltaje(app, voltajes(2), 0.0, 10.0);
            
            % Actualizar valores actuales de voltaje y posicion en UI
            app.XEditField.Value = app.currentVoltX * 8;
            app.YEditField.Value = app.currentVoltY * 8;
            
        end
        
        
        % Crear vectores con voltajes de salida con cantidad de elementos
        % que depende de punto inicial y final
        function outVoltage = voltVector(app, voltPtoInicial, voltPtoFinal)
            
            % calcular el voltaje total a desplazar
            
            totalVoltStep = abs(voltPtoFinal-voltPtoInicial);
            
            % Número de steps que tendrá el movimiento
                
            intervalos = ceil(totalVoltStep/app.maxVoltPiezo) + 1; 
                
            % Camino de voltajes a seguir en el piezo durante el
            % desplazamiento
                
            outVoltage = linspace(voltPtoInicial, voltPtoFinal, intervalos);
        end
        
        
        % Desplazar piezo considerando cada coordenada
        function desplazarCoordenada(app, coordenada)
            
            switch coordenada % Determinar canal y voltajes dependiendo de coordenada
                case 'x'
                    outChannel = app.DAQSesionCoordX;
                    voltPtoInicial = app.currentVoltX;
                    voltPtoFinal = app.voltFinalX;
                    app.currentVoltX = app.voltFinalX;
                case 'y'
                    outChannel = app.DAQSesionCoordY;
                    voltPtoInicial = app.currentVoltY;
                    voltPtoFinal = app.voltFinalY;
                    app.currentVoltY = app.voltFinalY;
                case 'z'
                    outChannel = app.DAQSesionCoordZ;
                    voltPtoInicial = app.currentVoltZ;
                    voltPtoFinal = app.voltFinalZ;
                    app.currentVoltZ = app.voltFinalZ;
            end
            
            totalVoltStep = abs(voltPtoFinal-voltPtoInicial); % Voltaje total a desplazar
            
            % Verificar si el desplazamiento total sobrepasa umbral de voltaje
            if(app.maxVoltPiezo < totalVoltStep) 
                
                salidaVoltaje = voltVector(app, voltPtoInicial, voltPtoFinal);
                
                % Iniciar desplazamiento en steps
                for i =1:length(salidaVoltaje)
                    outputSingleScan(outChannel, salidaVoltaje(i));
                    %pause(0.01);
                end
            else
                % Si el desplazamiento no sobrepasa umbral de voltaje
                outputSingleScan(outChannel, voltPtoFinal);
            end
            
        end
        
        
        % Funcion para actualizar valor esperado del timer paa scan
        function tiempoDeEspera(app)
            
            % Frecuencia de escaneo
            frec = app.ScanFreqEditField.Value;
            
            % Cantidad de elementos minimos que debe tener la salida de
            % voltaje en scan
            dimOutput = 0.5 * frec;   
            
            % Tiempo que consideramos que el piezo se mueve
            settlingTime = (app.StimemsEditField.Value)/1000;
            
            % Tiempo durante el cual se considerarán cuentas válidas
            integrationTime = (app.CtimemsEditField.Value)/1000;
            
            % Cantidad de elementos en voltaje constante
            constVoltIntervalo = int64(frec * (settlingTime + integrationTime));
            
            % Cantidad de puntos a escanear
            nPuntos = app.ScanNpixelsEditField.Value;
            
            % Total de elementos en output considerando tramo que devuelve
            % al piezo al (0,0)
            totalElementosOutput = (constVoltIntervalo + 1) * nPuntos * nPuntos;
            
            % Verificar que la salida de voltaje tenga los elementos
            % minimos
            if(totalElementosOutput < dimOutput)
                % Modificar nPuntos dados settlingTime e integrationTime
                nPuntos = ceil(sqrt(0.5 * (settlingTime + integrationTime)^-1));
                totalElementosOutput = (constVoltIntervalo + 1) * nPuntos * nPuntos;
                
                app.ScanNpixelsEditField.Value = nPuntos;
            end
            
            % Configurar tiempo inicial
            initialTime = double( ((settlingTime + integrationTime)*totalElementosOutput)/constVoltIntervalo )  + 8;
            app.TimeScansEditField.Value = initialTime;
        end
        
        
        function outCoords = vectorCoordsOptimiza(app, coordenada, intervaloOptimizar, stepInicial)
            
            % Crear posiciones a visitar en X e Y
            primerIntervalo = ((-1 * intervaloOptimizar):stepInicial:intervaloOptimizar)';
            segundoIntervalo = ((-0.5 * intervaloOptimizar):(0.5 * stepInicial):(0.5 * intervaloOptimizar))';
            tercerIntervalo = ((-(intervaloOptimizar + stepInicial) * 0.25):(0.25 * stepInicial):((intervaloOptimizar + stepInicial) * 0.25))';
            
            % Intervalo a optimizar se encuentra en nm
            factorConv = 0.001;
            
            % Coordenadas a visitar en um
            outCoords = sort(unique([primerIntervalo; segundoIntervalo; tercerIntervalo])) * factorConv + coordenada;
            
        end
        
        % FUNCIONES PARA OPTIMIZAR
        function [posAjustada, anchuraAjustada] = optimizarPos(app, posiciones, ctasMedidas, anchura, coordenada)
            
            % Definir la función gaussiana a ajustar
            
            Funcion_fit = @(p) calcularAjusteGaussiano(app, p(1), p(2), p(3), p(4), posiciones);
            
            % Definir la función de error
            err = @(p) sum((Funcion_fit(p) - ctasMedidas).^2);
            
            % Valores iniciales para el ajuste:
            % posición inicial aproximada del pico
            p1 = posiciones(round(mean(find(abs(ctasMedidas - max(ctasMedidas)) < 0.2))));
            
            % anchura inicial proporcionada como parámetro de entrada.
            p2 = anchura;
            
            % vector con los valores iniciales de los parámetros .
            p0 = [p1, p2, (max(ctasMedidas) - min(ctasMedidas)), min(ctasMedidas)];
            
            % Realizar el ajuste utilizando 'fminsearch' para minimizar el error de ajuste.
            [P, ~, ~] = fminsearch(err, p0);
            
            % Los parámetros:
            % P(1): posición ajustada del pico (mu).
            % P(2): anchura ajustada del pico (sigma).
            % P(3): amplitud ajustada.
            % P(4): offset ajustado.
            
            % Calcular los valores ajustados de la función gaussiana con los parámetros optimizados.
            ajusy = calcularAjusteGaussiano(app, P(1), P(2), P(3), P(4), posiciones);
            
            % Graficar los datos originales y la curva ajustada.
            switch coordenada
                case 'x' 
                    app.figOptX = figure('Name','Coordenada X', 'Position', [10, 570, 560, 420]);
                    ax = axes(app.figOptX);
                    plot(ax, posiciones, ctasMedidas, '*');
                    hold(ax, "on")
                    plot(ax, posiciones, ajusy, 'LineWidth', 3)
                    hold(ax, "off")
                case 'y'
                    app.figOptY = figure('Name','Coordenada Y', 'Position', [580, 570, 560, 420]);
                    ax = axes(app.figOptY);
                    plot(ax, posiciones, ctasMedidas, '*');
                    hold(ax, "on")
                    plot(ax, posiciones, ajusy, 'LineWidth', 3)
                    hold(ax, "off")
                case 'z'
                    app.figOptZ = figure('Name','Coordenada Z', 'Position', [10, 100, 560, 420]);
                    ax = axes(app.figOptZ);
                    plot(ax, posiciones, ctasMedidas, '*');
                    hold(ax, "on")
                    plot(ax, posiciones, ajusy, 'LineWidth', 3)
                    hold(ax, "off")
            end
%             figure
%             plot(posiciones, ctasMedidas, '*') % Datos medidos.
%             hold on
%             plot(posiciones, ajusy, 'LineWidth', 3) % Curva ajustada.
%             hold off
            
            % Si la anchura ajustada (P(2)) es muy diferente de la inicial (más del doble o menor a 0.1),
            % se mantiene la anchura inicial p2 para evitar un ajuste incorrecto.
            if or(P(2) > 2 * p2, P(2) < 0.1)
                anchuraAjustada = 2*sqrt(2*log(2))*p2;
            else
                anchuraAjustada = 2*sqrt(2*log(2))*P(2);
            end
            
            % Si la posición ajustada (P(1)) está fuera del rango de las posiciones medidas,
            % se mantiene la posición inicial p1.
            if or(P(1) > posiciones(end), P(1) < posiciones(end))
                posAjustada = p1;
            else
                posAjustada = P(1);
            end
        end
        
        
        function ajusteGaussiano = calcularAjusteGaussiano(app, media, desviacion, amplitud, offset, posiciones)
            
            % Cálculo de la función gaussiana:
            ajusteGaussiano = offset + amplitud .* (1/(sqrt(2*pi) * desviacion)) .* ...
                exp(-0.5 * ((posiciones - media) / desviacion).^2);
        end
        
        function actualizarBarraColor(app, tarea)
            
            switch tarea
                case 'scan'
                    matrizCuentas = app.countsMatrixCount1;
                case 'zoom'
                    matrizCuentas = app.countsZoomCount1;
            end
            
            app.minColorbar = min(matrizCuentas,[],"all");
            app.maxColorbar = max(matrizCuentas,[],"all");
            
            if app.minColorbar == 0 && app.maxColorbar == 0
                % Establecer límites por defecto
                caxis(app.UIAxes, [-1, 1]);
                
                app.MinEditField.Value = -1;
                app.MaxEditField.Value = 1;
            elseif app.maxColorbar == app.maxColorbar
                caxis(app.UIAxes, [0, app.maxColorbar]);
                
                app.MinEditField.Value = 0;
                app.MaxEditField.Value = app.maxColorbar;
            else
                % Establecer límites por defecto
                caxis(app.UIAxes, [app.maxColorbar, app.maxColorbar]);
                
                app.MinEditField.Value = app.minColorbar;
                app.MaxEditField.Value = app.maxColorbar;
            end
        end
        
          
        
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            
             %===============================================================
            % Se iniciaran sesiones principales al inciar la aplicación
            % para evitar conflictos al ejecutar distintas funcionalidades.
            %===============================================================
            
            % Crear sesión para generación de pulsos a usar como reloj
            %iniciarSesionReloj(app,'traza')
            
            % Crear sesión para medir la traza
            %iniciarSesionTraza(app)
            
            % Crear sesión para manejar piezo
            iniciarSesionCoordenada(app,'x')
            iniciarSesionCoordenada(app,'y')
            iniciarSesionCoordenada(app,'z')
            
            %======================================================================
            %======================================================================
            
            
            actualizarVoltajes(app)
            
            app.countsMatrixCount1 = zeros(80,80);
            app.xCoordCts = linspace(0,80,81)';
            app.yCoordCts = linspace(0,80,81)';
            
            dataLoadedCallback(app)
            
            % Inicializar timer
            tiempoDeEspera(app)
            
            % configurar diponibilidad de interacciones en la GUI
            setAppViewState(app, 'configuration');
            drawnow
        end

        % Button pushed function: StartTraceButton
        function StartTraceButtonPushed(app, event)
            
            if ~(isempty(app.DAQSessionTrace))
                % Verificar si los datos serán guardados
                
                if app.LogRequested
                    % If Log data to file switch is on
                    % Create and open temporary binary file to log data to disk
                    app.TempFilename = tempname;
                    app.TempFile = fopen(app.TempFilename, 'w');
                end
                
                %======================================================================
                %===================== CONF. GRÁFICO TRAZA ======================
                
                % Setear buffers como arreglos vacíos previo a usarlos
                app.DataFIFOBufferTraceCount1 = [];
                
                app.DataFIFOBufferTraceCount2 = [];
                
                % Crear figura externa a la app para mostrar traza
                
                app.traceFigure = figure('Name','Traza', 'Position', [910, 50, 1000, 800], ...
                    'CloseRequestFcn', @(src, event) closeTraceCallback(app, src, event));
                
                % Crear el primer subplot para el gráfico principal
                app.axesTraceCount1 = subplot(2, 1, 1, 'Parent', app.traceFigure);
                app.lineTraceCount1 = plot(app.axesTraceCount1, NaN, 'LineWidth', 3, "Color", 'k');
                ylabel(app.axesTraceCount1, 'Cts/s', 'Color', 'k');
                title(app.axesTraceCount1, 'Traza');
                xlim(app.axesTraceCount1, [0, app.NBufferEditField.Value]);
                set(app.axesTraceCount1, 'FontSize', 32);
                
                % Crear el segundo subplot para el gráfico infrarrojo
                app.axesTraceCount2 = subplot(2, 1, 2, 'Parent', app.traceFigure);
                app.lineTraceCount2 = plot(app.axesTraceCount2, NaN, 'LineWidth', 3, "Color", 'b');
                ylabel(app.axesTraceCount2, 'Cts/s', 'Color', 'k');
                xlabel(app.axesTraceCount2, 'u.a');
                xlim(app.axesTraceCount2, [0, app.NBufferEditField.Value]);
                set(app.axesTraceCount2, 'FontSize', 32);

                %======================================================================
                %======================================================================
                
                iniciarSesionReloj(app,'traza')
                
                % Crear listener e iniciar en 2do plano sesion de adquisición
                app.TraceAvailableListener = addlistener(app.DAQSessionTrace, 'DataAvailable', ...
                    @(src,event) processTrace(app, src, event));
                
                startBackground(app.DAQSessionTrace);
                
                % Listener 2da sesion traza
                app.TraceAvailableListener2 = addlistener(app.DAQSessionTrace2, 'DataAvailable', ...
                    @(src,event) processTraceCount2(app, src, event));
                
                startBackground(app.DAQSessionTrace2);
                %======================================================================
                %======================================================================
                
                % Modificar apariencia de botones y switches en UI
                
                setAppViewState(app, 'acquisition');
                
            else
                iniciarSesionTraza(app)
                StartTraceButtonPushed(app,event)
            end            

        end

        % Value changed function: StopTraceButton
        function StopTraceButtonValueChanged(app, event)
            % Eliminar e inicializar listener a array vacío
            delete(app.TraceAvailableListener2);
            app.TraceAvailableListener2 = [];
            
            % Eliminar e inicializar listener a array vacío
            delete(app.TraceAvailableListener);
            app.TraceAvailableListener = [];
            
            % Setear handles de gráfico de traza a array vacios
            app.lineTraceCount2 = [];
            app.lineTraceCount1 = [];
            
            % Setear handles de gráfico de traza a array vacios
            delete(app.traceFigure)
            app.traceFigure = [];
            app.axesTraceCount1 = [];
            app.axesTraceCount2 = [];
            
            % Detener adquisición de datos
            stop(app.DAQSessionTrace)
            
            
            
            %==================================
            % Eliminar sesion de traza 2
            % Detener adquisición de datos
            stop(app.DAQSessionTrace2)
            
            
            
            % Activar interacción con componentes de la UI
            if ~(isempty(app.DAQSesionCoordX))
                setAppViewState(app, 'configuration');
                
            else
                setAppViewState(app, 'scannerFinished');
            end
            
            app.TrackerSwitch.Value = 'Off';
            
            
            % Verificar si hay que guardar archivos
            
            if app.LogRequested
                % Log data to file switch is on
                % Save logged data to MAT file (unless the user clicks Cancel in the "Save As" dialog)
                
                % Close temporary binary file
                fclose(app.TempFile);
                
                
                % Gather metadata in preparation for saving to MAT file
                % Store relevant Daq device info
                metadata.IntegrationTime = app.IntTimemsEditField.Value;
                metadata.NotifyScans = app.NotifyScansSpinner.Value;
                metadata.ClkFreq = 1000/(app.IntTimemsEditField.Value);
                metadata.TriggerTime = datetime(app.TriggerTime, 'ConvertFrom', 'datenum', 'TimeZone', 'local');
                
                % Open "Save As" to request destination MAT file path and file name from user
                [filename, pathname] = uiputfile({'*.mat'}, 'Save as',...
                    fullfile(app.Filepath, datestr(datetime('now'), 'yyyy-mm-dd_HHMMSS_TRA')));
                
                if ~(isequal(filename,0) || isequal(pathname,0))
                    % User specified a file name in a folder with write permission
                    app.Filename = datestr(datetime('now'), 'yyyy-mm-dd_HHMMSS_TRA');
                    app.Filepath = pathname;
                    cancelSaveAs = false;
                else
                    %  User clicked Cancel in "Save As" dialog
                    cancelSaveAs = true;
                end
                
                if ~cancelSaveAs
                    % Convert data from binary file to MAT file
                    matFilepath = fullfile(app.Filepath, datestr(datetime('now'), 'yyyy-mm-dd_HHMMSS_TRA'));
                    
                    
                    numColumns = 2;
                    binFile2MAT(app, app.TempFilename, matFilepath, numColumns, metadata);
                    
                else
                    % User clicked Cancel in "Save As" dialog
                    % Inform user that data has not been saved
                end
            end
            
        end

        % Close request function: UIFigure
        function UIFigureCloseRequest(app, event)
            
            % Interacción para cerrar aplicación y usar callback para cerrar
            
            % Calcular distancia de posicion actual al origen
            posicionActual = [app.XEditField.Value, app.YEditField.Value, app.ZEditField.Value];
            dist = sqrt(sum(posicionActual.^2));
            
            % Si la posición actual no está en el origen preguntar para
            % mover el piezo
            if dist > 0.087
                moveToOrigin = uiconfirm(app.UIFigure, ...
                    'Do you want to place the piezo at the origin (0,0,0)?', ...
                    'Move Piezo to Origin', ...
                    'Options', {'Yes', 'No'}, ...
                    'DefaultOption', 1, ...
                    'CancelOption', 2);
                % Si el usuario selecciona "Yes" para mover el piezo
                if strcmp(moveToOrigin, 'Yes')
                    % Llamar a una función para mover el piezo al origen
                    Goto000ButtonValueChanged(app, [])
                end
            end
            
            % Verifica si la traza esta adquiriendo datos
            isAcquiring = ~isempty(app.DAQSessionTrace) && app.DAQSessionTrace.IsRunning;
            if isAcquiring
                question = 'Abort acquisition and close app?';
            else
                % La adquisición está detenida
                question = 'Close app?';
            end
            
            uiconfirm(app.UIFigure,question,'Confirm Close',...
                             'CloseFcn',@(src,event) closeApp_Callback(app,src,event,isAcquiring));

        end

        % Value changed function: SavingDataSwitch
        function SavingDataSwitchValueChanged(app, event)
            updateLogdatatofileSwitchComponents(app)
        end

        % Value changed function: IntTimemsEditField
        function IntTimemsEditFieldValueChanged(app, event)
            
            % Ajustar datos necearios para notificar en listener de
            % adquisicion dependiendo de tiempo de integración ingresado
            % por usuario
            
            dT = app.IntTimemsEditField.Value;
            notify = app.NotifyScansSpinner.Value;
            
            prod = dT * notify;
            
            if(prod < 100)
                app.NotifyScansSpinner.Value = round(100/dT) + 1;
            
            end
            
        end

        % Value changed function: NotifyScansSpinner
        function NotifyScansSpinnerValueChanged(app, event)
            
            % Ajustar tiempo de integración de adquisición de datos
            % dependiendo de datos necesarios para notificar en listener
            % ingresados por usuario
            
            dT = app.IntTimemsEditField.Value;
            notify = app.NotifyScansSpinner.Value;
            
            prod = dT * notify;
            
            if(prod < 100)
                app.IntTimemsEditField.Value = ceil((100/notify)*10)/10 ;
            
            end
        end

        % Button pushed function: LoadFigureButton
        function LoadFigureButtonPushed(app, event)
            % Se carga data elegida por usuario y se grafica apd excelitas
            
            if ~(isempty(app.DAQSesionCoordX))
                % Definir la carpeta actual
                currentFolder = pwd;
                
                % Definir el filtro de archivos para archivos .mat
                fileFilter = {'*.mat', 'Archivos MAT (*.mat)'};
                
                % Abrir el diálogo de selección de archivos
                [file, path] = uigetfile(fileFilter, 'Seleccionar un archivo MAT', currentFolder);
                
                % Verificar si se seleccionó un archivo
                if isequal(file, 0)
                    disp('Se ha cancelado cargar una figura');
                else
                    fullPath = fullfile(path, file);
                    disp(['Has seleccionado: ', fullPath]);
                    
                    % Cargar datos escaneados
                    struct = load(fullPath);
                    
                    % Identificar si el archivo tiene la estructura 'scan' o 'zoom'
                    if isfield(struct, 'scan')
                        dataStruct = struct.scan;
                    elseif isfield(struct, 'zoom')
                        dataStruct = struct.zoom;
                    else
                        disp('El archivo no contiene las estructuras esperadas.');
                        return;
                    end
                    
                    % Extraer coordenadas y datos de la estructura correspondiente
                    app.xCoordCts = dataStruct.data.x;
                    app.yCoordCts = dataStruct.data.y;
                    app.countsMatrixCount1 = dataStruct.data.count1;
                    app.countsMatrixCount2 = dataStruct.data.count2;
                    
                    % Leer voltajes actuales en piezo para cada coordenada
                    actualizarVoltajes(app)
                    
                    % Moverse a puntos donde se fijó offset para scan/zoom
                    app.voltFinalX = dataStruct.metadataScan.posX * 0.125;
                    app.voltFinalY = dataStruct.metadataScan.posY * 0.125;
                    app.voltFinalZ = dataStruct.metadataScan.posZ * 0.125;
                    
                    desplazarCoordenada(app,'x')
                    desplazarCoordenada(app,'y')
                    desplazarCoordenada(app,'z')
                    
                    % Actualizar voltajes actuales
                    actualizarVoltajes(app)
                    
                    % Hacer reset a colorbar
                    maxActual = max(app.countsMatrixCount1,[],'all');
                    minActual = min(app.countsMatrixCount1,[],'all');
                    
                    if maxActual == minActual
                        % Establecer límites por defecto
                        caxis(app.UIAxes, [0, 1000]);
                    else
                        % Establecer límites por defecto
                        caxis(app.UIAxes, [minActual, maxActual]);
                    end
                    
                    % Setear pestañas de colorbar a 0
                    app.MinEditField.Value = 0;
                    app.MaxEditField.Value = 0;
                    
                    % Llamar función que hace gráfico y configura listeners
                    dataLoadedCallback(app);
                    
                    % Actualizar valores del scan
                    app.ScanNpixelsEditField.Value = dataStruct.metadataScan.nPixels;
                    app.ScanFreqEditField.Value = dataStruct.metadataScan.frecuencia;
                    app.StimemsEditField.Value = dataStruct.metadataScan.settlingTime;
                    app.CtimemsEditField.Value = dataStruct.metadataScan.countsTime;
                    app.XoffsetEditField.Value = dataStruct.metadataScan.posX;
                    app.YoffsetEditField.Value = dataStruct.metadataScan.posY;
                    app.ZoffsetEditField.Value = dataStruct.metadataScan.posZ;
                    app.ScanSizeumEditField.Value = dataStruct.metadataScan.scanSize;
                    
                    app.SampleNameEditField.Value = dataStruct.metadataMuestra.muestra;
                    app.FilterNameEditField.Value = dataStruct.metadataMuestra.filtro;
                    
                    app.Count1DropDown.Value = dataStruct.metadataMuestra.detector1;
                    app.Count2DropDown.Value = dataStruct.metadataMuestra.detector2;
                    
                    app.PoweruWEditField.Value = dataStruct.metadataMuestra.potencia;
                    app.WavelengthnmEditField.Value = dataStruct.metadataMuestra.longOnda;
                    
                    % Actualizar timer
                    tiempoDeEspera(app)
                    
                end
            else
                iniciarSesionCoordenada(app,'x')
                iniciarSesionCoordenada(app,'y')
                iniciarSesionCoordenada(app,'z')
                LoadFigureButtonPushed(app, event);
            end

            

        end

        % Value changed function: NBufferEditField
        function NBufferEditFieldValueChanged(app, event)
            %supLim = app.NBufferEditField.Value;
            %xlim(app.axesTrace, [0, supLim])
        end

        % Value changed function: RightXButton
        function RightXButtonValueChanged(app, event)
            
            if ~(isempty(app.DAQSesionCoordX))
                % Leer voltajes actuales en piezo
                actualizarVoltajes(app)
                
                % Obtener coordenada X actual
                x = app.currentVoltX * 8;
                
                % Obtener desplazamiento en nm para coord. X
                rightX = x + app.StepnmEditField.Value/1000;
                
                % Verificar que desplazamiento está dentro de los margenes
                
                if rightX >= min(app.xCoordCts) && rightX <= max(app.xCoordCts)
                    
                    % Obtener voltaje asociado a dezplazamiento
                    app.voltFinalX = rightX * 0.125;
                    
                    % Mover el piezo solo en coordenada X
                    outputSingleScan(app.DAQSesionCoordX, app.voltFinalX);
                    
                    % Actualizar voltaje en UI
                    actualizarVoltajes(app)
                    
                    % Actualizar las líneas de coordenadas
                    set(app.hXLine, 'Value', rightX);
                end
            else
                iniciarSesionCoordenada(app,'x')
                iniciarSesionCoordenada(app,'y')
                iniciarSesionCoordenada(app,'z')
                
                RightXButtonValueChanged(app, event)
            end
            
        end

        % Value changed function: LeftXButton
        function LeftXButtonValueChanged(app, event)
            
            if ~(isempty(app.DAQSesionCoordX))
                % Leer voltajes actuales en piezo
                actualizarVoltajes(app)
                
                % Obtener coordenada X actual
                x = app.currentVoltX * 8;
                
                % Obtener desplazamiento en nm para coord. X
                LeftX = x - app.StepnmEditField.Value/1000;
                
                % Verificar que desplazamiento está dentro de los margenes
                
                if LeftX >= min(app.xCoordCts) && LeftX <= max(app.xCoordCts)
                    
                    % Obtener voltaje asociado a dezplazamiento
                    app.voltFinalX = LeftX * 0.125;
                    
                    % Mover el piezo solo en coordenada X
                    outputSingleScan(app.DAQSesionCoordX, app.voltFinalX);
                    
                    % Actualizar voltaje en UI
                    actualizarVoltajes(app)
                    
                    % Actualizar las líneas de coordenadas
                    set(app.hXLine, 'Value', LeftX);
                end
            else
                iniciarSesionCoordenada(app,'x')
                iniciarSesionCoordenada(app,'y')
                iniciarSesionCoordenada(app,'z')
                
                LeftXButtonValueChanged(app, event)
            end
           
            
        end

        % Value changed function: UpYButton
        function UpYButtonValueChanged(app, event)
            
            if ~(isempty(app.DAQSesionCoordY))
                % Leer voltajes actuales en piezo
                
                actualizarVoltajes(app)
                
                % Obtener coordenada Y actual
                
                y = app.currentVoltY * 8;
                
                % Obtener desplazamiento en nm para coord. Y
                
                upY = y - app.StepnmEditField.Value/1000;
                
                % Verificar que desplazamiento está dentro de los margenes
                
                if upY >= min(app.yCoordCts) && upY <= max(app.yCoordCts)
                    
                    % Obtener voltaje asociado a dezplazamiento
                    app.voltFinalY = upY * 0.125;
                    
                    % Mover el piezo solo en coordenada Y
                    outputSingleScan(app.DAQSesionCoordY, app.voltFinalY);
                    
                    % Actualizar voltaje en UI
                    actualizarVoltajes(app)
                    
                    % Actualizar las líneas de coordenadas
                    set(app.hYLine, 'Value', upY);
                end
            else
                iniciarSesionCoordenada(app,'x')
                iniciarSesionCoordenada(app,'y')
                iniciarSesionCoordenada(app,'z')
                
                UpYButtonValueChanged(app, event)
            end
           
            
        end

        % Value changed function: DownYButton
        function DownYButtonValueChanged(app, event)
            
            if ~(isempty(app.DAQSesionCoordY))
                % Leer voltajes actuales en piezo
                actualizarVoltajes(app);
                
                % Obtener coordenada Y actual
                
                y = app.currentVoltY * 8;
                
                % Obtener desplazamiento en nm para coord. Y
                
                DownY = y + app.StepnmEditField.Value/1000;
                
                % Verificar que desplazamiento está dentro de los margenes
                
                if DownY >= min(app.yCoordCts) && DownY <= max(app.yCoordCts)
                    
                    % Obtener voltaje asociado a dezplazamiento
                    app.voltFinalY = DownY/8;
                    
                    % Mover el piezo solo en coordenada Y
                    outputSingleScan(app.DAQSesionCoordY, app.voltFinalY);
                    
                    % Actualizar voltaje en UI
                    actualizarVoltajes(app)
                    
                    % Actualizar las líneas de coordenadas
                    set(app.hYLine, 'Value', DownY);
                end
            else
                iniciarSesionCoordenada(app,'x')
                iniciarSesionCoordenada(app,'y')
                iniciarSesionCoordenada(app,'z')
                
                DownYButtonValueChanged(app, event)
            end
           
            
        end

        % Value changing function: ZSlider
        function ZSliderValueChanging(app, event)
            
            if ~(isempty(app.DAQSesionCoordZ))
                % Update current voltage
                actualizarVoltajes(app)
                
                % Get the current value from slider
                zChanging = event.Value;
                
                % Update coord. Z in UI
                app.ZEditField.Value = zChanging;
                
                % Set the final voltage to approach it
                app.voltFinalZ = zChanging * 0.125;
                
                desplazarCoordenada(app,'z')
                % Update voltage values
                actualizarVoltajes(app)
            else
                iniciarSesionCoordenada(app,'x')
                iniciarSesionCoordenada(app,'y')
                iniciarSesionCoordenada(app,'z')
                
                ZSliderValueChanging(app, event)
            end
                
        end

        % Value changed function: IncZButton
        function IncZButtonValueChanged(app, event)
            
            if ~(isempty(app.DAQSesionCoordZ))
                % Leer voltajes actuales en piezo
                
                actualizarVoltajes(app);
                
                % Obtener coord. Z actual
                
                z = app.currentVoltZ * 8;
                
                % Obtener desplazamiento en nm para coord. Z
                
                incZ = z + app.StepnmEditField.Value/1000;
                
                % Verificar que desplazamiento está dentro de los margenes
                
                if incZ >= 0 && incZ <= 80
                    
                    % Obtener voltaje asociado a dezplazamiento
                    app.voltFinalZ = incZ * 0.125;
                    
                    % Mover el piezo solo en coordenada Z
                    outputSingleScan(app.DAQSesionCoordZ, app.voltFinalZ);
                    
                    % Actualizar voltaje en UI
                    actualizarVoltajes(app)
                    
                    % Actualizar valor slider
                    updateSliderZ(app,incZ);
                end
            else
                iniciarSesionCoordenada(app,'x')
                iniciarSesionCoordenada(app,'y')
                iniciarSesionCoordenada(app,'z')
                
                ZSliderValueChanging(app, event)
            end
       
            
        end

        % Value changed function: DecZButton
        function DecZButtonValueChanged(app, event)
            
            if ~(isempty(app.DAQSesionCoordZ))
                % Leer voltajes actuales en piezo
                actualizarVoltajes(app)
                
                % Obtener coord. Z actual
                
                z = app.currentVoltZ * 8;
                
                % Obtener desplazamiento en nm para coord. Z
                
                decZ = z - app.StepnmEditField.Value/1000;
                
                % Verificar que desplazamiento está dentro de los margenes
                
                if decZ >= 0 && decZ <= 80
                    
                    % Obtener voltaje asociado a dezplazamiento
                    app.voltFinalZ = decZ * 0.125 ;
                    
                    % Mover el piezo solo en coordenada Z
                    outputSingleScan(app.DAQSesionCoordZ, app.voltFinalZ);
                    
                    % Actualizar voltaje en UI
                    actualizarVoltajes(app)
                    
                    % Actualizar valor slider
                    updateSliderZ(app,decZ);
                    
                end
            else
                iniciarSesionCoordenada(app,'x')
                iniciarSesionCoordenada(app,'y')
                iniciarSesionCoordenada(app,'z')
                
                ZSliderValueChanging(app, event)
            end
            
        end

        % Value changed function: Goto000Button
        function Goto000ButtonValueChanged(app, event)
            
            if ~(isempty(app.DAQSesionCoordX) || isempty(app.DAQSesionCoordY) || isempty(app.DAQSesionCoordZ))
                % Leer voltajes actuales en piezo
                actualizarVoltajes(app)
                
                % Setear como voltaje final el 0,0,0
                
                app.voltFinalX = 0;
                app.voltFinalY = 0;
                app.voltFinalZ = 0;
                
                app.ZSlider.Limits = [0 80];
                app.ZSlider.Value = 0;
                
                % Desplazar cada coordenada al 0,0,0
                
                desplazarCoordenada(app,'x')
                desplazarCoordenada(app,'y')
                desplazarCoordenada(app,'z')
                
                % Actualizar valores en UI
                
                actualizarVoltajes(app)
                
                
                % Verificar si las líneas son válidas antes de modificarlas
                if ishandle(app.hXLine) && ishandle(app.hYLine)
                    % Actualizar las líneas de coordenadas en la figura
                    set(app.hXLine, 'Value', x);
                    set(app.hYLine, 'Value', y);
                end
            else
                iniciarSesionCoordenada(app,'x')
                iniciarSesionCoordenada(app,'y')
                iniciarSesionCoordenada(app,'z')
                
                Goto000ButtonValueChanged(app, event)
            end
                
        end

        % Button pushed function: ScanButton
        function ScanButtonPushed(app, event)
            
            setAppViewState(app, 'scanning')
            
            %============================================================================
            %============ E L I M I N A R  T R A Z A  P R I N C I P A L =================
            % Eliminar gráfico de traza en caso de que esté abierto
            if ~(isempty(app.DAQSessionTrace))
                stop(app.DAQSessionTrace)
                release(app.DAQSessionTrace)
                delete(app.DAQSessionTrace)
                
                app.DAQSessionTrace = [];
                
                %=========================
                % detener y eliminar apd2
                stop(app.DAQSessionTrace2)
                release(app.DAQSessionTrace2)
                delete(app.DAQSessionTrace2)
                
                app.DAQSessionTrace2 = [];
                
                % Setear handles de gráfico de traza a array vacios
                delete(app.traceFigure)
                app.traceFigure = [];
                app.axesTraceCount1 = [];
                app.axesTraceCount2 = [];
                app.lineTraceCount1 = [];
                app.lineTraceCount2 = [];
            end
            
            % Eliminar traza de scan en caso de estar abierta
            if ~(isempty(app.DAQScanTrace))
                stop(app.DAQScanTrace)
                release(app.DAQScanTrace)
                delete(app.DAQScanTrace)
                
                app.DAQScanTrace = [];
                
                % Setear handles de gráfico de traza a array vacios
                delete(app.scanTraceFigure)
                app.scanTraceFigure = [];
                app.axesScanTrace = [];
                app.lineScanTrace = [];
            end
            
            if ~(isempty(app.DAQScanSweepSession))
                stop(app.DAQScanSweepSession)
                release(app.DAQScanSweepSession)
                delete(app.DAQScanSweepSession)
                
                delete(app.sweepCountsListener)
                
                disp("Sesion Borrada")
                
                app.sweepCountsListener = [];
                app.DAQScanSweepSession = [];
                
                % Delete the figure with trace and accumulated trace
                delete(app.scanTraceFigure)
                app.scanTraceFigure = [];
                
                app.axesScanTrace = [];
                app.axesMeanTrace = [];
                
                app.lineScanTrace = [];
                app.lineMeanTrace = [];
            end
            
            %======================================================================
            %================= C R E A R  T R A Z A  S C A N ======================
            
            figureTrazaScan(app, 'scan', 'Traza Scan')
            
            %============================================================================
            %==================== P A R A M E T R O S  S C A N ==========================
            
            % Cantidad de elementos minimos en output voltaje
            dimOutput = app.ScanFreqEditField.Value * 0.5;
            
            % Tiempo que consideramos que el piezo se mueve
            settlingTime = (app.StimemsEditField.Value)/1000;
            
            % Tiempo durante el cual se considerarán cuentas válidas
            integrationTime = (app.CtimemsEditField.Value)/1000;
            
            % Cantidad de elementos en voltaje constante para cada voltaje
            constVoltIntervalo = int64(app.ScanFreqEditField.Value * (settlingTime + integrationTime));
            
            % Elementos para esperar antes de volver a escanear cuando
            % vuelve al inicio de la línea. Se implementa para procesar
            % cuentas correctamente. Se deja como tiempo de espera 48 ms
            tiempoEsperaVueltaOrigen = 0.048 * ( 2 * dimOutput);
            
            % Cantidad de puntos a escanear
            nPuntos = app.ScanNpixelsEditField.Value;
            
            % Total de elementos en output considerando tramo que devuelve
            % al piezo al (0,0)
            totalElementosOutput = (constVoltIntervalo + 1) * nPuntos * nPuntos + tiempoEsperaVueltaOrigen * nPuntos;
            
            disp(totalElementosOutput)
            
            % Verificar que la salida de voltaje tenga los elementos
            % minimos
            if(totalElementosOutput < dimOutput)
                % Modificar nPuntos dados settlingTime e integrationTime
                nPuntos = ceil(sqrt(0.5 * (settlingTime + integrationTime)^-1));
                totalElementosOutput = (constVoltIntervalo + 1) * nPuntos * nPuntos + tiempoEsperaVueltaOrigen * nPuntos;
                
                app.ScanNpixelsEditField.Value = nPuntos;
            end
            
            
            
            % MOVER PIEZO A OFFSET DE Z
            app.voltFinalZ = app.ZoffsetEditField.Value * 0.125;
            desplazarCoordenada(app,'z')
            
            
            % Configurar tiempo inicial
            initialTime = double( ((settlingTime + integrationTime)*totalElementosOutput)/constVoltIntervalo )  + 8;
            app.TimeScansEditField.Value = initialTime;
            
            % Crear el timer
            app.CountdownTimer = timer(...
                'ExecutionMode', 'fixedRate', ...  % El timer se ejecuta a intervalos regulares
                'Period', 1, ...  % Periodo de 1 segundo
                'TasksToExecute', initialTime, ...  % Número de veces que se ejecutará
                'TimerFcn', @(~,~) actualizarCountdown(app));  % Función que se ejecuta en cada tick del timer
            
            % Iniciar el timer
            start(app.CountdownTimer);
            
            disp(1)
            disp(class(app.DAQScanSession))
            % Iniciar sesion que realiza scan
            iniciarSesionScan(app)
            disp(2)
            disp(class(app.DAQScanSession))
            
            % Limpiar listener del scan
            delete(app.scanListener);
            app.scanListener = [];
            
            %============================================================================
            %======================== C O O R D S.  S C A N =============================
            
            % Obtener puntos en los cuales se centra el scan
            centroScanX = app.XoffsetEditField.Value;
            centroScanY = app.YoffsetEditField.Value;
            
            % Offset del scan
            scanOffset = app.ScanSizeumEditField.Value * 0.5;
            
            % Obtener puntos iniciales del scan. Esquina sup. Izq. en fig.
            % de scan.
            coordInicialX = centroScanX - scanOffset;
            coordInicialY = centroScanY - scanOffset;
            
            % Obtener puntos en los cuales debería terminar el scan.
            % Esquina inf. Der. en fig. de scan.
            coordFinalX = centroScanX + scanOffset;
            coordFinalY = centroScanY + scanOffset;
            
            % Actualizar voltajes actuales en piezo
            updatePiezoVoltage(app)
            
            disp(3)

            disp(class(app.DAQScanSession))
            
            
            if (coordInicialX >= 0 && coordInicialY >= 0) && (coordFinalX <= 80 && coordFinalY <= 80)
                
                % Transformar posiciones iniciales a voltaje
                voltInicialX = coordInicialX/8;
                voltInicialY = coordInicialY/8;
                
                % Transformar posiciones finales a voltaje
                voltFinalX = coordFinalX/8;
                voltFinalY = coordFinalY/8;
                
                % Setear voltajes a los que iremos en el pto inicial 
                app.voltFinalX = voltInicialX;
                app.voltFinalY = voltInicialY;
                
                disp(4)
                disp(class(app.DAQScanSession))
                % Desplazarse a las coordenadas iniciales ingresadas
                movePiezoScan(app)
                disp(5)
                disp(class(app.DAQScanSession))
                
                
                disp(6)
                % Una vez adquiridos datos totales se activará listener
                app.DAQScanSession.NotifyWhenDataAvailableExceeds = totalElementosOutput;
                
                % Arreglo de voltajes a seguir en eje X
                voltPathX = linspace(voltInicialX, voltFinalX, nPuntos)';
                
                % Arreglo de voltajes a seguir en eje Y
                voltPathY = linspace(voltInicialY, voltFinalY, nPuntos)';
                
                % Guardar caminos de voltaje en coordenadas
                app.xCoordCts = voltPathX * 8;
                app.yCoordCts = voltPathY * 8;
                
                % Voltaje de ida en X
                subidaVoltX = repelem(voltPathX, constVoltIntervalo);
                
                % Voltaje de vuelta en X
                bajadaVoltX = flip(voltPathX);
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                % Repetir primer elemento al inicio de la línea en X previo
                % a volver a escanear.
                repUltElemento = repelem(bajadaVoltX(end),tiempoEsperaVueltaOrigen)';
                
                % Agregar voltaje de espera a la bajada de voltaje. (Esto
                % se puede agregar al final de la bajada o al inicio de la
                % subida de voltaje)
                bajadaVoltX = [bajadaVoltX;repUltElemento];
                
                % Vector con voltajes concatenados
                outVoltajeX = [subidaVoltX; bajadaVoltX];
                
                % Matriz con total de voltajes para X
                outVoltajeX = repmat(outVoltajeX, nPuntos, 1);
                
                % Cantidad de elementos totales al escanear una linea en X
                periodoVoltX = length(outVoltajeX)/nPuntos;
                
                % Output de voltajes a entregar en el piezo en dimension Y
                outVoltajeY = repelem(voltPathY, periodoVoltX);
                
                disp(7)
                disp(class(app.DAQScanSession))
                
                %============================================================================
                %====================== P A R A M.  C U E N T A S ===========================
                
                % Elementos en cada intervalo de settling time
                intervaloSettlingTime = int64(settlingTime * app.ScanFreqEditField.Value);
                
                % Elementos en intervalo de cuentas
                intervaloCuentas = int64(integrationTime * app.ScanFreqEditField.Value);
                
                % Cantidad de elementos hasta que X vuelve al 0
                periodoIntervalo = (intervaloSettlingTime + intervaloCuentas) * nPuntos;
                
                % indices a eliminar; donde se vuelve al inicio
                initNoCtsIdx = (periodoIntervalo + 1:periodoVoltX:totalElementosOutput)';
                
                % Indice donde X termina de volver al 0
                finNoCtsIdx = (periodoVoltX:periodoVoltX:totalElementosOutput)';
                
                % Indices concatenados a eliminar
                idxNoCts = [initNoCtsIdx finNoCtsIdx];
                
                % Dar vuelta los indices para eliminar desde el indice mayor
                idxNoCts = flip(idxNoCts);
                
                clear initNoCtsIdx finNoCtsIdx periodoIntervalo
                
                totalElemCts = constVoltIntervalo * nPuntos * nPuntos;
                
                % Intervalos donde estan las cuentas
                initCtsIdx = (intervaloSettlingTime:constVoltIntervalo:totalElemCts)';
                finCtsIdx = (constVoltIntervalo-1:constVoltIntervalo:totalElemCts)';
                
                idxCts = [initCtsIdx finCtsIdx];
                
                clear initCtsIdx finCtsIdx
                
                % Crear el listener para generar matriz
                app.scanListener = addlistener(app.DAQScanSession, 'DataAvailable', ...
                    @(src, event) scanProcessData(app, event, idxNoCts, idxCts, 'scan'));
                
                % Agregar voltajes extra en la posicion final para recibir
                % cuentas en caso que falten datos.
                outVoltajeY = [outVoltajeY; repelem(outVoltajeY(end),5000)'];
                outVoltajeX = [outVoltajeX; repelem(outVoltajeX(end),5000)'];
                
                % Poner voltajes a la cola
                queueOutputData(app.DAQScanSession,[outVoltajeX, outVoltajeY]);
                pause(1)
                startBackground(app.DAQScanSession);
                % ==============================================
            else
                beep
                errordlg('Scan out of range! Please adjust the coordinate values.', 'Error');
                setAppViewState(app, 'scannerFinished')
            end
            
  
            
        end

        % Value changed function: SetoffsetButton
        function SetoffsetButtonValueChanged(app, event)
            
            
            
            % Setear la posición actual para hacer un scan a su alrededor
            app.XoffsetEditField.Value = app.XEditField.Value;
            app.YoffsetEditField.Value = app.YEditField.Value;
            app.ZoffsetEditField.Value = app.ZEditField.Value;
        end

        % Button pushed function: StopscanButton
        function StopscanButtonPushed(app, event)
            
            
            if ~(isempty(app.DAQScanSession))
                
                
                % Eliminar traza de scan en caso de estar abierta
                if ~(isempty(app.DAQScanTrace))
                    stop(app.DAQScanTrace)
                    release(app.DAQScanTrace)
                    delete(app.DAQScanTrace)
                    
                    app.DAQScanTrace = [];
                    
                    % Setear handles de gráfico de traza a array vacios
                    delete(app.scanTraceFigure)
                    app.scanTraceFigure = [];
                    app.axesScanTrace = [];
                    app.lineScanTrace = [];
                end
                
                
                % Detener la adquisición de datos
                stop(app.DAQScanSession)
                
                % Eliminar listener
                delete(app.scanListener);
                app.scanListener = [];
                
                % Eliminar sesion
                delete(app.DAQScanSession);
                app.DAQScanSession = [];
                
                % detener timer
                if ~(isempty(app.CountdownTimer))
                    stop(app.CountdownTimer); 
                    delete(app.CountdownTimer);
                end
                
                
                % Setear contador a cero
                app.TimeScansEditField.Value = 0;
                
                % Restablecer el estado de la aplicación
                setAppViewState(app, 'scannerStopped');
            end
        end

        % Button pushed function: ActPanelButton
        function ActPanelButtonPushed(app, event)
            if ~(isempty(app.DAQScanSession))
                
                %=========================================================================
                %========== E L I M I N A R   T R A Z A   D E L   S C A N ================
                % Detener adquisición de datos
                if ~(isempty(app.DAQScanTrace))
                    stop(app.DAQScanTrace)
                    
                    % Eliminar e inicializar listener a array vacío
                    delete(app.scanTraceListener);
                    app.scanTraceListener = [];
                    
                    % Setear handles de gráfico de traza a array vacios
                    delete(app.scanTraceFigure)
                    app.scanTraceFigure = [];
                    app.axesScanTrace = [];
                    app.lineScanTrace = [];
                end
                
                
                %====================================================
                %========== A C T I V A R  P A N E L ================
                iniciarSesionCoordenada(app,'x')
                iniciarSesionCoordenada(app,'y')
                iniciarSesionCoordenada(app,'z')
                
                actualizarVoltajes(app)
                
                setAppViewState(app, 'configuration')
                
                if app.isZoom
                    
                    figureGUIScan(app, event, 'zoom')
                else
                    figureGUIScan(app, event, 'scan')
                end
                
                saveScanBackup(app);
                
                
                % Inicializar líneas de coordenadas
                hold(app.UIAxes, 'on');
                app.hXLine = xline(app.UIAxes, app.XEditField.Value, 'k');
                app.hYLine = yline(app.UIAxes, app.YEditField.Value, 'k');
                hold(app.UIAxes, 'off');
    
                % Crear lsiteners de interaccion con figura para establecer
                % coordenadas
                set(app.matrixPlot, 'ButtonDownFcn', @(src, event)clickDown(app, src, event));
                set(app.UIFigure, 'WindowButtonMotionFcn', @(src, event)whileClickDown(app, src, event));
                set(app.UIFigure, 'WindowButtonUpFcn', @(src, event)clickUp(app, src, event));
                
                
                % Desplazar coordenadas para evitar saltos
                RightXButtonValueChanged(app,[])
                pause(0.1)
                LeftXButtonValueChanged(app,[])
                pause(0.1)
                UpYButtonValueChanged(app,[])
                pause(0.1)
                DownYButtonValueChanged(app,[])
            end
        end

        % Value changed function: MinZEditField
        function MinZEditFieldValueChanged(app, event)
            value = app.MinZEditField.Value;
            app.ZSlider.Limits = [value max(app.ZSlider.Limits)];
        end

        % Value changed function: MaxZEditField
        function MaxZEditFieldValueChanged(app, event)
            value = app.MaxZEditField.Value;
            app.ZSlider.Limits = [min(app.ZSlider.Limits) value];
            
        end

        % Button pushed function: SaveScanButton
        function SaveScanButtonPushed(app, event)
            
            saveScanData(app,'scan')                    
           
        end

        % Value changed function: MinEditField
        function MinEditFieldValueChanged(app, event)
            
            
            minUsuario = app.MinEditField.Value;
            
            % Limites actuales en colorbar
            colorLimits = caxis(app.UIAxes);
            
            maxActual = colorLimits(2);
            
            if minUsuario > maxActual
                beep
                errordlg('Error entering limit! The minimum value on the scale cannot be greater than the current maximum. Please adjust the values.', 'Error');
                return;
            end
            
            try
                % Establecer nuevo minimo
                caxis(app.UIAxes, [minUsuario, maxActual]);
            catch ME
                error(ME.message,'Unexpected error.')
            end
            
            
            
            
        end

        % Value changed function: MaxEditField
        function MaxEditFieldValueChanged(app, event)
            maxUsuario = app.MaxEditField.Value;
            
            % Limites actuales en colorbar
            colorLimits = caxis(app.UIAxes);
            
            minActual = colorLimits(1);
            
            if maxUsuario < minActual
                beep
                errordlg('Error entering limit! The maximum value on the scale cannot be less than the current maximum. Please adjust the values.', 'Error');
                return;
            end
            
            try
                % Establecer nuevo minimo
                caxis(app.UIAxes, [minActual, maxUsuario]);
            catch ME
                error(ME.message,'Unexpected error.')
            end
        end

        % Value changed function: CtimemsEditField, 
        % ScanFreqEditField, ScanNpixelsEditField, StimemsEditField
        function ScanNpixelsEditFieldValueChanged(app, event)
            tiempoDeEspera(app)
            
        end

        % Value changed function: ZoomButton
        function ZoomButtonValueChanged(app, event)
            
            setAppViewState(app, 'scanning')
            
            % Eliminar gráficos y traza si esta corriendo
            
            if ~(isempty(app.DAQSessionTrace))
                stop(app.DAQSessionTrace)
                release(app.DAQSessionTrace)
                delete(app.DAQSessionTrace)
                
                app.DAQSessionTrace = [];
                
                %=========================
                % detener y eliminar apd2
                stop(app.DAQSessionTrace2)
                release(app.DAQSessionTrace2)
                delete(app.DAQSessionTrace2)
                
                app.DAQSessionTrace2 = [];
                
                % Setear handles de gráfico de traza a array vacios
                delete(app.traceFigure)
                app.traceFigure = [];
                app.axesTraceCount1 = [];
                app.axesTraceCount2 = [];
                app.lineTraceCount1 = [];
                app.lineTraceCount2 = [];
            end
            
            % Variable para determianr si al activar panel muestra zoom o
            % scan completo
            app.ZoomSwitch.Value = 'On';
            ZoomSwitchValueChanged(app, event)
            
            
            
            %============================================================================
            %==================== P A R A M E T R O S  S C A N ==========================
            
            % Cantidad de elementos minimos en output voltaje
            dimOutput = app.ScanFreqEditField.Value * 0.5;
            
            % Tiempo que consideramos que el piezo se mueve
            settlingTime = (app.StimemsEditField.Value)/1000;
            
            % Tiempo durante el cual se considerarán cuentas válidas
            integrationTime = (app.CtimemsEditField.Value)/1000;
            
            % Cantidad de elementos en voltaje constante
            constVoltIntervalo = int64(app.ScanFreqEditField.Value * (settlingTime + integrationTime));
            
            % Elementos a repetir para esperar al volver al origen
            tiempoEsperaVueltaOrigen = 0.048 * ( 2 * dimOutput)*0.1;
            
            % Por defecto escaneamos 40 puntos
            nPuntos = app.ZoomNpixelsEditField.Value;
            
            % Total de elementos en output considerando tramo que devuelve
            % al piezo al (0,0)
            totalElementosOutput = (constVoltIntervalo + 1) * nPuntos * nPuntos + tiempoEsperaVueltaOrigen * nPuntos;
            
            disp(totalElementosOutput)
            
            % Verificar que la salida de voltaje tenga los elementos
            % minimos
            if(totalElementosOutput < dimOutput)
                % Modificar nPuntos dados settlingTime e integrationTime
                nPuntos = ceil(sqrt(0.5 * (settlingTime + integrationTime)^-1));
                app.ZoomNpixelsEditField.Value
                totalElementosOutput = (constVoltIntervalo + 1) * nPuntos * nPuntos;
                
            end
            
            %============================================================================
            %============================== T I M E R ===================================
            
            % Configurar tiempo inicial
            initialTime = double( ((settlingTime + integrationTime)*totalElementosOutput)/constVoltIntervalo )  + 8;
            app.TimeScansEditField.Value = initialTime;
            
            % Crear el timer
            app.CountdownTimer = timer(...
                'ExecutionMode', 'fixedRate', ...  % El timer se ejecuta a intervalos regulares
                'Period', 1, ...  % Periodo de 1 segundo
                'TasksToExecute', initialTime, ...  % Número de veces que se ejecutará
                'TimerFcn', @(~,~) actualizarCountdown(app));  % Función que se ejecuta en cada tick del timer
            
            % Iniciar el timer
            start(app.CountdownTimer);
            
            disp(1)
            disp(class(app.DAQScanSession))
            % Iniciar sesion que realiza scan
            iniciarSesionScan(app)
            disp(2)
            disp(class(app.DAQScanSession))
            
            % Limpiar listener del scan
            delete(app.scanListener);
            app.scanListener = [];
            
            %============================================================================
            %======================== C O O R D S.  S C A N =============================
            
            % Obtener puntos en los cuales se centra el scan
            centroScanX = app.XEditField.Value;
            centroScanY = app.YEditField.Value;
            
            % Offset del zoom. Predeterminado en 10 um
            scanOffset = app.ZoomSizeumEditField.Value * 0.5;
            
            % Obtener puntos iniciales del scan
            coordInicialX = centroScanX - scanOffset;
            coordInicialY = centroScanY - scanOffset;
            
            % Obtener puntos en los cuales debería terminar el scan
            coordFinalX = centroScanX + scanOffset;
            coordFinalY = centroScanY + scanOffset;
            
            % Actualizar voltajes actuales en piezo
            updatePiezoVoltage(app)
            
            % ACTUALIZAR VARIABLES DEL SISTEMA RELACIONADAS AL ZOOM
            app.xOffSetZoom = centroScanX;
            app.yOffSetZoom = centroScanY;
            app.zOffSetZoom = app.ZEditField.Value;
            app.sizeZoom = app.ZoomSizeumEditField.Value;
            
            
            
            disp(3)

            disp(class(app.DAQScanSession))
            
            
            if (coordInicialX >= 0 && coordInicialY >= 0) && (coordFinalX <= 80 && coordFinalY <= 80)
                
                % Transformar posiciones iniciales a voltaje
                voltInicialX = coordInicialX/8;
                voltInicialY = coordInicialY/8;
                
                % Transformar posiciones finales a voltaje
                voltFinalX = coordFinalX/8;
                voltFinalY = coordFinalY/8;
                
                % Setear voltajes a los que iremos en el pto inicial 
                app.voltFinalX = voltInicialX;
                app.voltFinalY = voltInicialY;
                
                disp(4)
                disp(class(app.DAQScanSession))
                % Desplazarse a las coordenadas iniciales ingresadas
                movePiezoScan(app)
                disp(5)
                disp(class(app.DAQScanSession))
                
                
                disp(6)
                % Una vez adquiridos datos totales se activará listener
                app.DAQScanSession.NotifyWhenDataAvailableExceeds = totalElementosOutput;
                
                % Arreglo de voltajes a seguir en eje X
                voltPathX = linspace(voltInicialX, voltFinalX, nPuntos)';
                
                % Arreglo de voltajes a seguir en eje Y
                voltPathY = linspace(voltInicialY, voltFinalY, nPuntos)';
                
                % Guardar caminos de voltaje en coordenadas
                app.xCoordsZoom = voltPathX * 8;
                app.yCoordsZoom = voltPathY * 8;
                
                % Voltaje de ida en X
                subidaVoltX = repelem(voltPathX, constVoltIntervalo);
                
                % Voltaje de vuelta en X
                bajadaVoltX = flip(voltPathX);
                % Repetir primer y ultimo elemento en bajada de voltaje
                repUltElemento = repelem(bajadaVoltX(end),tiempoEsperaVueltaOrigen)';
                
                bajadaVoltX = [bajadaVoltX;repUltElemento];
                
                % Vector con voltajes concatenados
                outVoltajeX = [subidaVoltX; bajadaVoltX];
                
                % Matriz con total de voltajes para X
                outVoltajeX = repmat(outVoltajeX, nPuntos, 1);
                
                % Periodo voltaje X
                periodoVoltX = length(outVoltajeX)/nPuntos;
                
                % Output de voltajes a entregar en el piezo en dimension Y
                outVoltajeY = repelem(voltPathY, periodoVoltX);
                
                disp(7)
                disp(class(app.DAQScanSession))
                % Poner voltajes a la cola
                
                %============================================================================
                %====================== P A R A M.  C U E N T A S ===========================
                
                % Elementos en cada intervalo de settling time
                intervaloSettlingTime = int64(settlingTime * app.ScanFreqEditField.Value);
                
                % Elementos en intervalo de cuentas
                intervaloCuentas = int64(integrationTime * app.ScanFreqEditField.Value);
                
                % Cantidad de elementos hasta que X vuelve al 0
                periodoIntervalo = (intervaloSettlingTime + intervaloCuentas) * nPuntos;
                
                % indices a eliminar; donde se vuelve al inicio
                initNoCtsIdx = (periodoIntervalo + 1:periodoVoltX:totalElementosOutput)';
                
                % Indice donde X termina de volver al 0
                finNoCtsIdx = (periodoVoltX:periodoVoltX:totalElementosOutput)';
                
                % Indices concatenados a eliminar
                idxNoCts = [initNoCtsIdx finNoCtsIdx];
                
                % Dar vuelta los indices para eliminar desde el indice mayor
                idxNoCts = flip(idxNoCts);
                
                clear initNoCtsIdx finNoCtsIdx periodoIntervalo
                
                totalElemCts = (constVoltIntervalo) * nPuntos * nPuntos;
                
                % Intervalos donde estan las cuentas
                initCtsIdx = [intervaloSettlingTime:constVoltIntervalo:totalElemCts]';
                finCtsIdx = [constVoltIntervalo-1:constVoltIntervalo:totalElemCts]';
                
                idxCts = [initCtsIdx finCtsIdx];
                
                clear initCtsIdx finCtsIdx
                
                % Crear el listener para generar matriz
                app.scanListener = addlistener(app.DAQScanSession, 'DataAvailable', ...
                    @(src, event) scanProcessData(app, event, idxNoCts, idxCts, 'zoom'));
                
                % Agregar voltajes extra en la posicion final para recibir
                % cuentas en caso que falten datos.
                outVoltajeY = [outVoltajeY; repelem(outVoltajeY(end),5000)'];
                outVoltajeX = [outVoltajeX; repelem(outVoltajeX(end),5000)'];
                
                queueOutputData(app.DAQScanSession,[outVoltajeX, outVoltajeY]);
                pause(1)
                
                startBackground(app.DAQScanSession);
                
                % ==============================================
            else
                beep
                errordlg('Scan out of range! Please adjust the coordinate values.', 'Error');
            end
            
            
        end

        % Value changed function: SetFigButton
        function SetFigButtonValueChanged(app, event)
            app.countsMatrixCount1 = app.countsZoomCount1;
            app.xCoordCts = app.xCoordsZoom;
            app.yCoordCts = app.yCoordsZoom;
            
        end

        % Value changed function: PrevFigButton
        function PrevFigButtonValueChanged(app, event)
            
            if ~(isempty(app.DAQScanSession))
                
                iniciarSesionCoordenada(app,'x')
                iniciarSesionCoordenada(app,'y')
                iniciarSesionCoordenada(app,'z')
                
                actualizarVoltajes(app)
                
                setAppViewState(app, 'configuration')
            end
            
            dataLoadedCallback(app)
        end

        % Value changed function: SavezoomButton
        function SavezoomButtonValueChanged(app, event)
            saveScanData(app,'zoom')
            
        end

        % Value changed function: StartOptButton
        function StartOptButtonValueChanged(app, event)
            
            % Eliminar ejes gráficos de mapa PL
            delete(app.hXLine)
            delete(app.hYLine)
            %===========================================================
            
            % Si el tracking no está activado bloquear cambio de detector
            % al empezar optimizacion
            disp(1)
            disp(app.TrackerSwitch.Value)
            switch app.TrackerSwitch.Value
                case 'Off'
                    app.StartOptButton.Enable = 'off';
                    app.SwitchCounterOptimization.Enable = 'off';
                    app.TrackerSwitch.Enable = 'off';
                    app.StopTraceButton.Enable = 'off';
                    app.NBufferOptEditField.Enable = 'off';
                    app.UpToleranceEditField.Enable = 'off';
                    app.DownToleranceEditField.Enable = 'off';
                    app.XYRangeEditField.Enable = 'off';
                    app.ZRangeEditField.Enable = 'off';
            end
            disp(2)
            
            if ~(isempty(app.figOptX))
                delete(app.figOptX)
                delete(app.figOptY)
                delete(app.figOptZ)
                
                app.figOptX = [];
                app.figOptY = [];
                app.figOptZ = [];
                
            end
            
            
            
            % Verificar que coordenadas esten desacopladas
            if ~(isempty(app.DAQSesionCoordX))
                
                
                % Leer voltajes actuales en piezo
                actualizarVoltajes(app);
                
                % Obtener coordenadas actuales
                x = app.currentVoltX * 8;
                y = app.currentVoltY * 8;
                z = app.currentVoltZ * 8;
                
                % Generar coordenadas a visitar en optimizacion
                posicionesX = vectorCoordsOptimiza(app, x, app.XYRangeEditField.Value, 100);
                posicionesY = vectorCoordsOptimiza(app, y, app.XYRangeEditField.Value, 100);
                posicionesZ = vectorCoordsOptimiza(app, z, app.ZRangeEditField.Value, 100);
            
                
                %=========================================================================
                %============================= O P T .  X ================================
                
                % Voltajes de salida
                outVoltX = posicionesX*0.125;
                %assignin('base',"outVoltX",outVoltX)
                
                
                % Mover el piezo en la coordenada X al punto de partida
                app.voltFinalX = outVoltX(1);
                desplazarCoordenada(app,'x')
                
                % Configurar rate
                rateTrazaEff = app.IntTimemsEditField.Value/1000 * app.NotifyScansSpinner.Value;
                stop(app.DAQSesionCoordX)
                app.DAQSesionCoordX.Rate = ceil(1/rateTrazaEff);
                disp(app.DAQSesionCoordX.Rate)
                
                % Configurar acumulacion de cuentas
                app.collectCounts = true;
                
                
                % Mover piezo y recibir cuentas
                queueOutputData(app.DAQSesionCoordX,outVoltX)
                app.DAQSesionCoordX.startForeground();
                app.collectCounts = false;
                
                % Guardar cuentas en workspace
                %assignin('base','ctasAcumuladasX',app.collectedCountsOpt);
                
                
                % Obtener posición y anchura ajustadas
                disp(length(app.collectedCountsOpt)-length(posicionesX)+1)
                
                cuentasX = app.collectedCountsOpt(length(app.collectedCountsOpt)-length(posicionesX)+1:end);
                
                %assignin('base','ctasX',cuentasX)
                
                [posAjustadaX, anchuraAjustadaX] = optimizarPos(app,posicionesX,cuentasX, 0.45, 'x')
                
                stop(app.DAQSesionCoordX)
                app.DAQSesionCoordX.Rate = 1000;
                disp(app.DAQSesionCoordX.Rate)
                
                 % Moverse desde pos. actual a pos optima X
                app.voltFinalX = posAjustadaX * 0.125;
                desplazarCoordenada(app, 'x')
                
                % Actualizar GUI
                hold(app.UIAxes, 'on');
                app.hXLine = xline(app.UIAxes, posAjustadaX, 'k');
                hold(app.UIAxes, 'off');
                
                app.XEditField.Value = posAjustadaX;
                
                % Eliminar cuentas acumuladas de la app
                app.collectedCountsOpt = [];
                
                %=========================================================================
                %============================= O P T .  Y ================================
                
                % Voltajes de salida
                %outVoltX = repelem(posicionesX*0.125, constVoltIntervalo);
                outVoltY = posicionesY*0.125;
                
                %assignin('base',"outVoltY",outVoltY)
                
                % Mover el piezo en la coordenada X al punto de partida
                app.voltFinalY = outVoltY(1);
                desplazarCoordenada(app,'y')
                
                % Configurar rate
                
                stop(app.DAQSesionCoordY)
                app.DAQSesionCoordY.Rate = ceil(1/rateTrazaEff);
                disp(app.DAQSesionCoordY.Rate)
                % Configurar acumulacion de cuentas
                app.collectCounts = true;
                
                
                % Mover piezo y recibir cuentas
                queueOutputData(app.DAQSesionCoordY,outVoltY)
                app.DAQSesionCoordY.startForeground();
                app.collectCounts = false;
                
                % Guardar cuentas en workspace
                %assignin('base','ctasAcumuladasY',app.collectedCountsOpt);
                
                % Obtener posición y anchura ajustadas
                disp(length(app.collectedCountsOpt)-length(posicionesY)+1)
                cuentasY = app.collectedCountsOpt(length(app.collectedCountsOpt)-length(posicionesY)+1:end);
                %assignin('base','ctasY',cuentasY)
                
                [posAjustadaY, anchuraAjustadaY] = optimizarPos(app,posicionesY,cuentasY, 0.45, 'y')
                
                 % Moverse desde pos. actual a pos optima X
                app.voltFinalY = posAjustadaY * 0.125;
                desplazarCoordenada(app, 'y')
                
                % Actualizar GUI
                hold(app.UIAxes, 'on');
                app.hYLine = yline(app.UIAxes, posAjustadaY, 'k');
                hold(app.UIAxes, 'off');
                
                app.YEditField.Value = posAjustadaY;
                
                % Eliminar cuentas acumuladas de la app
                app.collectedCountsOpt = [];
                
                stop(app.DAQSesionCoordY)
                app.DAQSesionCoordY.Rate = 1000;
                disp(app.DAQSesionCoordY.Rate)
                
                %=========================================================================
                %============================= O P T .  Z ================================
                
                % Voltajes de salida
                outVoltZ = posicionesZ*0.125;
                
                %assignin('base',"outVoltZ",outVoltZ)
                
                % Mover el piezo en la coordenada X al punto de partida
                app.voltFinalZ = outVoltZ(1);
                desplazarCoordenada(app,'z')
                
                % Configurar rate
                
                stop(app.DAQSesionCoordZ)
                app.DAQSesionCoordZ.Rate = ceil(1/rateTrazaEff);
                disp(app.DAQSesionCoordZ.Rate)
                % Configurar acumulacion de cuentas
                app.collectCounts = true;
                
                
                % Mover piezo y recibir cuentas
                queueOutputData(app.DAQSesionCoordZ,outVoltZ)
                app.DAQSesionCoordZ.startForeground();
                app.collectCounts = false;
                
                % Guardar cuentas en workspace
                %assignin('base','ctasAcumuladasZ',app.collectedCountsOpt);
                
                % Obtener posición y anchura ajustadas
                disp(length(app.collectedCountsOpt)-length(posicionesZ)+1)
                cuentasZ = app.collectedCountsOpt(length(app.collectedCountsOpt)-length(posicionesZ)+1:end);
                %assignin('base','ctasZ',cuentasZ)
                
                app.ctaMaxZ = max(cuentasZ);
                
                [posAjustadaZ, anchuraAjustadaZ] = optimizarPos(app,posicionesZ,cuentasZ, 0.45, 'z')
                
                 % Moverse desde pos. actual a pos optima X
                app.voltFinalZ = posAjustadaZ * 0.125;
                desplazarCoordenada(app, 'z')
                
                
                app.ZEditField.Value = posAjustadaZ;
                
                % Eliminar cuentas acumuladas de la app
                app.collectedCountsOpt = [];
                
                stop(app.DAQSesionCoordZ)
                app.DAQSesionCoordZ.Rate = 1000;
                disp(app.DAQSesionCoordZ.Rate)
                
                % Si el tracking no estaba activado permitir cambio de detector
                % al terminar optimizacion
                switch app.TrackerSwitch.Value
                case 'Off'
                    app.StartOptButton.Enable = 'on';
                    app.SwitchCounterOptimization.Enable = 'on';
                    app.TrackerSwitch.Enable = 'on';
                    app.StopTraceButton.Enable = 'on';
                    app.NBufferOptEditField.Enable = 'on';
                    app.UpToleranceEditField.Enable = 'on';
                    app.DownToleranceEditField.Enable = 'on';
                    app.XYRangeEditField.Enable = 'on';
                    app.ZRangeEditField.Enable = 'on';
                end
                
                pause(2.5)
                delete(app.figOptX);delete(app.figOptY);delete(app.figOptZ);
                app.figOptX = [];app.figOptY = []; app.figOptZ = [];

                
            else
                iniciarSesionCoordenada(app,'x')
                iniciarSesionCoordenada(app,'y')
                iniciarSesionCoordenada(app,'z')
            end
            
           
            
            
            
        end

        % Value changed function: CleanFigButton
        function CleanFigButtonValueChanged(app, event)
            app.countsMatrixCount1 = zeros(80,80);
            app.xCoordCts = linspace(0,80,81)';
            app.yCoordCts = linspace(0,80,81)';
            
            dataLoadedCallback(app)
            
            actualizarBarraColor(app,'scan')
        end

        % Value changed function: TrackerSwitch
        function TrackerSwitchValueChanged(app, event)
            
            switch app.TrackerSwitch.Value
                case 'Off'
                    % Detener timer
                    stop(app.timerOptimization);
                    
                    % Activar cambio de detector
                    app.SwitchCounterOptimization.Enable = 'on';
                    app.StartOptButton.Enable = 'on';
                    
                    saveTrackingBackup(app)
                    
                    
                case 'On'
                    % Bloquear cambio de detector
                    app.SwitchCounterOptimization.Enable = 'off';
                    app.StartOptButton.Enable = 'off';
                    
                    % Activar botón de guardar coordenadas
                    app.SaveCoordsButton.Enable = 'on';
                    
                    % Actualizar valores buffer y umbrales de tolerancia
                    NBufferEditFieldValueChanged(app)
                    UpToleranceEditFieldValueChanged(app)
                    DownToleranceEditFieldValueChanged(app)
                    
                    % Limpiar coordenadas trackeadas
                    app.trackedCoordX = [];
                    app.trackedCoordY = [];
                    app.trackedCoordZ = [];
                    
                    app.figTrackedCoords = figure("Name", 'Coordenadas Optimizadas');
                    
                    app.axesTrackedCoordX = subplot(2, 2, 1, 'Parent', app.figTrackedCoords);
                    app.lineTrackedCoordX = plot(app.axesTrackedCoordX, NaN, 'Marker', '*');
                    title('X')
                    
                    app.axesTrackedCoordY = subplot(2, 2, 2, 'Parent', app.figTrackedCoords);
                    app.lineTrackedCoordY = plot(app.axesTrackedCoordY, NaN, 'Marker', '*');
                    title('Y')
                    
                    app.axesTrackedCoordZ = subplot(2, 2, 3, 'Parent', app.figTrackedCoords);
                    app.lineTrackedCoordZ = plot(app.axesTrackedCoordZ, NaN, 'Marker', '*');
                    title('Z')
                    
                    app.axesTrackedCoordXY = subplot(2, 2, 4, 'Parent', app.figTrackedCoords);
                    app.lineTrackedCoordXY = plot(app.axesTrackedCoordXY, NaN, 'Marker', '*');
                    title('X-Y')
                
                
                    
                    % Verificar si esta trackeando excelitas o lasercomp
                    switch app.SwitchCounterOptimization.Value
                        case 'Count. 1'
                            % En excelitas consideramos valor medio MEAN
                            app.meanTracking = app.MeanC1EditField.Value;
                            
                            disp("Referencia Opt. " + app.meanTracking)
                            disp("Valor tolerancia bajada " + app.meanTracking * app.umbralDownTracker)
                            disp("Valor tolerancia subida " + app.meanTracking * app.umbralUpTracker)
                            
                            % Configurar el temporizador
                            app.timerOptimization = timer('ExecutionMode', 'fixedRate', ...
                                'Period', 0.1, ... % Ejecuta cada 100 ms
                                'TimerFcn', @(~,~) conditionsOptCount1(app));
                            
                            % Inicia el temporizador cuando sea necesario
                            start(app.timerOptimization);
                        case 'Count. 2'
                            % En excelitas consideramos valor medio MEAN 2
                            app.meanTracking = app.MeanC2EditField.Value;
                            
                            disp("Referencia Opt. " + app.meanTracking)
                            disp("Valor tolerancia bajada " + app.meanTracking * app.umbralDownTracker)
                            disp("Valor tolerancia subida " + app.meanTracking * app.umbralUpTracker)
                            
                            % Configurar el temporizador en la inicialización de la app
                            app.timerOptimization = timer('ExecutionMode', 'fixedRate', ...
                                'Period', 0.1, ... % Ejecuta cada 100 ms
                                'TimerFcn', @(~,~) conditionsOptCount2(app));
                    end
                    
                    
            end
            
            

        end

        % Value changed function: SwitchCounterOptimization
        function SwitchCounterOptimizationValueChanged(app, event)
            value = app.SwitchCounterOptimization.Value;
            switch value
                case 'Count. 1'
                    app.optimizeCounter1 = true;
                case 'Count. 2'
                    app.optimizeCounter1 = false;
            end
        end

        % Value changed function: SwitchCountPLMap
        function SwitchCountPLMapValueChanged(app, event)
            value = app.SwitchCountPLMap.Value;
            app.matrixPlot = [];
            switch value
                case 'Count. 1'
                    app.showScanCount1 = true;
                    if app.isZoom
                        app.matrixPlot = imagesc(app.UIAxes,app.xCoordsZoom, app.yCoordsZoom, app.countsZoomCount1);
                        xlim(app.UIAxes, [min(app.xCoordsZoom), max(app.xCoordsZoom)]);
                        ylim(app.UIAxes, [min(app.yCoordsZoom), max(app.yCoordsZoom)]);
                        
                        colorbar(app.UIAxes)
                        
                        actualizarBarraColor(app,'zoom')
                    else
                        app.matrixPlot = imagesc(app.UIAxes,app.xCoordCts, app.yCoordCts, app.countsMatrixCount1);
                        colorbar(app.UIAxes)
                        xlim(app.UIAxes, [min(app.xCoordCts), max(app.xCoordCts)]);
                        ylim(app.UIAxes, [min(app.yCoordCts), max(app.yCoordCts)]);
                        
                        actualizarBarraColor(app, 'scan')
                        
                    end
                case 'Count. 2'
                    app.showScanCount1 = false;
                    if app.isZoom
                        app.matrixPlot = imagesc(app.UIAxes,app.xCoordsZoom, app.yCoordsZoom, app.countsZoomCount2);
                        xlim(app.UIAxes, [min(app.xCoordsZoom), max(app.xCoordsZoom)]);
                        ylim(app.UIAxes, [min(app.yCoordsZoom), max(app.yCoordsZoom)]);
                        
                        colorbar(app.UIAxes)
                        
                        actualizarBarraColor(app,'zoom')
                    else
                        app.matrixPlot = imagesc(app.UIAxes,app.xCoordCts, app.yCoordCts, app.countsMatrixCount2);
                        colorbar(app.UIAxes)
                        xlim(app.UIAxes, [min(app.xCoordCts), max(app.xCoordCts)]);
                        ylim(app.UIAxes, [min(app.yCoordCts), max(app.yCoordCts)]);
                        
                        actualizarBarraColor(app, 'scan')
                        
                    end
            end
            
            hold(app.UIAxes, 'on');
            app.hXLine = xline(app.UIAxes, app.XEditField.Value, 'k');
            app.hYLine = yline(app.UIAxes, app.YEditField.Value, 'k');
            hold(app.UIAxes, 'off');
            
            % Obtener la barra de herramientas del axes
            tb = axtoolbar(app.UIAxes);
            % Eliminar herramientas específicas
            delete(tb.Children);
            
            % Crear lsiteners de interaccion con figura para establecer
            % coordenadas
            set(app.matrixPlot, 'ButtonDownFcn', @(src, event)clickDown(app, src, event));
            set(app.UIFigure, 'WindowButtonMotionFcn', @(src, event)whileClickDown(app, src, event));
            set(app.UIFigure, 'WindowButtonUpFcn', @(src, event)clickUp(app, src, event));
            
            
            % Desplazar coordenadas para evitar saltos
            RightXButtonValueChanged(app,[])
            pause(0.1)
            LeftXButtonValueChanged(app,[])
            pause(0.1)
            UpYButtonValueChanged(app,[])
            pause(0.1)
            DownYButtonValueChanged(app,[])
            
            
            
        end

        % Value changed function: ZoomSwitch
        function ZoomSwitchValueChanged(app, event)
            value = app.ZoomSwitch.Value;
            switch value
                case 'On'
                    app.isZoom = true;
                    app.Lamp.Enable = true;
                    figureGUIScan(app,[],'zoom')
                case 'Off'
                    app.isZoom = false;
                    app.Lamp.Enable = false;
                    figureGUIScan(app,[],'scan')
            end
        end

        % Value changed function: NBufferOptEditField
        function NBufferOptEditFieldValueChanged(app, event)
            
            bufferTracker = ceil(app.NBufferEditField.Value * app.NBufferOptEditField.Value/100);
            disp("El buffer del tracking considera " + bufferTracker + " cuentas.")
        end

        % Value changed function: DownToleranceEditField
        function DownToleranceEditFieldValueChanged(app, event)
            % Actualizar porcentaje de tolerancia ante la caída de cuentas
            app.umbralDownTracker = 1 - app.DownToleranceEditField.Value/100;
            
        end

        % Value changed function: UpToleranceEditField
        function UpToleranceEditFieldValueChanged(app, event)
            % Actualizar valor para umbral superior de cuentas
            app.umbralUpTracker = 1 + app.UpToleranceEditField.Value/100;
        end

        % Value changed function: SaveCoordsButton
        function SaveCoordsButtonValueChanged(app, event)
            
            if ~(isempty(app.trackedCoordX))
                saveTrackingData(app)
            else
                disp("Las coordenadas de trackeo están vacías.")
            end
        end

        % Button pushed function: RecPos1Button
        function RecPos1ButtonPushed(app, event)
            app.Ximg.Value = app.XEditField.Value;
            app.Yimg.Value = app.YEditField.Value;
        end

        % Button pushed function: RecPos2Button
        function RecPos2ButtonPushed(app, event)
            
            app.AdjustPosButton.Enable = 'on';
            
            app.Xreal.Value = app.XEditField.Value;
            app.Yreal.Value = app.YEditField.Value;
        end

        % Button pushed function: AdjustPosButton
        function AdjustPosButtonPushed(app, event)
            
            app.UIAxes.Visible = 'off';
            app.AdjustPosButton.Enable = 'off';
            
            xShift = app.Ximg.Value - app.Xreal.Value;
            yShift = app.Yimg.Value - app.Yreal.Value;
            
            app.xCoordCts = app.xCoordCts - xShift;
            app.yCoordCts = app.yCoordCts - yShift;
            
            setAppViewState(app, 'configuration')
            
            figureGUIScan(app, event, 'scan')
            
            actualizarVoltajes(app)
            
            % Inicializar líneas de coordenadas
            hold(app.UIAxes, 'on');
            app.hXLine = xline(app.UIAxes, app.XEditField.Value, 'k');
            app.hYLine = yline(app.UIAxes, app.YEditField.Value, 'k');
            hold(app.UIAxes, 'off');
            
            % Crear lsiteners de interaccion con figura para establecer
            % coordenadas
            set(app.matrixPlot, 'ButtonDownFcn', @(src, event)clickDown(app, src, event));
            set(app.UIFigure, 'WindowButtonMotionFcn', @(src, event)whileClickDown(app, src, event));
            set(app.UIFigure, 'WindowButtonUpFcn', @(src, event)clickUp(app, src, event));
            
            
            % Desplazar coordenadas para evitar saltos
            RightXButtonValueChanged(app,[])
            pause(0.1)
            LeftXButtonValueChanged(app,[])
            pause(0.1)
            UpYButtonValueChanged(app,[])
            pause(0.1)
            DownYButtonValueChanged(app,[])
            
            saveScanBackup(app)
            
            
        end

        % Value changed function: CONNECTMWButton
        function CONNECTMWButtonValueChanged(app, event)
            
            % Create the session
            d = visa('ni', 'USB0::0x03EB::0xAFFF::111-333600000-2111::INSTR')
            % Open the session
            fopen(d)
            % Configure the way you interact
            set(d, 'EOSMode', 'read&write');
            % Display de IDN
            query(d, '*IDN?')
            
            % Display the current configuration of CW
            % Update the Freq. and Pow. fields to the current conf.
            disp("The CW frequency is ")
            devFreq = str2double(query(d, 'FREQ?')) * 1E-9
            app.FreqGHzEditField.Value = devFreq;
            devFreq = num2str(devFreq);
            fprintf(d, 'FREQ %s Ghz\n', devFreq);
            
            disp("The CW power is ")
            devPow = str2double(query(d, 'POW?'))
            app.PowerdBmEditField.Value = devPow;
            app.PowerdBmEditField_2.Value = devPow;
            devPow = num2str(devPow);
            fprintf(d, 'POW %s dBm\n', devPow);
            
            % Save the visa object on a global variable
            app.anapicoSession = d;
            
            % Create the session for triggers
            initTriggerSession(app)
            
            % activate the lamp and the disconnect button
            app.CONNECTMWButton.Enable = 'Off';
            app.DISCONNECTMWButton.Enable = 'on';
            
            app.LampMW.Enable = 'on';
            app.RFSwitch.Enable = 'on';
            app.SWEEPButton.Enable = 'on';
            
        end

        % Button pushed function: DISCONNECTMWButton
        function DISCONNECTMWButtonPushed(app, event)
            % Get the session
            d = app.anapicoSession;
            
            if ~(isempty(d))
                
                if app.rfState
                    app.RFSwitch.Value = 'Off';
                    RFSwitchValueChanged(app)
                end
                
                % Turn the trigero output off
                fprintf(d, 'LFO:STAT OFF \n');
                pause(0.1)
                
                % Close the session
                fclose(d);
                
                % delete the object associated to the session
                delete(app.anapicoSession)
                app.anapicoSession = [];
                
                % Turn off the lamp and enable the connect button
                app.LampMW.Enable = 'off';
                app.CONNECTMWButton.Enable = 'on';
                app.DISCONNECTMWButton.Enable = 'off';
                
                app.SWEEPButton.Enable = 'off';
            end
        end

        % Value changed function: SWEEPButton
        function SWEEPButtonValueChanged(app, event)
            
            
            % Clean the counts session and listener
            if ~(isempty(app.DAQScanSweepSession))
                stop(app.DAQScanSweepSession)
                release(app.DAQScanSweepSession)
                delete(app.DAQScanSweepSession)
                
                delete(app.sweepCountsListener)
                
                disp("Sesion Borrada")
                
                app.sweepCountsListener = [];
                app.DAQScanSweepSession = [];
                
                % Delete the figure with trace and accumulated trace
                delete(app.scanTraceFigure)
                app.scanTraceFigure = [];
                
                app.axesScanTrace = [];
                app.axesMeanTrace = [];
                
                app.lineScanTrace = [];
                app.lineMeanTrace = [];
                
                pause(0.1)
                
                % Recall the function
                SWEEPButtonValueChanged(app, [])
            else
                % Create session for scanning and counts
                prepareMWGen(app)
                iniciarSesionScanSweep(app)
                
                % Create real time trace session
                figureTrazaScan(app, 'sweep', 'Traza Sweep')
                
                pause(0.1)
                % start count session in background
                startBackground(app.DAQScanSweepSession);
                pause(0.1)
                disp("Esperando Trigger")
                triggerSweep(app)
                disp("TRIGGER")
            end
            
            
            
        end

        % Value changed function: FreqGHzEditField
        function FreqGHzEditFieldValueChanged(app, event)
            % Value registered by user
            value = num2str(app.FreqGHzEditField.Value);
            
            % get the session of the device
            d = app.anapicoSession;
            
            if ~(isempty(d))
                fprintf(d, 'FREQ %s Ghz\n', value);
                
                disp("The CW frequency is ")
                query(d, 'FREQ?')
            
            end
            
        end

        % Value changed function: PowerdBmEditField
        function PowerdBmEditFieldValueChanged(app, event)
            % Value registered by user
            value = num2str(app.PowerdBmEditField.Value);
            
            % get the session of the device
            d = app.anapicoSession;
            
            if ~(isempty(d))
                fprintf(d, 'POW %s dBm\n', value);
                disp("The CW power is ")
                query(d, 'POW?')
                
                % Update the value in CW Tab
                app.PowerdBmEditField_2.Value = app.PowerdBmEditField.Value;
            end
            
        end

        % Value changed function: PowerdBmEditField_2
        function PowerdBmEditField_2ValueChanged(app, event)
            value = num2str(app.PowerdBmEditField_2.Value);
            
            % get the session of the device
            d = app.anapicoSession;
            
            if ~(isempty(d))
                fprintf(d, 'POW %s dBm\n', value);
                disp("The CW power is ")
                query(d, 'POW?')
                % Update the value in ESR Tab
                app.PowerdBmEditField.Value = app.PowerdBmEditField_2.Value;
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
                    
                    if ~(isempty(app.DAQScanSweepSession))
                        
                        stop(app.DAQScanSweepSession)
                        release(app.DAQScanSweepSession)
                        delete(app.DAQScanSweepSession)
                        
                        delete(app.sweepCountsListener)
                        
                        disp("Sesion Borrada")
                        
                        app.sweepCountsListener = [];
                        app.DAQScanSweepSession = [];
                        
                        % Delete the figure with trace and accumulated trace
                        delete(app.scanTraceFigure)
                        app.scanTraceFigure = [];
                        
                        app.axesScanTrace = [];
                        app.axesMeanTrace = [];
                        
                        app.lineScanTrace = [];
                        app.lineMeanTrace = [];
                    end
                    
                    % Deactivate rf
                    fprintf(d, 'FREQ:MODE FIX\n');
                    pause(0.2)
                    fprintf(d, 'OUTP OFF\n');
                    
            end
            
        end

        % Button pushed function: SAVESWEEPButton
        function SAVESWEEPButtonPushed(app, event)
            % Metadata correspondiente a la muestra
            metadataMuestraStruct.muestra = app.SampleNameEditField.Value;
            
            % Obtener la fecha y hora actual
            timestamp = datetime('now', 'Format', 'yyyy-MM-dd_HHmmss');
            timestampStr = datestr(timestamp, 'yyyy-mm-dd_HHMMSS');
            
            % Generar el nombre del archivo
            usrName = app.SampleNameEditField.Value;
            
            % Obtener la carpeta actual
            currentFolder = pwd;
            
            % Definir los datos a guardar
            
            dataStruct.PL = app.ctasSweep;
            dataStruct.accumCts = app.movingAverageBuffer;
            dataStruct.frequencies = app.freqSwep;
            
            % Metadata correspondiente al sweep
            
            metadataSweepStruct.freqStartGHz = app.FreqStartGHzEditField.Value;
            metadataSweepStruct.freqStopGHz = app.FreqStopGHzEditField.Value;
            metadataSweepStruct.powdBm = app.PowerdBmEditField.Value;
            
            metadataSweepStruct.dwellTime = (app.DTimemsEditField.Value)/1000;
            metadataSweepStruct.nPoints = app.PointsEditField.Value;
            metadataSweepStruct.nReps = app.RepetitionsEditField.Value;
            metadataSweepStruct.totalCycles = app.CyclesEditField.Value;
            
            metadataSweepStruct.posX = app.XEditField.Value;
            metadataSweepStruct.posY = app.YEditField.Value;
            metadataSweepStruct.posZ = app.ZEditField.Value;
            
            
            
            % Guardar datos y metadata en una estructura
            sweep.data = dataStruct;
            sweep.metadataMuestra = metadataMuestraStruct;
            sweep.metadataSweep = metadataSweepStruct;
            
            filename = [timestampStr, '_', usrName, '_SWEEP.mat'];
            
            % Generar la ruta completa del archivo
            fullPath = fullfile(currentFolder, filename);
            
            % Guardar los datos en un archivo .mat
            save(fullPath, 'sweep');
            
            % Mostrar un mensaje de confirmación
            disp(['Sweep guardado en: ', fullPath]);
        end

        % Value changed function: LOADSWEEPButton
        function LOADSWEEPButtonValueChanged(app, event)
            
            
            % Las sesiones de coordenadas deben estar activas para
            % desplazarse al lugarl del sweep
            
            if ~(isempty(app.DAQSesionCoordX))
                % Definir la carpeta actual
                currentFolder = pwd;
                
                % Definir el filtro de archivos para archivos .mat
                fileFilter = {'*.mat', 'Archivos MAT (*.mat)'};
                
                % Abrir el diálogo de selección de archivos
                [file, path] = uigetfile(fileFilter, 'Seleccionar un archivo MAT', currentFolder);
                
                % Verificar si se seleccionó un archivo
                if isequal(file, 0)
                    disp('Se ha cancelado cargar una figura');
                else
                    fullPath = fullfile(path, file);
                    disp(['Has seleccionado: ', fullPath]);
                    
                    % Cargar datos escaneados
                    struct = load(fullPath);
                    
                    % Identificar si el archivo tiene la estructura 'scan' o 'zoom'
                    if isfield(struct, 'sweep')
                        dataStruct = struct.sweep;
                    else
                        disp('El archivo no contiene las estructuras esperadas.');
                        return;
                    end
                    
                    % Extraer coordenadas y datos de la estructura correspondiente
                    app.ctasSweep = dataStruct.data.PL;
                    app.movingAverageBuffer = dataStruct.data.accumCts;
                    app.freqSwep = dataStruct.data.frequencies;
                    
                    % Leer voltajes actuales en piezo para cada coordenada
                    actualizarVoltajes(app)
                    
                    % Moverse a puntos donde se fijó offset para scan/zoom
                    app.voltFinalX = dataStruct.metadataSweep.posX * 0.125;
                    app.voltFinalY = dataStruct.metadataSweep.posY * 0.125;
                    app.voltFinalZ = dataStruct.metadataSweep.posZ * 0.125;
                    
                    desplazarCoordenada(app,'x')
                    desplazarCoordenada(app,'y')
                    desplazarCoordenada(app,'z')
                    
                    % Actualizar voltajes actuales
                    actualizarVoltajes(app)
                    
                    % Actualizar parametros de sweep en GUI
                    app.FreqStartGHzEditField.Value = dataStruct.metadataSweep.freqStartGHz;
                    app.FreqStopGHzEditField.Value = dataStruct.metadataSweep.freqStopGHz;
                    app.PowerdBmEditField.Value = dataStruct.metadataSweep.powdBm;
                    
                    app.DTimemsEditField.Value = dataStruct.metadataSweep.dwellTime;
                    app.PointsEditField.Value = dataStruct.metadataSweep.nPoints;
                    app.RepetitionsEditField.Value = dataStruct.metadataSweep.nReps;
                    app.CyclesEditField.Value = dataStruct.metadataSweep.totalCycles;
                    
                    % Actualizar nombre de muestra
                    app.SampleNameEditField.Value = dataStruct.metadataMuestra.muestra;
                    
                    
                    imagesc(app.UIAxes, app.freqSwep, (1:1:app.RepetitionsEditField.Value),app.ctasSweep)
                    xlim(app.UIAxes, [min(app.freqSwep), max(app.freqSwep)]);
                    ylim(app.UIAxes, [1, app.RepetitionsEditField.Value]);
                    colormap(app.UIAxes,"jet")
                    colorbar(app.UIAxes)
            
                    
                end
            else
                iniciarSesionCoordenada(app,'x')
                iniciarSesionCoordenada(app,'y')
                iniciarSesionCoordenada(app,'z')
                LOADSWEEPButtonValueChanged(app, event);
            end
            
        end

        % Button pushed function: STOPSWEEPButton
        function STOPSWEEPButtonPushed(app, event)
            if ~(isempty(app.sweepCountsListener))
                
                delete(app.sweepCountsListener)
                app.lineNumber = 0;
                disp("Sweep abortado.")
                
                % Deactivate rf
                d = app.anapicoSession;
                fprintf(d, 'FREQ:MODE FIX\n');
                devFreq = str2double(query(d, 'FREQ?')) * 1E-9;
                app.FreqGHzEditField.Value = devFreq;
                
                % Enable the fields to configure sweep
                app.FreqStartGHzEditField.Enable = 'On';
                app.FreqStopGHzEditField.Enable = 'On';
                app.PowerdBmEditField.Enable = 'On';
                
                app.FreqGHzEditField.Enable = 'On';
                app.PowerdBmEditField_2.Enable = 'On';
                
                app.DTimemsEditField.Enable = 'On';
                app.PointsEditField.Enable = 'On';
                app.RepetitionsEditField.Enable = 'On';
                app.CyclesEditField.Enable = 'On';
                
                app.SWEEPButton.Enable = 'On';
                app.STOPSWEEPButton.Enable = 'Off';
                
                app.LOADSWEEPButton.Enable = 'On';
                app.SAVESWEEPButton.Enable = 'On';
            end
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.AutoResizeChildren = 'off';
            app.UIFigure.Color = [0.2549 0.3961 0.8196];
            app.UIFigure.Position = [100 100 1663 916];
            app.UIFigure.Name = 'UI Figure';
            app.UIFigure.Resize = 'off';
            app.UIFigure.CloseRequestFcn = createCallbackFcn(app, @UIFigureCloseRequest, true);

            % Create GridLayout
            app.GridLayout = uigridlayout(app.UIFigure);
            app.GridLayout.ColumnWidth = {'2x', '2x', '2x', '2x', '2x', '2x', '2x', '2x', '2x', '2x', '2x'};
            app.GridLayout.RowHeight = {'2x', '2x', '2x', '2x', '2x', '2x', '2x', '2x', '2x', '2x', '2x', '1x', '1x', '2x'};

            % Create Panel_2
            app.Panel_2 = uipanel(app.GridLayout);
            app.Panel_2.AutoResizeChildren = 'off';
            app.Panel_2.BorderType = 'none';
            app.Panel_2.BackgroundColor = [0.2549 0.3961 0.8196];
            app.Panel_2.Layout.Row = [1 11];
            app.Panel_2.Layout.Column = [6 11];

            % Create UIAxes
            app.UIAxes = uiaxes(app.Panel_2);
            title(app.UIAxes, 'PL MAP')
            xlabel(app.UIAxes, 'X')
            ylabel(app.UIAxes, 'Y')
            app.UIAxes.PlotBoxAspectRatio = [1.26291079812207 1 1];
            app.UIAxes.FontSize = 16;
            app.UIAxes.FontWeight = 'bold';
            app.UIAxes.Box = 'on';
            app.UIAxes.BackgroundColor = [0.2549 0.3961 0.8196];
            app.UIAxes.Position = [9 34 873 716];

            % Create Panel_3
            app.Panel_3 = uipanel(app.GridLayout);
            app.Panel_3.AutoResizeChildren = 'off';
            app.Panel_3.ForegroundColor = [0.1294 0.1294 0.1294];
            app.Panel_3.BorderType = 'none';
            app.Panel_3.BackgroundColor = [0.2549 0.3961 0.8196];
            app.Panel_3.Layout.Row = [1 14];
            app.Panel_3.Layout.Column = [1 5];

            % Create TabGroup
            app.TabGroup = uitabgroup(app.Panel_3);
            app.TabGroup.AutoResizeChildren = 'off';
            app.TabGroup.Position = [6 490 513 400];

            % Create SAMPLEINFOTab
            app.SAMPLEINFOTab = uitab(app.TabGroup);
            app.SAMPLEINFOTab.Title = 'SAMPLE INFO.';
            app.SAMPLEINFOTab.BackgroundColor = [0.2549 0.3961 0.8196];

            % Create SampleNameEditFieldLabel
            app.SampleNameEditFieldLabel = uilabel(app.SAMPLEINFOTab);
            app.SampleNameEditFieldLabel.HorizontalAlignment = 'right';
            app.SampleNameEditFieldLabel.FontSize = 18;
            app.SampleNameEditFieldLabel.FontWeight = 'bold';
            app.SampleNameEditFieldLabel.Position = [10 327 124 22];
            app.SampleNameEditFieldLabel.Text = 'Sample Name';

            % Create SampleNameEditField
            app.SampleNameEditField = uieditfield(app.SAMPLEINFOTab, 'text');
            app.SampleNameEditField.HorizontalAlignment = 'right';
            app.SampleNameEditField.FontSize = 18;
            app.SampleNameEditField.Position = [156 325 338 26];
            app.SampleNameEditField.Value = 'sampleName';

            % Create FilterNameEditFieldLabel
            app.FilterNameEditFieldLabel = uilabel(app.SAMPLEINFOTab);
            app.FilterNameEditFieldLabel.HorizontalAlignment = 'right';
            app.FilterNameEditFieldLabel.FontSize = 18;
            app.FilterNameEditFieldLabel.FontWeight = 'bold';
            app.FilterNameEditFieldLabel.Position = [11 288 104 22];
            app.FilterNameEditFieldLabel.Text = 'Filter Name';

            % Create FilterNameEditField
            app.FilterNameEditField = uieditfield(app.SAMPLEINFOTab, 'text');
            app.FilterNameEditField.HorizontalAlignment = 'right';
            app.FilterNameEditField.FontSize = 18;
            app.FilterNameEditField.Position = [155 286 339 26];
            app.FilterNameEditField.Value = 'BLP01-532R';

            % Create PoweruWEditFieldLabel
            app.PoweruWEditFieldLabel = uilabel(app.SAMPLEINFOTab);
            app.PoweruWEditFieldLabel.HorizontalAlignment = 'right';
            app.PoweruWEditFieldLabel.FontSize = 18;
            app.PoweruWEditFieldLabel.FontWeight = 'bold';
            app.PoweruWEditFieldLabel.Position = [11 189 104 22];
            app.PoweruWEditFieldLabel.Text = 'Power (uW)';

            % Create PoweruWEditField
            app.PoweruWEditField = uieditfield(app.SAMPLEINFOTab, 'numeric');
            app.PoweruWEditField.FontSize = 18;
            app.PoweruWEditField.Position = [141 189 98 23];
            app.PoweruWEditField.Value = 2;

            % Create WavelengthnmEditFieldLabel
            app.WavelengthnmEditFieldLabel = uilabel(app.SAMPLEINFOTab);
            app.WavelengthnmEditFieldLabel.HorizontalAlignment = 'right';
            app.WavelengthnmEditFieldLabel.FontSize = 18;
            app.WavelengthnmEditFieldLabel.FontWeight = 'bold';
            app.WavelengthnmEditFieldLabel.Position = [253 190 150 22];
            app.WavelengthnmEditFieldLabel.Text = 'Wavelength (nm)';

            % Create WavelengthnmEditField
            app.WavelengthnmEditField = uieditfield(app.SAMPLEINFOTab, 'numeric');
            app.WavelengthnmEditField.FontSize = 18;
            app.WavelengthnmEditField.Position = [434 189 64 23];
            app.WavelengthnmEditField.Value = 532;

            % Create ScanFreqEditFieldLabel
            app.ScanFreqEditFieldLabel = uilabel(app.SAMPLEINFOTab);
            app.ScanFreqEditFieldLabel.HorizontalAlignment = 'right';
            app.ScanFreqEditFieldLabel.FontSize = 18;
            app.ScanFreqEditFieldLabel.FontWeight = 'bold';
            app.ScanFreqEditFieldLabel.Position = [10 155 98 22];
            app.ScanFreqEditFieldLabel.Text = 'Scan Freq.';

            % Create ScanFreqEditField
            app.ScanFreqEditField = uieditfield(app.SAMPLEINFOTab, 'numeric');
            app.ScanFreqEditField.Limits = [100 5000000];
            app.ScanFreqEditField.ValueDisplayFormat = '%.2e';
            app.ScanFreqEditField.ValueChangedFcn = createCallbackFcn(app, @ScanNpixelsEditFieldValueChanged, true);
            app.ScanFreqEditField.FontSize = 18;
            app.ScanFreqEditField.Position = [142 155 97 23];
            app.ScanFreqEditField.Value = 50000;

            % Create Count1DropDownLabel
            app.Count1DropDownLabel = uilabel(app.SAMPLEINFOTab);
            app.Count1DropDownLabel.HorizontalAlignment = 'right';
            app.Count1DropDownLabel.FontSize = 18;
            app.Count1DropDownLabel.FontWeight = 'bold';
            app.Count1DropDownLabel.Position = [10 245 77 22];
            app.Count1DropDownLabel.Text = 'Count. 1';

            % Create Count1DropDown
            app.Count1DropDown = uidropdown(app.SAMPLEINFOTab);
            app.Count1DropDown.Items = {'Excelitas', 'Lasercomp', 'SSPD1', 'SSPD2', 'SSPD3', 'SSPD4'};
            app.Count1DropDown.FontSize = 18;
            app.Count1DropDown.FontWeight = 'bold';
            app.Count1DropDown.Position = [106 244 133 23];
            app.Count1DropDown.Value = 'Excelitas';

            % Create Count2DropDownLabel
            app.Count2DropDownLabel = uilabel(app.SAMPLEINFOTab);
            app.Count2DropDownLabel.HorizontalAlignment = 'right';
            app.Count2DropDownLabel.FontSize = 18;
            app.Count2DropDownLabel.FontWeight = 'bold';
            app.Count2DropDownLabel.Position = [253 246 77 22];
            app.Count2DropDownLabel.Text = 'Count. 2';

            % Create Count2DropDown
            app.Count2DropDown = uidropdown(app.SAMPLEINFOTab);
            app.Count2DropDown.Items = {'Excelitas', 'Lasercomp', 'SSPD1', 'SSPD2', 'SSPD3', 'SSPD4'};
            app.Count2DropDown.FontSize = 18;
            app.Count2DropDown.FontWeight = 'bold';
            app.Count2DropDown.Position = [349 245 145 23];
            app.Count2DropDown.Value = 'Lasercomp';

            % Create TRACETab
            app.TRACETab = uitab(app.TabGroup);
            app.TRACETab.Title = 'TRACE';
            app.TRACETab.BackgroundColor = [0.2549 0.3961 0.8196];

            % Create StartTraceButton
            app.StartTraceButton = uibutton(app.TRACETab, 'push');
            app.StartTraceButton.ButtonPushedFcn = createCallbackFcn(app, @StartTraceButtonPushed, true);
            app.StartTraceButton.BackgroundColor = [0 0 0];
            app.StartTraceButton.FontSize = 24;
            app.StartTraceButton.FontWeight = 'bold';
            app.StartTraceButton.FontColor = [1 1 1];
            app.StartTraceButton.Position = [24 298 149 60];
            app.StartTraceButton.Text = 'Start Trace';

            % Create StopTraceButton
            app.StopTraceButton = uibutton(app.TRACETab, 'state');
            app.StopTraceButton.ValueChangedFcn = createCallbackFcn(app, @StopTraceButtonValueChanged, true);
            app.StopTraceButton.Text = 'Stop Trace';
            app.StopTraceButton.BackgroundColor = [0.651 0.1373 0.1686];
            app.StopTraceButton.FontSize = 24;
            app.StopTraceButton.FontWeight = 'bold';
            app.StopTraceButton.FontColor = [1 1 1];
            app.StopTraceButton.Position = [24 219 149 60];

            % Create IntTimemsEditFieldLabel
            app.IntTimemsEditFieldLabel = uilabel(app.TRACETab);
            app.IntTimemsEditFieldLabel.HorizontalAlignment = 'right';
            app.IntTimemsEditFieldLabel.FontSize = 18;
            app.IntTimemsEditFieldLabel.FontWeight = 'bold';
            app.IntTimemsEditFieldLabel.Position = [287 257 122 22];
            app.IntTimemsEditFieldLabel.Text = 'Int. Time (ms)';

            % Create IntTimemsEditField
            app.IntTimemsEditField = uieditfield(app.TRACETab, 'numeric');
            app.IntTimemsEditField.Limits = [0.0005 1000];
            app.IntTimemsEditField.ValueChangedFcn = createCallbackFcn(app, @IntTimemsEditFieldValueChanged, true);
            app.IntTimemsEditField.FontSize = 18;
            app.IntTimemsEditField.Position = [433 256 58 23];
            app.IntTimemsEditField.Value = 2;

            % Create NBufferEditFieldLabel
            app.NBufferEditFieldLabel = uilabel(app.TRACETab);
            app.NBufferEditFieldLabel.HorizontalAlignment = 'right';
            app.NBufferEditFieldLabel.FontSize = 18;
            app.NBufferEditFieldLabel.FontWeight = 'bold';
            app.NBufferEditFieldLabel.Position = [287 209 76 22];
            app.NBufferEditFieldLabel.Text = 'N Buffer';

            % Create NBufferEditField
            app.NBufferEditField = uieditfield(app.TRACETab, 'numeric');
            app.NBufferEditField.Limits = [25 1000];
            app.NBufferEditField.ValueDisplayFormat = '%.0f';
            app.NBufferEditField.ValueChangedFcn = createCallbackFcn(app, @NBufferEditFieldValueChanged, true);
            app.NBufferEditField.FontSize = 18;
            app.NBufferEditField.Position = [433 208 58 23];
            app.NBufferEditField.Value = 50;

            % Create NotifyScansSpinnerLabel
            app.NotifyScansSpinnerLabel = uilabel(app.TRACETab);
            app.NotifyScansSpinnerLabel.HorizontalAlignment = 'right';
            app.NotifyScansSpinnerLabel.FontSize = 18;
            app.NotifyScansSpinnerLabel.FontWeight = 'bold';
            app.NotifyScansSpinnerLabel.Position = [287 160 115 22];
            app.NotifyScansSpinnerLabel.Text = 'Notify Scans';

            % Create NotifyScansSpinner
            app.NotifyScansSpinner = uispinner(app.TRACETab);
            app.NotifyScansSpinner.Limits = [25 50000];
            app.NotifyScansSpinner.ValueDisplayFormat = '%g';
            app.NotifyScansSpinner.ValueChangedFcn = createCallbackFcn(app, @NotifyScansSpinnerValueChanged, true);
            app.NotifyScansSpinner.FontSize = 18;
            app.NotifyScansSpinner.Position = [433 160 58 23];
            app.NotifyScansSpinner.Value = 50;

            % Create SavingDataSwitchLabel
            app.SavingDataSwitchLabel = uilabel(app.TRACETab);
            app.SavingDataSwitchLabel.HorizontalAlignment = 'center';
            app.SavingDataSwitchLabel.FontSize = 22;
            app.SavingDataSwitchLabel.FontWeight = 'bold';
            app.SavingDataSwitchLabel.Position = [343 321 148 43];
            app.SavingDataSwitchLabel.Text = 'Saving Data';

            % Create SavingDataSwitch
            app.SavingDataSwitch = uiswitch(app.TRACETab, 'slider');
            app.SavingDataSwitch.ValueChangedFcn = createCallbackFcn(app, @SavingDataSwitchValueChanged, true);
            app.SavingDataSwitch.FontSize = 22;
            app.SavingDataSwitch.FontWeight = 'bold';
            app.SavingDataSwitch.Position = [392 300 51 22];

            % Create StartOptButton
            app.StartOptButton = uibutton(app.TRACETab, 'state');
            app.StartOptButton.ValueChangedFcn = createCallbackFcn(app, @StartOptButtonValueChanged, true);
            app.StartOptButton.Text = 'Start Opt.';
            app.StartOptButton.BackgroundColor = [1 0.7608 0.051];
            app.StartOptButton.FontSize = 24;
            app.StartOptButton.FontWeight = 'bold';
            app.StartOptButton.FontColor = [0.1294 0.1294 0.1294];
            app.StartOptButton.Position = [24 130 149 60];

            % Create XYRangeEditFieldLabel
            app.XYRangeEditFieldLabel = uilabel(app.TRACETab);
            app.XYRangeEditFieldLabel.HorizontalAlignment = 'center';
            app.XYRangeEditFieldLabel.FontSize = 18;
            app.XYRangeEditFieldLabel.FontWeight = 'bold';
            app.XYRangeEditFieldLabel.Position = [287 97 96 22];
            app.XYRangeEditFieldLabel.Text = 'X-Y Range';

            % Create XYRangeEditField
            app.XYRangeEditField = uieditfield(app.TRACETab, 'numeric');
            app.XYRangeEditField.FontSize = 18;
            app.XYRangeEditField.FontWeight = 'bold';
            app.XYRangeEditField.Position = [433 97 54 23];
            app.XYRangeEditField.Value = 800;

            % Create ZRangeEditFieldLabel
            app.ZRangeEditFieldLabel = uilabel(app.TRACETab);
            app.ZRangeEditFieldLabel.HorizontalAlignment = 'center';
            app.ZRangeEditFieldLabel.FontSize = 18;
            app.ZRangeEditFieldLabel.FontWeight = 'bold';
            app.ZRangeEditFieldLabel.Position = [287 59 77 22];
            app.ZRangeEditFieldLabel.Text = 'Z Range';

            % Create ZRangeEditField
            app.ZRangeEditField = uieditfield(app.TRACETab, 'numeric');
            app.ZRangeEditField.FontSize = 18;
            app.ZRangeEditField.FontWeight = 'bold';
            app.ZRangeEditField.Position = [433 58 54 23];
            app.ZRangeEditField.Value = 1800;

            % Create SwitchCounterOptimization
            app.SwitchCounterOptimization = uiswitch(app.TRACETab, 'toggle');
            app.SwitchCounterOptimization.Items = {'Count. 2', 'Count. 1'};
            app.SwitchCounterOptimization.ValueChangedFcn = createCallbackFcn(app, @SwitchCounterOptimizationValueChanged, true);
            app.SwitchCounterOptimization.FontSize = 18;
            app.SwitchCounterOptimization.FontWeight = 'bold';
            app.SwitchCounterOptimization.Position = [76 40 23 52];
            app.SwitchCounterOptimization.Value = 'Count. 1';

            % Create SCANTab
            app.SCANTab = uitab(app.TabGroup);
            app.SCANTab.AutoResizeChildren = 'off';
            app.SCANTab.Title = 'SCAN';
            app.SCANTab.BackgroundColor = [0.2549 0.3961 0.8196];

            % Create StopscanButton
            app.StopscanButton = uibutton(app.SCANTab, 'push');
            app.StopscanButton.ButtonPushedFcn = createCallbackFcn(app, @StopscanButtonPushed, true);
            app.StopscanButton.BackgroundColor = [0.651 0.1373 0.1686];
            app.StopscanButton.FontSize = 20;
            app.StopscanButton.FontWeight = 'bold';
            app.StopscanButton.FontColor = [1 1 1];
            app.StopscanButton.Position = [363 314 138 45];
            app.StopscanButton.Text = 'Stop scan';

            % Create SaveScanButton
            app.SaveScanButton = uibutton(app.SCANTab, 'push');
            app.SaveScanButton.ButtonPushedFcn = createCallbackFcn(app, @SaveScanButtonPushed, true);
            app.SaveScanButton.BackgroundColor = [1 0.7608 0.051];
            app.SaveScanButton.FontSize = 20;
            app.SaveScanButton.FontWeight = 'bold';
            app.SaveScanButton.FontColor = [0.149 0.149 0.149];
            app.SaveScanButton.Position = [188 314 138 45];
            app.SaveScanButton.Text = 'Save Scan';

            % Create ScanButton
            app.ScanButton = uibutton(app.SCANTab, 'push');
            app.ScanButton.ButtonPushedFcn = createCallbackFcn(app, @ScanButtonPushed, true);
            app.ScanButton.BackgroundColor = [0 0 0];
            app.ScanButton.FontSize = 20;
            app.ScanButton.FontWeight = 'bold';
            app.ScanButton.FontColor = [1 1 1];
            app.ScanButton.Position = [13 314 138 45];
            app.ScanButton.Text = 'Scan';

            % Create ScanSizeumEditFieldLabel
            app.ScanSizeumEditFieldLabel = uilabel(app.SCANTab);
            app.ScanSizeumEditFieldLabel.HorizontalAlignment = 'right';
            app.ScanSizeumEditFieldLabel.FontSize = 18;
            app.ScanSizeumEditFieldLabel.FontWeight = 'bold';
            app.ScanSizeumEditFieldLabel.Position = [17 177 134 22];
            app.ScanSizeumEditFieldLabel.Text = 'Scan Size (um)';

            % Create ScanSizeumEditField
            app.ScanSizeumEditField = uieditfield(app.SCANTab, 'numeric');
            app.ScanSizeumEditField.Limits = [2 100];
            app.ScanSizeumEditField.FontSize = 18;
            app.ScanSizeumEditField.Position = [164 177 54 23];
            app.ScanSizeumEditField.Value = 50;

            % Create XoffsetEditFieldLabel
            app.XoffsetEditFieldLabel = uilabel(app.SCANTab);
            app.XoffsetEditFieldLabel.HorizontalAlignment = 'right';
            app.XoffsetEditFieldLabel.FontSize = 20;
            app.XoffsetEditFieldLabel.FontWeight = 'bold';
            app.XoffsetEditFieldLabel.Position = [38 264 79 24];
            app.XoffsetEditFieldLabel.Text = 'X offset';

            % Create XoffsetEditField
            app.XoffsetEditField = uieditfield(app.SCANTab, 'numeric');
            app.XoffsetEditField.Limits = [0 80];
            app.XoffsetEditField.ValueDisplayFormat = '%.3f';
            app.XoffsetEditField.FontSize = 20;
            app.XoffsetEditField.Position = [38 240 87 25];
            app.XoffsetEditField.Value = 40;

            % Create YoffsetEditFieldLabel
            app.YoffsetEditFieldLabel = uilabel(app.SCANTab);
            app.YoffsetEditFieldLabel.HorizontalAlignment = 'right';
            app.YoffsetEditFieldLabel.FontSize = 20;
            app.YoffsetEditFieldLabel.FontWeight = 'bold';
            app.YoffsetEditFieldLabel.Position = [217 264 79 24];
            app.YoffsetEditFieldLabel.Text = 'Y offset';

            % Create YoffsetEditField
            app.YoffsetEditField = uieditfield(app.SCANTab, 'numeric');
            app.YoffsetEditField.Limits = [0 80];
            app.YoffsetEditField.ValueDisplayFormat = '%.3f';
            app.YoffsetEditField.FontSize = 20;
            app.YoffsetEditField.Position = [213 240 87 25];
            app.YoffsetEditField.Value = 40;

            % Create ScanNpixelsEditFieldLabel
            app.ScanNpixelsEditFieldLabel = uilabel(app.SCANTab);
            app.ScanNpixelsEditFieldLabel.HorizontalAlignment = 'right';
            app.ScanNpixelsEditFieldLabel.FontSize = 18;
            app.ScanNpixelsEditFieldLabel.FontWeight = 'bold';
            app.ScanNpixelsEditFieldLabel.Position = [280 177 128 22];
            app.ScanNpixelsEditFieldLabel.Text = 'Scan N. pixels';

            % Create ScanNpixelsEditField
            app.ScanNpixelsEditField = uieditfield(app.SCANTab, 'numeric');
            app.ScanNpixelsEditField.Limits = [1 1000];
            app.ScanNpixelsEditField.ValueChangedFcn = createCallbackFcn(app, @ScanNpixelsEditFieldValueChanged, true);
            app.ScanNpixelsEditField.FontSize = 18;
            app.ScanNpixelsEditField.Position = [427 177 54 23];
            app.ScanNpixelsEditField.Value = 30;

            % Create CtimemsEditFieldLabel
            app.CtimemsEditFieldLabel = uilabel(app.SCANTab);
            app.CtimemsEditFieldLabel.HorizontalAlignment = 'right';
            app.CtimemsEditFieldLabel.FontSize = 18;
            app.CtimemsEditFieldLabel.FontWeight = 'bold';
            app.CtimemsEditFieldLabel.Position = [17 138 109 22];
            app.CtimemsEditFieldLabel.Text = 'C. time (ms)';

            % Create CtimemsEditField
            app.CtimemsEditField = uieditfield(app.SCANTab, 'numeric');
            app.CtimemsEditField.Limits = [0.0005 1000];
            app.CtimemsEditField.ValueChangedFcn = createCallbackFcn(app, @ScanNpixelsEditFieldValueChanged, true);
            app.CtimemsEditField.FontSize = 18;
            app.CtimemsEditField.Position = [164 138 54 23];
            app.CtimemsEditField.Value = 1;

            % Create StimemsEditFieldLabel
            app.StimemsEditFieldLabel = uilabel(app.SCANTab);
            app.StimemsEditFieldLabel.HorizontalAlignment = 'right';
            app.StimemsEditFieldLabel.FontSize = 18;
            app.StimemsEditFieldLabel.FontWeight = 'bold';
            app.StimemsEditFieldLabel.Position = [280 138 108 22];
            app.StimemsEditFieldLabel.Text = 'S. time (ms)';

            % Create StimemsEditField
            app.StimemsEditField = uieditfield(app.SCANTab, 'numeric');
            app.StimemsEditField.Limits = [0.0005 1000];
            app.StimemsEditField.ValueChangedFcn = createCallbackFcn(app, @ScanNpixelsEditFieldValueChanged, true);
            app.StimemsEditField.FontSize = 18;
            app.StimemsEditField.Position = [427 138 54 23];
            app.StimemsEditField.Value = 2;

            % Create ZoffsetEditFieldLabel
            app.ZoffsetEditFieldLabel = uilabel(app.SCANTab);
            app.ZoffsetEditFieldLabel.HorizontalAlignment = 'right';
            app.ZoffsetEditFieldLabel.FontSize = 20;
            app.ZoffsetEditFieldLabel.FontWeight = 'bold';
            app.ZoffsetEditFieldLabel.Position = [388 264 78 24];
            app.ZoffsetEditFieldLabel.Text = 'Z offset';

            % Create ZoffsetEditField
            app.ZoffsetEditField = uieditfield(app.SCANTab, 'numeric');
            app.ZoffsetEditField.Limits = [0 80];
            app.ZoffsetEditField.ValueDisplayFormat = '%.3f';
            app.ZoffsetEditField.FontSize = 20;
            app.ZoffsetEditField.Position = [388 240 87 25];
            app.ZoffsetEditField.Value = 40;

            % Create ZOOMTab
            app.ZOOMTab = uitab(app.TabGroup);
            app.ZOOMTab.AutoResizeChildren = 'off';
            app.ZOOMTab.Title = 'ZOOM';
            app.ZOOMTab.BackgroundColor = [0.2549 0.3961 0.8196];

            % Create ZoomButton
            app.ZoomButton = uibutton(app.ZOOMTab, 'state');
            app.ZoomButton.ValueChangedFcn = createCallbackFcn(app, @ZoomButtonValueChanged, true);
            app.ZoomButton.Text = 'Zoom';
            app.ZoomButton.BackgroundColor = [0 0 0];
            app.ZoomButton.FontSize = 18;
            app.ZoomButton.FontWeight = 'bold';
            app.ZoomButton.FontColor = [1 1 1];
            app.ZoomButton.Position = [50 299 135 47];

            % Create SavezoomButton
            app.SavezoomButton = uibutton(app.ZOOMTab, 'state');
            app.SavezoomButton.ValueChangedFcn = createCallbackFcn(app, @SavezoomButtonValueChanged, true);
            app.SavezoomButton.Text = 'Save zoom';
            app.SavezoomButton.BackgroundColor = [1 0.7608 0.051];
            app.SavezoomButton.FontSize = 18;
            app.SavezoomButton.FontWeight = 'bold';
            app.SavezoomButton.FontColor = [0.149 0.149 0.149];
            app.SavezoomButton.Position = [274 299 135 47];

            % Create ZoomSizeumEditFieldLabel
            app.ZoomSizeumEditFieldLabel = uilabel(app.ZOOMTab);
            app.ZoomSizeumEditFieldLabel.HorizontalAlignment = 'right';
            app.ZoomSizeumEditFieldLabel.FontSize = 18;
            app.ZoomSizeumEditFieldLabel.FontWeight = 'bold';
            app.ZoomSizeumEditFieldLabel.Position = [252 232 139 22];
            app.ZoomSizeumEditFieldLabel.Text = 'Zoom Size (um)';

            % Create ZoomSizeumEditField
            app.ZoomSizeumEditField = uieditfield(app.ZOOMTab, 'numeric');
            app.ZoomSizeumEditField.Limits = [1 30];
            app.ZoomSizeumEditField.FontSize = 18;
            app.ZoomSizeumEditField.Position = [408 232 54 23];
            app.ZoomSizeumEditField.Value = 2;

            % Create ZoomNpixelsEditFieldLabel
            app.ZoomNpixelsEditFieldLabel = uilabel(app.ZOOMTab);
            app.ZoomNpixelsEditFieldLabel.HorizontalAlignment = 'right';
            app.ZoomNpixelsEditFieldLabel.FontSize = 18;
            app.ZoomNpixelsEditFieldLabel.FontWeight = 'bold';
            app.ZoomNpixelsEditFieldLabel.Position = [14 232 134 22];
            app.ZoomNpixelsEditFieldLabel.Text = 'Zoom N. pixels';

            % Create ZoomNpixelsEditField
            app.ZoomNpixelsEditField = uieditfield(app.ZOOMTab, 'numeric');
            app.ZoomNpixelsEditField.Limits = [1 1000];
            app.ZoomNpixelsEditField.FontSize = 18;
            app.ZoomNpixelsEditField.Position = [167 232 54 23];
            app.ZoomNpixelsEditField.Value = 40;

            % Create TRACKINGTab
            app.TRACKINGTab = uitab(app.TabGroup);
            app.TRACKINGTab.Title = 'TRACKING';
            app.TRACKINGTab.BackgroundColor = [0.251 0.4 0.8196];

            % Create TrackerSwitchLabel
            app.TrackerSwitchLabel = uilabel(app.TRACKINGTab);
            app.TrackerSwitchLabel.HorizontalAlignment = 'center';
            app.TrackerSwitchLabel.FontSize = 18;
            app.TrackerSwitchLabel.FontWeight = 'bold';
            app.TrackerSwitchLabel.Position = [58 325 70 22];
            app.TrackerSwitchLabel.Text = 'Tracker';

            % Create TrackerSwitch
            app.TrackerSwitch = uiswitch(app.TRACKINGTab, 'slider');
            app.TrackerSwitch.ValueChangedFcn = createCallbackFcn(app, @TrackerSwitchValueChanged, true);
            app.TrackerSwitch.FontSize = 18;
            app.TrackerSwitch.Position = [67 304 51 22];

            % Create DownToleranceEditFieldLabel
            app.DownToleranceEditFieldLabel = uilabel(app.TRACKINGTab);
            app.DownToleranceEditFieldLabel.HorizontalAlignment = 'center';
            app.DownToleranceEditFieldLabel.FontSize = 18;
            app.DownToleranceEditFieldLabel.FontWeight = 'bold';
            app.DownToleranceEditFieldLabel.Position = [25 197 176 22];
            app.DownToleranceEditFieldLabel.Text = 'Down Tolerance (%)';

            % Create DownToleranceEditField
            app.DownToleranceEditField = uieditfield(app.TRACKINGTab, 'numeric');
            app.DownToleranceEditField.Limits = [0 100];
            app.DownToleranceEditField.ValueChangedFcn = createCallbackFcn(app, @DownToleranceEditFieldValueChanged, true);
            app.DownToleranceEditField.FontSize = 18;
            app.DownToleranceEditField.FontWeight = 'bold';
            app.DownToleranceEditField.Position = [214 197 37 23];
            app.DownToleranceEditField.Value = 10;

            % Create NBufferOptLabel
            app.NBufferOptLabel = uilabel(app.TRACKINGTab);
            app.NBufferOptLabel.HorizontalAlignment = 'center';
            app.NBufferOptLabel.FontSize = 18;
            app.NBufferOptLabel.FontWeight = 'bold';
            app.NBufferOptLabel.Position = [25 256 150 22];
            app.NBufferOptLabel.Text = 'N Buffer Opt. (%)';

            % Create NBufferOptEditField
            app.NBufferOptEditField = uieditfield(app.TRACKINGTab, 'numeric');
            app.NBufferOptEditField.Limits = [0 100];
            app.NBufferOptEditField.ValueChangedFcn = createCallbackFcn(app, @NBufferOptEditFieldValueChanged, true);
            app.NBufferOptEditField.FontSize = 18;
            app.NBufferOptEditField.FontWeight = 'bold';
            app.NBufferOptEditField.Position = [214 256 37 23];
            app.NBufferOptEditField.Value = 30;

            % Create UpToleranceEditFieldLabel
            app.UpToleranceEditFieldLabel = uilabel(app.TRACKINGTab);
            app.UpToleranceEditFieldLabel.HorizontalAlignment = 'center';
            app.UpToleranceEditFieldLabel.FontSize = 18;
            app.UpToleranceEditFieldLabel.FontWeight = 'bold';
            app.UpToleranceEditFieldLabel.Position = [25 226 151 22];
            app.UpToleranceEditFieldLabel.Text = 'Up Tolerance (%)';

            % Create UpToleranceEditField
            app.UpToleranceEditField = uieditfield(app.TRACKINGTab, 'numeric');
            app.UpToleranceEditField.Limits = [0 100];
            app.UpToleranceEditField.ValueChangedFcn = createCallbackFcn(app, @UpToleranceEditFieldValueChanged, true);
            app.UpToleranceEditField.FontSize = 18;
            app.UpToleranceEditField.FontWeight = 'bold';
            app.UpToleranceEditField.Position = [214 228 37 23];
            app.UpToleranceEditField.Value = 30;

            % Create SaveCoordsButton
            app.SaveCoordsButton = uibutton(app.TRACKINGTab, 'state');
            app.SaveCoordsButton.ValueChangedFcn = createCallbackFcn(app, @SaveCoordsButtonValueChanged, true);
            app.SaveCoordsButton.Enable = 'off';
            app.SaveCoordsButton.Text = 'Save Coords.';
            app.SaveCoordsButton.BackgroundColor = [1 0.7608 0.051];
            app.SaveCoordsButton.FontSize = 24;
            app.SaveCoordsButton.FontWeight = 'bold';
            app.SaveCoordsButton.FontColor = [0.149 0.149 0.149];
            app.SaveCoordsButton.Position = [229.5 297 169 57];

            % Create CWTab
            app.CWTab = uitab(app.TabGroup);
            app.CWTab.Title = 'CW';
            app.CWTab.BackgroundColor = [0.251 0.4 0.8196];

            % Create PowerdBmEditField_2Label
            app.PowerdBmEditField_2Label = uilabel(app.CWTab);
            app.PowerdBmEditField_2Label.HorizontalAlignment = 'right';
            app.PowerdBmEditField_2Label.FontSize = 18;
            app.PowerdBmEditField_2Label.FontWeight = 'bold';
            app.PowerdBmEditField_2Label.Position = [26 127 117 22];
            app.PowerdBmEditField_2Label.Text = 'Power (dBm)';

            % Create PowerdBmEditField_2
            app.PowerdBmEditField_2 = uieditfield(app.CWTab, 'numeric');
            app.PowerdBmEditField_2.Limits = [-35 -9];
            app.PowerdBmEditField_2.ValueDisplayFormat = '%.3f';
            app.PowerdBmEditField_2.ValueChangedFcn = createCallbackFcn(app, @PowerdBmEditField_2ValueChanged, true);
            app.PowerdBmEditField_2.FontSize = 18;
            app.PowerdBmEditField_2.FontWeight = 'bold';
            app.PowerdBmEditField_2.Position = [158 126 100 23];
            app.PowerdBmEditField_2.Value = -20;

            % Create FreqGHzEditFieldLabel
            app.FreqGHzEditFieldLabel = uilabel(app.CWTab);
            app.FreqGHzEditFieldLabel.HorizontalAlignment = 'right';
            app.FreqGHzEditFieldLabel.FontSize = 18;
            app.FreqGHzEditFieldLabel.FontWeight = 'bold';
            app.FreqGHzEditFieldLabel.Position = [26 178 97 22];
            app.FreqGHzEditFieldLabel.Text = 'Freq (GHz)';

            % Create FreqGHzEditField
            app.FreqGHzEditField = uieditfield(app.CWTab, 'numeric');
            app.FreqGHzEditField.Limits = [0.001 5.9];
            app.FreqGHzEditField.ValueChangedFcn = createCallbackFcn(app, @FreqGHzEditFieldValueChanged, true);
            app.FreqGHzEditField.FontSize = 18;
            app.FreqGHzEditField.FontWeight = 'bold';
            app.FreqGHzEditField.Position = [158 177 100 23];
            app.FreqGHzEditField.Value = 2.87;

            % Create RFSwitchLabel
            app.RFSwitchLabel = uilabel(app.CWTab);
            app.RFSwitchLabel.HorizontalAlignment = 'center';
            app.RFSwitchLabel.FontSize = 24;
            app.RFSwitchLabel.FontWeight = 'bold';
            app.RFSwitchLabel.Position = [381 133 37 30];
            app.RFSwitchLabel.Text = 'RF';

            % Create RFSwitch
            app.RFSwitch = uiswitch(app.CWTab, 'toggle');
            app.RFSwitch.ValueChangedFcn = createCallbackFcn(app, @RFSwitchValueChanged, true);
            app.RFSwitch.Enable = 'off';
            app.RFSwitch.FontSize = 24;
            app.RFSwitch.FontWeight = 'bold';
            app.RFSwitch.Position = [340 110 34 77];

            % Create DISCONNECTMWButton
            app.DISCONNECTMWButton = uibutton(app.CWTab, 'push');
            app.DISCONNECTMWButton.ButtonPushedFcn = createCallbackFcn(app, @DISCONNECTMWButtonPushed, true);
            app.DISCONNECTMWButton.BackgroundColor = [0.651 0.1412 0.1686];
            app.DISCONNECTMWButton.FontSize = 18;
            app.DISCONNECTMWButton.FontWeight = 'bold';
            app.DISCONNECTMWButton.FontColor = [1 1 1];
            app.DISCONNECTMWButton.Enable = 'off';
            app.DISCONNECTMWButton.Position = [280 271 171 71];
            app.DISCONNECTMWButton.Text = 'DISCONNECT MW';

            % Create CONNECTMWButton
            app.CONNECTMWButton = uibutton(app.CWTab, 'state');
            app.CONNECTMWButton.ValueChangedFcn = createCallbackFcn(app, @CONNECTMWButtonValueChanged, true);
            app.CONNECTMWButton.Text = 'CONNECT MW';
            app.CONNECTMWButton.BackgroundColor = [0 0 0];
            app.CONNECTMWButton.FontSize = 18;
            app.CONNECTMWButton.FontWeight = 'bold';
            app.CONNECTMWButton.FontColor = [1 1 1];
            app.CONNECTMWButton.Position = [63 271 171 71];

            % Create LampMW
            app.LampMW = uilamp(app.CWTab);
            app.LampMW.Enable = 'off';
            app.LampMW.Position = [19 341 20 20];

            % Create ESRTab
            app.ESRTab = uitab(app.TabGroup);
            app.ESRTab.Title = 'ESR';
            app.ESRTab.BackgroundColor = [0.251 0.4 0.8196];

            % Create SWEEPButton
            app.SWEEPButton = uibutton(app.ESRTab, 'state');
            app.SWEEPButton.ValueChangedFcn = createCallbackFcn(app, @SWEEPButtonValueChanged, true);
            app.SWEEPButton.Enable = 'off';
            app.SWEEPButton.Text = 'SWEEP';
            app.SWEEPButton.BackgroundColor = [0 0 0];
            app.SWEEPButton.FontSize = 18;
            app.SWEEPButton.FontWeight = 'bold';
            app.SWEEPButton.FontColor = [1 1 1];
            app.SWEEPButton.Position = [324 282 171 71];

            % Create FreqStartGHzEditFieldLabel
            app.FreqStartGHzEditFieldLabel = uilabel(app.ESRTab);
            app.FreqStartGHzEditFieldLabel.HorizontalAlignment = 'right';
            app.FreqStartGHzEditFieldLabel.FontSize = 18;
            app.FreqStartGHzEditFieldLabel.FontWeight = 'bold';
            app.FreqStartGHzEditFieldLabel.Position = [12 331 144 22];
            app.FreqStartGHzEditFieldLabel.Text = 'Freq Start (GHz)';

            % Create FreqStartGHzEditField
            app.FreqStartGHzEditField = uieditfield(app.ESRTab, 'numeric');
            app.FreqStartGHzEditField.Limits = [0.0001 5.9];
            app.FreqStartGHzEditField.FontSize = 18;
            app.FreqStartGHzEditField.FontWeight = 'bold';
            app.FreqStartGHzEditField.Position = [171 330 100 23];
            app.FreqStartGHzEditField.Value = 2.8;

            % Create FreqStopGHzEditFieldLabel
            app.FreqStopGHzEditFieldLabel = uilabel(app.ESRTab);
            app.FreqStopGHzEditFieldLabel.HorizontalAlignment = 'right';
            app.FreqStopGHzEditFieldLabel.FontSize = 18;
            app.FreqStopGHzEditFieldLabel.FontWeight = 'bold';
            app.FreqStopGHzEditFieldLabel.Position = [14 288 142 22];
            app.FreqStopGHzEditFieldLabel.Text = 'Freq Stop (GHz)';

            % Create FreqStopGHzEditField
            app.FreqStopGHzEditField = uieditfield(app.ESRTab, 'numeric');
            app.FreqStopGHzEditField.Limits = [0.0001 5.9];
            app.FreqStopGHzEditField.FontSize = 18;
            app.FreqStopGHzEditField.FontWeight = 'bold';
            app.FreqStopGHzEditField.Position = [171 287 100 23];
            app.FreqStopGHzEditField.Value = 2.9;

            % Create DTimemsEditFieldLabel
            app.DTimemsEditFieldLabel = uilabel(app.ESRTab);
            app.DTimemsEditFieldLabel.HorizontalAlignment = 'right';
            app.DTimemsEditFieldLabel.FontSize = 18;
            app.DTimemsEditFieldLabel.FontWeight = 'bold';
            app.DTimemsEditFieldLabel.Position = [15 159 113 22];
            app.DTimemsEditFieldLabel.Text = 'D. Time (ms)';

            % Create DTimemsEditField
            app.DTimemsEditField = uieditfield(app.ESRTab, 'numeric');
            app.DTimemsEditField.Limits = [0.05 9000000];
            app.DTimemsEditField.FontSize = 18;
            app.DTimemsEditField.FontWeight = 'bold';
            app.DTimemsEditField.Position = [143 158 100 23];
            app.DTimemsEditField.Value = 50;

            % Create PointsEditFieldLabel
            app.PointsEditFieldLabel = uilabel(app.ESRTab);
            app.PointsEditFieldLabel.HorizontalAlignment = 'right';
            app.PointsEditFieldLabel.FontSize = 18;
            app.PointsEditFieldLabel.FontWeight = 'bold';
            app.PointsEditFieldLabel.Position = [15 131 61 22];
            app.PointsEditFieldLabel.Text = 'Points';

            % Create PointsEditField
            app.PointsEditField = uieditfield(app.ESRTab, 'numeric');
            app.PointsEditField.Limits = [1 9990];
            app.PointsEditField.FontSize = 18;
            app.PointsEditField.FontWeight = 'bold';
            app.PointsEditField.Position = [143 130 100 23];
            app.PointsEditField.Value = 50;

            % Create RepetitionsEditFieldLabel
            app.RepetitionsEditFieldLabel = uilabel(app.ESRTab);
            app.RepetitionsEditFieldLabel.HorizontalAlignment = 'right';
            app.RepetitionsEditFieldLabel.FontSize = 18;
            app.RepetitionsEditFieldLabel.FontWeight = 'bold';
            app.RepetitionsEditFieldLabel.Position = [15 102 104 22];
            app.RepetitionsEditFieldLabel.Text = 'Repetitions';

            % Create RepetitionsEditField
            app.RepetitionsEditField = uieditfield(app.ESRTab, 'numeric');
            app.RepetitionsEditField.FontSize = 18;
            app.RepetitionsEditField.FontWeight = 'bold';
            app.RepetitionsEditField.Position = [143 102 100 23];
            app.RepetitionsEditField.Value = 2;

            % Create CyclesEditFieldLabel
            app.CyclesEditFieldLabel = uilabel(app.ESRTab);
            app.CyclesEditFieldLabel.HorizontalAlignment = 'right';
            app.CyclesEditFieldLabel.FontSize = 18;
            app.CyclesEditFieldLabel.FontWeight = 'bold';
            app.CyclesEditFieldLabel.Position = [15 73 64 22];
            app.CyclesEditFieldLabel.Text = 'Cycles';

            % Create CyclesEditField
            app.CyclesEditField = uieditfield(app.ESRTab, 'numeric');
            app.CyclesEditField.FontSize = 18;
            app.CyclesEditField.FontWeight = 'bold';
            app.CyclesEditField.Position = [143 73 100 23];
            app.CyclesEditField.Value = 1;

            % Create PowerdBmEditFieldLabel
            app.PowerdBmEditFieldLabel = uilabel(app.ESRTab);
            app.PowerdBmEditFieldLabel.HorizontalAlignment = 'right';
            app.PowerdBmEditFieldLabel.FontSize = 18;
            app.PowerdBmEditFieldLabel.FontWeight = 'bold';
            app.PowerdBmEditFieldLabel.Position = [15 247 117 22];
            app.PowerdBmEditFieldLabel.Text = 'Power (dBm)';

            % Create PowerdBmEditField
            app.PowerdBmEditField = uieditfield(app.ESRTab, 'numeric');
            app.PowerdBmEditField.Limits = [-35 -9];
            app.PowerdBmEditField.ValueDisplayFormat = '%.3f';
            app.PowerdBmEditField.ValueChangedFcn = createCallbackFcn(app, @PowerdBmEditFieldValueChanged, true);
            app.PowerdBmEditField.FontSize = 18;
            app.PowerdBmEditField.FontWeight = 'bold';
            app.PowerdBmEditField.Position = [171 246 100 23];
            app.PowerdBmEditField.Value = -20;

            % Create STOPSWEEPButton
            app.STOPSWEEPButton = uibutton(app.ESRTab, 'push');
            app.STOPSWEEPButton.ButtonPushedFcn = createCallbackFcn(app, @STOPSWEEPButtonPushed, true);
            app.STOPSWEEPButton.BackgroundColor = [0.651 0.1412 0.1686];
            app.STOPSWEEPButton.FontSize = 18;
            app.STOPSWEEPButton.FontWeight = 'bold';
            app.STOPSWEEPButton.FontColor = [1 1 1];
            app.STOPSWEEPButton.Enable = 'off';
            app.STOPSWEEPButton.Position = [327 107 171 71];
            app.STOPSWEEPButton.Text = 'STOP SWEEP';

            % Create SAVESWEEPButton
            app.SAVESWEEPButton = uibutton(app.ESRTab, 'push');
            app.SAVESWEEPButton.ButtonPushedFcn = createCallbackFcn(app, @SAVESWEEPButtonPushed, true);
            app.SAVESWEEPButton.BackgroundColor = [1 0.7608 0.051];
            app.SAVESWEEPButton.FontSize = 18;
            app.SAVESWEEPButton.FontWeight = 'bold';
            app.SAVESWEEPButton.FontColor = [0.149 0.149 0.149];
            app.SAVESWEEPButton.Enable = 'off';
            app.SAVESWEEPButton.Position = [327 201 171 71];
            app.SAVESWEEPButton.Text = 'SAVE SWEEP';

            % Create LOADSWEEPButton
            app.LOADSWEEPButton = uibutton(app.ESRTab, 'state');
            app.LOADSWEEPButton.ValueChangedFcn = createCallbackFcn(app, @LOADSWEEPButtonValueChanged, true);
            app.LOADSWEEPButton.Text = 'LOAD SWEEP';
            app.LOADSWEEPButton.BackgroundColor = [0.9608 0.9608 0.9608];
            app.LOADSWEEPButton.FontSize = 18;
            app.LOADSWEEPButton.FontWeight = 'bold';
            app.LOADSWEEPButton.FontColor = [0.1294 0.1294 0.1294];
            app.LOADSWEEPButton.Position = [324 24 171 71];

            % Create STDC2EditFieldLabel
            app.STDC2EditFieldLabel = uilabel(app.Panel_3);
            app.STDC2EditFieldLabel.HorizontalAlignment = 'right';
            app.STDC2EditFieldLabel.FontSize = 28;
            app.STDC2EditFieldLabel.FontWeight = 'bold';
            app.STDC2EditFieldLabel.Position = [380 340 121 34];
            app.STDC2EditFieldLabel.Text = 'STD C. 2';

            % Create STDC2EditField
            app.STDC2EditField = uieditfield(app.Panel_3, 'numeric');
            app.STDC2EditField.ValueDisplayFormat = '%.2e';
            app.STDC2EditField.Editable = 'off';
            app.STDC2EditField.FontSize = 28;
            app.STDC2EditField.FontWeight = 'bold';
            app.STDC2EditField.Position = [537 340 179 34];

            % Create MeanC2EditFieldLabel
            app.MeanC2EditFieldLabel = uilabel(app.Panel_3);
            app.MeanC2EditFieldLabel.HorizontalAlignment = 'right';
            app.MeanC2EditFieldLabel.FontSize = 28;
            app.MeanC2EditFieldLabel.FontWeight = 'bold';
            app.MeanC2EditFieldLabel.Position = [6 343 136 34];
            app.MeanC2EditFieldLabel.Text = 'Mean C. 2';

            % Create MeanC2EditField
            app.MeanC2EditField = uieditfield(app.Panel_3, 'numeric');
            app.MeanC2EditField.ValueDisplayFormat = '%.2e';
            app.MeanC2EditField.Editable = 'off';
            app.MeanC2EditField.FontSize = 28;
            app.MeanC2EditField.FontWeight = 'bold';
            app.MeanC2EditField.Position = [157 343 180 34];

            % Create MeanC1EditFieldLabel
            app.MeanC1EditFieldLabel = uilabel(app.Panel_3);
            app.MeanC1EditFieldLabel.HorizontalAlignment = 'right';
            app.MeanC1EditFieldLabel.FontSize = 28;
            app.MeanC1EditFieldLabel.FontWeight = 'bold';
            app.MeanC1EditFieldLabel.Position = [6 401 136 34];
            app.MeanC1EditFieldLabel.Text = 'Mean C. 1';

            % Create MeanC1EditField
            app.MeanC1EditField = uieditfield(app.Panel_3, 'numeric');
            app.MeanC1EditField.ValueDisplayFormat = '%.2e';
            app.MeanC1EditField.Editable = 'off';
            app.MeanC1EditField.FontSize = 28;
            app.MeanC1EditField.FontWeight = 'bold';
            app.MeanC1EditField.Position = [157 401 180 34];

            % Create STDC1EditFieldLabel
            app.STDC1EditFieldLabel = uilabel(app.Panel_3);
            app.STDC1EditFieldLabel.HorizontalAlignment = 'right';
            app.STDC1EditFieldLabel.FontSize = 28;
            app.STDC1EditFieldLabel.FontWeight = 'bold';
            app.STDC1EditFieldLabel.Position = [380 401 121 34];
            app.STDC1EditFieldLabel.Text = 'STD C. 1';

            % Create STDC1EditField
            app.STDC1EditField = uieditfield(app.Panel_3, 'numeric');
            app.STDC1EditField.ValueDisplayFormat = '%.2e';
            app.STDC1EditField.Editable = 'off';
            app.STDC1EditField.FontSize = 28;
            app.STDC1EditField.FontWeight = 'bold';
            app.STDC1EditField.Position = [537 401 179 34];

            % Create TimeScansEditFieldLabel
            app.TimeScansEditFieldLabel = uilabel(app.Panel_3);
            app.TimeScansEditFieldLabel.HorizontalAlignment = 'center';
            app.TimeScansEditFieldLabel.FontSize = 20;
            app.TimeScansEditFieldLabel.FontWeight = 'bold';
            app.TimeScansEditFieldLabel.Position = [598 842 135 24];
            app.TimeScansEditFieldLabel.Text = 'Time Scan (s)';

            % Create TimeScansEditField
            app.TimeScansEditField = uieditfield(app.Panel_3, 'numeric');
            app.TimeScansEditField.Editable = 'off';
            app.TimeScansEditField.HorizontalAlignment = 'center';
            app.TimeScansEditField.FontSize = 20;
            app.TimeScansEditField.FontWeight = 'bold';
            app.TimeScansEditField.Position = [616 799 100 25];

            % Create StepnmEditField
            app.StepnmEditField = uieditfield(app.Panel_3, 'numeric');
            app.StepnmEditField.Limits = [0 10000];
            app.StepnmEditField.ValueDisplayFormat = '%11.3g';
            app.StepnmEditField.FontSize = 18;
            app.StepnmEditField.FontWeight = 'bold';
            app.StepnmEditField.Position = [463 152 41 23];
            app.StepnmEditField.Value = 100;

            % Create UpYButton
            app.UpYButton = uibutton(app.Panel_3, 'state');
            app.UpYButton.ValueChangedFcn = createCallbackFcn(app, @UpYButtonValueChanged, true);
            app.UpYButton.Icon = 'block-arrow-up.png';
            app.UpYButton.Text = '';
            app.UpYButton.BackgroundColor = [0.9608 0.9608 0.9608];
            app.UpYButton.FontSize = 15;
            app.UpYButton.FontWeight = 'bold';
            app.UpYButton.FontColor = [0.1294 0.1294 0.1294];
            app.UpYButton.Position = [463 185 43 63];

            % Create DownYButton
            app.DownYButton = uibutton(app.Panel_3, 'state');
            app.DownYButton.ValueChangedFcn = createCallbackFcn(app, @DownYButtonValueChanged, true);
            app.DownYButton.Icon = 'block-arrow-down.png';
            app.DownYButton.Text = '';
            app.DownYButton.BackgroundColor = [0.9608 0.9608 0.9608];
            app.DownYButton.FontSize = 15;
            app.DownYButton.FontWeight = 'bold';
            app.DownYButton.FontColor = [0.1294 0.1294 0.1294];
            app.DownYButton.Position = [461 80 43 63];

            % Create RightXButton
            app.RightXButton = uibutton(app.Panel_3, 'state');
            app.RightXButton.ValueChangedFcn = createCallbackFcn(app, @RightXButtonValueChanged, true);
            app.RightXButton.Icon = 'block-arrow-right.png';
            app.RightXButton.Text = '';
            app.RightXButton.BackgroundColor = [0.9608 0.9608 0.9608];
            app.RightXButton.FontSize = 15;
            app.RightXButton.FontWeight = 'bold';
            app.RightXButton.FontColor = [0.1294 0.1294 0.1294];
            app.RightXButton.Position = [518 132 43 63];

            % Create LeftXButton
            app.LeftXButton = uibutton(app.Panel_3, 'state');
            app.LeftXButton.ValueChangedFcn = createCallbackFcn(app, @LeftXButtonValueChanged, true);
            app.LeftXButton.Icon = 'block-arrow-left.png';
            app.LeftXButton.Text = '';
            app.LeftXButton.BackgroundColor = [0.9608 0.9608 0.9608];
            app.LeftXButton.FontSize = 15;
            app.LeftXButton.FontWeight = 'bold';
            app.LeftXButton.FontColor = [0.1294 0.1294 0.1294];
            app.LeftXButton.Position = [408 132 43 63];

            % Create IncZButton
            app.IncZButton = uibutton(app.Panel_3, 'state');
            app.IncZButton.ValueChangedFcn = createCallbackFcn(app, @IncZButtonValueChanged, true);
            app.IncZButton.Icon = 'block-arrow-up.png';
            app.IncZButton.IconAlignment = 'center';
            app.IncZButton.Text = '';
            app.IncZButton.BackgroundColor = [0.9608 0.9608 0.9608];
            app.IncZButton.FontSize = 18;
            app.IncZButton.FontWeight = 'bold';
            app.IncZButton.FontColor = [1 0 0];
            app.IncZButton.Position = [605 185 43 63];

            % Create DecZButton
            app.DecZButton = uibutton(app.Panel_3, 'state');
            app.DecZButton.ValueChangedFcn = createCallbackFcn(app, @DecZButtonValueChanged, true);
            app.DecZButton.Icon = 'block-arrow-down.png';
            app.DecZButton.Text = '';
            app.DecZButton.BackgroundColor = [0.9608 0.9608 0.9608];
            app.DecZButton.FontSize = 18;
            app.DecZButton.FontWeight = 'bold';
            app.DecZButton.FontColor = [0.1294 0.1294 0.1294];
            app.DecZButton.Position = [605 80 43 63];

            % Create ZSlider
            app.ZSlider = uislider(app.Panel_3);
            app.ZSlider.Limits = [0 80];
            app.ZSlider.Orientation = 'vertical';
            app.ZSlider.ValueChangingFcn = createCallbackFcn(app, @ZSliderValueChanging, true);
            app.ZSlider.FontSize = 22;
            app.ZSlider.FontWeight = 'bold';
            app.ZSlider.Position = [673 41 3 254];

            % Create MinZEditFieldLabel
            app.MinZEditFieldLabel = uilabel(app.Panel_3);
            app.MinZEditFieldLabel.HorizontalAlignment = 'right';
            app.MinZEditFieldLabel.FontSize = 22;
            app.MinZEditFieldLabel.FontWeight = 'bold';
            app.MinZEditFieldLabel.Position = [586 1 69 27];
            app.MinZEditFieldLabel.Text = 'Min. Z';

            % Create MinZEditField
            app.MinZEditField = uieditfield(app.Panel_3, 'numeric');
            app.MinZEditField.Limits = [0 80];
            app.MinZEditField.ValueChangedFcn = createCallbackFcn(app, @MinZEditFieldValueChanged, true);
            app.MinZEditField.FontSize = 22;
            app.MinZEditField.FontWeight = 'bold';
            app.MinZEditField.Position = [603 37 43 28];

            % Create MaxZEditFieldLabel
            app.MaxZEditFieldLabel = uilabel(app.Panel_3);
            app.MaxZEditFieldLabel.HorizontalAlignment = 'right';
            app.MaxZEditFieldLabel.FontSize = 22;
            app.MaxZEditFieldLabel.FontWeight = 'bold';
            app.MaxZEditFieldLabel.Position = [581 302 74 27];
            app.MaxZEditFieldLabel.Text = 'Max. Z';

            % Create MaxZEditField
            app.MaxZEditField = uieditfield(app.Panel_3, 'numeric');
            app.MaxZEditField.Limits = [0 80];
            app.MaxZEditField.ValueChangedFcn = createCallbackFcn(app, @MaxZEditFieldValueChanged, true);
            app.MaxZEditField.FontSize = 22;
            app.MaxZEditField.FontWeight = 'bold';
            app.MaxZEditField.Position = [603 267 43 28];
            app.MaxZEditField.Value = 80;

            % Create XEditFieldLabel
            app.XEditFieldLabel = uilabel(app.Panel_3);
            app.XEditFieldLabel.HorizontalAlignment = 'right';
            app.XEditFieldLabel.FontSize = 24;
            app.XEditFieldLabel.FontWeight = 'bold';
            app.XEditFieldLabel.Position = [659 732 25 30];
            app.XEditFieldLabel.Text = 'X';

            % Create XEditField
            app.XEditField = uieditfield(app.Panel_3, 'numeric');
            app.XEditField.ValueDisplayFormat = '%.3f';
            app.XEditField.Editable = 'off';
            app.XEditField.FontSize = 24;
            app.XEditField.FontWeight = 'bold';
            app.XEditField.Position = [621 704 95 30];

            % Create YEditFieldLabel
            app.YEditFieldLabel = uilabel(app.Panel_3);
            app.YEditFieldLabel.HorizontalAlignment = 'right';
            app.YEditFieldLabel.FontSize = 24;
            app.YEditFieldLabel.FontWeight = 'bold';
            app.YEditFieldLabel.Position = [659 638 25 30];
            app.YEditFieldLabel.Text = 'Y';

            % Create YEditField
            app.YEditField = uieditfield(app.Panel_3, 'numeric');
            app.YEditField.ValueDisplayFormat = '%.3f';
            app.YEditField.Editable = 'off';
            app.YEditField.FontSize = 24;
            app.YEditField.FontWeight = 'bold';
            app.YEditField.Position = [621 609 95 30];

            % Create ZEditFieldLabel
            app.ZEditFieldLabel = uilabel(app.Panel_3);
            app.ZEditFieldLabel.HorizontalAlignment = 'right';
            app.ZEditFieldLabel.FontSize = 24;
            app.ZEditFieldLabel.FontWeight = 'bold';
            app.ZEditFieldLabel.Position = [659 541 25 30];
            app.ZEditFieldLabel.Text = 'Z';

            % Create ZEditField
            app.ZEditField = uieditfield(app.Panel_3, 'numeric');
            app.ZEditField.ValueDisplayFormat = '%.3f';
            app.ZEditField.Editable = 'off';
            app.ZEditField.FontSize = 24;
            app.ZEditField.FontWeight = 'bold';
            app.ZEditField.Position = [621 512 95 30];

            % Create TabGroup2
            app.TabGroup2 = uitabgroup(app.Panel_3);
            app.TabGroup2.AutoResizeChildren = 'off';
            app.TabGroup2.Position = [7 51 330 223];

            % Create PositionsTab
            app.PositionsTab = uitab(app.TabGroup2);
            app.PositionsTab.AutoResizeChildren = 'off';
            app.PositionsTab.Title = 'Positions Tab';
            app.PositionsTab.BackgroundColor = [0.2314 0.298 0.5098];

            % Create Goto000Button
            app.Goto000Button = uibutton(app.PositionsTab, 'state');
            app.Goto000Button.ValueChangedFcn = createCallbackFcn(app, @Goto000ButtonValueChanged, true);
            app.Goto000Button.Text = 'Go to (0, 0, 0)';
            app.Goto000Button.BackgroundColor = [0 0 0];
            app.Goto000Button.FontSize = 18;
            app.Goto000Button.FontWeight = 'bold';
            app.Goto000Button.FontColor = [1 1 1];
            app.Goto000Button.Position = [25 150 129 44];

            % Create SetoffsetButton
            app.SetoffsetButton = uibutton(app.PositionsTab, 'state');
            app.SetoffsetButton.ValueChangedFcn = createCallbackFcn(app, @SetoffsetButtonValueChanged, true);
            app.SetoffsetButton.Text = 'Set offset';
            app.SetoffsetButton.BackgroundColor = [0.651 0.1373 0.1686];
            app.SetoffsetButton.FontSize = 18;
            app.SetoffsetButton.FontWeight = 'bold';
            app.SetoffsetButton.FontColor = [1 1 1];
            app.SetoffsetButton.Position = [25 84 129 44];

            % Create RecPos1Button
            app.RecPos1Button = uibutton(app.PositionsTab, 'push');
            app.RecPos1Button.ButtonPushedFcn = createCallbackFcn(app, @RecPos1ButtonPushed, true);
            app.RecPos1Button.BackgroundColor = [0 0 0];
            app.RecPos1Button.FontSize = 15;
            app.RecPos1Button.FontWeight = 'bold';
            app.RecPos1Button.FontColor = [1 1 1];
            app.RecPos1Button.Position = [178 150 128 44];
            app.RecPos1Button.Text = 'Rec. Pos. 1';

            % Create RecPos2Button
            app.RecPos2Button = uibutton(app.PositionsTab, 'push');
            app.RecPos2Button.ButtonPushedFcn = createCallbackFcn(app, @RecPos2ButtonPushed, true);
            app.RecPos2Button.BackgroundColor = [0.651 0.1373 0.1686];
            app.RecPos2Button.FontSize = 15;
            app.RecPos2Button.FontWeight = 'bold';
            app.RecPos2Button.FontColor = [1 1 1];
            app.RecPos2Button.Position = [178 84 128 44];
            app.RecPos2Button.Text = 'Rec. Pos. 2';

            % Create AdjustPosButton
            app.AdjustPosButton = uibutton(app.PositionsTab, 'push');
            app.AdjustPosButton.ButtonPushedFcn = createCallbackFcn(app, @AdjustPosButtonPushed, true);
            app.AdjustPosButton.BackgroundColor = [1 0.7608 0.051];
            app.AdjustPosButton.FontSize = 15;
            app.AdjustPosButton.FontWeight = 'bold';
            app.AdjustPosButton.FontColor = [0.149 0.149 0.149];
            app.AdjustPosButton.Enable = 'off';
            app.AdjustPosButton.Position = [97 21 128 44];
            app.AdjustPosButton.Text = 'Adjust Pos.';

            % Create Panel
            app.Panel = uipanel(app.GridLayout);
            app.Panel.ForegroundColor = [1 1 1];
            app.Panel.BorderType = 'none';
            app.Panel.BackgroundColor = [0.2549 0.3961 0.8196];
            app.Panel.Layout.Row = [12 14];
            app.Panel.Layout.Column = [6 11];

            % Create LoadFigureButton
            app.LoadFigureButton = uibutton(app.Panel, 'push');
            app.LoadFigureButton.ButtonPushedFcn = createCallbackFcn(app, @LoadFigureButtonPushed, true);
            app.LoadFigureButton.BackgroundColor = [0.651 0.1373 0.1686];
            app.LoadFigureButton.FontSize = 18;
            app.LoadFigureButton.FontWeight = 'bold';
            app.LoadFigureButton.FontColor = [1 1 1];
            app.LoadFigureButton.Position = [222 93 141 43];
            app.LoadFigureButton.Text = 'Load Figure';

            % Create ActPanelButton
            app.ActPanelButton = uibutton(app.Panel, 'push');
            app.ActPanelButton.ButtonPushedFcn = createCallbackFcn(app, @ActPanelButtonPushed, true);
            app.ActPanelButton.BackgroundColor = [0 0 0];
            app.ActPanelButton.FontSize = 18;
            app.ActPanelButton.FontWeight = 'bold';
            app.ActPanelButton.FontColor = [1 1 1];
            app.ActPanelButton.Position = [40 93 141 43];
            app.ActPanelButton.Text = 'Act. Panel';

            % Create SetFigButton
            app.SetFigButton = uibutton(app.Panel, 'state');
            app.SetFigButton.ValueChangedFcn = createCallbackFcn(app, @SetFigButtonValueChanged, true);
            app.SetFigButton.Text = 'Set Fig.';
            app.SetFigButton.BackgroundColor = [0.9608 0.9608 0.9608];
            app.SetFigButton.FontSize = 18;
            app.SetFigButton.FontWeight = 'bold';
            app.SetFigButton.FontColor = [0.1294 0.1294 0.1294];
            app.SetFigButton.Position = [579 93 141 43];

            % Create PrevFigButton
            app.PrevFigButton = uibutton(app.Panel, 'state');
            app.PrevFigButton.ValueChangedFcn = createCallbackFcn(app, @PrevFigButtonValueChanged, true);
            app.PrevFigButton.Text = 'Prev. Fig.';
            app.PrevFigButton.BackgroundColor = [1 0.7608 0.051];
            app.PrevFigButton.FontSize = 18;
            app.PrevFigButton.FontWeight = 'bold';
            app.PrevFigButton.FontColor = [0.149 0.149 0.149];
            app.PrevFigButton.Position = [400 93 141 43];

            % Create CleanFigButton
            app.CleanFigButton = uibutton(app.Panel, 'state');
            app.CleanFigButton.ValueChangedFcn = createCallbackFcn(app, @CleanFigButtonValueChanged, true);
            app.CleanFigButton.Text = 'Clean Fig.';
            app.CleanFigButton.BackgroundColor = [0.9608 0.9608 0.9608];
            app.CleanFigButton.FontSize = 18;
            app.CleanFigButton.FontWeight = 'bold';
            app.CleanFigButton.FontColor = [0.1294 0.1294 0.1294];
            app.CleanFigButton.Position = [579 11 141 43];

            % Create SwitchCountPLMap
            app.SwitchCountPLMap = uiswitch(app.Panel, 'toggle');
            app.SwitchCountPLMap.Items = {'Count. 2', 'Count. 1'};
            app.SwitchCountPLMap.ValueChangedFcn = createCallbackFcn(app, @SwitchCountPLMapValueChanged, true);
            app.SwitchCountPLMap.FontSize = 16;
            app.SwitchCountPLMap.FontWeight = 'bold';
            app.SwitchCountPLMap.Position = [790 45 31 71];
            app.SwitchCountPLMap.Value = 'Count. 1';

            % Create MinEditFieldLabel
            app.MinEditFieldLabel = uilabel(app.Panel);
            app.MinEditFieldLabel.HorizontalAlignment = 'center';
            app.MinEditFieldLabel.FontSize = 20;
            app.MinEditFieldLabel.FontWeight = 'bold';
            app.MinEditFieldLabel.FontColor = [1 1 1];
            app.MinEditFieldLabel.Position = [270 59 45 24];
            app.MinEditFieldLabel.Text = 'Min.';

            % Create MinEditField
            app.MinEditField = uieditfield(app.Panel, 'numeric');
            app.MinEditField.ValueDisplayFormat = '%.2e';
            app.MinEditField.ValueChangedFcn = createCallbackFcn(app, @MinEditFieldValueChanged, true);
            app.MinEditField.FontSize = 20;
            app.MinEditField.FontWeight = 'bold';
            app.MinEditField.FontColor = [1 1 1];
            app.MinEditField.BackgroundColor = [0.651 0.1373 0.1686];
            app.MinEditField.Position = [222 11 141 43];

            % Create MaxEditFieldLabel
            app.MaxEditFieldLabel = uilabel(app.Panel);
            app.MaxEditFieldLabel.HorizontalAlignment = 'center';
            app.MaxEditFieldLabel.FontSize = 20;
            app.MaxEditFieldLabel.FontWeight = 'bold';
            app.MaxEditFieldLabel.FontColor = [1 1 1];
            app.MaxEditFieldLabel.Position = [79 58 50 24];
            app.MaxEditFieldLabel.Text = 'Max.';

            % Create MaxEditField
            app.MaxEditField = uieditfield(app.Panel, 'numeric');
            app.MaxEditField.ValueDisplayFormat = '%.2e';
            app.MaxEditField.ValueChangedFcn = createCallbackFcn(app, @MaxEditFieldValueChanged, true);
            app.MaxEditField.FontSize = 20;
            app.MaxEditField.FontWeight = 'bold';
            app.MaxEditField.FontColor = [1 1 1];
            app.MaxEditField.BackgroundColor = [0 0 0];
            app.MaxEditField.Position = [40 11 141 43];

            % Create ZoomSwitchLabel
            app.ZoomSwitchLabel = uilabel(app.Panel);
            app.ZoomSwitchLabel.HorizontalAlignment = 'center';
            app.ZoomSwitchLabel.FontSize = 16;
            app.ZoomSwitchLabel.FontWeight = 'bold';
            app.ZoomSwitchLabel.Position = [447 30 49 22];
            app.ZoomSwitchLabel.Text = 'Zoom';

            % Create ZoomSwitch
            app.ZoomSwitch = uiswitch(app.Panel, 'slider');
            app.ZoomSwitch.ValueChangedFcn = createCallbackFcn(app, @ZoomSwitchValueChanged, true);
            app.ZoomSwitch.FontSize = 16;
            app.ZoomSwitch.Position = [445 9 51 22];

            % Create Lamp
            app.Lamp = uilamp(app.Panel);
            app.Lamp.Enable = 'off';
            app.Lamp.Position = [504 33 20 20];
            app.Lamp.Color = [1 1 1];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = DAQDataAnalyzer_exported

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