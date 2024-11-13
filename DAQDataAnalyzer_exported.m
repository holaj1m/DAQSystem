classdef DAQDataAnalyzer_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                     matlab.ui.Figure
        GridLayout                   matlab.ui.container.GridLayout
        LiveViewPanel                matlab.ui.container.Panel
        UIAxes                       matlab.ui.control.UIAxes
        PanelTraza                   matlab.ui.container.Panel
        StartTraceButton             matlab.ui.control.Button
        StopTraceButton              matlab.ui.control.StateButton
        IntTimemsEditFieldLabel      matlab.ui.control.Label
        IntTimemsEditField           matlab.ui.control.NumericEditField
        NBufferEditFieldLabel        matlab.ui.control.Label
        NBufferEditField             matlab.ui.control.NumericEditField
        NotifyScansSpinnerLabel      matlab.ui.control.Label
        NotifyScansSpinner           matlab.ui.control.Spinner
        MeanEditFieldLabel           matlab.ui.control.Label
        MeanEditField                matlab.ui.control.NumericEditField
        STDEditFieldLabel            matlab.ui.control.Label
        STDEditField                 matlab.ui.control.NumericEditField
        SavingDataSwitchLabel        matlab.ui.control.Label
        SavingDataSwitch             matlab.ui.control.Switch
        Panel4                       matlab.ui.container.Panel
        ScanButton                   matlab.ui.control.Button
        ScanSizeumEditFieldLabel     matlab.ui.control.Label
        ScanSizeumEditField          matlab.ui.control.NumericEditField
        ScanFreqEditFieldLabel       matlab.ui.control.Label
        ScanFreqEditField            matlab.ui.control.NumericEditField
        XoffsetEditFieldLabel        matlab.ui.control.Label
        XoffsetEditField             matlab.ui.control.NumericEditField
        YoffsetEditFieldLabel        matlab.ui.control.Label
        YoffsetEditField             matlab.ui.control.NumericEditField
        StopscanButton               matlab.ui.control.Button
        ScanNpixelsEditFieldLabel    matlab.ui.control.Label
        ScanNpixelsEditField         matlab.ui.control.NumericEditField
        CtimemsEditFieldLabel        matlab.ui.control.Label
        CtimemsEditField             matlab.ui.control.NumericEditField
        StimemsEditFieldLabel        matlab.ui.control.Label
        StimemsEditField             matlab.ui.control.NumericEditField
        SaveScanButton               matlab.ui.control.Button
        SampleNameEditFieldLabel     matlab.ui.control.Label
        SampleNameEditField          matlab.ui.control.EditField
        FilterNameEditFieldLabel     matlab.ui.control.Label
        FilterNameEditField          matlab.ui.control.EditField
        DetectorEditFieldLabel       matlab.ui.control.Label
        DetectorEditField            matlab.ui.control.EditField
        PoweruWEditFieldLabel        matlab.ui.control.Label
        PoweruWEditField             matlab.ui.control.NumericEditField
        WavelengthnmEditFieldLabel   matlab.ui.control.Label
        WavelengthnmEditField        matlab.ui.control.NumericEditField
        RemainingTimeScansEditFieldLabel  matlab.ui.control.Label
        RemainingTimeScansEditField  matlab.ui.control.NumericEditField
        ZoffsetEditFieldLabel        matlab.ui.control.Label
        ZoffsetEditField             matlab.ui.control.NumericEditField
        Panel5                       matlab.ui.container.Panel
        UpYButton                    matlab.ui.control.StateButton
        DownYButton                  matlab.ui.control.StateButton
        RightXButton                 matlab.ui.control.StateButton
        LeftXButton                  matlab.ui.control.StateButton
        DecZButton                   matlab.ui.control.StateButton
        IncZButton                   matlab.ui.control.StateButton
        MovenmEditFieldLabel         matlab.ui.control.Label
        MovenmEditField              matlab.ui.control.NumericEditField
        MaxZEditFieldLabel           matlab.ui.control.Label
        MaxZEditField                matlab.ui.control.NumericEditField
        MinZEditFieldLabel           matlab.ui.control.Label
        MinZEditField                matlab.ui.control.NumericEditField
        ActPanelButton               matlab.ui.control.Button
        Goto000Button                matlab.ui.control.StateButton
        ZSliderLabel                 matlab.ui.control.Label
        ZSlider                      matlab.ui.control.Slider
        Switch                       matlab.ui.control.ToggleSwitch
        Panel6                       matlab.ui.container.Panel
        XcoordEditFieldLabel         matlab.ui.control.Label
        XcoordEditField              matlab.ui.control.NumericEditField
        YcoordEditFieldLabel         matlab.ui.control.Label
        YcoordEditField              matlab.ui.control.NumericEditField
        ZcoordEditFieldLabel         matlab.ui.control.Label
        ZcoordEditField              matlab.ui.control.NumericEditField
        Mean2EditFieldLabel          matlab.ui.control.Label
        Mean2EditField               matlab.ui.control.NumericEditField
        STD2EditFieldLabel           matlab.ui.control.Label
        STD2EditField                matlab.ui.control.NumericEditField
        Panel7                       matlab.ui.container.Panel
        LoadFigureButton             matlab.ui.control.Button
        SetoffsetButton              matlab.ui.control.StateButton
        ZoomButton                   matlab.ui.control.StateButton
        SetFigButton                 matlab.ui.control.StateButton
        PrevFigButton                matlab.ui.control.StateButton
        MinColorbarEditFieldLabel    matlab.ui.control.Label
        MinColorbarEditField         matlab.ui.control.NumericEditField
        MaxColorbarEditFieldLabel    matlab.ui.control.Label
        MaxColorbarEditField         matlab.ui.control.NumericEditField
        SavezoomButton               matlab.ui.control.StateButton
        ZoomSizeumEditFieldLabel     matlab.ui.control.Label
        ZoomSizeumEditField          matlab.ui.control.NumericEditField
        CleanFigButton               matlab.ui.control.StateButton
        Lamp                         matlab.ui.control.Lamp
        ZoomSwitchLabel              matlab.ui.control.Label
        ZoomSwitch                   matlab.ui.control.Switch
        Panel3                       matlab.ui.container.Panel
        XYRangeEditFieldLabel        matlab.ui.control.Label
        XYRangeEditField             matlab.ui.control.NumericEditField
        ZRangeEditFieldLabel         matlab.ui.control.Label
        ZRangeEditField              matlab.ui.control.NumericEditField
        NBufferOptLabel              matlab.ui.control.Label
        NBufferOptEditField          matlab.ui.control.NumericEditField
        UpToleranceEditFieldLabel    matlab.ui.control.Label
        UpToleranceEditField         matlab.ui.control.NumericEditField
        DownToleranceEditFieldLabel  matlab.ui.control.Label
        DownToleranceEditField       matlab.ui.control.NumericEditField
        Panel8                       matlab.ui.container.Panel
        StartOptButton               matlab.ui.control.StateButton
        Switch_2                     matlab.ui.control.ToggleSwitch
        SaveCoordsButton             matlab.ui.control.StateButton
        TrackerSwitchLabel           matlab.ui.control.Label
        TrackerSwitch                matlab.ui.control.Switch
    end

    
properties (Access = private)
        DAQSession = [] % Handle to DAQ session
        
        DAQClkTraceSession = [] % Handle to DAQ session
        
        DAQSession2 = []
        
        
        DAQTrazaScan = [] % sesion de traza a ejecutar durante scan
        trazaScanListener = [];
        traceScanFigure % Handle a figura externa que plotea la traza
        axesScanTrace % Handle de los ejes de figura que plotea traza
        lineScanTrace % Handle a la linea del gráfico
        
        axesTraceLeft
        axesTraceRight
        
        mostrarScanCont1 = true;
        DataFIFOBufferTrazaScan
        TimestampsFIFOBufferTrazaScan
        
        TraceAvailableListener % Listener for DAQ session 'DataAvailable' event
        TraceAvailableListener2
        
        %======= TRAZA APD %=======
        TimestampsFIFOBuffer % Timestamps FIFO buffer used for live plot of latest "N" seconds of acquired data
        bufferSizeExcelitas
        bufferSizeLasercomp
        DataFIFOBuffer  % Data FIFO buffer used for live plot of latest "N" seconds of acquired data
        %======= TRAZA INFRARROJO %=======
        DataFIFOBufferInfrarrojo
        lineTraceInfrarrojo
        %=======
        traceFigure % Handle a figura externa que plotea la traza
        axesTrace % Handle de los ejes de figura que plotea traza
        lineTrace % Handle a la linea del gráfico
        
        % VARIABLES PARA SINCRONIZAR OPTIMIZACION
        acumularCtas = false; % Bandera lógica para dar paso a optimizacion
        ctasAcumuladasOpt = []; % variable para acumular cuentas
        bufferOptTrackerExcelitas = []; % Buffer para acumular cuentas en el trackeo
        bufferOptTrackerLasercomp = [];
        mediaTracking;
        
        % Variables para almacenar coordenadas optimizadas durante tracking
        trackingCoordX = [];
        trackingCoordY = [];
        trackingCoordZ = [];
        figCoordTracking
        axesTrackingX
        lineTrackingX
        
        axesTrackingY
        lineTrackingY
        
        axesTrackingZ
        lineTrackingZ
        
        axesTrackingXY
        lineTrackingXY
        
        CheckConditionsOpt
        
        umbralDownTracker = 1;
        umbralUpTracker = 1;
        
        optimizarContador1 = true;
        ctaMaxZ
        
        % Figuras con cuentas de la optimizacion
        figOptX = [];
        figOptY = [];
        figOptZ = [];
        
        
        %========================================
        
        LogRequested % Logical value, indicates whether user selected to log data to file from the UI (set by LogdatatofileSwitch)
        LogSaveScan % Valor booleano para guardar datos tomados del scan
        TriggerTime % Acquisition start time stored as datetime
        TempFilename % Temporary binary file name, acquired data is logged to this file during acquisition
        TempFile % Handle of opened binary file, acquired data is logged to this file during acquisition
        Filename = datestr(datetime('now'), 'yyyy-mm-dd_HHMMSS_TRA') % Default MAT file name at app start
        Filepath = pwd % Default folder for saving the MAT file at app start
        
        % Propiedades asociadas a mapa PL
        
        
        DAQScanSession = [] % Sesion para realizar scan
        scanListener = [];
        
        DAQScanCtr2 = [];
        scanCtr2Listener = [];
        
        % Sesiones para manejo de coordenadas por separado
        
        DAQSesionCoordX = [] % Sesion para manejar entrada y salidas de voltajes asociadas a coordenada X
        
        DAQSesionCoordY = [] % Sesion para manejar entrada y salidas de voltajes asociadas a coordenada Y
        
        DAQSesionCoordZ = [] % Sesion para manejar entrada y salidas de voltajes asociadas a coordenada Z
        
        CountdownTimer % Timer pare cuenta regresiva de scan
        
        transCoords = false % Bandera para trackear coordenadas actuales a scan
        piezoSettlingTime = 2E-3 % Tiempo que le toma al piezo moverse de un punto a otro
        
        xCoordCts % X coordinates scanned
        yCoordCts % Y coordinates scanned
        xCoordsZoom % Coordenadas X recorridas en zoom
        yCoordsZoom % Coordenadas Y recorridas en zoom
        xOffSetZoom % Centro en X del zoom
        yOffSetZoom % Centro en Y del zoom
        zOffSetZoom % Centro en Z del zoom
        sizeZoom % Tamaño del scan en el zoom
        countsMatrix = [] % Matrix associated with counts/s at the given coordinates
        countsZoom = []
        
        countsMatrixAPD2 = [] % Matrix associated with counts/s at the given coordinates
        countsZoomAPD2 = []
        
        isZoom = false; % Variable para controlar si el proceso de scan corresponde a zoom o scan
        
        matrixPlot 
        isClickedDown = false
        buttonDownTime % Variable para medir el tiempo que se mantiene presionado el clic
        
        currentVoltX  % Voltaje asociado a posicion actual X
        currentVoltY  % Voltaje asociado a posicion actual Y
        currentVoltZ % Voltaje asociado a posicion actual Z
        maxVoltPiezo = 0.25 % Voltaje máximo a aplicar al piezo
        
        hXLine  % Handle para la línea vertical
        hYLine  % Handle para la línea horizontal
        
        minColorbar
        maxColorbar
        
        voltX = 0
        voltY = 0
        voltZ = 0
    end
    
    
    
    
    
    
    methods (Access = private)
        
        function dataAvailable_Callback(app, ~, event)
            
        %dataAvailable_Callback Executes on DAQ session DataAvailable event
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
            app.bufferSizeExcelitas = round(abs(app.NBufferEditField.Value));
        
            % Definir variables que determinan tiempo de integración
            timeMs = app.IntTimemsEditField.Value;
            dT = timeMs/(1000*2);
        
            data = mean(diff(event.Data(:,1)))/(2*dT);
        
            if app.acumularCtas && app.optimizarContador1
            app.ctasAcumuladasOpt = [app.ctasAcumuladasOpt; data];
            end
            
            
            app.DataFIFOBuffer = storeDataInFIFO(app, app.DataFIFOBuffer, app.bufferSizeExcelitas, data);
            
            if numel(app.DataFIFOBuffer) == app.bufferSizeExcelitas
                app.MeanEditField.Value = mean(app.DataFIFOBuffer(1:end));
                app.STDEditField.Value = std(app.DataFIFOBuffer(1:end));
                
            end
            
            % Update plot data
            %yyaxis(app.axesTraceLeft, 'left');
            set(app.lineTrace ,'YData', app.DataFIFOBuffer);
            drawnow limitrate;
            
            bufferTracker = ceil(app.bufferSizeExcelitas * app.NBufferOptEditField.Value/100);
            app.bufferOptTrackerExcelitas = storeDataInFIFO(app, app.bufferOptTrackerExcelitas, bufferTracker, data);
            
        end
        
        function conditionsOptExcelitas(app)
            
            % Si las cuentas suben por sobre un umbral actualizar el valor
            % de referencia
            if (numel(app.DataFIFOBuffer) == app.bufferSizeExcelitas) && (app.MeanEditField.Value > app.mediaTracking * app.umbralUpTracker)
                
                app.mediaTracking = app.MeanEditField.Value;
                disp("Se ha actualizado la tolerancia de subida " + app.mediaTracking * app.umbralUpTracker)
                disp("Tolerancia de bajada " + app.mediaTracking * app.umbralDownTracker)
            end
            
            
            % Solo evalúa las condiciones lógicas cuando el tracker está activo
            if (numel(app.DataFIFOBuffer) == app.bufferSizeExcelitas) && (mean(app.bufferOptTrackerExcelitas) < app.mediaTracking * app.umbralDownTracker)
                
                % Ejecuta la acción que se desea realizar sin bloquear el flujo de datos
                StartOptButtonValueChanged(app, []);
                
                % Actualizar referencia de trackeo
                app.mediaTracking = app.ctaMaxZ;
                
                % Guardar coordenadas trackeadas
                app.trackingCoordX = [app.trackingCoordX; app.XcoordEditField.Value];
                app.trackingCoordY = [app.trackingCoordY; app.YcoordEditField.Value];
                app.trackingCoordZ = [app.trackingCoordZ; app.ZcoordEditField.Value];
                
                set(app.lineTrackingX ,'YData', app.trackingCoordX);
                set(app.lineTrackingY ,'YData', app.trackingCoordY);
                set(app.lineTrackingZ ,'YData', app.trackingCoordZ);
                set(app.lineTrackingXY , 'XData', app.trackingCoordX, 'YData', app.trackingCoordY);
                
                
                disp("Tamaño buffer tracking " + length(app.bufferOptTrackerExcelitas))
                disp("Referencia Opt. " + app.mediaTracking)
                disp("Valor tolerancia subida " + app.mediaTracking * app.umbralUpTracker)
                disp("Valor tolerancia bajada " + app.mediaTracking * app.umbralDownTracker)
                pause(2)
            end
        end
        
        function conditionsOptLasercomp(app)
            
            % Si las cuentas suben por sobre un umbral actualizar el valor
            % de referencia
            if (numel(app.DataFIFOBufferInfrarrojo) == app.bufferSizeLasercomp) && (app.Mean2EditField.Value > app.mediaTracking * app.umbralUpTracker)
                
                app.mediaTracking = app.Mean2EditField.Value;
                disp("Se ha actualizado la tolerancia de subida " + app.mediaTracking * app.umbralUpTracker)
                disp("Tolerancia de bajada " + app.mediaTracking * app.umbralDownTracker)
            end
            
            
            % Solo evalúa las condiciones lógicas cuando el tracker está activo
            if (numel(app.DataFIFOBufferInfrarrojo) == app.bufferSizeLasercomp) && (mean(app.bufferOptTrackerLasercomp) < app.mediaTracking * app.umbralDownTracker)
                
                % Ejecuta la acción que se desea realizar sin bloquear el flujo de datos
                StartOptButtonValueChanged(app, []);
                app.mediaTracking = app.ctaMaxZ;
                
                % Guardar coordenadas trackeadas
                app.trackingCoordX = [app.trackingCoordX; app.XcoordEditField.Value];
                app.trackingCoordY = [app.trackingCoordY; app.YcoordEditField.Value];
                app.trackingCoordZ = [app.trackingCoordZ; app.ZcoordEditField.Value];
                
                set(app.lineTrackingX ,'YData', app.trackingCoordX);
                set(app.lineTrackingY ,'YData', app.trackingCoordY);
                set(app.lineTrackingZ ,'YData', app.trackingCoordZ);
                set(app.lineTrackingXY , 'XData', app.trackingCoordX, 'YData', app.trackingCoordY);
                
                
                disp("Tamaño buffer tracking " + length(app.bufferOptTrackerLasercomp))
                disp("Referencia Opt. " + app.mediaTracking)
                disp("Valor tolerancia subida" + app.mediaTracking * app.umbralUpTracker)
                disp("Valor tolerancia bajada" + app.mediaTracking * app.umbralDownTracker)
                pause(2)
            end
        end

        
        function procesarTraza2(app, ~, event)
            %==========================================================
            %================== TRAZA INFRARROJO ======================
            
            % Store continuous acquisition data in FIFO data buffers
            buffersize = round(abs(app.NBufferEditField.Value));
        
            % Definir variables que determinan tiempo de integración
            timeMs = app.IntTimemsEditField.Value;
            dT = timeMs/(1000*2);
            
            dataInfra = mean(diff(event.Data(:,1)))/(2*dT);
            
            if app.acumularCtas && ~(app.optimizarContador1)
            app.ctasAcumuladasOpt = [app.ctasAcumuladasOpt; dataInfra];
            end
            
            app.DataFIFOBufferInfrarrojo = storeDataInFIFO(app, app.DataFIFOBufferInfrarrojo, buffersize, dataInfra);
            
            if numel(app.DataFIFOBufferInfrarrojo) == buffersize
                app.Mean2EditField.Value = mean(app.DataFIFOBufferInfrarrojo(1:end));
                app.STD2EditField.Value = std(app.DataFIFOBufferInfrarrojo(1:end));
                
            end
            
            % Update plot data
            %yyaxis(app.axesTraceRight, 'right');
            set(app.lineTraceInfrarrojo ,'YData', app.DataFIFOBufferInfrarrojo);
            drawnow limitrate;
        end
        
        function trazaScanCallback(app, ~, event)
        
            % Store continuous acquisition data in FIFO data buffers
            buffersize = round(abs(app.NBufferEditField.Value));
            
            % Definir variables que determinan tiempo de integración
            timeMs = 2;
            dT = timeMs/(1000*2);
            
            data = mean(diff(event.Data(:,1)))/(2*dT);
            
            
            app.DataFIFOBufferTrazaScan = storeDataInFIFO(app, app.DataFIFOBufferTrazaScan, buffersize, data);
            
            
            % Update plot data
            set(app.lineScanTrace ,'YData', app.DataFIFOBufferTrazaScan);
            drawnow limitrate;
            
        end
        
        % Callback que se ejecuta al cerrar la figura externa
        function closeTrazaCallback(app, src, event)
            % Cerrar la sesión de DAQ
            StopTraceButtonValueChanged(app,[])
            % Cerrar la figura
            %delete(src);
        end
        
        function closeScanTrazaCallback(app, src, event)
            % Detener adquisición de datos
            stop(app.DAQTrazaScan)
            
            % Eliminar e inicializar listener a array vacío
            delete(app.trazaScanListener);
            app.trazaScanListener = [];
            
            % Setear handles de gráfico de traza a array vacios
            delete(app.traceScanFigure)
            app.traceScanFigure = [];
            app.axesScanTrace = [];
            app.lineScanTrace = [];
            
            app.DataFIFOBufferTrazaScan = [];
            app.TimestampsFIFOBufferTrazaScan = [];
            
            
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
                    
                    app.ScanButton.Enable = 'on';
                    app.StopscanButton.Enable = 'off';
                    app.LiveViewPanel.Visible = 'on';
                    
                    if ~(isempty(app.DAQSession)) && app.DAQSession.IsRunning % Sila traza está funcionando
                        app.StartTraceButton.Enable = 'off';
                        app.StopTraceButton.Enable = 'on';
                        app.SavingDataSwitch.Enable = 'off';
                        app.NotifyScansSpinner.Enable = 'off';
                        app.IntTimemsEditField.Enable = 'off';
                        app.NBufferEditField.Enable = 'off';
                        % Optimización
                        app.StartOptButton.Enable = 'on';
                        app.TrackerSwitch.Enable = 'on';
                        app.Switch_2.Enable = 'on';
                        app.NBufferOptEditField.Enable = 'on';
                        app.UpToleranceEditField.Enable = 'on';
                        app.DownToleranceEditField.Enable = 'on';
                        app.XYRangeEditField.Enable = 'on';
                        app.ZRangeEditField.Enable = 'on';
                        
                    else
                        app.StartTraceButton.Enable = 'on';
                        app.StopTraceButton.Enable = 'off';
                        app.SavingDataSwitch.Enable = 'on';
                        app.NotifyScansSpinner.Enable = 'on';
                        app.IntTimemsEditField.Enable = 'on';
                        app.NBufferEditField.Enable = 'on';
                        % Optimización
                        app.StartOptButton.Enable = 'off';
                        app.TrackerSwitch.Enable = 'off';
                        app.Switch_2.Enable = 'off';
                        app.NBufferOptEditField.Enable = 'off';
                        app.UpToleranceEditField.Enable = 'off';
                        app.DownToleranceEditField.Enable = 'off';
                        app.XYRangeEditField.Enable = 'off';
                        app.ZRangeEditField.Enable = 'off';
                    end
                    
                    
                    app.XoffsetEditField.Enable = 'on';
                    app.YoffsetEditField.Enable = 'on';
                    app.ZoffsetEditField.Enable = 'on';
                    app.ScanFreqEditField.Enable = 'on';
                    app.ScanSizeumEditField.Enable = 'on';
                    app.ScanNpixelsEditField.Enable = 'on';
                    app.StimemsEditField.Enable = 'on';
                    app.CtimemsEditField.Enable = 'on';
                    
                    app.LoadFigureButton.Enable = 'on';
                    app.Goto000Button.Enable = 'on';
                    app.SetoffsetButton.Enable = 'on';
                    app.UpYButton.Enable = 'on';
                    app.DownYButton.Enable = 'on';
                    app.LeftXButton.Enable = 'on';
                    app.RightXButton.Enable = 'on';
                    app.MinZEditField.Enable = 'on';
                    app.MaxZEditField.Enable = 'on';
                    app.ZSlider.Enable = 'on';
                    app.DecZButton.Enable = 'on';
                    app.IncZButton.Enable = 'on';
                    app.MovenmEditField.Enable = 'on';
                    app.XcoordEditField.Enable = 'on';
                    app.YcoordEditField.Enable = 'on';
                    app.ZcoordEditField.Enable = 'on';
                    
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
                    app.Switch_2.Enable = 'on';
                    app.NBufferOptEditField.Enable = 'on';
                    app.UpToleranceEditField.Enable = 'on';
                    app.DownToleranceEditField.Enable = 'on';
                    app.XYRangeEditField.Enable = 'on';
                    app.ZRangeEditField.Enable = 'on';
                    
                case 'scanning'
                    app.SavingDataSwitch.Enable = 'on';
                    app.NotifyScansSpinner.Enable = 'on';
                    app.IntTimemsEditField.Enable = 'on';
                    app.NBufferEditField.Enable = 'on';
                    app.StartTraceButton.Enable = 'off';
                    app.ScanButton.Enable = 'off';
                    app.StopTraceButton.Enable = 'off';
                    app.StopscanButton.Enable = 'on';
                    app.SaveScanButton.Enable = 'off';
                    app.ActPanelButton.Enable = 'off';
                    
                    app.XoffsetEditField.Enable = 'off';
                    app.YoffsetEditField.Enable = 'off';
                    app.ZoffsetEditField.Enable = 'off';
                    app.ScanFreqEditField.Enable = 'off';
                    app.ScanSizeumEditField.Enable = 'off';
                    app.ScanNpixelsEditField.Enable = 'off';
                    app.StimemsEditField.Enable = 'off';
                    app.CtimemsEditField.Enable = 'off';
                    
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
                    app.MovenmEditField.Enable = 'off';
                    app.XcoordEditField.Enable = 'off';
                    app.YcoordEditField.Enable = 'off';
                    app.ZcoordEditField.Enable = 'off';
                    
                    app.LiveViewPanel.Visible = 'off';
                    
                case 'scannerFinished'
                    app.SavingDataSwitch.Enable = 'on';
                    app.NotifyScansSpinner.Enable = 'on';
                    app.IntTimemsEditField.Enable = 'on';
                    app.NBufferEditField.Enable = 'on';
                    app.StartTraceButton.Enable = 'off';
                    app.ScanButton.Enable = 'on';
                    app.StopTraceButton.Enable = 'off';
                    app.StopscanButton.Enable = 'off';
                    app.ActPanelButton.Enable = 'on';
                    app.SaveScanButton.Enable = 'on';
                    
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
                    app.MovenmEditField.Enable = 'off';
                    app.XcoordEditField.Enable = 'off';
                    app.YcoordEditField.Enable = 'off';
                    app.ZcoordEditField.Enable = 'off';
                    
                    app.LiveViewPanel.Visible = 'off';
                    
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
                    app.MovenmEditField.Enable = 'off';
                    app.XcoordEditField.Enable = 'off';
                    app.YcoordEditField.Enable = 'off';
                    app.ZcoordEditField.Enable = 'off';
                    
                    app.LiveViewPanel.Visible = 'off';
                    
                    
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
        
        function guardarRespaldoScan(app)
            
            %DATOS INDEPENDIENTES DE LA TAREA
            metadataScanStruct.nPixels = app.ScanNpixelsEditField.Value;
            metadataScanStruct.frecuencia = app.ScanFreqEditField.Value;
            metadataScanStruct.settlingTime = app.StimemsEditField.Value;
            metadataScanStruct.countsTime = app.CtimemsEditField.Value;
            
            % Metadata correspondiente a la muestra
            metadataMuestraStruct.muestra = app.SampleNameEditField.Value;
            metadataMuestraStruct.filtro = app.FilterNameEditField.Value;
            metadataMuestraStruct.detector = app.DetectorEditField.Value;
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
            dataStruct.excelitas = app.countsMatrix;
            dataStruct.laserComp = app.countsMatrixAPD2;
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

        
        
        function guardarDatosScan(app, tipoScan)
            
            
            %DATOS INDEPENDIENTES DE LA TAREA
            
            
            
            % Metadata correspondiente a la muestra
            metadataMuestraStruct.muestra = app.SampleNameEditField.Value;
            metadataMuestraStruct.filtro = app.FilterNameEditField.Value;
            metadataMuestraStruct.detector = app.DetectorEditField.Value;
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
                    dataStruct.excelitas = app.countsMatrix;
                    dataStruct.laserComp = app.countsMatrixAPD2;
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
                    dataStruct.excelitas = app.countsZoom;
                    dataStruct.laserComp = app.countsMatrixAPD2;
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
        
        function guardarRespaldoTracking(app)
            
            % Metadata correspondiente a la muestra
            metadataMuestraStruct.muestra = app.SampleNameEditField.Value;
            metadataMuestraStruct.filtro = app.FilterNameEditField.Value;
            metadataMuestraStruct.detector = app.DetectorEditField.Value;
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
            dataStruct.x = app.trackingCoordX;
            dataStruct.y = app.trackingCoordY;
            dataStruct.y = app.trackingCoordZ;
            
            tracking.coords = dataStruct;
            tracking.metadata = metadataMuestraStruct;
            
            % Guardar archivo de respaldo (sin hora)
            save(backupFullPath, 'tracking');
            disp(['Respaldo guardado en: ', backupFullPath]);
        end
        
        function guardarTracking(app)
            
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
            metadataMuestraStruct.detector = app.DetectorEditField.Value;
            metadataMuestraStruct.potencia = app.PoweruWEditField.Value;
            metadataMuestraStruct.longOnda = app.WavelengthnmEditField.Value;
            
            % Definir los datos a guardar
            dataStruct.x = app.trackingCoordX;
            dataStruct.y = app.trackingCoordY;
            dataStruct.y = app.trackingCoordZ;
            
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
                    if isAcquiring
                        closeTrazaCallback(app, [], [])
                        
                        % Acquisition is currently on
%                         stop(app.DAQSession)
%                         stop(app.DAQSession2)
                        stop(app.DAQClkTraceSession)
                        %stop(app.DAQScanSession)
                        
                        
%                         delete(app.TraceAvailableListener)
%                         delete(app.TraceAvailableListener2)
%                         delete(app.DAQSession)
                        delete(app.DAQClkTraceSession)
                        delete(app.DAQScanSession)

                        
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
        
        function actualizarSliderZ(app, newValue)
            
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
            app.XcoordEditField.Value = app.currentVoltX * 8;
            app.YcoordEditField.Value = app.currentVoltY * 8;
            app.ZcoordEditField.Value = app.currentVoltZ * 8;
            
            actualizarSliderZ(app, app.ZcoordEditField.Value)
            
        end
        
        % FUNCIONES ASOCIADAS A MAPA PL
        
        % Callback para greaficar matriz y setear listeners de interacción
        % con imagen
        
        function dataLoadedCallback(app)
            % Usar imagesc para graficar amtriz y setear límites
            app.matrixPlot = imagesc(app.UIAxes,app.xCoordCts, app.yCoordCts, app.countsMatrix);
            xlim(app.UIAxes, [min(app.xCoordCts), max(app.xCoordCts)]);
            ylim(app.UIAxes, [min(app.yCoordCts), max(app.yCoordCts)]);
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
            app.buttonDownTime = tic;
            pos = get(app.UIAxes, 'CurrentPoint');
            x = round(pos(1,1),4);
            y = round(pos(1,2),4);
            app.isClickedDown = true;
            actualizarVoltajes(app)
            
            
            % Verificar que el click se haya hecho dentro de los límites de la figura
            
            if x >= min(app.xCoordCts) && x <= max(app.xCoordCts) && y >= min(app.yCoordCts) && y <= max(app.yCoordCts)
                
                
                % Actualizar las líneas de coordenadas
                
                set(app.hXLine, 'Value', x);
                set(app.hYLine, 'Value', y);
                
                % Actualizar la posición clickeada como voltaje final
                
                app.voltX = x/8;
                app.voltY = y/8;
                
                
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
                    
                    app.XcoordEditField.Value = x;
                    app.YcoordEditField.Value = y;
                    
                    % Actualizar la posición del mouse como voltaje final
                    
                    app.voltX = x/8;
                    app.voltY = y/8;
                    
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
                
                % Actualizar las líneas de coordenadas en la figura
                
                set(app.hXLine, 'Value', x);
                set(app.hYLine, 'Value', y);
                
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
        
        function desplazarScan(app)
            
            
            s = app.DAQScanSession;
            
            
            if ~(isempty(s))
                % Crear vector con voltajes iniciales actuales y voltajes
                % finales
                
                voltInicial = [app.currentVoltX, app.currentVoltY];
                
                voltFinal = [app.voltX, app.voltY];
                
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
                    
                    vectorVoltX = voltVector(app, app.currentVoltX, app.voltX);
                    vectorVoltY = voltVector(app, app.currentVoltY, app.voltY);
                    
                    % Igualar el largo de los vectores de voltajes de salida
                    
                    [vectorVoltX, vectorVoltY] = equalizeVectorLength(app, vectorVoltX, vectorVoltY);
                    
                    % Darle salida a los voltajes
                    for i = 1 : length(vectorVoltX)
                        outputSingleScan(s, [vectorVoltX(i), vectorVoltY(i)]);
                    end
                    
                    
                end
                
            else
                iniciarSesionScan(app)
                desplazarScan(app)
            end
            
        end
        
        function scanProcessData(app, event, idxNoCts, idxCts, tarea)
            
            try
                
%                 assignin('base','ctasBruto',ctasBruto)
%                 assignin('base','idxNoCts',idxNoCts)
%                 assignin('base','idxCts',idxCts)

                %=================== APD ===================
                
                preDataAPD = event.Data(:,1);
                
                for i=1:length(idxNoCts)
                    preDataAPD(idxNoCts(i,1):idxNoCts(i,2)) = [];
                end
                
                dataAPD = diff(preDataAPD);
                
                nPuntos = app.ScanNpixelsEditField.Value;
                integrationTime = (app.CtimemsEditField.Value)/1000;
                bufferCuentasAPD = zeros(nPuntos * nPuntos,1);
                
                for i=1:length(idxCts)
                    bufferCuentasAPD(i) = sum(  dataAPD(idxCts(i,1):idxCts(i,2))  )/integrationTime;
                end
                
                switch tarea
                    case 'scan'
                        
                        app.countsMatrix = reshape(bufferCuentasAPD, nPuntos, nPuntos)';
                        % Crear figura con scan en el infrarrojo
                        figure('Name','APD')
                        imagesc(reshape(bufferCuentasAPD, nPuntos, nPuntos))
                        colormap jet
                        
                    case 'zoom'
                        
                        app.countsZoom = reshape(bufferCuentasAPD, nPuntos, nPuntos)';
                        % Crear figura con scan en el infrarrojo
                        figure('Name','APD ZOOM')
                        imagesc(reshape(bufferCuentasAPD, nPuntos, nPuntos))
                        colormap jet
                        
                end
                
                
                setAppViewState(app, 'scannerFinished')
                
            catch ME
                disp('Error in scanProcessData:');
                disp(ME.message);
            end
            
        end
        
        function datosScanAPD2(app, event, idxNoCts, idxCts, tarea)
            try
                
                %=================== INFRARROJO ===================
                
                preDataInfra = event.Data(:,1);
                
                for i=1:length(idxNoCts)
                    preDataInfra(idxNoCts(i,1):idxNoCts(i,2)) = [];
                end
                
                dataInfra = diff(preDataInfra);
                
                nPuntos = app.ScanNpixelsEditField.Value;
                integrationTime = (app.CtimemsEditField.Value)/1000;
                bufferCuentasInfra = zeros(nPuntos * nPuntos,1);
                
                for i=1:length(idxCts)
                    bufferCuentasInfra(i) = sum(  dataInfra(idxCts(i,1):idxCts(i,2))  )/integrationTime;
                end
                
                switch tarea
                    case 'scan'
                        
                        app.countsMatrixAPD2 = reshape(bufferCuentasInfra, nPuntos, nPuntos)';
                        % Crear figura con scan en el infrarrojo
                        figure('Name','INFRARROJO')
                        imagesc(reshape(bufferCuentasInfra, nPuntos, nPuntos))
                        colormap jet
                        
                    case 'zoom'
                        
                        app.countsZoomAPD2 = reshape(bufferCuentasInfra, nPuntos, nPuntos)';
                        % Crear figura con scan en el infrarrojo
                        figure('Name','INFRARROJO ZOOM')
                        imagesc(reshape(bufferCuentasInfra, nPuntos, nPuntos))
                        colormap jet
                        
                end
                
                stop(app.DAQScanCtr2)
                
            catch ME
                disp('Error in datosScanAPD2:');
                disp(ME.message);
            end
        end
        
        function graficosGUIScan(app, event, tarea)
            
            if app.mostrarScanCont1
                switch tarea
                    case 'scan'
                        
                        app.matrixPlot = imagesc(app.UIAxes,app.xCoordCts, app.yCoordCts, app.countsMatrix);
                        colormap(app.UIAxes, "jet")
                        colorbar(app.UIAxes)
                        xlim(app.UIAxes, [min(app.xCoordCts), max(app.xCoordCts)]);
                        ylim(app.UIAxes, [min(app.yCoordCts), max(app.yCoordCts)]);
                        
                        actualizarBarraColor(app, 'scan')
                        
                        
                    case 'zoom'
                        app.matrixPlot = imagesc(app.UIAxes,app.xCoordsZoom, app.yCoordsZoom, app.countsZoom);
                        xlim(app.UIAxes, [min(app.xCoordsZoom), max(app.xCoordsZoom)]);
                        ylim(app.UIAxes, [min(app.yCoordsZoom), max(app.yCoordsZoom)]);
                        colormap(app.UIAxes, "jet")
                        colorbar(app.UIAxes)
                        
                        actualizarBarraColor(app,'zoom')
                end
                
            else
                
                switch tarea
                    case 'scan'
                        
                        app.matrixPlot = imagesc(app.UIAxes,app.xCoordCts, app.yCoordCts, app.countsMatrixAPD2)';
                        colorbar(app.UIAxes)
                        xlim(app.UIAxes, [min(app.xCoordCts), max(app.xCoordCts)]);
                        ylim(app.UIAxes, [min(app.yCoordCts), max(app.yCoordCts)]);
                        
                        actualizarBarraColor(app, 'scan')
                        
                        
                    case 'zoom'
                        
                        app.matrixPlot = imagesc(app.UIAxes,app.xCoordsZoom, app.yCoordsZoom, app.countsZoomAPD2)';
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
                
                iniciarSesionTraza(app)
                
            else
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
                app.DAQSession = s_in;
                
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
                app.DAQSession2 = s_in2;
                
                % Inicializar listener como arreglo vacío.
                app.TraceAvailableListener2 = [];
            end
            
        end
        
        
        
        function iniciarSesionScan(app)
            
            if ~(isempty(app.DAQSession))
                % Detener sesion de traza para usar sus canales
                stop(app.DAQSession)
                release(app.DAQSession)
                delete(app.DAQSession)
                
                app.DAQSession = [];
                
                %=========================
                % detener y eliminar apd2
                stop(app.DAQSession2)
                release(app.DAQSession2)
                delete(app.DAQSession2)
                
                app.DAQSession2 = [];
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
                
                % Agregar un canal de entrada para contador
                addCounterInputChannel(s_scan, 'Dev1', 'ctr0', 'EdgeCount');
                
                
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
                % Agregar sesion para contador de APD2
                
                %Crear sesion principal para el scan
                s_scanCtr = daq.createSession('ni');
                
                % Detector infrarojo
                addCounterInputChannel(s_scanCtr, 'Dev1', 'ctr3', 'EdgeCount');
                
                % Configurar reloj
                s_scanCtr.addClockConnection('External', 'Dev1/PFI13', 'ScanClock');
                
                % Configurar la tasa de muestreo igual a frec. del reloj
                s_scanCtr.Rate = app.ScanFreqEditField.Value;
                
                % Recibir datos de manera continua
                s_scanCtr.IsContinuous = true;
                
                % Guardar sesion como variable de la clase
                app.DAQScanCtr2 = s_scanCtr;
                
            end
            
            
        end
        
        function iniciarTrazaScan(app)
            if ~(isempty(app.DAQTrazaScan))
                
                % Si hay una sesion asociada al scan estará usando los
                % canales de la traza. 
                
                stop(app.DAQTrazaScan)
                release(app.DAQTrazaScan)
                delete(app.DAQTrazaScan)
                
                % Eliminar listener
                delete(app.trazaScanListener);
                app.trazaScanListener = [];
                
                app.DAQTrazaScan = [];
                
                iniciarTrazaScan(app)
                
            else
                %Crear sesion principal para adquisición de cuentas
                s_in = daq.createSession('ni');
                
                % Agregar un canal de entrada para contador
                addCounterInputChannel(s_in, 'Dev1', 'ctr2', 'EdgeCount');
                
                % Configurar reloj para medir traza
                iniciarSesionReloj(app, 'traza')
                
                % Agregar reloj a sesion de traza
                s_in.addClockConnection('External', 'Dev1/PFI7', 'ScanClock');
                
                % Configurar la tasa de muestreo igual a frec. del reloj
                frecGenerador = 5E2;
                s_in.Rate = frecGenerador;
                
                % Recibir datos de manera continua
                s_in.IsContinuous = true;
                
                % Configurar cantidad de datos para llamar al listener
                s_in.NotifyWhenDataAvailableExceeds = app.NotifyScansSpinner.Value;
                
                % Guardar sesion como variable de la clase
                app.DAQTrazaScan = s_in;
                
                
                % Inicializar listener como arreglo vacío.
                app.trazaScanListener = [];
            end
        end
        
        
        function actualizarCountdown(app)
            
            % diminuir el valor en 1
            currentTime = app.RemainingTimeScansEditField.Value - 1;
            
            % Actualizar el valor en GUI
            app.RemainingTimeScansEditField.Value = currentTime;
            
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
            app.XcoordEditField.Value = app.currentVoltX * 8;
            app.YcoordEditField.Value = app.currentVoltY * 8;
            app.ZcoordEditField.Value = app.currentVoltZ * 8;
            
            actualizarSliderZ(app, app.ZcoordEditField.Value)
        end
        
        
        % Actualizar voltajes desde sesion de Scan
        function actualizarVoltajeScan(app)
            
            % Vector asociado con voltajes de cada entrada
            voltajes = inputSingleScan(app.DAQScanSession);
            
            % Guardar voltajes en variables de app
            app.currentVoltX = recortarVoltaje(app, voltajes(1), 0.0, 10.0);
            app.currentVoltY = recortarVoltaje(app, voltajes(2), 0.0, 10.0);
            
            % Actualizar valores actuales de voltaje y posicion en UI
            app.XcoordEditField.Value = app.currentVoltX * 8;
            app.YcoordEditField.Value = app.currentVoltY * 8;
            
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
                    voltPtoFinal = app.voltX;
                    app.currentVoltX = app.voltX;
                case 'y'
                    outChannel = app.DAQSesionCoordY;
                    voltPtoInicial = app.currentVoltY;
                    voltPtoFinal = app.voltY;
                    app.currentVoltY = app.voltY;
                case 'z'
                    outChannel = app.DAQSesionCoordZ;
                    voltPtoInicial = app.currentVoltZ;
                    voltPtoFinal = app.voltZ;
                    app.currentVoltZ = app.voltZ;
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
            app.RemainingTimeScansEditField.Value = initialTime;
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
                    matrizCuentas = app.countsMatrix;
                case 'zoom'
                    matrizCuentas = app.countsZoom;
            end
            
            app.minColorbar = min(matrizCuentas,[],"all");
            app.maxColorbar = max(matrizCuentas,[],"all");
            
            if app.minColorbar == 0 && app.maxColorbar == 0
                % Establecer límites por defecto
                caxis(app.UIAxes, [-1, 1]);
                
                app.MinColorbarEditField.Value = -1;
                app.MaxColorbarEditField.Value = 1;
            elseif app.maxColorbar == app.maxColorbar
                caxis(app.UIAxes, [0, app.maxColorbar]);
                
                app.MinColorbarEditField.Value = 0;
                app.MaxColorbarEditField.Value = app.maxColorbar;
            else
                % Establecer límites por defecto
                caxis(app.UIAxes, [app.maxColorbar, app.maxColorbar]);
                
                app.MinColorbarEditField.Value = app.minColorbar;
                app.MaxColorbarEditField.Value = app.maxColorbar;
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
            
            app.countsMatrix = zeros(80,80);
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
            
            if ~(isempty(app.DAQSession))
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
                app.DataFIFOBuffer = [];
                app.TimestampsFIFOBuffer = [];
                
                app.DataFIFOBufferInfrarrojo = [];
                
                % Crear figura externa a la app para mostrar traza
                
                app.traceFigure = figure('Name','Traza', 'Position', [910, 50, 1000, 800], ...
                    'CloseRequestFcn', @(src, event) closeTrazaCallback(app, src, event));
                
                % Crear el primer subplot para el gráfico principal
                app.axesTraceLeft = subplot(2, 1, 1, 'Parent', app.traceFigure);
                app.lineTrace = plot(app.axesTraceLeft, NaN, 'LineWidth', 3, "Color", 'k');
                ylabel(app.axesTraceLeft, 'Cts/s', 'Color', 'k');
                title(app.axesTraceLeft, 'Traza');
                xlim(app.axesTraceLeft, [0, app.NBufferEditField.Value]);
                %app.axesTraceLeft.YColor = 'k';
                set(app.axesTraceLeft, 'FontSize', 32);
                
                % Crear el segundo subplot para el gráfico infrarrojo
                app.axesTraceRight = subplot(2, 1, 2, 'Parent', app.traceFigure);
                app.lineTraceInfrarrojo = plot(app.axesTraceRight, NaN, 'LineWidth', 3, "Color", 'b');
                ylabel(app.axesTraceRight, 'Cts/s', 'Color', 'k');
                xlabel(app.axesTraceRight, 'u.a');
                xlim(app.axesTraceRight, [0, app.NBufferEditField.Value]);
                %app.axesTraceRight.YColor = 'b';
                set(app.axesTraceRight, 'FontSize', 32);

                
%                 app.traceFigure = figure('Name','Traza', 'Position', [100, 100, 800, 600], ...
%                          'CloseRequestFcn', @(src, event) closeTrazaCallback(app, src, event));
%                 
%                 % Obtener el handle a los ejes de la figura
%                 app.axesTrace = axes(app.traceFigure);
%                 %Hacer plot sin datos
%                 yyaxis(app.axesTrace, 'left')
%                 app.lineTrace = plot(app.axesTrace, NaN, 'LineWidth',3,"Color",'k');
%                 ylabel(app.axesTrace, 'Cuentas/s', 'Color', 'k');
%                 app.axesTrace.YColor = 'k';
%                 % Plot infrarrojo
%                 yyaxis(app.axesTrace, 'right')
%                 app.lineTraceInfrarrojo = plot(app.axesTrace, NaN, 'LineWidth',3,"Color",'b');
%                 %ylabel(app.axesTrace, 'Color', 'b');
%                 app.axesTrace.YColor = 'b';
%                 
%                 
%                 % Conf. título y etiquetas
%                 title(app.axesTrace, 'Traza');
%                 xlabel(app.axesTrace, 'u.a');
%                 %ylabel(app.axesTrace, 'cuentas/s');
%                 
%                 xlim(app.axesTrace,[0, app.NBufferEditField.Value]);
%                 set(app.axesTrace, 'FontSize', 32);
                
                %======================================================================
                %======================================================================
                
                %iniciarSesionReloj(app,'traza')
                
                % Crear listener e iniciar en 2do plano sesion de adquisición
                app.TraceAvailableListener = addlistener(app.DAQSession, 'DataAvailable', ...
                    @(src,event) dataAvailable_Callback(app, src, event));
                
                startBackground(app.DAQSession);
                
                % Listener 2da sesion traza
                app.TraceAvailableListener2 = addlistener(app.DAQSession2, 'DataAvailable', ...
                    @(src,event) procesarTraza2(app, src, event));
                
                startBackground(app.DAQSession2);
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
            app.lineTraceInfrarrojo = [];
            
            app.lineTrace = [];
            
            % Setear handles de gráfico de traza a array vacios
            delete(app.traceFigure)
            app.traceFigure = [];
            app.axesTrace = [];
            
            % Detener adquisición de datos
            stop(app.DAQSession)
            
            
            
            %==================================
            % Eliminar sesion de traza 2
            % Detener adquisición de datos
            stop(app.DAQSession2)
            
            
            
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
            
            %Interacción para cerrar aplicación y usar callback para cerrar
            
            isAcquiring = ~isempty(app.DAQSession) && app.DAQSession.IsRunning;
            if isAcquiring
                question = 'Abort acquisition and close app?';
                
            else
                % Acquisition is stopped
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
                    app.countsMatrix = dataStruct.data.excelitas;
                    app.countsMatrixAPD2 = dataStruct.data.laserComp;
                    
                    % Leer voltajes actuales en piezo para cada coordenada
                    actualizarVoltajes(app)
                    
                    % Moverse a puntos donde se fijó offset para scan/zoom
                    app.voltX = dataStruct.metadataScan.posX * 0.125;
                    app.voltY = dataStruct.metadataScan.posY * 0.125;
                    app.voltZ = dataStruct.metadataScan.posZ * 0.125;
                    
                    desplazarCoordenada(app,'x')
                    desplazarCoordenada(app,'y')
                    desplazarCoordenada(app,'z')
                    
                    % Actualizar voltajes actuales
                    actualizarVoltajes(app)
                    
                    % Hacer reset a colorbar
                    maxActual = max(app.countsMatrix,[],'all');
                    minActual = min(app.countsMatrix,[],'all');
                    
                    if maxActual == minActual
                        % Establecer límites por defecto
                        caxis(app.UIAxes, [0, 1000]);
                    else
                        % Establecer límites por defecto
                        caxis(app.UIAxes, [minActual, maxActual]);
                    end
                    
                    % Setear pestañas de colorbar a 0
                    app.MinColorbarEditField.Value = 0;
                    app.MaxColorbarEditField.Value = 0;
                    
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
                    app.DetectorEditField.Value = dataStruct.metadataMuestra.detector;
                    app.PoweruWEditField.Value = dataStruct.metadataMuestra.potencia;
                    app.WavelengthnmEditField.Value = dataStruct.metadataMuestra.longOnda;
                    
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
                rightX = x + app.MovenmEditField.Value/1000;
                
                % Verificar que desplazamiento está dentro de los margenes
                
                if rightX >= min(app.xCoordCts) && rightX <= max(app.xCoordCts)
                    
                    % Obtener voltaje asociado a dezplazamiento
                    app.voltX = rightX * 0.125;
                    
                    % Mover el piezo solo en coordenada X
                    outputSingleScan(app.DAQSesionCoordX, app.voltX);
                    
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
                LeftX = x - app.MovenmEditField.Value/1000;
                
                % Verificar que desplazamiento está dentro de los margenes
                
                if LeftX >= min(app.xCoordCts) && LeftX <= max(app.xCoordCts)
                    
                    % Obtener voltaje asociado a dezplazamiento
                    app.voltX = LeftX * 0.125;
                    
                    % Mover el piezo solo en coordenada X
                    outputSingleScan(app.DAQSesionCoordX, app.voltX);
                    
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
                
                upY = y - app.MovenmEditField.Value/1000;
                
                % Verificar que desplazamiento está dentro de los margenes
                
                if upY >= min(app.yCoordCts) && upY <= max(app.yCoordCts)
                    
                    % Obtener voltaje asociado a dezplazamiento
                    app.voltY = upY * 0.125;
                    
                    % Mover el piezo solo en coordenada Y
                    outputSingleScan(app.DAQSesionCoordY, app.voltY);
                    
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
                
                DownY = y + app.MovenmEditField.Value/1000;
                
                % Verificar que desplazamiento está dentro de los margenes
                
                if DownY >= min(app.yCoordCts) && DownY <= max(app.yCoordCts)
                    
                    % Obtener voltaje asociado a dezplazamiento
                    app.voltY = DownY/8;
                    
                    % Mover el piezo solo en coordenada Y
                    outputSingleScan(app.DAQSesionCoordY, app.voltY);
                    
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
                app.ZcoordEditField.Value = zChanging;
                
                % Set the final voltage to approach it
                app.voltZ = zChanging * 0.125;
                
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
                
                incZ = z + app.MovenmEditField.Value/1000;
                
                % Verificar que desplazamiento está dentro de los margenes
                
                if incZ >= 0 && incZ <= 80
                    
                    % Obtener voltaje asociado a dezplazamiento
                    app.voltZ = incZ * 0.125;
                    
                    % Mover el piezo solo en coordenada Z
                    outputSingleScan(app.DAQSesionCoordZ, app.voltZ);
                    
                    % Actualizar voltaje en UI
                    actualizarVoltajes(app)
                    
                    % Actualizar valor slider
                    actualizarSliderZ(app,incZ);
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
                
                decZ = z - app.MovenmEditField.Value/1000;
                
                % Verificar que desplazamiento está dentro de los margenes
                
                if decZ >= 0 && decZ <= 80
                    
                    % Obtener voltaje asociado a dezplazamiento
                    app.voltZ = decZ * 0.125 ;
                    
                    % Mover el piezo solo en coordenada Z
                    outputSingleScan(app.DAQSesionCoordZ, app.voltZ);
                    
                    % Actualizar voltaje en UI
                    actualizarVoltajes(app)
                    
                    % Actualizar valor slider
                    actualizarSliderZ(app,decZ);
                    
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
                
                app.voltX = 0;
                app.voltY = 0;
                app.voltZ = 0;
                
                app.ZSlider.Limits = [0 80];
                app.ZSlider.Value = 0;
                
                % Desplazar cada coordenada al 0,0,0
                
                desplazarCoordenada(app,'x')
                desplazarCoordenada(app,'y')
                desplazarCoordenada(app,'z')
                
                % Actualizar valores en UI
                
                actualizarVoltajes(app)
                
                
                set(app.hXLine, 'Value', 0);
                set(app.hYLine, 'Value', 0);
            else
                iniciarSesionCoordenada(app,'x')
                iniciarSesionCoordenada(app,'y')
                iniciarSesionCoordenada(app,'z')
                
                Goto000ButtonValueChanged(app, event)
            end
                
        end

        % Button pushed function: ScanButton
        function ScanButtonPushed(app, event)
            %============================================================================
            %============ E L I M I N A R  T R A Z A  P R I N C I P A L =================
            % Eliminar gráfico de traza en caso de que esté abierto
            if ~(isempty(app.DAQSession))
                stop(app.DAQSession)
                release(app.DAQSession)
                delete(app.DAQSession)
                
                app.DAQSession = [];
                
                %=========================
                % detener y eliminar apd2
                stop(app.DAQSession2)
                release(app.DAQSession2)
                delete(app.DAQSession2)
                
                app.DAQSession2 = [];
                
                % Setear handles de gráfico de traza a array vacios
                delete(app.traceFigure)
                app.traceFigure = [];
                app.axesTrace = [];
                app.lineTrace = [];
            end
            
            %======================================================================
            %================= C R E A R  T R A Z A  S C A N ======================
            
            % Setear buffers como arreglos vacíos previo a usarlos
            app.DataFIFOBufferTrazaScan = [];
            app.TimestampsFIFOBufferTrazaScan = [];
            
            
            % Crear figura externa a la app para mostrar traza
            app.traceScanFigure = figure('Name','Traza Scan', 'Position', [100, 100, 800, 600], ...
                'CloseRequestFcn', @(src, event) closeScanTrazaCallback(app, src, event));
            
            
            % Obtener el handle a los ejes de la figura
            app.axesScanTrace = axes(app.traceScanFigure);
            %Hacer plot sin datos
            app.lineScanTrace = plot(app.axesScanTrace, NaN, 'LineWidth',3,"Color",'k');
            
            % Conf. título y etiquetas
            title(app.axesScanTrace, 'Traza Scan');
            xlabel(app.axesScanTrace, 'u.a');
            ylabel(app.axesScanTrace, 'cuentas/s');
            
            xlim(app.axesScanTrace,[0, app.NBufferEditField.Value]);
            set(app.axesScanTrace, 'FontSize', 32);
            
            % Iniciar sesion de traza scan
            iniciarTrazaScan(app)
            
            % Crear listener e iniciar en 2do plano sesion de adquisición
            app.trazaScanListener = addlistener(app.DAQTrazaScan, 'DataAvailable', ...
                @(src,event) trazaScanCallback(app, src, event));
            
            startBackground(app.DAQTrazaScan);
            
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
            app.voltZ = app.ZoffsetEditField.Value * 0.125;
            desplazarCoordenada(app,'z')
            
            
            % Configurar tiempo inicial
            initialTime = double( ((settlingTime + integrationTime)*totalElementosOutput)/constVoltIntervalo )  + 8;
            app.RemainingTimeScansEditField.Value = initialTime;
            
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
            setAppViewState(app, 'scanning')
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
            
            % Obtener puntos iniciales del scan
            coordInicialX = centroScanX - scanOffset;
            coordInicialY = centroScanY - scanOffset;
            
            % Obtener puntos en los cuales debería terminar el scan
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
                app.voltX = voltInicialX;
                app.voltY = voltInicialY;
                
                disp(4)
                disp(class(app.DAQScanSession))
                % Desplazarse a las coordenadas iniciales ingresadas
                desplazarScan(app)
                disp(5)
                disp(class(app.DAQScanSession))
                
                
                disp(6)
                % Una vez adquiridos datos totales se activará listener
                app.DAQScanSession.NotifyWhenDataAvailableExceeds = totalElementosOutput;
                
                app.DAQScanCtr2.NotifyWhenDataAvailableExceeds = totalElementosOutput;
                
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
                initNoCtsIdx = [periodoIntervalo + 1:periodoVoltX:totalElementosOutput]';
                
                % Indice donde X termina de volver al 0
                finNoCtsIdx = [periodoVoltX:periodoVoltX:totalElementosOutput]';
                
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
                    @(src, event) scanProcessData(app, event, idxNoCts, idxCts, 'scan'));
                
                queueOutputData(app.DAQScanSession,[outVoltajeX, outVoltajeY]);
                pause(1)
                startBackground(app.DAQScanSession);
                
                % ==============================================
                % Agregar listener par contador APD2
                app.scanCtr2Listener = addlistener(app.DAQScanCtr2, 'DataAvailable', ...
                    @(src, event) datosScanAPD2(app, event, idxNoCts, idxCts, 'scan'));
                
                startBackground(app.DAQScanCtr2);
                
                
                
            else
                beep
                errordlg('Scan out of range! Please adjust the coordinate values.', 'Error');
            end
            
  
            
        end

        % Value changed function: SetoffsetButton
        function SetoffsetButtonValueChanged(app, event)
            
            % Marcar bandera de offset presionado
            app.transCoords = true;
            
            % Setear la posición actual para hacer un scan a su alrededor
            app.XoffsetEditField.Value = app.XcoordEditField.Value;
            app.YoffsetEditField.Value = app.YcoordEditField.Value;
            app.ZoffsetEditField.Value = app.ZcoordEditField.Value;
        end

        % Button pushed function: StopscanButton
        function StopscanButtonPushed(app, event)
            if ~(isempty(app.DAQScanSession))
                % Detener la adquisición de datos
                stop(app.DAQScanSession)
                
                % Eliminar listener
                delete(app.scanListener);
                app.scanListener = [];
                
                % detener timer
                if ~(isempty(app.CountdownTimer))
                    stop(app.CountdownTimer); 
                    delete(app.CountdownTimer);
                end
                
                
                % Setear contador a cero
                app.RemainingTimeScansEditField.Value = 0;
                
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
                if ~(isempty(app.DAQTrazaScan))
                    stop(app.DAQTrazaScan)
                    
                    % Eliminar e inicializar listener a array vacío
                    delete(app.trazaScanListener);
                    app.trazaScanListener = [];
                    
                    % Setear handles de gráfico de traza a array vacios
                    delete(app.traceScanFigure)
                    app.traceScanFigure = [];
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
                    
                    graficosGUIScan(app, event, 'zoom')
                else
                    graficosGUIScan(app, event, 'scan')
                end
                
                guardarRespaldoScan(app);
                
                
                % Inicializar líneas de coordenadas
                hold(app.UIAxes, 'on');
                app.hXLine = xline(app.UIAxes, app.XcoordEditField.Value, 'k');
                app.hYLine = yline(app.UIAxes, app.YcoordEditField.Value, 'k');
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
            
            guardarDatosScan(app,'scan')                    
           
        end

        % Value changed function: MinColorbarEditField
        function MinColorbarEditFieldValueChanged(app, event)
            
            
            minUsuario = app.MinColorbarEditField.Value;
            
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

        % Value changed function: MaxColorbarEditField
        function MaxColorbarEditFieldValueChanged(app, event)
            maxUsuario = app.MaxColorbarEditField.Value;
            
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
            
            % Eliminar gráficos y traza si esta corriendo
            
            if ~(isempty(app.DAQSession))
                stop(app.DAQSession)
                release(app.DAQSession)
                delete(app.DAQSession)
                
                app.DAQSession = [];
                
                %=========================
                % detener y eliminar apd2
                stop(app.DAQSession2)
                release(app.DAQSession2)
                delete(app.DAQSession2)
                
                app.DAQSession2 = [];
                
                % Setear handles de gráfico de traza a array vacios
                delete(app.traceFigure)
                app.traceFigure = [];
                app.axesTrace = [];
                app.lineTrace = [];
            end
            
            % Variable para determianr si al activar panel muestra zoom o
            % scan completo
            app.ZoomSwitch.Value = 'On';
            ZoomSwitchValueChanged(app, event)
            % Eliminar gráfico de traza en caso de que esté abierto
            
            
            
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
                totalElementosOutput = (constVoltIntervalo + 1) * nPuntos * nPuntos;
                
                app.ScanNpixelsEditField.Value = nPuntos;
            end
            
            %============================================================================
            %============================== T I M E R ===================================
            
            % Configurar tiempo inicial
            initialTime = double( ((settlingTime + integrationTime)*totalElementosOutput)/constVoltIntervalo )  + 8;
            app.RemainingTimeScansEditField.Value = initialTime;
            
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
            setAppViewState(app, 'scanning')
            disp(2)
            disp(class(app.DAQScanSession))
            
            % Limpiar listener del scan
            delete(app.scanListener);
            app.scanListener = [];
            
            %============================================================================
            %======================== C O O R D S.  S C A N =============================
            
            % Obtener puntos en los cuales se centra el scan
            centroScanX = app.XcoordEditField.Value;
            centroScanY = app.YcoordEditField.Value;
            
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
            app.zOffSetZoom = app.ZcoordEditField.Value;
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
                app.voltX = voltInicialX;
                app.voltY = voltInicialY;
                
                disp(4)
                disp(class(app.DAQScanSession))
                % Desplazarse a las coordenadas iniciales ingresadas
                desplazarScan(app)
                disp(5)
                disp(class(app.DAQScanSession))
                
                
                disp(6)
                % Una vez adquiridos datos totales se activará listener
                app.DAQScanSession.NotifyWhenDataAvailableExceeds = totalElementosOutput;
                app.DAQScanCtr2.NotifyWhenDataAvailableExceeds = totalElementosOutput;
                
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
                initNoCtsIdx = [periodoIntervalo + 1:periodoVoltX:totalElementosOutput]';
                
                % Indice donde X termina de volver al 0
                finNoCtsIdx = [periodoVoltX:periodoVoltX:totalElementosOutput]';
                
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
                
                queueOutputData(app.DAQScanSession,[outVoltajeX, outVoltajeY]);
                pause(1)
                startBackground(app.DAQScanSession);
                
                % ==============================================
                
                % Agregar listener par contador APD2
                app.scanCtr2Listener = addlistener(app.DAQScanCtr2, 'DataAvailable', ...
                    @(src, event) datosScanAPD2(app, event, idxNoCts, idxCts, 'zoom'));
                
                startBackground(app.DAQScanCtr2);
                
                
                
            else
                beep
                errordlg('Scan out of range! Please adjust the coordinate values.', 'Error');
            end
            
        end

        % Value changed function: SetFigButton
        function SetFigButtonValueChanged(app, event)
            app.countsMatrix = app.countsZoom;
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
            guardarDatosScan(app,'zoom')
            
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
                    app.Switch_2.Enable = 'off';
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
                assignin('base',"outVoltX",outVoltX)
                
                
                % Mover el piezo en la coordenada X al punto de partida
                app.voltX = outVoltX(1);
                desplazarCoordenada(app,'x')
                
                % Configurar rate
                rateTrazaEff = app.IntTimemsEditField.Value/1000 * app.NotifyScansSpinner.Value;
                stop(app.DAQSesionCoordX)
                app.DAQSesionCoordX.Rate = ceil(1/rateTrazaEff);
                disp(app.DAQSesionCoordX.Rate)
                
                % Configurar acumulacion de cuentas
                app.acumularCtas = true;
                
                
                % Mover piezo y recibir cuentas
                queueOutputData(app.DAQSesionCoordX,outVoltX)
                app.DAQSesionCoordX.startForeground();
                app.acumularCtas = false;
                
                % Guardar cuentas en workspace
                assignin('base','ctasAcumuladasX',app.ctasAcumuladasOpt);
                
                
                % Obtener posición y anchura ajustadas
                disp(length(app.ctasAcumuladasOpt)-length(posicionesX)+1)
                
                cuentasX = app.ctasAcumuladasOpt(length(app.ctasAcumuladasOpt)-length(posicionesX)+1:end);
                
                assignin('base','ctasX',cuentasX)
                
                [posAjustadaX, anchuraAjustadaX] = optimizarPos(app,posicionesX,cuentasX, 0.45, 'x')
                
                stop(app.DAQSesionCoordX)
                app.DAQSesionCoordX.Rate = 1000;
                disp(app.DAQSesionCoordX.Rate)
                
                 % Moverse desde pos. actual a pos optima X
                app.voltX = posAjustadaX * 0.125;
                desplazarCoordenada(app, 'x')
                
                % Actualizar GUI
                hold(app.UIAxes, 'on');
                app.hXLine = xline(app.UIAxes, posAjustadaX, 'k');
                hold(app.UIAxes, 'off');
                
                app.XcoordEditField.Value = posAjustadaX;
                
                % Eliminar cuentas acumuladas de la app
                app.ctasAcumuladasOpt = [];
                
                %=========================================================================
                %============================= O P T .  Y ================================
                
                % Voltajes de salida
                %outVoltX = repelem(posicionesX*0.125, constVoltIntervalo);
                outVoltY = posicionesY*0.125;
                
                assignin('base',"outVoltY",outVoltY)
                
                % Mover el piezo en la coordenada X al punto de partida
                app.voltY = outVoltY(1);
                desplazarCoordenada(app,'y')
                
                % Configurar rate
                
                stop(app.DAQSesionCoordY)
                app.DAQSesionCoordY.Rate = ceil(1/rateTrazaEff);
                disp(app.DAQSesionCoordY.Rate)
                % Configurar acumulacion de cuentas
                app.acumularCtas = true;
                
                
                % Mover piezo y recibir cuentas
                queueOutputData(app.DAQSesionCoordY,outVoltY)
                app.DAQSesionCoordY.startForeground();
                app.acumularCtas = false;
                
                % Guardar cuentas en workspace
                assignin('base','ctasAcumuladasY',app.ctasAcumuladasOpt);
                
                % Obtener posición y anchura ajustadas
                disp(length(app.ctasAcumuladasOpt)-length(posicionesY)+1)
                cuentasY = app.ctasAcumuladasOpt(length(app.ctasAcumuladasOpt)-length(posicionesY)+1:end);
                assignin('base','ctasY',cuentasY)
                
                [posAjustadaY, anchuraAjustadaY] = optimizarPos(app,posicionesY,cuentasY, 0.45, 'y')
                
                 % Moverse desde pos. actual a pos optima X
                app.voltY = posAjustadaY * 0.125;
                desplazarCoordenada(app, 'y')
                
                % Actualizar GUI
                hold(app.UIAxes, 'on');
                app.hYLine = yline(app.UIAxes, posAjustadaY, 'k');
                hold(app.UIAxes, 'off');
                
                app.YcoordEditField.Value = posAjustadaY;
                
                % Eliminar cuentas acumuladas de la app
                app.ctasAcumuladasOpt = [];
                
                stop(app.DAQSesionCoordY)
                app.DAQSesionCoordY.Rate = 1000;
                disp(app.DAQSesionCoordY.Rate)
                
                %=========================================================================
                %============================= O P T .  Z ================================
                
                % Voltajes de salida
                outVoltZ = posicionesZ*0.125;
                
                assignin('base',"outVoltZ",outVoltZ)
                
                % Mover el piezo en la coordenada X al punto de partida
                app.voltZ = outVoltZ(1);
                desplazarCoordenada(app,'z')
                
                % Configurar rate
                
                stop(app.DAQSesionCoordZ)
                app.DAQSesionCoordZ.Rate = ceil(1/rateTrazaEff);
                disp(app.DAQSesionCoordZ.Rate)
                % Configurar acumulacion de cuentas
                app.acumularCtas = true;
                
                
                % Mover piezo y recibir cuentas
                queueOutputData(app.DAQSesionCoordZ,outVoltZ)
                app.DAQSesionCoordZ.startForeground();
                app.acumularCtas = false;
                
                % Guardar cuentas en workspace
                assignin('base','ctasAcumuladasZ',app.ctasAcumuladasOpt);
                
                % Obtener posición y anchura ajustadas
                disp(length(app.ctasAcumuladasOpt)-length(posicionesZ)+1)
                cuentasZ = app.ctasAcumuladasOpt(length(app.ctasAcumuladasOpt)-length(posicionesZ)+1:end);
                assignin('base','ctasZ',cuentasZ)
                
                app.ctaMaxZ = max(cuentasZ);
                
                [posAjustadaZ, anchuraAjustadaZ] = optimizarPos(app,posicionesZ,cuentasZ, 0.45, 'z')
                
                 % Moverse desde pos. actual a pos optima X
                app.voltZ = posAjustadaZ * 0.125;
                desplazarCoordenada(app, 'z')
                
                
                app.ZcoordEditField.Value = posAjustadaZ;
                
                % Eliminar cuentas acumuladas de la app
                app.ctasAcumuladasOpt = [];
                
                stop(app.DAQSesionCoordZ)
                app.DAQSesionCoordZ.Rate = 1000;
                disp(app.DAQSesionCoordZ.Rate)
                
                % Si el tracking no estaba activado permitir cambio de detector
                % al terminar optimizacion
                switch app.TrackerSwitch.Value
                case 'Off'
                    app.StartOptButton.Enable = 'on';
                    app.Switch_2.Enable = 'on';
                    app.TrackerSwitch.Enable = 'on';
                    app.StopTraceButton.Enable = 'on';
                    app.NBufferOptEditField.Enable = 'on';
                    app.UpToleranceEditField.Enable = 'on';
                    app.DownToleranceEditField.Enable = 'on';
                    app.XYRangeEditField.Enable = 'on';
                    app.ZRangeEditField.Enable = 'on';
                end

                
            else
                iniciarSesionCoordenada(app,'x')
                iniciarSesionCoordenada(app,'y')
                iniciarSesionCoordenada(app,'z')
            end
            
           
            
            
            
        end

        % Value changed function: CleanFigButton
        function CleanFigButtonValueChanged(app, event)
            app.countsMatrix = zeros(80,80);
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
                    stop(app.CheckConditionsOpt);
                    
                    % Activar cambio de detector
                    app.Switch_2.Enable = 'on';
                    app.StartOptButton.Enable = 'on';
                    
                    guardarRespaldoTracking(app)
                    
                    
                case 'On'
                    % Bloquear cambio de detector
                    app.Switch_2.Enable = 'off';
                    app.StartOptButton.Enable = 'off';
                    
                    % Activar botón de guardar coordenadas
                    app.SaveCoordsButton.Enable = 'on';
                    
                    % Actualizar valores buffer y umbrales de tolerancia
                    NBufferEditFieldValueChanged(app)
                    UpToleranceEditFieldValueChanged(app)
                    DownToleranceEditFieldValueChanged(app)
                    
                    % Limpiar coordenadas trackeadas
                    app.trackingCoordX = [];
                    app.trackingCoordY = [];
                    app.trackingCoordZ = [];
                    
                    app.figCoordTracking = figure("Name", 'Coordenadas Optimizadas');
                    
                    app.axesTrackingX = subplot(2, 2, 1, 'Parent', app.figCoordTracking);
                    app.lineTrackingX = plot(app.axesTrackingX, NaN, 'Marker', '*');
                    title('X')
                    
                    app.axesTrackingY = subplot(2, 2, 2, 'Parent', app.figCoordTracking);
                    app.lineTrackingY = plot(app.axesTrackingY, NaN, 'Marker', '*');
                    title('Y')
                    
                    app.axesTrackingZ = subplot(2, 2, 3, 'Parent', app.figCoordTracking);
                    app.lineTrackingZ = plot(app.axesTrackingZ, NaN, 'Marker', '*');
                    title('Z')
                    
                    app.axesTrackingXY = subplot(2, 2, 4, 'Parent', app.figCoordTracking);
                    app.lineTrackingXY = plot(app.axesTrackingXY, NaN, 'Marker', '*');
                    title('X-Y')
                
                
                    
                    % Verificar si esta trackeando excelitas o lasercomp
                    switch app.Switch_2.Value
                        case 'Excelitas'
                            % En excelitas consideramos valor medio MEAN
                            app.mediaTracking = app.MeanEditField.Value;
                            
                            disp("Referencia Opt. " + app.mediaTracking)
                            disp("Valor tolerancia bajada " + app.mediaTracking * app.umbralDownTracker)
                            disp("Valor tolerancia subida " + app.mediaTracking * app.umbralUpTracker)
                            
                            % Configurar el temporizador en la inicialización de la app
                            app.CheckConditionsOpt = timer('ExecutionMode', 'fixedRate', ...
                                'Period', 0.1, ... % Ejecuta cada 100 ms
                                'TimerFcn', @(~,~) conditionsOptExcelitas(app));
                            
                            % Inicia el temporizador cuando sea necesario
                            start(app.CheckConditionsOpt);
                        case 'Lasercomp'
                            % En excelitas consideramos valor medio MEAN 2
                            app.mediaTracking = app.Mean2EditField.Value;
                            
                            disp("Referencia Opt. " + app.mediaTracking)
                            disp("Valor tolerancia bajada " + app.mediaTracking * app.umbralDownTracker)
                            disp("Valor tolerancia subida " + app.mediaTracking * app.umbralUpTracker)
                            
                            % Configurar el temporizador en la inicialización de la app
                            app.CheckConditionsOpt = timer('ExecutionMode', 'fixedRate', ...
                                'Period', 0.1, ... % Ejecuta cada 100 ms
                                'TimerFcn', @(~,~) conditionsOptLasercomp(app));
                    end
                    
                    
            end
            
            

        end

        % Callback function
        function Traza2TestButtonPushed(app, event)
            
            %======================================================================
            %===================== CONF. GRÁFICO TRAZA ======================
            
            % Setear buffers como arreglos vacíos previo a usarlos
            app.DataFIFOBufferTrazaScan = [];
            app.TimestampsFIFOBufferTrazaScan = [];
            
            
            % Crear figura externa a la app para mostrar traza
            app.traceScanFigure = figure('Name','Traza Scan', 'Position', [100, 100, 800, 600]);
            
            % Obtener el handle a los ejes de la figura
            app.axesScanTrace = axes(app.traceScanFigure);
            %Hacer plot sin datos
            app.lineScanTrace = plot(app.axesScanTrace, NaN, 'LineWidth',3,"Color",'k');
            
            % Conf. título y etiquetas
            title(app.axesScanTrace, 'Traza Scan');
            xlabel(app.axesScanTrace, 'u.a');
            ylabel(app.axesScanTrace, 'cuentas/s');
            
            xlim(app.axesScanTrace,[0, app.NBufferEditField.Value]);
            set(app.axesScanTrace, 'FontSize', 32);
            
            %======================================================================
            %======================================================================
            % Iniciar sesion de traza scan
            iniciarTrazaScan(app)
            
            % Crear listener e iniciar en 2do plano sesion de adquisición
            app.trazaScanListener = addlistener(app.DAQTrazaScan, 'DataAvailable', ...
                @(src,event) trazaScanCallback(app, src, event));
            
            startBackground(app.DAQTrazaScan);
            %======================================================================
            %======================================================================
            
        end

        % Callback function
        function StopTraza2ButtonValueChanged(app, event)
            % Detener adquisición de datos
            stop(app.DAQTrazaScan)
            
            % Eliminar e inicializar listener a array vacío
            delete(app.trazaScanListener);
            app.trazaScanListener = [];
            
            % Setear handles de gráfico de traza a array vacios
            delete(app.traceScanFigure)
            app.traceScanFigure = [];
            app.axesScanTrace = [];
            app.lineScanTrace = [];
        end

        % Value changed function: Switch_2
        function Switch_2ValueChanged(app, event)
            value = app.Switch_2.Value;
            switch value
                case 'Excelitas'
                    app.optimizarContador1 = true;
                case 'Lasercomp'
                    app.optimizarContador1 = false;
            end
        end

        % Value changed function: Switch
        function SwitchValueChanged(app, event)
            value = app.Switch.Value;
            app.matrixPlot = [];
            switch value
                case 'Excelitas'
                    app.mostrarScanCont1 = true;
                    if app.isZoom
                        app.matrixPlot = imagesc(app.UIAxes,app.xCoordsZoom, app.yCoordsZoom, app.countsZoom);
                        xlim(app.UIAxes, [min(app.xCoordsZoom), max(app.xCoordsZoom)]);
                        ylim(app.UIAxes, [min(app.yCoordsZoom), max(app.yCoordsZoom)]);
                        
                        colorbar(app.UIAxes)
                        
                        actualizarBarraColor(app,'zoom')
                    else
                        app.matrixPlot = imagesc(app.UIAxes,app.xCoordCts, app.yCoordCts, app.countsMatrix);
                        colorbar(app.UIAxes)
                        xlim(app.UIAxes, [min(app.xCoordCts), max(app.xCoordCts)]);
                        ylim(app.UIAxes, [min(app.yCoordCts), max(app.yCoordCts)]);
                        
                        actualizarBarraColor(app, 'scan')
                        
                    end
                case 'Lasercomp'
                    app.mostrarScanCont1 = false;
                    if app.isZoom
                        app.matrixPlot = imagesc(app.UIAxes,app.xCoordsZoom, app.yCoordsZoom, app.countsZoomAPD2);
                        xlim(app.UIAxes, [min(app.xCoordsZoom), max(app.xCoordsZoom)]);
                        ylim(app.UIAxes, [min(app.yCoordsZoom), max(app.yCoordsZoom)]);
                        
                        colorbar(app.UIAxes)
                        
                        actualizarBarraColor(app,'zoom')
                    else
                        app.matrixPlot = imagesc(app.UIAxes,app.xCoordCts, app.yCoordCts, app.countsMatrixAPD2);
                        colorbar(app.UIAxes)
                        xlim(app.UIAxes, [min(app.xCoordCts), max(app.xCoordCts)]);
                        ylim(app.UIAxes, [min(app.yCoordCts), max(app.yCoordCts)]);
                        
                        actualizarBarraColor(app, 'scan')
                        
                    end
            end
            
            hold(app.UIAxes, 'on');
            app.hXLine = xline(app.UIAxes, app.XcoordEditField.Value, 'k');
            app.hYLine = yline(app.UIAxes, app.YcoordEditField.Value, 'k');
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
                case 'Off'
                    app.isZoom = false;
                    app.Lamp.Enable = false;
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
            
            if ~(isempty(app.trackingCoordX))
                guardarTracking(app)
            else
                disp("Las coordenadas de trackeo están vacías.")
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
            app.UIFigure.Position = [100 100 1653 883];
            app.UIFigure.Name = 'UI Figure';
            app.UIFigure.Resize = 'off';
            app.UIFigure.CloseRequestFcn = createCallbackFcn(app, @UIFigureCloseRequest, true);

            % Create GridLayout
            app.GridLayout = uigridlayout(app.UIFigure);
            app.GridLayout.ColumnWidth = {'2x', '2x', '2x', '2x', '2x', '2x', '2x', '2x', '2x', '2x', '2x'};
            app.GridLayout.RowHeight = {'2x', '2x', '2x', '2x', '2x', '2x', '2x', '2x', '2x', '2x', '2x', '2x', '2x', '2x'};

            % Create LiveViewPanel
            app.LiveViewPanel = uipanel(app.GridLayout);
            app.LiveViewPanel.AutoResizeChildren = 'off';
            app.LiveViewPanel.Title = 'Panel';
            app.LiveViewPanel.Layout.Row = [1 11];
            app.LiveViewPanel.Layout.Column = [7 11];

            % Create UIAxes
            app.UIAxes = uiaxes(app.LiveViewPanel);
            title(app.UIAxes, 'PL MAP')
            xlabel(app.UIAxes, 'X')
            ylabel(app.UIAxes, 'Y')
            app.UIAxes.FontSize = 16;
            app.UIAxes.FontWeight = 'bold';
            app.UIAxes.Box = 'on';
            app.UIAxes.Position = [8 16 706 633];

            % Create PanelTraza
            app.PanelTraza = uipanel(app.GridLayout);
            app.PanelTraza.AutoResizeChildren = 'off';
            app.PanelTraza.Title = 'Panel2';
            app.PanelTraza.Layout.Row = [6 9];
            app.PanelTraza.Layout.Column = [1 3];

            % Create StartTraceButton
            app.StartTraceButton = uibutton(app.PanelTraza, 'push');
            app.StartTraceButton.ButtonPushedFcn = createCallbackFcn(app, @StartTraceButtonPushed, true);
            app.StartTraceButton.BackgroundColor = [0.5059 0.7804 0.5176];
            app.StartTraceButton.FontSize = 20;
            app.StartTraceButton.FontWeight = 'bold';
            app.StartTraceButton.FontColor = [0.1294 0.1294 0.1294];
            app.StartTraceButton.Position = [15 80 119 40];
            app.StartTraceButton.Text = 'Start Trace';

            % Create StopTraceButton
            app.StopTraceButton = uibutton(app.PanelTraza, 'state');
            app.StopTraceButton.ValueChangedFcn = createCallbackFcn(app, @StopTraceButtonValueChanged, true);
            app.StopTraceButton.Text = 'Stop Trace';
            app.StopTraceButton.BackgroundColor = [0.898 0.2235 0.2078];
            app.StopTraceButton.FontSize = 20;
            app.StopTraceButton.FontWeight = 'bold';
            app.StopTraceButton.FontColor = [0.1294 0.1294 0.1294];
            app.StopTraceButton.Position = [12 13 122 41];

            % Create IntTimemsEditFieldLabel
            app.IntTimemsEditFieldLabel = uilabel(app.PanelTraza);
            app.IntTimemsEditFieldLabel.HorizontalAlignment = 'right';
            app.IntTimemsEditFieldLabel.FontSize = 18;
            app.IntTimemsEditFieldLabel.FontWeight = 'bold';
            app.IntTimemsEditFieldLabel.Position = [178 89 122 22];
            app.IntTimemsEditFieldLabel.Text = 'Int. Time (ms)';

            % Create IntTimemsEditField
            app.IntTimemsEditField = uieditfield(app.PanelTraza, 'numeric');
            app.IntTimemsEditField.Limits = [0.0005 1000];
            app.IntTimemsEditField.ValueChangedFcn = createCallbackFcn(app, @IntTimemsEditFieldValueChanged, true);
            app.IntTimemsEditField.FontSize = 18;
            app.IntTimemsEditField.Position = [324 88 54 23];
            app.IntTimemsEditField.Value = 2;

            % Create NBufferEditFieldLabel
            app.NBufferEditFieldLabel = uilabel(app.PanelTraza);
            app.NBufferEditFieldLabel.HorizontalAlignment = 'right';
            app.NBufferEditFieldLabel.FontSize = 18;
            app.NBufferEditFieldLabel.FontWeight = 'bold';
            app.NBufferEditFieldLabel.Position = [178 23 76 22];
            app.NBufferEditFieldLabel.Text = 'N Buffer';

            % Create NBufferEditField
            app.NBufferEditField = uieditfield(app.PanelTraza, 'numeric');
            app.NBufferEditField.Limits = [25 1000];
            app.NBufferEditField.ValueDisplayFormat = '%.0f';
            app.NBufferEditField.ValueChangedFcn = createCallbackFcn(app, @NBufferEditFieldValueChanged, true);
            app.NBufferEditField.FontSize = 18;
            app.NBufferEditField.Position = [324 21 54 23];
            app.NBufferEditField.Value = 50;

            % Create NotifyScansSpinnerLabel
            app.NotifyScansSpinnerLabel = uilabel(app.PanelTraza);
            app.NotifyScansSpinnerLabel.HorizontalAlignment = 'right';
            app.NotifyScansSpinnerLabel.FontSize = 18;
            app.NotifyScansSpinnerLabel.FontWeight = 'bold';
            app.NotifyScansSpinnerLabel.Position = [178 54 115 22];
            app.NotifyScansSpinnerLabel.Text = 'Notify Scans';

            % Create NotifyScansSpinner
            app.NotifyScansSpinner = uispinner(app.PanelTraza);
            app.NotifyScansSpinner.Limits = [25 50000];
            app.NotifyScansSpinner.ValueDisplayFormat = '%g';
            app.NotifyScansSpinner.ValueChangedFcn = createCallbackFcn(app, @NotifyScansSpinnerValueChanged, true);
            app.NotifyScansSpinner.FontSize = 18;
            app.NotifyScansSpinner.Position = [324 53 58 23];
            app.NotifyScansSpinner.Value = 50;

            % Create MeanEditFieldLabel
            app.MeanEditFieldLabel = uilabel(app.PanelTraza);
            app.MeanEditFieldLabel.HorizontalAlignment = 'right';
            app.MeanEditFieldLabel.FontSize = 28;
            app.MeanEditFieldLabel.FontWeight = 'bold';
            app.MeanEditFieldLabel.Position = [149 172 77 34];
            app.MeanEditFieldLabel.Text = 'Mean';

            % Create MeanEditField
            app.MeanEditField = uieditfield(app.PanelTraza, 'numeric');
            app.MeanEditField.ValueDisplayFormat = '%.2e';
            app.MeanEditField.Editable = 'off';
            app.MeanEditField.FontSize = 28;
            app.MeanEditField.FontWeight = 'bold';
            app.MeanEditField.Position = [241 172 180 34];

            % Create STDEditFieldLabel
            app.STDEditFieldLabel = uilabel(app.PanelTraza);
            app.STDEditFieldLabel.HorizontalAlignment = 'right';
            app.STDEditFieldLabel.FontSize = 28;
            app.STDEditFieldLabel.FontWeight = 'bold';
            app.STDEditFieldLabel.Position = [149 131 61 34];
            app.STDEditFieldLabel.Text = 'STD';

            % Create STDEditField
            app.STDEditField = uieditfield(app.PanelTraza, 'numeric');
            app.STDEditField.ValueDisplayFormat = '%.2e';
            app.STDEditField.Editable = 'off';
            app.STDEditField.FontSize = 28;
            app.STDEditField.FontWeight = 'bold';
            app.STDEditField.Position = [242 131 179 34];

            % Create SavingDataSwitchLabel
            app.SavingDataSwitchLabel = uilabel(app.PanelTraza);
            app.SavingDataSwitchLabel.HorizontalAlignment = 'center';
            app.SavingDataSwitchLabel.FontSize = 18;
            app.SavingDataSwitchLabel.FontWeight = 'bold';
            app.SavingDataSwitchLabel.Position = [15 172 109 22];
            app.SavingDataSwitchLabel.Text = 'Saving Data';

            % Create SavingDataSwitch
            app.SavingDataSwitch = uiswitch(app.PanelTraza, 'slider');
            app.SavingDataSwitch.ValueChangedFcn = createCallbackFcn(app, @SavingDataSwitchValueChanged, true);
            app.SavingDataSwitch.FontSize = 18;
            app.SavingDataSwitch.Position = [44 151 51 22];

            % Create Panel4
            app.Panel4 = uipanel(app.GridLayout);
            app.Panel4.AutoResizeChildren = 'off';
            app.Panel4.Title = 'Panel4';
            app.Panel4.Layout.Row = [1 5];
            app.Panel4.Layout.Column = [1 6];

            % Create ScanButton
            app.ScanButton = uibutton(app.Panel4, 'push');
            app.ScanButton.ButtonPushedFcn = createCallbackFcn(app, @ScanButtonPushed, true);
            app.ScanButton.BackgroundColor = [0.298 0.6863 0.3137];
            app.ScanButton.FontSize = 20;
            app.ScanButton.FontWeight = 'bold';
            app.ScanButton.FontColor = [0.1294 0.1294 0.1294];
            app.ScanButton.Position = [12 219 138 45];
            app.ScanButton.Text = 'Scan';

            % Create ScanSizeumEditFieldLabel
            app.ScanSizeumEditFieldLabel = uilabel(app.Panel4);
            app.ScanSizeumEditFieldLabel.HorizontalAlignment = 'right';
            app.ScanSizeumEditFieldLabel.FontSize = 18;
            app.ScanSizeumEditFieldLabel.FontWeight = 'bold';
            app.ScanSizeumEditFieldLabel.Position = [12 125 134 22];
            app.ScanSizeumEditFieldLabel.Text = 'Scan Size (um)';

            % Create ScanSizeumEditField
            app.ScanSizeumEditField = uieditfield(app.Panel4, 'numeric');
            app.ScanSizeumEditField.Limits = [2 100];
            app.ScanSizeumEditField.FontSize = 18;
            app.ScanSizeumEditField.Position = [159 125 54 23];
            app.ScanSizeumEditField.Value = 50;

            % Create ScanFreqEditFieldLabel
            app.ScanFreqEditFieldLabel = uilabel(app.Panel4);
            app.ScanFreqEditFieldLabel.HorizontalAlignment = 'right';
            app.ScanFreqEditFieldLabel.FontSize = 18;
            app.ScanFreqEditFieldLabel.FontWeight = 'bold';
            app.ScanFreqEditFieldLabel.Position = [519 89 98 22];
            app.ScanFreqEditFieldLabel.Text = 'Scan Freq.';

            % Create ScanFreqEditField
            app.ScanFreqEditField = uieditfield(app.Panel4, 'numeric');
            app.ScanFreqEditField.Limits = [100 5000000];
            app.ScanFreqEditField.ValueDisplayFormat = '%.2e';
            app.ScanFreqEditField.ValueChangedFcn = createCallbackFcn(app, @ScanNpixelsEditFieldValueChanged, true);
            app.ScanFreqEditField.FontSize = 18;
            app.ScanFreqEditField.Position = [691 89 98 23];
            app.ScanFreqEditField.Value = 50000;

            % Create XoffsetEditFieldLabel
            app.XoffsetEditFieldLabel = uilabel(app.Panel4);
            app.XoffsetEditFieldLabel.HorizontalAlignment = 'right';
            app.XoffsetEditFieldLabel.FontSize = 20;
            app.XoffsetEditFieldLabel.FontWeight = 'bold';
            app.XoffsetEditFieldLabel.Position = [11 162 79 24];
            app.XoffsetEditFieldLabel.Text = 'X offset';

            % Create XoffsetEditField
            app.XoffsetEditField = uieditfield(app.Panel4, 'numeric');
            app.XoffsetEditField.Limits = [0 80];
            app.XoffsetEditField.ValueDisplayFormat = '%.3f';
            app.XoffsetEditField.FontSize = 20;
            app.XoffsetEditField.Position = [125 162 87 25];
            app.XoffsetEditField.Value = 40;

            % Create YoffsetEditFieldLabel
            app.YoffsetEditFieldLabel = uilabel(app.Panel4);
            app.YoffsetEditFieldLabel.HorizontalAlignment = 'right';
            app.YoffsetEditFieldLabel.FontSize = 20;
            app.YoffsetEditFieldLabel.FontWeight = 'bold';
            app.YoffsetEditFieldLabel.Position = [234 162 79 24];
            app.YoffsetEditFieldLabel.Text = 'Y offset';

            % Create YoffsetEditField
            app.YoffsetEditField = uieditfield(app.Panel4, 'numeric');
            app.YoffsetEditField.Limits = [0 80];
            app.YoffsetEditField.ValueDisplayFormat = '%.3f';
            app.YoffsetEditField.FontSize = 20;
            app.YoffsetEditField.Position = [348 162 87 25];
            app.YoffsetEditField.Value = 40;

            % Create StopscanButton
            app.StopscanButton = uibutton(app.Panel4, 'push');
            app.StopscanButton.ButtonPushedFcn = createCallbackFcn(app, @StopscanButtonPushed, true);
            app.StopscanButton.BackgroundColor = [0.8275 0.1843 0.1843];
            app.StopscanButton.FontSize = 20;
            app.StopscanButton.FontWeight = 'bold';
            app.StopscanButton.FontColor = [0.1294 0.1294 0.1294];
            app.StopscanButton.Position = [312 219 138 45];
            app.StopscanButton.Text = 'Stop scan';

            % Create ScanNpixelsEditFieldLabel
            app.ScanNpixelsEditFieldLabel = uilabel(app.Panel4);
            app.ScanNpixelsEditFieldLabel.HorizontalAlignment = 'right';
            app.ScanNpixelsEditFieldLabel.FontSize = 18;
            app.ScanNpixelsEditFieldLabel.FontWeight = 'bold';
            app.ScanNpixelsEditFieldLabel.Position = [249 125 128 22];
            app.ScanNpixelsEditFieldLabel.Text = 'Scan N. pixels';

            % Create ScanNpixelsEditField
            app.ScanNpixelsEditField = uieditfield(app.Panel4, 'numeric');
            app.ScanNpixelsEditField.Limits = [1 1000];
            app.ScanNpixelsEditField.ValueChangedFcn = createCallbackFcn(app, @ScanNpixelsEditFieldValueChanged, true);
            app.ScanNpixelsEditField.FontSize = 18;
            app.ScanNpixelsEditField.Position = [396 125 54 23];
            app.ScanNpixelsEditField.Value = 30;

            % Create CtimemsEditFieldLabel
            app.CtimemsEditFieldLabel = uilabel(app.Panel4);
            app.CtimemsEditFieldLabel.HorizontalAlignment = 'right';
            app.CtimemsEditFieldLabel.FontSize = 18;
            app.CtimemsEditFieldLabel.FontWeight = 'bold';
            app.CtimemsEditFieldLabel.Position = [249 89 109 22];
            app.CtimemsEditFieldLabel.Text = 'C. time (ms)';

            % Create CtimemsEditField
            app.CtimemsEditField = uieditfield(app.Panel4, 'numeric');
            app.CtimemsEditField.Limits = [0.0005 1000];
            app.CtimemsEditField.ValueChangedFcn = createCallbackFcn(app, @ScanNpixelsEditFieldValueChanged, true);
            app.CtimemsEditField.FontSize = 18;
            app.CtimemsEditField.Position = [396 89 54 23];
            app.CtimemsEditField.Value = 1;

            % Create StimemsEditFieldLabel
            app.StimemsEditFieldLabel = uilabel(app.Panel4);
            app.StimemsEditFieldLabel.HorizontalAlignment = 'right';
            app.StimemsEditFieldLabel.FontSize = 18;
            app.StimemsEditFieldLabel.FontWeight = 'bold';
            app.StimemsEditFieldLabel.Position = [11 89 108 22];
            app.StimemsEditFieldLabel.Text = 'S. time (ms)';

            % Create StimemsEditField
            app.StimemsEditField = uieditfield(app.Panel4, 'numeric');
            app.StimemsEditField.Limits = [0.0005 1000];
            app.StimemsEditField.ValueChangedFcn = createCallbackFcn(app, @ScanNpixelsEditFieldValueChanged, true);
            app.StimemsEditField.FontSize = 18;
            app.StimemsEditField.Position = [158 89 54 23];
            app.StimemsEditField.Value = 2;

            % Create SaveScanButton
            app.SaveScanButton = uibutton(app.Panel4, 'push');
            app.SaveScanButton.ButtonPushedFcn = createCallbackFcn(app, @SaveScanButtonPushed, true);
            app.SaveScanButton.BackgroundColor = [0.2588 0.651 0.9608];
            app.SaveScanButton.FontSize = 20;
            app.SaveScanButton.FontWeight = 'bold';
            app.SaveScanButton.FontColor = [0.1294 0.1294 0.1294];
            app.SaveScanButton.Position = [162 219 138 45];
            app.SaveScanButton.Text = 'Save Scan';

            % Create SampleNameEditFieldLabel
            app.SampleNameEditFieldLabel = uilabel(app.Panel4);
            app.SampleNameEditFieldLabel.HorizontalAlignment = 'right';
            app.SampleNameEditFieldLabel.FontSize = 18;
            app.SampleNameEditFieldLabel.FontWeight = 'bold';
            app.SampleNameEditFieldLabel.Position = [10 53 124 22];
            app.SampleNameEditFieldLabel.Text = 'Sample Name';

            % Create SampleNameEditField
            app.SampleNameEditField = uieditfield(app.Panel4, 'text');
            app.SampleNameEditField.HorizontalAlignment = 'right';
            app.SampleNameEditField.FontSize = 18;
            app.SampleNameEditField.Position = [156 51 296 26];
            app.SampleNameEditField.Value = 'sampleName';

            % Create FilterNameEditFieldLabel
            app.FilterNameEditFieldLabel = uilabel(app.Panel4);
            app.FilterNameEditFieldLabel.HorizontalAlignment = 'right';
            app.FilterNameEditFieldLabel.FontSize = 18;
            app.FilterNameEditFieldLabel.FontWeight = 'bold';
            app.FilterNameEditFieldLabel.Position = [12 11 104 22];
            app.FilterNameEditFieldLabel.Text = 'Filter Name';

            % Create FilterNameEditField
            app.FilterNameEditField = uieditfield(app.Panel4, 'text');
            app.FilterNameEditField.HorizontalAlignment = 'right';
            app.FilterNameEditField.FontSize = 18;
            app.FilterNameEditField.Position = [156 9 296 26];
            app.FilterNameEditField.Value = 'BLP01-532R';

            % Create DetectorEditFieldLabel
            app.DetectorEditFieldLabel = uilabel(app.Panel4);
            app.DetectorEditFieldLabel.HorizontalAlignment = 'right';
            app.DetectorEditFieldLabel.FontSize = 18;
            app.DetectorEditFieldLabel.FontWeight = 'bold';
            app.DetectorEditFieldLabel.Position = [519 125 79 22];
            app.DetectorEditFieldLabel.Text = 'Detector';

            % Create DetectorEditField
            app.DetectorEditField = uieditfield(app.Panel4, 'text');
            app.DetectorEditField.HorizontalAlignment = 'right';
            app.DetectorEditField.FontSize = 18;
            app.DetectorEditField.Position = [692 123 97 26];
            app.DetectorEditField.Value = 'APD';

            % Create PoweruWEditFieldLabel
            app.PoweruWEditFieldLabel = uilabel(app.Panel4);
            app.PoweruWEditFieldLabel.HorizontalAlignment = 'right';
            app.PoweruWEditFieldLabel.FontSize = 18;
            app.PoweruWEditFieldLabel.FontWeight = 'bold';
            app.PoweruWEditFieldLabel.Position = [519 53 104 22];
            app.PoweruWEditFieldLabel.Text = 'Power (uW)';

            % Create PoweruWEditField
            app.PoweruWEditField = uieditfield(app.Panel4, 'numeric');
            app.PoweruWEditField.FontSize = 18;
            app.PoweruWEditField.Position = [691 53 98 23];
            app.PoweruWEditField.Value = 2;

            % Create WavelengthnmEditFieldLabel
            app.WavelengthnmEditFieldLabel = uilabel(app.Panel4);
            app.WavelengthnmEditFieldLabel.HorizontalAlignment = 'right';
            app.WavelengthnmEditFieldLabel.FontSize = 18;
            app.WavelengthnmEditFieldLabel.FontWeight = 'bold';
            app.WavelengthnmEditFieldLabel.Position = [519 12 150 22];
            app.WavelengthnmEditFieldLabel.Text = 'Wavelength (nm)';

            % Create WavelengthnmEditField
            app.WavelengthnmEditField = uieditfield(app.Panel4, 'numeric');
            app.WavelengthnmEditField.FontSize = 18;
            app.WavelengthnmEditField.Position = [692 10 97 23];
            app.WavelengthnmEditField.Value = 532;

            % Create RemainingTimeScansEditFieldLabel
            app.RemainingTimeScansEditFieldLabel = uilabel(app.Panel4);
            app.RemainingTimeScansEditFieldLabel.HorizontalAlignment = 'center';
            app.RemainingTimeScansEditFieldLabel.FontSize = 20;
            app.RemainingTimeScansEditFieldLabel.FontWeight = 'bold';
            app.RemainingTimeScansEditFieldLabel.Position = [505 251 245 24];
            app.RemainingTimeScansEditFieldLabel.Text = 'Remaining Time Scan (s)';

            % Create RemainingTimeScansEditField
            app.RemainingTimeScansEditField = uieditfield(app.Panel4, 'numeric');
            app.RemainingTimeScansEditField.Editable = 'off';
            app.RemainingTimeScansEditField.HorizontalAlignment = 'center';
            app.RemainingTimeScansEditField.FontSize = 20;
            app.RemainingTimeScansEditField.FontWeight = 'bold';
            app.RemainingTimeScansEditField.Position = [579 208 100 25];

            % Create ZoffsetEditFieldLabel
            app.ZoffsetEditFieldLabel = uilabel(app.Panel4);
            app.ZoffsetEditFieldLabel.HorizontalAlignment = 'right';
            app.ZoffsetEditFieldLabel.FontSize = 20;
            app.ZoffsetEditFieldLabel.FontWeight = 'bold';
            app.ZoffsetEditFieldLabel.Position = [484 162 78 24];
            app.ZoffsetEditFieldLabel.Text = 'Z offset';

            % Create ZoffsetEditField
            app.ZoffsetEditField = uieditfield(app.Panel4, 'numeric');
            app.ZoffsetEditField.Limits = [0 80];
            app.ZoffsetEditField.ValueDisplayFormat = '%.3f';
            app.ZoffsetEditField.FontSize = 20;
            app.ZoffsetEditField.Position = [597 162 87 25];
            app.ZoffsetEditField.Value = 40;

            % Create Panel5
            app.Panel5 = uipanel(app.GridLayout);
            app.Panel5.AutoResizeChildren = 'off';
            app.Panel5.ForegroundColor = [0.1294 0.1294 0.1294];
            app.Panel5.Title = 'Panel5';
            app.Panel5.Layout.Row = [6 12];
            app.Panel5.Layout.Column = [4 6];

            % Create UpYButton
            app.UpYButton = uibutton(app.Panel5, 'state');
            app.UpYButton.ValueChangedFcn = createCallbackFcn(app, @UpYButtonValueChanged, true);
            app.UpYButton.Text = 'Up Y';
            app.UpYButton.BackgroundColor = [0.902 0.902 0.902];
            app.UpYButton.FontSize = 15;
            app.UpYButton.FontWeight = 'bold';
            app.UpYButton.FontColor = [0.1294 0.1294 0.1294];
            app.UpYButton.Position = [121 174 100 26];

            % Create DownYButton
            app.DownYButton = uibutton(app.Panel5, 'state');
            app.DownYButton.ValueChangedFcn = createCallbackFcn(app, @DownYButtonValueChanged, true);
            app.DownYButton.Text = 'Down Y';
            app.DownYButton.BackgroundColor = [0.902 0.902 0.902];
            app.DownYButton.FontSize = 15;
            app.DownYButton.FontWeight = 'bold';
            app.DownYButton.FontColor = [0.1294 0.1294 0.1294];
            app.DownYButton.Position = [121 98 100 26];

            % Create RightXButton
            app.RightXButton = uibutton(app.Panel5, 'state');
            app.RightXButton.ValueChangedFcn = createCallbackFcn(app, @RightXButtonValueChanged, true);
            app.RightXButton.Text = 'Right X';
            app.RightXButton.BackgroundColor = [0.8627 0.8627 0.8627];
            app.RightXButton.FontSize = 15;
            app.RightXButton.FontWeight = 'bold';
            app.RightXButton.FontColor = [0.1294 0.1294 0.1294];
            app.RightXButton.Position = [220 136 100 26];

            % Create LeftXButton
            app.LeftXButton = uibutton(app.Panel5, 'state');
            app.LeftXButton.ValueChangedFcn = createCallbackFcn(app, @LeftXButtonValueChanged, true);
            app.LeftXButton.Text = 'Left X';
            app.LeftXButton.BackgroundColor = [0.902 0.902 0.902];
            app.LeftXButton.FontSize = 15;
            app.LeftXButton.FontWeight = 'bold';
            app.LeftXButton.FontColor = [0.1294 0.1294 0.1294];
            app.LeftXButton.Position = [21 136 100 26];

            % Create DecZButton
            app.DecZButton = uibutton(app.Panel5, 'state');
            app.DecZButton.ValueChangedFcn = createCallbackFcn(app, @DecZButtonValueChanged, true);
            app.DecZButton.Text = 'Dec. Z';
            app.DecZButton.BackgroundColor = [0.902 0.902 0.902];
            app.DecZButton.FontSize = 18;
            app.DecZButton.FontWeight = 'bold';
            app.DecZButton.FontColor = [0.1294 0.1294 0.1294];
            app.DecZButton.Position = [309 6 100 29];

            % Create IncZButton
            app.IncZButton = uibutton(app.Panel5, 'state');
            app.IncZButton.ValueChangedFcn = createCallbackFcn(app, @IncZButtonValueChanged, true);
            app.IncZButton.Text = 'Inc. Z';
            app.IncZButton.BackgroundColor = [0.902 0.902 0.902];
            app.IncZButton.FontSize = 18;
            app.IncZButton.FontWeight = 'bold';
            app.IncZButton.FontColor = [0.1294 0.1294 0.1294];
            app.IncZButton.Position = [309 328 100 29];

            % Create MovenmEditFieldLabel
            app.MovenmEditFieldLabel = uilabel(app.Panel5);
            app.MovenmEditFieldLabel.HorizontalAlignment = 'right';
            app.MovenmEditFieldLabel.FontSize = 18;
            app.MovenmEditFieldLabel.FontWeight = 'bold';
            app.MovenmEditFieldLabel.Position = [177 292 95 22];
            app.MovenmEditFieldLabel.Text = {'Move (nm)'; ''};

            % Create MovenmEditField
            app.MovenmEditField = uieditfield(app.Panel5, 'numeric');
            app.MovenmEditField.Limits = [0 10000];
            app.MovenmEditField.ValueDisplayFormat = '%11.3g';
            app.MovenmEditField.FontSize = 18;
            app.MovenmEditField.FontWeight = 'bold';
            app.MovenmEditField.Position = [178 259 100 23];
            app.MovenmEditField.Value = 30;

            % Create MaxZEditFieldLabel
            app.MaxZEditFieldLabel = uilabel(app.Panel5);
            app.MaxZEditFieldLabel.HorizontalAlignment = 'right';
            app.MaxZEditFieldLabel.FontSize = 18;
            app.MaxZEditFieldLabel.FontWeight = 'bold';
            app.MaxZEditFieldLabel.Position = [220 38 62 22];
            app.MaxZEditFieldLabel.Text = 'Max. Z';

            % Create MaxZEditField
            app.MaxZEditField = uieditfield(app.Panel5, 'numeric');
            app.MaxZEditField.Limits = [0 80];
            app.MaxZEditField.ValueChangedFcn = createCallbackFcn(app, @MaxZEditFieldValueChanged, true);
            app.MaxZEditField.FontSize = 18;
            app.MaxZEditField.FontWeight = 'bold';
            app.MaxZEditField.Position = [235 7 44 23];
            app.MaxZEditField.Value = 80;

            % Create MinZEditFieldLabel
            app.MinZEditFieldLabel = uilabel(app.Panel5);
            app.MinZEditFieldLabel.HorizontalAlignment = 'right';
            app.MinZEditFieldLabel.FontSize = 18;
            app.MinZEditFieldLabel.FontWeight = 'bold';
            app.MinZEditFieldLabel.Position = [77 40 57 22];
            app.MinZEditFieldLabel.Text = 'Min. Z';

            % Create MinZEditField
            app.MinZEditField = uieditfield(app.Panel5, 'numeric');
            app.MinZEditField.Limits = [0 80];
            app.MinZEditField.ValueChangedFcn = createCallbackFcn(app, @MinZEditFieldValueChanged, true);
            app.MinZEditField.FontSize = 18;
            app.MinZEditField.FontWeight = 'bold';
            app.MinZEditField.Position = [87 9 44 23];

            % Create ActPanelButton
            app.ActPanelButton = uibutton(app.Panel5, 'push');
            app.ActPanelButton.ButtonPushedFcn = createCallbackFcn(app, @ActPanelButtonPushed, true);
            app.ActPanelButton.BackgroundColor = [0.3765 0.4902 0.5451];
            app.ActPanelButton.FontSize = 18;
            app.ActPanelButton.FontWeight = 'bold';
            app.ActPanelButton.FontColor = [0.1294 0.1294 0.1294];
            app.ActPanelButton.Position = [15 354 133 44];
            app.ActPanelButton.Text = 'Act. Panel';

            % Create Goto000Button
            app.Goto000Button = uibutton(app.Panel5, 'state');
            app.Goto000Button.ValueChangedFcn = createCallbackFcn(app, @Goto000ButtonValueChanged, true);
            app.Goto000Button.Text = 'Go to (0, 0, 0)';
            app.Goto000Button.BackgroundColor = [0.8627 0.8627 0.902];
            app.Goto000Button.FontSize = 18;
            app.Goto000Button.FontWeight = 'bold';
            app.Goto000Button.FontColor = [0.1294 0.1294 0.1294];
            app.Goto000Button.Position = [164 354 129 44];

            % Create ZSliderLabel
            app.ZSliderLabel = uilabel(app.Panel5);
            app.ZSliderLabel.HorizontalAlignment = 'right';
            app.ZSliderLabel.FontSize = 18;
            app.ZSliderLabel.FontWeight = 'bold';
            app.ZSliderLabel.Position = [309 169 25 22];
            app.ZSliderLabel.Text = 'Z';

            % Create ZSlider
            app.ZSlider = uislider(app.Panel5);
            app.ZSlider.Limits = [0 80];
            app.ZSlider.Orientation = 'vertical';
            app.ZSlider.ValueChangingFcn = createCallbackFcn(app, @ZSliderValueChanging, true);
            app.ZSlider.FontSize = 18;
            app.ZSlider.FontWeight = 'bold';
            app.ZSlider.Position = [350 53 3 254];

            % Create Switch
            app.Switch = uiswitch(app.Panel5, 'toggle');
            app.Switch.Items = {'Lasercomp', 'Excelitas'};
            app.Switch.ValueChangedFcn = createCallbackFcn(app, @SwitchValueChanged, true);
            app.Switch.FontSize = 20;
            app.Switch.FontWeight = 'bold';
            app.Switch.Position = [47 241 31 71];
            app.Switch.Value = 'Excelitas';

            % Create Panel6
            app.Panel6 = uipanel(app.GridLayout);
            app.Panel6.Title = 'Panel6';
            app.Panel6.Layout.Row = [13 14];
            app.Panel6.Layout.Column = [2 6];

            % Create XcoordEditFieldLabel
            app.XcoordEditFieldLabel = uilabel(app.Panel6);
            app.XcoordEditFieldLabel.HorizontalAlignment = 'right';
            app.XcoordEditFieldLabel.FontSize = 18;
            app.XcoordEditFieldLabel.FontWeight = 'bold';
            app.XcoordEditFieldLabel.Position = [29 60 78 22];
            app.XcoordEditFieldLabel.Text = 'X coord.';

            % Create XcoordEditField
            app.XcoordEditField = uieditfield(app.Panel6, 'numeric');
            app.XcoordEditField.ValueDisplayFormat = '%.3f';
            app.XcoordEditField.Editable = 'off';
            app.XcoordEditField.FontSize = 18;
            app.XcoordEditField.FontWeight = 'bold';
            app.XcoordEditField.Position = [122 59 100 23];

            % Create YcoordEditFieldLabel
            app.YcoordEditFieldLabel = uilabel(app.Panel6);
            app.YcoordEditFieldLabel.HorizontalAlignment = 'right';
            app.YcoordEditFieldLabel.FontSize = 18;
            app.YcoordEditFieldLabel.FontWeight = 'bold';
            app.YcoordEditFieldLabel.Position = [284 59 78 22];
            app.YcoordEditFieldLabel.Text = 'Y coord.';

            % Create YcoordEditField
            app.YcoordEditField = uieditfield(app.Panel6, 'numeric');
            app.YcoordEditField.ValueDisplayFormat = '%.3f';
            app.YcoordEditField.Editable = 'off';
            app.YcoordEditField.FontSize = 18;
            app.YcoordEditField.FontWeight = 'bold';
            app.YcoordEditField.Position = [377 59 100 23];

            % Create ZcoordEditFieldLabel
            app.ZcoordEditFieldLabel = uilabel(app.Panel6);
            app.ZcoordEditFieldLabel.HorizontalAlignment = 'right';
            app.ZcoordEditFieldLabel.FontSize = 18;
            app.ZcoordEditFieldLabel.FontWeight = 'bold';
            app.ZcoordEditFieldLabel.Position = [526 59 76 22];
            app.ZcoordEditFieldLabel.Text = 'Z coord.';

            % Create ZcoordEditField
            app.ZcoordEditField = uieditfield(app.Panel6, 'numeric');
            app.ZcoordEditField.ValueDisplayFormat = '%.3f';
            app.ZcoordEditField.Editable = 'off';
            app.ZcoordEditField.FontSize = 18;
            app.ZcoordEditField.FontWeight = 'bold';
            app.ZcoordEditField.Position = [617 59 100 23];

            % Create Mean2EditFieldLabel
            app.Mean2EditFieldLabel = uilabel(app.Panel6);
            app.Mean2EditFieldLabel.HorizontalAlignment = 'right';
            app.Mean2EditFieldLabel.FontSize = 28;
            app.Mean2EditFieldLabel.FontWeight = 'bold';
            app.Mean2EditFieldLabel.Position = [13 10 100 34];
            app.Mean2EditFieldLabel.Text = 'Mean 2';

            % Create Mean2EditField
            app.Mean2EditField = uieditfield(app.Panel6, 'numeric');
            app.Mean2EditField.ValueDisplayFormat = '%.2e';
            app.Mean2EditField.Editable = 'off';
            app.Mean2EditField.FontSize = 28;
            app.Mean2EditField.FontWeight = 'bold';
            app.Mean2EditField.Position = [128 10 180 34];

            % Create STD2EditFieldLabel
            app.STD2EditFieldLabel = uilabel(app.Panel6);
            app.STD2EditFieldLabel.HorizontalAlignment = 'right';
            app.STD2EditFieldLabel.FontSize = 28;
            app.STD2EditFieldLabel.FontWeight = 'bold';
            app.STD2EditFieldLabel.Position = [402 10 85 34];
            app.STD2EditFieldLabel.Text = 'STD 2';

            % Create STD2EditField
            app.STD2EditField = uieditfield(app.Panel6, 'numeric');
            app.STD2EditField.ValueDisplayFormat = '%.2e';
            app.STD2EditField.Editable = 'off';
            app.STD2EditField.FontSize = 28;
            app.STD2EditField.FontWeight = 'bold';
            app.STD2EditField.Position = [519 10 179 34];

            % Create Panel7
            app.Panel7 = uipanel(app.GridLayout);
            app.Panel7.Title = 'Panel7';
            app.Panel7.Layout.Row = [12 14];
            app.Panel7.Layout.Column = [7 11];

            % Create LoadFigureButton
            app.LoadFigureButton = uibutton(app.Panel7, 'push');
            app.LoadFigureButton.ButtonPushedFcn = createCallbackFcn(app, @LoadFigureButtonPushed, true);
            app.LoadFigureButton.BackgroundColor = [0.298 0.6863 0.6471];
            app.LoadFigureButton.FontSize = 18;
            app.LoadFigureButton.FontWeight = 'bold';
            app.LoadFigureButton.FontColor = [0.1294 0.1294 0.1294];
            app.LoadFigureButton.Position = [102 102 141 43];
            app.LoadFigureButton.Text = 'Load Figure';

            % Create SetoffsetButton
            app.SetoffsetButton = uibutton(app.Panel7, 'state');
            app.SetoffsetButton.ValueChangedFcn = createCallbackFcn(app, @SetoffsetButtonValueChanged, true);
            app.SetoffsetButton.Text = 'Set offset';
            app.SetoffsetButton.BackgroundColor = [1 0.5961 0];
            app.SetoffsetButton.FontSize = 18;
            app.SetoffsetButton.FontWeight = 'bold';
            app.SetoffsetButton.FontColor = [0.1294 0.1294 0.1294];
            app.SetoffsetButton.Position = [268 101 141 44];

            % Create ZoomButton
            app.ZoomButton = uibutton(app.Panel7, 'state');
            app.ZoomButton.ValueChangedFcn = createCallbackFcn(app, @ZoomButtonValueChanged, true);
            app.ZoomButton.Text = 'Zoom';
            app.ZoomButton.BackgroundColor = [0.298 0.6863 0.3137];
            app.ZoomButton.FontSize = 18;
            app.ZoomButton.FontWeight = 'bold';
            app.ZoomButton.FontColor = [0.1294 0.1294 0.1294];
            app.ZoomButton.Position = [92 43 100 29];

            % Create SetFigButton
            app.SetFigButton = uibutton(app.Panel7, 'state');
            app.SetFigButton.ValueChangedFcn = createCallbackFcn(app, @SetFigButtonValueChanged, true);
            app.SetFigButton.Text = 'Set Fig.';
            app.SetFigButton.BackgroundColor = [1 0.8353 0.3098];
            app.SetFigButton.FontSize = 18;
            app.SetFigButton.FontWeight = 'bold';
            app.SetFigButton.FontColor = [0.1294 0.1294 0.1294];
            app.SetFigButton.Position = [205 43 100 29];

            % Create PrevFigButton
            app.PrevFigButton = uibutton(app.Panel7, 'state');
            app.PrevFigButton.ValueChangedFcn = createCallbackFcn(app, @PrevFigButtonValueChanged, true);
            app.PrevFigButton.Text = 'Prev. Fig.';
            app.PrevFigButton.BackgroundColor = [0.6196 0.6196 0.6196];
            app.PrevFigButton.FontSize = 18;
            app.PrevFigButton.FontWeight = 'bold';
            app.PrevFigButton.FontColor = [0.1294 0.1294 0.1294];
            app.PrevFigButton.Position = [327 43 100 29];

            % Create MinColorbarEditFieldLabel
            app.MinColorbarEditFieldLabel = uilabel(app.Panel7);
            app.MinColorbarEditFieldLabel.HorizontalAlignment = 'center';
            app.MinColorbarEditFieldLabel.FontSize = 18;
            app.MinColorbarEditFieldLabel.FontWeight = 'bold';
            app.MinColorbarEditFieldLabel.Position = [593 123 121 22];
            app.MinColorbarEditFieldLabel.Text = 'Min. Colorbar';

            % Create MinColorbarEditField
            app.MinColorbarEditField = uieditfield(app.Panel7, 'numeric');
            app.MinColorbarEditField.ValueDisplayFormat = '%.2e';
            app.MinColorbarEditField.ValueChangedFcn = createCallbackFcn(app, @MinColorbarEditFieldValueChanged, true);
            app.MinColorbarEditField.FontSize = 18;
            app.MinColorbarEditField.FontWeight = 'bold';
            app.MinColorbarEditField.Position = [601 93 105 23];

            % Create MaxColorbarEditFieldLabel
            app.MaxColorbarEditFieldLabel = uilabel(app.Panel7);
            app.MaxColorbarEditFieldLabel.HorizontalAlignment = 'center';
            app.MaxColorbarEditFieldLabel.FontSize = 18;
            app.MaxColorbarEditFieldLabel.FontWeight = 'bold';
            app.MaxColorbarEditFieldLabel.Position = [593 50 126 22];
            app.MaxColorbarEditFieldLabel.Text = 'Max. Colorbar';

            % Create MaxColorbarEditField
            app.MaxColorbarEditField = uieditfield(app.Panel7, 'numeric');
            app.MaxColorbarEditField.ValueDisplayFormat = '%.2e';
            app.MaxColorbarEditField.ValueChangedFcn = createCallbackFcn(app, @MaxColorbarEditFieldValueChanged, true);
            app.MaxColorbarEditField.FontSize = 18;
            app.MaxColorbarEditField.FontWeight = 'bold';
            app.MaxColorbarEditField.Position = [606 20 102 23];

            % Create SavezoomButton
            app.SavezoomButton = uibutton(app.Panel7, 'state');
            app.SavezoomButton.ValueChangedFcn = createCallbackFcn(app, @SavezoomButtonValueChanged, true);
            app.SavezoomButton.Text = 'Save zoom';
            app.SavezoomButton.BackgroundColor = [0.2588 0.651 0.9608];
            app.SavezoomButton.FontSize = 18;
            app.SavezoomButton.FontWeight = 'bold';
            app.SavezoomButton.FontColor = [0.1294 0.1294 0.1294];
            app.SavezoomButton.Position = [149 1 110 29];

            % Create ZoomSizeumEditFieldLabel
            app.ZoomSizeumEditFieldLabel = uilabel(app.Panel7);
            app.ZoomSizeumEditFieldLabel.HorizontalAlignment = 'right';
            app.ZoomSizeumEditFieldLabel.FontSize = 18;
            app.ZoomSizeumEditFieldLabel.FontWeight = 'bold';
            app.ZoomSizeumEditFieldLabel.Position = [451 110 139 22];
            app.ZoomSizeumEditFieldLabel.Text = 'Zoom Size (um)';

            % Create ZoomSizeumEditField
            app.ZoomSizeumEditField = uieditfield(app.Panel7, 'numeric');
            app.ZoomSizeumEditField.Limits = [1 30];
            app.ZoomSizeumEditField.FontSize = 18;
            app.ZoomSizeumEditField.Position = [494 87 54 23];
            app.ZoomSizeumEditField.Value = 2;

            % Create CleanFigButton
            app.CleanFigButton = uibutton(app.Panel7, 'state');
            app.CleanFigButton.ValueChangedFcn = createCallbackFcn(app, @CleanFigButtonValueChanged, true);
            app.CleanFigButton.Text = 'Clean Fig.';
            app.CleanFigButton.BackgroundColor = [0.898 0.2235 0.2078];
            app.CleanFigButton.FontSize = 18;
            app.CleanFigButton.FontWeight = 'bold';
            app.CleanFigButton.FontColor = [0.1294 0.1294 0.1294];
            app.CleanFigButton.Position = [288 1 102 29];

            % Create Lamp
            app.Lamp = uilamp(app.Panel7);
            app.Lamp.Enable = 'off';
            app.Lamp.Position = [556 39 20 20];

            % Create ZoomSwitchLabel
            app.ZoomSwitchLabel = uilabel(app.Panel7);
            app.ZoomSwitchLabel.HorizontalAlignment = 'center';
            app.ZoomSwitchLabel.FontSize = 18;
            app.ZoomSwitchLabel.FontWeight = 'bold';
            app.ZoomSwitchLabel.Position = [494 37 54 22];
            app.ZoomSwitchLabel.Text = 'Zoom';

            % Create ZoomSwitch
            app.ZoomSwitch = uiswitch(app.Panel7, 'slider');
            app.ZoomSwitch.ValueChangedFcn = createCallbackFcn(app, @ZoomSwitchValueChanged, true);
            app.ZoomSwitch.FontSize = 18;
            app.ZoomSwitch.Position = [495 16 51 22];

            % Create Panel3
            app.Panel3 = uipanel(app.GridLayout);
            app.Panel3.AutoResizeChildren = 'off';
            app.Panel3.Title = 'Panel3';
            app.Panel3.Layout.Row = [10 12];
            app.Panel3.Layout.Column = [2 3];

            % Create XYRangeEditFieldLabel
            app.XYRangeEditFieldLabel = uilabel(app.Panel3);
            app.XYRangeEditFieldLabel.HorizontalAlignment = 'center';
            app.XYRangeEditFieldLabel.FontSize = 18;
            app.XYRangeEditFieldLabel.FontWeight = 'bold';
            app.XYRangeEditFieldLabel.Position = [43 36 96 22];
            app.XYRangeEditFieldLabel.Text = 'X-Y Range';

            % Create XYRangeEditField
            app.XYRangeEditField = uieditfield(app.Panel3, 'numeric');
            app.XYRangeEditField.FontSize = 18;
            app.XYRangeEditField.FontWeight = 'bold';
            app.XYRangeEditField.Position = [38 6 105 23];
            app.XYRangeEditField.Value = 800;

            % Create ZRangeEditFieldLabel
            app.ZRangeEditFieldLabel = uilabel(app.Panel3);
            app.ZRangeEditFieldLabel.HorizontalAlignment = 'center';
            app.ZRangeEditFieldLabel.FontSize = 18;
            app.ZRangeEditFieldLabel.FontWeight = 'bold';
            app.ZRangeEditFieldLabel.Position = [179 36 77 22];
            app.ZRangeEditFieldLabel.Text = 'Z Range';

            % Create ZRangeEditField
            app.ZRangeEditField = uieditfield(app.Panel3, 'numeric');
            app.ZRangeEditField.FontSize = 18;
            app.ZRangeEditField.FontWeight = 'bold';
            app.ZRangeEditField.Position = [165 6 105 23];
            app.ZRangeEditField.Value = 1800;

            % Create NBufferOptLabel
            app.NBufferOptLabel = uilabel(app.Panel3);
            app.NBufferOptLabel.HorizontalAlignment = 'center';
            app.NBufferOptLabel.FontSize = 18;
            app.NBufferOptLabel.FontWeight = 'bold';
            app.NBufferOptLabel.Position = [38 126 150 22];
            app.NBufferOptLabel.Text = 'N Buffer Opt. (%)';

            % Create NBufferOptEditField
            app.NBufferOptEditField = uieditfield(app.Panel3, 'numeric');
            app.NBufferOptEditField.Limits = [0 100];
            app.NBufferOptEditField.ValueChangedFcn = createCallbackFcn(app, @NBufferOptEditFieldValueChanged, true);
            app.NBufferOptEditField.FontSize = 18;
            app.NBufferOptEditField.FontWeight = 'bold';
            app.NBufferOptEditField.Position = [227 126 37 23];
            app.NBufferOptEditField.Value = 30;

            % Create UpToleranceEditFieldLabel
            app.UpToleranceEditFieldLabel = uilabel(app.Panel3);
            app.UpToleranceEditFieldLabel.HorizontalAlignment = 'center';
            app.UpToleranceEditFieldLabel.FontSize = 18;
            app.UpToleranceEditFieldLabel.FontWeight = 'bold';
            app.UpToleranceEditFieldLabel.Position = [38 96 151 22];
            app.UpToleranceEditFieldLabel.Text = 'Up Tolerance (%)';

            % Create UpToleranceEditField
            app.UpToleranceEditField = uieditfield(app.Panel3, 'numeric');
            app.UpToleranceEditField.Limits = [0 100];
            app.UpToleranceEditField.ValueChangedFcn = createCallbackFcn(app, @UpToleranceEditFieldValueChanged, true);
            app.UpToleranceEditField.FontSize = 18;
            app.UpToleranceEditField.FontWeight = 'bold';
            app.UpToleranceEditField.Position = [227 98 37 23];
            app.UpToleranceEditField.Value = 30;

            % Create DownToleranceEditFieldLabel
            app.DownToleranceEditFieldLabel = uilabel(app.Panel3);
            app.DownToleranceEditFieldLabel.HorizontalAlignment = 'center';
            app.DownToleranceEditFieldLabel.FontSize = 18;
            app.DownToleranceEditFieldLabel.FontWeight = 'bold';
            app.DownToleranceEditFieldLabel.Position = [38 67 176 22];
            app.DownToleranceEditFieldLabel.Text = 'Down Tolerance (%)';

            % Create DownToleranceEditField
            app.DownToleranceEditField = uieditfield(app.Panel3, 'numeric');
            app.DownToleranceEditField.Limits = [0 100];
            app.DownToleranceEditField.ValueChangedFcn = createCallbackFcn(app, @DownToleranceEditFieldValueChanged, true);
            app.DownToleranceEditField.FontSize = 18;
            app.DownToleranceEditField.FontWeight = 'bold';
            app.DownToleranceEditField.Position = [227 67 37 23];
            app.DownToleranceEditField.Value = 10;

            % Create Panel8
            app.Panel8 = uipanel(app.GridLayout);
            app.Panel8.ForegroundColor = [0.1294 0.1294 0.1294];
            app.Panel8.Title = 'Panel8';
            app.Panel8.Layout.Row = [10 14];
            app.Panel8.Layout.Column = 1;

            % Create StartOptButton
            app.StartOptButton = uibutton(app.Panel8, 'state');
            app.StartOptButton.ValueChangedFcn = createCallbackFcn(app, @StartOptButtonValueChanged, true);
            app.StartOptButton.Text = 'Start Opt.';
            app.StartOptButton.BackgroundColor = [0.7412 0.7412 0.7412];
            app.StartOptButton.FontSize = 18;
            app.StartOptButton.FontWeight = 'bold';
            app.StartOptButton.FontColor = [0.1294 0.1294 0.1294];
            app.StartOptButton.Position = [15 233 100 29];

            % Create Switch_2
            app.Switch_2 = uiswitch(app.Panel8, 'toggle');
            app.Switch_2.Items = {'Lasercomp', 'Excelitas'};
            app.Switch_2.ValueChangedFcn = createCallbackFcn(app, @Switch_2ValueChanged, true);
            app.Switch_2.FontSize = 18;
            app.Switch_2.FontWeight = 'bold';
            app.Switch_2.Position = [58 144 23 52];
            app.Switch_2.Value = 'Excelitas';

            % Create SaveCoordsButton
            app.SaveCoordsButton = uibutton(app.Panel8, 'state');
            app.SaveCoordsButton.ValueChangedFcn = createCallbackFcn(app, @SaveCoordsButtonValueChanged, true);
            app.SaveCoordsButton.Enable = 'off';
            app.SaveCoordsButton.Text = 'Save Coords.';
            app.SaveCoordsButton.BackgroundColor = [0.2588 0.651 0.9608];
            app.SaveCoordsButton.FontSize = 18;
            app.SaveCoordsButton.FontWeight = 'bold';
            app.SaveCoordsButton.Position = [4 13 131 29];

            % Create TrackerSwitchLabel
            app.TrackerSwitchLabel = uilabel(app.Panel8);
            app.TrackerSwitchLabel.HorizontalAlignment = 'center';
            app.TrackerSwitchLabel.FontSize = 18;
            app.TrackerSwitchLabel.FontWeight = 'bold';
            app.TrackerSwitchLabel.Position = [36 81 70 22];
            app.TrackerSwitchLabel.Text = 'Tracker';

            % Create TrackerSwitch
            app.TrackerSwitch = uiswitch(app.Panel8, 'slider');
            app.TrackerSwitch.ValueChangedFcn = createCallbackFcn(app, @TrackerSwitchValueChanged, true);
            app.TrackerSwitch.FontSize = 18;
            app.TrackerSwitch.Position = [45 60 51 22];

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