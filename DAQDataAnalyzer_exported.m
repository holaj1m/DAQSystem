classdef DAQDataAnalyzer_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                     matlab.ui.Figure
        GridLayout                   matlab.ui.container.GridLayout
        LiveViewPanel                matlab.ui.container.Panel
        UIAxes                       matlab.ui.control.UIAxes
        LoadFigureButton             matlab.ui.control.Button
        SetoffsetButton              matlab.ui.control.StateButton
        XcoordEditFieldLabel         matlab.ui.control.Label
        XcoordEditField              matlab.ui.control.NumericEditField
        YcoordEditFieldLabel         matlab.ui.control.Label
        YcoordEditField              matlab.ui.control.NumericEditField
        XvoltageEditFieldLabel       matlab.ui.control.Label
        XvoltageEditField            matlab.ui.control.NumericEditField
        YvoltageEditFieldLabel       matlab.ui.control.Label
        YvoltageEditField            matlab.ui.control.NumericEditField
        ZcoordEditFieldLabel         matlab.ui.control.Label
        ZcoordEditField              matlab.ui.control.NumericEditField
        ZvoltageEditFieldLabel       matlab.ui.control.Label
        ZvoltageEditField            matlab.ui.control.NumericEditField
        MinColorbarEditFieldLabel    matlab.ui.control.Label
        MinColorbarEditField         matlab.ui.control.NumericEditField
        MaxColorbarEditFieldLabel    matlab.ui.control.Label
        MaxColorbarEditField         matlab.ui.control.NumericEditField
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
        Panel3                       matlab.ui.container.Panel
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
    end

    
properties (Access = private)
        DAQSession = [] % Handle to DAQ session
        
        DAQClkTraceSession = [] % Handle to DAQ session
        
        TraceAvailableListener % Listener for DAQ session 'DataAvailable' event
        
        TimestampsFIFOBuffer % Timestamps FIFO buffer used for live plot of latest "N" seconds of acquired data
        
        DataFIFOBuffer  % Data FIFO buffer used for live plot of latest "N" seconds of acquired data
        
        traceFigure % Handle a figura externa que plotea la traza
        axesTrace % Handle de los ejes de figura que plotea traza
        lineTrace % Handle a la linea del gráfico
        
        LogRequested % Logical value, indicates whether user selected to log data to file from the UI (set by LogdatatofileSwitch)
        LogSaveScan % Valor booleano para guardar datos tomados del scan
        TriggerTime % Acquisition start time stored as datetime
        TempFilename % Temporary binary file name, acquired data is logged to this file during acquisition
        TempFile % Handle of opened binary file, acquired data is logged to this file during acquisition
        Filename = datestr(datetime('now'), 'yyyy-mm-dd_HHMMSS_TRA') % Default MAT file name at app start
        Filepath = pwd % Default folder for saving the MAT file at app start
        
        % Propiedades asociadas a mapa PL
        
        DAQPiezoSession = [] % Sesion para manejar entradas y salidas de voltaje en piezo
        DAQScanSession = [] % Sesion para realizar scan
        scanListener = [];
        
        % Sesiones para manejo de coordenadas por separado
        
        DAQSesionCoordX = [] % Sesion para manejar entrada y salidas de voltajes asociadas a coordenada X
        
        DAQSesionCoordY = [] % Sesion para manejar entrada y salidas de voltajes asociadas a coordenada Y
        
        DAQSesionCoordZ = [] % Sesion para manejar entrada y salidas de voltajes asociadas a coordenada Z
        
        CountdownTimer % Timer pare cuenta regresiva de scan
        
        transCoords = false % Bandera para trackear coordenadas actuales a scan
        piezoSettlingTime = 2E-3 % Tiempo que le toma al piezo moverse de un punto a otro
        
        xCoord % X coordinates scanned
        yCoord % Y coordinates scanned
        countsMatrix = [] % Matrix associated with counts/s at the given coordinates
        matrixPlot
        isClickedDown = false
        buttonDownTime % Variable para medir el tiempo que se mantiene presionado el clic
        
        currentVoltX  % Voltaje asociado a posicion actual X
        currentVoltY  % Voltaje asociado a posicion actual Y
        currentVoltZ % Voltaje asociado a posicion actual Z
        maxVoltPiezo = 0.25 % Voltaje máximo a aplicar al piezo
        
        hXLine  % Handle para la línea vertical
        hYLine  % Handle para la línea horizontal
        
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
        
            if app.LogRequested
                % If Log data to file switch is on
                data = [event.TimeStamps, event.Data]' ;
                fwrite(app.TempFile, data, 'double');
                if event.TimeStamps(1)==0
                    app.TriggerTime = event.TriggerTime;
                end
            end
            
            % Store continuous acquisition data in FIFO data buffers
            buffersize = round(abs(app.NBufferEditField.Value));
            
            % Definir variables que determinan tiempo de integración
            timeMs = app.IntTimemsEditField.Value;
            dT = timeMs/(1000*2);
            
            data = mean(diff(event.Data(:,1)))/(2*dT);
            
            app.DataFIFOBuffer = storeDataInFIFO(app, app.DataFIFOBuffer, buffersize, data);
            if numel(app.DataFIFOBuffer) == buffersize
                app.MeanEditField.Value = mean(app.DataFIFOBuffer(1:end));
                app.STDEditField.Value = std(app.DataFIFOBuffer(1:end));
            end
            
            % Update plot data
            set(app.lineTrace ,'YData', app.DataFIFOBuffer);
            drawnow limitrate;
            
        end
        
        % Callback que se ejecuta al cerrar la figura externa
        function closeTrazaCallback(app, src, event)
            % Cerrar la sesión de DAQ
            StopTraceButtonValueChanged(app,[])
            % Cerrar la figura
            %delete(src);
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
                    
                    if ~(isempty(app.DAQSession)) && app.DAQSession.IsRunning
                        app.StartTraceButton.Enable = 'off';
                        app.StopTraceButton.Enable = 'on';
                        app.SavingDataSwitch.Enable = 'off';
                        app.NotifyScansSpinner.Enable = 'off';
                        app.IntTimemsEditField.Enable = 'off';
                        app.NBufferEditField.Enable = 'off';
                        
                    else
                        app.StartTraceButton.Enable = 'on';
                        app.StopTraceButton.Enable = 'off';
                        app.SavingDataSwitch.Enable = 'on';
                        app.NotifyScansSpinner.Enable = 'on';
                        app.IntTimemsEditField.Enable = 'on';
                        app.NBufferEditField.Enable = 'on';
                    end
                    
                    
                    app.XoffsetEditField.Enable = 'on';
                    app.YoffsetEditField.Enable = 'on';
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
        
        
        function closeApp_Callback(app, ~, event, isAcquiring)
        %closeApp_Callback Executes after "Close Confirm" dialog window
        %  "Close Confirm" dialog window is launched from LiveDataAcquisitionCloseRequest.
        %   before closing app if acquisition is currently on (isAcquiring=true) clean-up 
        %   DAQ session and close file if logging.
        
            switch event.SelectedOption
                case 'OK'
                    if isAcquiring
                        % Acquisition is currently on
                        stop(app.DAQSession)
                        stop(app.DAQClkTraceSession)
                        stop(app.DAQPiezoSession)
                        stop(app.DAQScanSession)
                        delete(app.TraceAvailableListener)
                        delete(app.DAQSession)
                        delete(app.DAQClkTraceSession)
                        delete(app.DAQPiezoSession)
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
        
        function updatePiezoVoltage(app, sesion)
            
            % Leer voltajes
            switch sesion
                case 'piezo'
                    voltajes = inputSingleScan(app.DAQPiezoSession);
                    % Asignar voltajes leidos a variables de clase
                    
                    app.currentVoltX = recortarVoltaje(app, voltajes(1), 0.0, 10.0);
                    app.currentVoltY = recortarVoltaje(app, voltajes(2), 0.0, 10.0);
                    app.currentVoltZ = recortarVoltaje(app, voltajes(3), 0.0, 10.0);
                    
                case 'scan'
                    voltajes = inputSingleScan(app.DAQScanSession);
                    % Asignar voltajes leidos a variables de clase
                    
                    app.currentVoltX = recortarVoltaje(app, voltajes(2), 0.0, 10.0);
                    app.currentVoltY = recortarVoltaje(app, voltajes(3), 0.0, 10.0);
            end
            
            
            
            % Actualizar valores actuales de voltaje en UI
            
            app.XvoltageEditField.Value = app.currentVoltX;
            app.YvoltageEditField.Value = app.currentVoltY;
            app.ZvoltageEditField.Value = app.currentVoltZ;
            
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
            app.matrixPlot = imagesc(app.UIAxes,app.xCoord, app.yCoord, app.countsMatrix);
            xlim(app.UIAxes, [min(app.xCoord), max(app.xCoord)]);
            ylim(app.UIAxes, [min(app.yCoord), max(app.yCoord)]);
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
            
            if x >= min(app.xCoord) && x <= max(app.xCoord) && y >= min(app.yCoord) && y <= max(app.yCoord)
                
                
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
            % Configurar las funciones de movimiento y liberación del click
            set(app.UIFigure, 'WindowButtonMotionFcn', @(src, event)whileClickDown(app, src, event));
        end
        
        function whileClickDown(app, src, event)
            
            % Obtener posiciones mientras se mantiene presionado el click
            
             if(app.isClickedDown==true)
%                 
%                 % Posición dad por el mouse
%                 
%                 pos = get(app.UIAxes, 'CurrentPoint');
%                 x = round(pos(1,1),4);
%                 y = round(pos(1,2),4);
%                 
%                 % Verificar que el mouse esté dentro de los límites de la figura
%             
%                 if x >= min(app.xCoord) && x <= max(app.xCoord) && y >= min(app.yCoord) && y <= max(app.yCoord)
%                     
%                     % Mostrar en UI posición del mouse
%                     
%                     app.XcoordEditField.Value = x;
%                     app.YcoordEditField.Value = y;
%                     
%                     % Actualizar la posición del mouse como voltaje final
%                     
%                     app.voltX = x/8;
%                     app.voltY = y/8;
%                     
%                     % Mostrar en UI voltaje asociado a la posición del
%                     % mouse
%                     
%                     app.XvoltageEditField.Value = app.voltX;
%                     app.YvoltageEditField.Value = app.voltY;
%                     
%                     % Desplazar piezo por coordenada considerando voltaje
%                     % final
%                     outputSingleScan(app.DAQSesionCoordX, app.voltX)
%                     outputSingleScan(app.DAQSesionCoordY, app.voltY)
%                     
%                     % Actualizar voltajes del piezo
%                     actualizarVoltajes(app);
%                     
%                 end
                % Configurar las funciones de liberación del click
                set(app.UIFigure, 'WindowButtonUpFcn', @(src, event)clickUp(app, src, event));
            end
            
        end
        
        function clickUp(app, src, event)
            
            % Obtener el tiempo que estuvo presionado el click
            buttonUpTime = toc(app.buttonDownTime);
            %buttonUpTime = toc(app.buttonDownTime);
            %disp(buttonUpTime)
            app.isClickedDown = false;
            
            % Obtener las posiciones cuando se deja de presionar el click
            
            pos = get(app.UIAxes, 'CurrentPoint');
            x = round(pos(1,1),4);
            y = round(pos(1,2),4);
            
            
            
            % Verificar que el click se haya levantado dentro de los límites de la figura
            % y el tiempo que estuvo presionado
            
            if x >= min(app.xCoord) && x <= max(app.xCoord) && y >= min(app.yCoord) && y <= max(app.yCoord)
                
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
        
        function desplazar(app, sesion)
            
            switch sesion
                case 'piezo'
                    s = app.DAQPiezoSession;
                case 'scan'
                    s = app.DAQScanSession;
            end
            
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
                
                switch sesion
                    case 'piezo'
                        iniciarSesionPiezo(app)
                        desplazar(app, 'piezo')
                    case 'scan'
                        iniciarSesionScan(app)
                        desplazar(app, 'scan')
                end
                
            end
            
        end
        
        function scanProcessData(app, event, idxNoCts, idxCts)
            
            try
                
                preData = event.Data;
                
                for i=1:length(idxNoCts)
                    preData(idxNoCts(i,1):idxNoCts(i,2)) = [];
                end
                
                data = diff(preData);
                
                nPuntos = app.ScanNpixelsEditField.Value;
                integrationTime = (app.CtimemsEditField.Value)/1000;
                bufferCuentas = zeros(nPuntos * nPuntos,1);
                
                for i=1:length(idxCts)
                    bufferCuentas(i) = sum(  data(idxCts(i,1):idxCts(i,2))  )/integrationTime;
                end
                
                app.countsMatrix = reshape(bufferCuentas, nPuntos, nPuntos)';
                
                app.matrixPlot = imagesc(app.UIAxes,app.xCoord, app.yCoord, app.countsMatrix);
                colorbar(app.UIAxes)
                xlim(app.UIAxes, [min(app.xCoord), max(app.xCoord)]);
                ylim(app.UIAxes, [min(app.yCoord), max(app.yCoord)]);
                
                % Obtener la barra de herramientas del axes
                tb = axtoolbar(app.UIAxes);
                
                % Eliminar herramientas específicas
                delete(tb.Children);
                
                imagesc(app.countsMatrix)
                disp(app.countsMatrix)
                setAppViewState(app, 'scannerFinished')
                
            catch ME
                disp('Error in scanProcessData:');
                disp(ME.message);
            end
            
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
                
                % Agregar un canal de entrada para contador
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
            end
            
        end
        
        function iniciarSesionPiezo(app)
            
            if ~(isempty(app.DAQScanSession))
                
                % Si hay una sesion asociada al scan estará usando los
                % canales del piezo. 
                
                stop(app.DAQScanSession)
                release(app.DAQScanSession)
                delete(app.DAQScanSession)
                
                app.DAQScanSession = [];
                
                iniciarSesionPiezo(app)
                
            else
                % Crear sesion para entrada y salida de voltajes en piezo
                s = daq.createSession('ni');
                
                % El orden de las coordenadas va como X, Y, Z.
                % Crear salidas analógicas
                addAnalogOutputChannel(s, 'Dev1', 'ao0', 'Voltage');
                addAnalogOutputChannel(s, 'Dev1', 'ao1', 'Voltage');
                addAnalogOutputChannel(s, 'Dev1', 'ao2', 'Voltage');
                
                % Agregar entradas analógicas
                addAnalogInputChannel(s, 'Dev1', 'ai0', 'Voltage');
                addAnalogInputChannel(s, 'Dev1', 'ai4', 'Voltage');
                addAnalogInputChannel(s, 'Dev1', 'ai16', 'Voltage');
                
                
                % Guardar session como variable de clase
                app.DAQPiezoSession = s;
            end
        end
        
        function iniciarSesionScan(app)
            
            if ~(isempty(app.DAQSession))
                % Detener sesion de traza para usar sus canales
                stop(app.DAQSession)
                release(app.DAQSession)
                delete(app.DAQSession)
                
                app.DAQSession = [];
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
            app.XvoltageEditField.Value = app.currentVoltX;
            app.YvoltageEditField.Value = app.currentVoltY;
            app.ZvoltageEditField.Value = app.currentVoltZ;
            
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
            app.XvoltageEditField.Value = app.currentVoltX;
            app.YvoltageEditField.Value = app.currentVoltY;
            
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
                    pause(0.01);
                end
            else
                % Si el desplazamiento no sobrepasa umbral de voltaje
                outputSingleScan(outChannel, voltPtoFinal);
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
            iniciarSesionReloj(app,'traza')
            
            % Crear sesión para medir la traza
            iniciarSesionTraza(app)
            
            % Crear sesión para manejar piezo
            iniciarSesionCoordenada(app,'x')
            iniciarSesionCoordenada(app,'y')
            iniciarSesionCoordenada(app,'z')
            
            %======================================================================
            %======================================================================
            
            
            actualizarVoltajes(app)
            
            app.countsMatrix = zeros(80,80);
            app.xCoord = linspace(0,80,81)';
            app.yCoord = linspace(0,80,81)';
            
            dataLoadedCallback(app)
            
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
                
                % Crear figura externa a la app para mostrar traza
                app.traceFigure = figure('Name','Traza', 'Position', [100, 100, 800, 600], ...
                         'CloseRequestFcn', @(src, event) closeTrazaCallback(app, src, event));
                
                % Obtener el handle a los ejes de la figura
                app.axesTrace = axes(app.traceFigure);
                %Hacer plot sin datos
                app.lineTrace = plot(app.axesTrace, NaN, 'LineWidth',3,"Color",'k');
                
                % Conf. título y etiquetas
                title(app.axesTrace, 'Traza');
                xlabel(app.axesTrace, 'u.a');
                ylabel(app.axesTrace, 'cuentas/s');
                
                xlim(app.axesTrace,[0, app.NBufferEditField.Value]);
                set(app.axesTrace, 'FontSize', 32);
                
                %======================================================================
                %======================================================================
                
                iniciarSesionReloj(app,'traza')
                
                % Crear listener e iniciar en 2do plano sesion de adquisición
                
                app.TraceAvailableListener = addlistener(app.DAQSession, 'DataAvailable', ...
                    @(src,event) dataAvailable_Callback(app, src, event));
                
                startBackground(app.DAQSession);
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
            
            % Detener adquisición de datos
            stop(app.DAQSession)
            
            % Eliminar e inicializar listener a array vacío
            delete(app.TraceAvailableListener);
            app.TraceAvailableListener = [];
            
            % Setear handles de gráfico de traza a array vacios
            delete(app.traceFigure)
            app.traceFigure = [];
            app.axesTrace = [];
            app.lineTrace = [];
            
            % Activar interacción con componentes de la UI
            if ~(isempty(app.DAQPiezoSession))
                setAppViewState(app, 'configuration');
                
            else
                setAppViewState(app, 'scannerFinished');
            end
            
            
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
                    disp(['Has seleccinado: ', fullPath]);
                    % Puedes agregar código adicional aquí para cargar el archivo o realizar otras acciones
                    
                    % Cargar datos para simular un escaneo
                    struct = load(fullPath);  % Corregir la variable a 'fullPath'
                    app.xCoord = struct.scan.data.x;
                    app.yCoord = struct.scan.data.y;
                    app.countsMatrix = struct.scan.data.c;
                    
                    %======================================================================
                    %======================================================================
                    
                    % Leer voltajes actuales en piezo para cada coordenada
                    actualizarVoltajes(app)
                    
                    % Llamar función que hace gráfico y configura listeners
                    dataLoadedCallback(app);
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
                
                if rightX >= min(app.xCoord) && rightX <= max(app.xCoord)
                    
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
                
                if LeftX >= min(app.xCoord) && LeftX <= max(app.xCoord)
                    
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
                
                if upY >= min(app.yCoord) && upY <= max(app.yCoord)
                    
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
                
                if DownY >= min(app.yCoord) && DownY <= max(app.yCoord)
                    
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
            %==================== P A R A M E T R O S  S C A N ==========================
            
            % Cantidad de elementos minimos en output voltaje
            dimOutput = app.ScanFreqEditField.Value * 0.5;
            
            % Tiempo que consideramos que el piezo se mueve
            settlingTime = (app.StimemsEditField.Value)/1000;
            
            % Tiempo durante el cual se considerarán cuentas válidas
            integrationTime = (app.CtimemsEditField.Value)/1000;
            
            % Cantidad de elementos en voltaje constante
            constVoltIntervalo = int64(app.ScanFreqEditField.Value * (settlingTime + integrationTime));
            
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
            updatePiezoVoltage(app, 'scan')
            
            
            
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
                desplazar(app, 'scan')
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
                app.xCoord = voltPathX * 8;
                app.yCoord = voltPathY * 8;
                
                % Voltaje de ida en X
                subidaVoltX = repelem(voltPathX, constVoltIntervalo);
                
                % Voltaje de vuelta en X
                bajadaVoltX = flip(voltPathX);
                
                % Vector con voltajes concatenados
                outVoltajeX = [subidaVoltX; bajadaVoltX];
                
                % Matriz con total de voltajes para X
                outVoltajeX = repmat(outVoltajeX, nPuntos, 1);
                
                % Periodo voltaje X
                periodoVoltX = length(outVoltajeX)/nPuntos;
                
                % Output de voltajes a entregar en el piezo en dimension Y
                outVoltajeY = repelem(voltPathY, periodoVoltX);
                
                disp(length(outVoltajeY))
                disp(length(outVoltajeX))
                
                
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
                    @(src, event) scanProcessData(app, event, idxNoCts, idxCts));
                
                queueOutputData(app.DAQScanSession,[outVoltajeX, outVoltajeY]);
                pause(1)
                startBackground(app.DAQScanSession);
                
                
                
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
            if ~(isempty(app.DAQScanSession)) || isempty(app.DAQPiezoSession)
                
                iniciarSesionCoordenada(app,'x')
                iniciarSesionCoordenada(app,'y')
                iniciarSesionCoordenada(app,'z')
                
                actualizarVoltajes(app)
                
                setAppViewState(app, 'configuration')
                
                
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
            
            % Definir los datos a guardar
            dataStruct.c = app.countsMatrix;
            dataStruct.x = app.xCoord;
            dataStruct.y = app.yCoord;
            
            % Metadata correspondiente al scan
            metadataScanStruct.posX = app.XoffsetEditField.Value;
            metadataScanStruct.posY = app.YoffsetEditField.Value;
            metadataScanStruct.scanSize = app.ScanSizeumEditField.Value;
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
            
            % Guardar datos y metadata en una estructura
            scan.data = dataStruct;
            scan.metadataMuestra = metadataMuestraStruct;
            scan.metadataScan = metadataScanStruct;
            
            % Obtener la fecha y hora actual
            timestamp = datetime('now', 'Format', 'yyyy-MM-dd_HHmmss');
            timestampStr = datestr(timestamp, 'yyyy-mm-dd_HHMMSS');
            
            % Generar el nombre del archivo
            usrName = app.SampleNameEditField.Value;
            filename = [timestampStr, '_', usrName, '_SCAN.mat'];
            
            % Obtener la carpeta actual
            currentFolder = pwd;
            
            % Generar la ruta completa del archivo
            fullPath = fullfile(currentFolder, filename);
            
            % Guardar los datos en un archivo .mat
            save(fullPath, 'scan');
            
            % Mostrar un mensaje de confirmación
            disp(['Datos guardados en: ', fullPath]);
                    
           
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
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.AutoResizeChildren = 'off';
            app.UIFigure.Position = [100 100 1602 894];
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
            app.LiveViewPanel.Layout.Row = [1 13];
            app.LiveViewPanel.Layout.Column = [7 11];

            % Create UIAxes
            app.UIAxes = uiaxes(app.LiveViewPanel);
            title(app.UIAxes, 'PL MAP')
            xlabel(app.UIAxes, 'X')
            ylabel(app.UIAxes, 'Y')
            app.UIAxes.FontSize = 16;
            app.UIAxes.FontWeight = 'bold';
            app.UIAxes.Box = 'on';
            app.UIAxes.Position = [1 98 706 633];

            % Create LoadFigureButton
            app.LoadFigureButton = uibutton(app.LiveViewPanel, 'push');
            app.LoadFigureButton.ButtonPushedFcn = createCallbackFcn(app, @LoadFigureButtonPushed, true);
            app.LoadFigureButton.BackgroundColor = [0 0 0];
            app.LoadFigureButton.FontSize = 18;
            app.LoadFigureButton.FontWeight = 'bold';
            app.LoadFigureButton.FontColor = [1 1 1];
            app.LoadFigureButton.Position = [24 745 141 43];
            app.LoadFigureButton.Text = 'Load Figure';

            % Create SetoffsetButton
            app.SetoffsetButton = uibutton(app.LiveViewPanel, 'state');
            app.SetoffsetButton.ValueChangedFcn = createCallbackFcn(app, @SetoffsetButtonValueChanged, true);
            app.SetoffsetButton.Text = 'Set offset';
            app.SetoffsetButton.BackgroundColor = [1 1 0.0667];
            app.SetoffsetButton.FontSize = 18;
            app.SetoffsetButton.FontWeight = 'bold';
            app.SetoffsetButton.Position = [205 745 141 44];

            % Create XcoordEditFieldLabel
            app.XcoordEditFieldLabel = uilabel(app.LiveViewPanel);
            app.XcoordEditFieldLabel.HorizontalAlignment = 'right';
            app.XcoordEditFieldLabel.FontSize = 18;
            app.XcoordEditFieldLabel.FontWeight = 'bold';
            app.XcoordEditFieldLabel.Position = [6 64 78 22];
            app.XcoordEditFieldLabel.Text = 'X coord.';

            % Create XcoordEditField
            app.XcoordEditField = uieditfield(app.LiveViewPanel, 'numeric');
            app.XcoordEditField.ValueDisplayFormat = '%.3f';
            app.XcoordEditField.Editable = 'off';
            app.XcoordEditField.FontSize = 18;
            app.XcoordEditField.FontWeight = 'bold';
            app.XcoordEditField.Position = [99 63 100 23];

            % Create YcoordEditFieldLabel
            app.YcoordEditFieldLabel = uilabel(app.LiveViewPanel);
            app.YcoordEditFieldLabel.HorizontalAlignment = 'right';
            app.YcoordEditFieldLabel.FontSize = 18;
            app.YcoordEditFieldLabel.FontWeight = 'bold';
            app.YcoordEditFieldLabel.Position = [261 63 78 22];
            app.YcoordEditFieldLabel.Text = 'Y coord.';

            % Create YcoordEditField
            app.YcoordEditField = uieditfield(app.LiveViewPanel, 'numeric');
            app.YcoordEditField.ValueDisplayFormat = '%.3f';
            app.YcoordEditField.Editable = 'off';
            app.YcoordEditField.FontSize = 18;
            app.YcoordEditField.FontWeight = 'bold';
            app.YcoordEditField.Position = [354 63 100 23];

            % Create XvoltageEditFieldLabel
            app.XvoltageEditFieldLabel = uilabel(app.LiveViewPanel);
            app.XvoltageEditFieldLabel.HorizontalAlignment = 'right';
            app.XvoltageEditFieldLabel.FontSize = 18;
            app.XvoltageEditFieldLabel.FontWeight = 'bold';
            app.XvoltageEditFieldLabel.Position = [1 20 86 22];
            app.XvoltageEditFieldLabel.Text = 'X voltage';

            % Create XvoltageEditField
            app.XvoltageEditField = uieditfield(app.LiveViewPanel, 'numeric');
            app.XvoltageEditField.ValueDisplayFormat = '%.3f';
            app.XvoltageEditField.Editable = 'off';
            app.XvoltageEditField.FontSize = 18;
            app.XvoltageEditField.Position = [102 19 100 23];

            % Create YvoltageEditFieldLabel
            app.YvoltageEditFieldLabel = uilabel(app.LiveViewPanel);
            app.YvoltageEditFieldLabel.HorizontalAlignment = 'right';
            app.YvoltageEditFieldLabel.FontSize = 18;
            app.YvoltageEditFieldLabel.FontWeight = 'bold';
            app.YvoltageEditFieldLabel.Position = [256 21 86 22];
            app.YvoltageEditFieldLabel.Text = 'Y voltage';

            % Create YvoltageEditField
            app.YvoltageEditField = uieditfield(app.LiveViewPanel, 'numeric');
            app.YvoltageEditField.ValueDisplayFormat = '%.3f';
            app.YvoltageEditField.Editable = 'off';
            app.YvoltageEditField.FontSize = 18;
            app.YvoltageEditField.Position = [357 20 100 23];

            % Create ZcoordEditFieldLabel
            app.ZcoordEditFieldLabel = uilabel(app.LiveViewPanel);
            app.ZcoordEditFieldLabel.HorizontalAlignment = 'right';
            app.ZcoordEditFieldLabel.FontSize = 18;
            app.ZcoordEditFieldLabel.FontWeight = 'bold';
            app.ZcoordEditFieldLabel.Position = [503 63 76 22];
            app.ZcoordEditFieldLabel.Text = 'Z coord.';

            % Create ZcoordEditField
            app.ZcoordEditField = uieditfield(app.LiveViewPanel, 'numeric');
            app.ZcoordEditField.ValueDisplayFormat = '%.3f';
            app.ZcoordEditField.Editable = 'off';
            app.ZcoordEditField.FontSize = 18;
            app.ZcoordEditField.FontWeight = 'bold';
            app.ZcoordEditField.Position = [594 63 100 23];

            % Create ZvoltageEditFieldLabel
            app.ZvoltageEditFieldLabel = uilabel(app.LiveViewPanel);
            app.ZvoltageEditFieldLabel.HorizontalAlignment = 'right';
            app.ZvoltageEditFieldLabel.FontSize = 18;
            app.ZvoltageEditFieldLabel.FontWeight = 'bold';
            app.ZvoltageEditFieldLabel.Position = [498 20 85 22];
            app.ZvoltageEditFieldLabel.Text = 'Z voltage';

            % Create ZvoltageEditField
            app.ZvoltageEditField = uieditfield(app.LiveViewPanel, 'numeric');
            app.ZvoltageEditField.ValueDisplayFormat = '%.3f';
            app.ZvoltageEditField.Editable = 'off';
            app.ZvoltageEditField.FontSize = 18;
            app.ZvoltageEditField.Position = [598 19 100 23];

            % Create MinColorbarEditFieldLabel
            app.MinColorbarEditFieldLabel = uilabel(app.LiveViewPanel);
            app.MinColorbarEditFieldLabel.HorizontalAlignment = 'center';
            app.MinColorbarEditFieldLabel.FontSize = 18;
            app.MinColorbarEditFieldLabel.FontWeight = 'bold';
            app.MinColorbarEditFieldLabel.Position = [420 760 121 22];
            app.MinColorbarEditFieldLabel.Text = 'Min. Colorbar';

            % Create MinColorbarEditField
            app.MinColorbarEditField = uieditfield(app.LiveViewPanel, 'numeric');
            app.MinColorbarEditField.ValueChangedFcn = createCallbackFcn(app, @MinColorbarEditFieldValueChanged, true);
            app.MinColorbarEditField.FontSize = 18;
            app.MinColorbarEditField.FontWeight = 'bold';
            app.MinColorbarEditField.Position = [459 730 44 23];

            % Create MaxColorbarEditFieldLabel
            app.MaxColorbarEditFieldLabel = uilabel(app.LiveViewPanel);
            app.MaxColorbarEditFieldLabel.HorizontalAlignment = 'center';
            app.MaxColorbarEditFieldLabel.FontSize = 18;
            app.MaxColorbarEditFieldLabel.FontWeight = 'bold';
            app.MaxColorbarEditFieldLabel.Position = [570.5 760 126 22];
            app.MaxColorbarEditFieldLabel.Text = 'Max. Colorbar';

            % Create MaxColorbarEditField
            app.MaxColorbarEditField = uieditfield(app.LiveViewPanel, 'numeric');
            app.MaxColorbarEditField.ValueChangedFcn = createCallbackFcn(app, @MaxColorbarEditFieldValueChanged, true);
            app.MaxColorbarEditField.FontSize = 18;
            app.MaxColorbarEditField.FontWeight = 'bold';
            app.MaxColorbarEditField.Position = [612 730 44 23];

            % Create PanelTraza
            app.PanelTraza = uipanel(app.GridLayout);
            app.PanelTraza.AutoResizeChildren = 'off';
            app.PanelTraza.Title = 'Panel2';
            app.PanelTraza.Layout.Row = [6 10];
            app.PanelTraza.Layout.Column = [1 3];

            % Create StartTraceButton
            app.StartTraceButton = uibutton(app.PanelTraza, 'push');
            app.StartTraceButton.ButtonPushedFcn = createCallbackFcn(app, @StartTraceButtonPushed, true);
            app.StartTraceButton.BackgroundColor = [0.4235 0.902 0.0824];
            app.StartTraceButton.FontSize = 20;
            app.StartTraceButton.FontWeight = 'bold';
            app.StartTraceButton.Position = [23 234 119 40];
            app.StartTraceButton.Text = 'Start Trace';

            % Create StopTraceButton
            app.StopTraceButton = uibutton(app.PanelTraza, 'state');
            app.StopTraceButton.ValueChangedFcn = createCallbackFcn(app, @StopTraceButtonValueChanged, true);
            app.StopTraceButton.Text = 'Stop Trace';
            app.StopTraceButton.BackgroundColor = [0.9804 0.0784 0.0784];
            app.StopTraceButton.FontSize = 20;
            app.StopTraceButton.FontWeight = 'bold';
            app.StopTraceButton.Position = [152 233 122 41];

            % Create IntTimemsEditFieldLabel
            app.IntTimemsEditFieldLabel = uilabel(app.PanelTraza);
            app.IntTimemsEditFieldLabel.HorizontalAlignment = 'right';
            app.IntTimemsEditFieldLabel.FontSize = 18;
            app.IntTimemsEditFieldLabel.FontWeight = 'bold';
            app.IntTimemsEditFieldLabel.Position = [17 176 122 22];
            app.IntTimemsEditFieldLabel.Text = 'Int. Time (ms)';

            % Create IntTimemsEditField
            app.IntTimemsEditField = uieditfield(app.PanelTraza, 'numeric');
            app.IntTimemsEditField.Limits = [0.0005 1000];
            app.IntTimemsEditField.ValueChangedFcn = createCallbackFcn(app, @IntTimemsEditFieldValueChanged, true);
            app.IntTimemsEditField.FontSize = 18;
            app.IntTimemsEditField.Position = [163 175 54 23];
            app.IntTimemsEditField.Value = 2;

            % Create NBufferEditFieldLabel
            app.NBufferEditFieldLabel = uilabel(app.PanelTraza);
            app.NBufferEditFieldLabel.HorizontalAlignment = 'right';
            app.NBufferEditFieldLabel.FontSize = 18;
            app.NBufferEditFieldLabel.FontWeight = 'bold';
            app.NBufferEditFieldLabel.Position = [257 176 76 22];
            app.NBufferEditFieldLabel.Text = 'N Buffer';

            % Create NBufferEditField
            app.NBufferEditField = uieditfield(app.PanelTraza, 'numeric');
            app.NBufferEditField.Limits = [25 1000];
            app.NBufferEditField.ValueDisplayFormat = '%.0f';
            app.NBufferEditField.ValueChangedFcn = createCallbackFcn(app, @NBufferEditFieldValueChanged, true);
            app.NBufferEditField.FontSize = 18;
            app.NBufferEditField.Position = [356 175 54 23];
            app.NBufferEditField.Value = 50;

            % Create NotifyScansSpinnerLabel
            app.NotifyScansSpinnerLabel = uilabel(app.PanelTraza);
            app.NotifyScansSpinnerLabel.HorizontalAlignment = 'right';
            app.NotifyScansSpinnerLabel.FontSize = 18;
            app.NotifyScansSpinnerLabel.FontWeight = 'bold';
            app.NotifyScansSpinnerLabel.Position = [17 135 115 22];
            app.NotifyScansSpinnerLabel.Text = 'Notify Scans';

            % Create NotifyScansSpinner
            app.NotifyScansSpinner = uispinner(app.PanelTraza);
            app.NotifyScansSpinner.Limits = [25 50000];
            app.NotifyScansSpinner.ValueDisplayFormat = '%g';
            app.NotifyScansSpinner.ValueChangedFcn = createCallbackFcn(app, @NotifyScansSpinnerValueChanged, true);
            app.NotifyScansSpinner.FontSize = 18;
            app.NotifyScansSpinner.Position = [163 134 62 23];
            app.NotifyScansSpinner.Value = 50;

            % Create MeanEditFieldLabel
            app.MeanEditFieldLabel = uilabel(app.PanelTraza);
            app.MeanEditFieldLabel.HorizontalAlignment = 'right';
            app.MeanEditFieldLabel.FontSize = 28;
            app.MeanEditFieldLabel.FontWeight = 'bold';
            app.MeanEditFieldLabel.Position = [73 72 77 34];
            app.MeanEditFieldLabel.Text = 'Mean';

            % Create MeanEditField
            app.MeanEditField = uieditfield(app.PanelTraza, 'numeric');
            app.MeanEditField.ValueDisplayFormat = '%.2e';
            app.MeanEditField.Editable = 'off';
            app.MeanEditField.FontSize = 28;
            app.MeanEditField.FontWeight = 'bold';
            app.MeanEditField.Position = [165 72 180 34];

            % Create STDEditFieldLabel
            app.STDEditFieldLabel = uilabel(app.PanelTraza);
            app.STDEditFieldLabel.HorizontalAlignment = 'right';
            app.STDEditFieldLabel.FontSize = 28;
            app.STDEditFieldLabel.FontWeight = 'bold';
            app.STDEditFieldLabel.Position = [73 9 61 34];
            app.STDEditFieldLabel.Text = 'STD';

            % Create STDEditField
            app.STDEditField = uieditfield(app.PanelTraza, 'numeric');
            app.STDEditField.ValueDisplayFormat = '%.2e';
            app.STDEditField.Editable = 'off';
            app.STDEditField.FontSize = 28;
            app.STDEditField.FontWeight = 'bold';
            app.STDEditField.Position = [166 9 179 34];

            % Create SavingDataSwitchLabel
            app.SavingDataSwitchLabel = uilabel(app.PanelTraza);
            app.SavingDataSwitchLabel.HorizontalAlignment = 'center';
            app.SavingDataSwitchLabel.FontSize = 18;
            app.SavingDataSwitchLabel.FontWeight = 'bold';
            app.SavingDataSwitchLabel.Position = [305 252 109 22];
            app.SavingDataSwitchLabel.Text = 'Saving Data';

            % Create SavingDataSwitch
            app.SavingDataSwitch = uiswitch(app.PanelTraza, 'slider');
            app.SavingDataSwitch.ValueChangedFcn = createCallbackFcn(app, @SavingDataSwitchValueChanged, true);
            app.SavingDataSwitch.FontSize = 18;
            app.SavingDataSwitch.Position = [334 231 51 22];

            % Create Panel3
            app.Panel3 = uipanel(app.GridLayout);
            app.Panel3.AutoResizeChildren = 'off';
            app.Panel3.Title = 'Panel3';
            app.Panel3.Layout.Row = [11 12];
            app.Panel3.Layout.Column = [1 3];

            % Create Panel4
            app.Panel4 = uipanel(app.GridLayout);
            app.Panel4.AutoResizeChildren = 'off';
            app.Panel4.Title = 'Panel4';
            app.Panel4.Layout.Row = [1 5];
            app.Panel4.Layout.Column = [1 6];

            % Create ScanButton
            app.ScanButton = uibutton(app.Panel4, 'push');
            app.ScanButton.ButtonPushedFcn = createCallbackFcn(app, @ScanButtonPushed, true);
            app.ScanButton.BackgroundColor = [0 1 0];
            app.ScanButton.FontSize = 20;
            app.ScanButton.FontWeight = 'bold';
            app.ScanButton.Position = [12 223 138 45];
            app.ScanButton.Text = 'Scan';

            % Create ScanSizeumEditFieldLabel
            app.ScanSizeumEditFieldLabel = uilabel(app.Panel4);
            app.ScanSizeumEditFieldLabel.HorizontalAlignment = 'right';
            app.ScanSizeumEditFieldLabel.FontSize = 18;
            app.ScanSizeumEditFieldLabel.FontWeight = 'bold';
            app.ScanSizeumEditFieldLabel.Position = [12 129 134 22];
            app.ScanSizeumEditFieldLabel.Text = 'Scan Size (um)';

            % Create ScanSizeumEditField
            app.ScanSizeumEditField = uieditfield(app.Panel4, 'numeric');
            app.ScanSizeumEditField.Limits = [2 100];
            app.ScanSizeumEditField.FontSize = 18;
            app.ScanSizeumEditField.Position = [159 129 54 23];
            app.ScanSizeumEditField.Value = 50;

            % Create ScanFreqEditFieldLabel
            app.ScanFreqEditFieldLabel = uilabel(app.Panel4);
            app.ScanFreqEditFieldLabel.HorizontalAlignment = 'right';
            app.ScanFreqEditFieldLabel.FontSize = 18;
            app.ScanFreqEditFieldLabel.FontWeight = 'bold';
            app.ScanFreqEditFieldLabel.Position = [519 93 98 22];
            app.ScanFreqEditFieldLabel.Text = 'Scan Freq.';

            % Create ScanFreqEditField
            app.ScanFreqEditField = uieditfield(app.Panel4, 'numeric');
            app.ScanFreqEditField.Limits = [100 100000];
            app.ScanFreqEditField.ValueDisplayFormat = '%.2e';
            app.ScanFreqEditField.FontSize = 18;
            app.ScanFreqEditField.Position = [691 93 98 23];
            app.ScanFreqEditField.Value = 50000;

            % Create XoffsetEditFieldLabel
            app.XoffsetEditFieldLabel = uilabel(app.Panel4);
            app.XoffsetEditFieldLabel.HorizontalAlignment = 'right';
            app.XoffsetEditFieldLabel.FontSize = 20;
            app.XoffsetEditFieldLabel.FontWeight = 'bold';
            app.XoffsetEditFieldLabel.Position = [11 166 79 24];
            app.XoffsetEditFieldLabel.Text = 'X offset';

            % Create XoffsetEditField
            app.XoffsetEditField = uieditfield(app.Panel4, 'numeric');
            app.XoffsetEditField.Limits = [0 80];
            app.XoffsetEditField.ValueDisplayFormat = '%.3f';
            app.XoffsetEditField.FontSize = 20;
            app.XoffsetEditField.Position = [125 166 87 25];
            app.XoffsetEditField.Value = 40;

            % Create YoffsetEditFieldLabel
            app.YoffsetEditFieldLabel = uilabel(app.Panel4);
            app.YoffsetEditFieldLabel.HorizontalAlignment = 'right';
            app.YoffsetEditFieldLabel.FontSize = 20;
            app.YoffsetEditFieldLabel.FontWeight = 'bold';
            app.YoffsetEditFieldLabel.Position = [249 166 79 24];
            app.YoffsetEditFieldLabel.Text = 'Y offset';

            % Create YoffsetEditField
            app.YoffsetEditField = uieditfield(app.Panel4, 'numeric');
            app.YoffsetEditField.Limits = [0 80];
            app.YoffsetEditField.ValueDisplayFormat = '%.3f';
            app.YoffsetEditField.FontSize = 20;
            app.YoffsetEditField.Position = [363 166 87 25];
            app.YoffsetEditField.Value = 40;

            % Create StopscanButton
            app.StopscanButton = uibutton(app.Panel4, 'push');
            app.StopscanButton.ButtonPushedFcn = createCallbackFcn(app, @StopscanButtonPushed, true);
            app.StopscanButton.BackgroundColor = [0.9804 0.0784 0.0784];
            app.StopscanButton.FontSize = 20;
            app.StopscanButton.FontWeight = 'bold';
            app.StopscanButton.Position = [312 223 138 45];
            app.StopscanButton.Text = 'Stop scan';

            % Create ScanNpixelsEditFieldLabel
            app.ScanNpixelsEditFieldLabel = uilabel(app.Panel4);
            app.ScanNpixelsEditFieldLabel.HorizontalAlignment = 'right';
            app.ScanNpixelsEditFieldLabel.FontSize = 18;
            app.ScanNpixelsEditFieldLabel.FontWeight = 'bold';
            app.ScanNpixelsEditFieldLabel.Position = [249 129 128 22];
            app.ScanNpixelsEditFieldLabel.Text = 'Scan N. pixels';

            % Create ScanNpixelsEditField
            app.ScanNpixelsEditField = uieditfield(app.Panel4, 'numeric');
            app.ScanNpixelsEditField.Limits = [1 1000];
            app.ScanNpixelsEditField.FontSize = 18;
            app.ScanNpixelsEditField.Position = [396 129 54 23];
            app.ScanNpixelsEditField.Value = 30;

            % Create CtimemsEditFieldLabel
            app.CtimemsEditFieldLabel = uilabel(app.Panel4);
            app.CtimemsEditFieldLabel.HorizontalAlignment = 'right';
            app.CtimemsEditFieldLabel.FontSize = 18;
            app.CtimemsEditFieldLabel.FontWeight = 'bold';
            app.CtimemsEditFieldLabel.Position = [249 93 109 22];
            app.CtimemsEditFieldLabel.Text = 'C. time (ms)';

            % Create CtimemsEditField
            app.CtimemsEditField = uieditfield(app.Panel4, 'numeric');
            app.CtimemsEditField.Limits = [0.0005 1000];
            app.CtimemsEditField.FontSize = 18;
            app.CtimemsEditField.Position = [396 93 54 23];
            app.CtimemsEditField.Value = 1;

            % Create StimemsEditFieldLabel
            app.StimemsEditFieldLabel = uilabel(app.Panel4);
            app.StimemsEditFieldLabel.HorizontalAlignment = 'right';
            app.StimemsEditFieldLabel.FontSize = 18;
            app.StimemsEditFieldLabel.FontWeight = 'bold';
            app.StimemsEditFieldLabel.Position = [11 93 108 22];
            app.StimemsEditFieldLabel.Text = 'S. time (ms)';

            % Create StimemsEditField
            app.StimemsEditField = uieditfield(app.Panel4, 'numeric');
            app.StimemsEditField.Limits = [0.0005 1000];
            app.StimemsEditField.FontSize = 18;
            app.StimemsEditField.Position = [158 93 54 23];
            app.StimemsEditField.Value = 2;

            % Create SaveScanButton
            app.SaveScanButton = uibutton(app.Panel4, 'push');
            app.SaveScanButton.ButtonPushedFcn = createCallbackFcn(app, @SaveScanButtonPushed, true);
            app.SaveScanButton.BackgroundColor = [0.1686 0.549 0.9294];
            app.SaveScanButton.FontSize = 20;
            app.SaveScanButton.FontWeight = 'bold';
            app.SaveScanButton.Position = [162 223 138 45];
            app.SaveScanButton.Text = 'Save Scan';

            % Create SampleNameEditFieldLabel
            app.SampleNameEditFieldLabel = uilabel(app.Panel4);
            app.SampleNameEditFieldLabel.HorizontalAlignment = 'right';
            app.SampleNameEditFieldLabel.FontSize = 18;
            app.SampleNameEditFieldLabel.FontWeight = 'bold';
            app.SampleNameEditFieldLabel.Position = [10 57 124 22];
            app.SampleNameEditFieldLabel.Text = 'Sample Name';

            % Create SampleNameEditField
            app.SampleNameEditField = uieditfield(app.Panel4, 'text');
            app.SampleNameEditField.HorizontalAlignment = 'right';
            app.SampleNameEditField.FontSize = 18;
            app.SampleNameEditField.Position = [156 55 296 26];
            app.SampleNameEditField.Value = 'sampleName';

            % Create FilterNameEditFieldLabel
            app.FilterNameEditFieldLabel = uilabel(app.Panel4);
            app.FilterNameEditFieldLabel.HorizontalAlignment = 'right';
            app.FilterNameEditFieldLabel.FontSize = 18;
            app.FilterNameEditFieldLabel.FontWeight = 'bold';
            app.FilterNameEditFieldLabel.Position = [12 15 104 22];
            app.FilterNameEditFieldLabel.Text = 'Filter Name';

            % Create FilterNameEditField
            app.FilterNameEditField = uieditfield(app.Panel4, 'text');
            app.FilterNameEditField.HorizontalAlignment = 'right';
            app.FilterNameEditField.FontSize = 18;
            app.FilterNameEditField.Position = [156 13 296 26];
            app.FilterNameEditField.Value = 'filterName';

            % Create DetectorEditFieldLabel
            app.DetectorEditFieldLabel = uilabel(app.Panel4);
            app.DetectorEditFieldLabel.HorizontalAlignment = 'right';
            app.DetectorEditFieldLabel.FontSize = 18;
            app.DetectorEditFieldLabel.FontWeight = 'bold';
            app.DetectorEditFieldLabel.Position = [519 129 79 22];
            app.DetectorEditFieldLabel.Text = 'Detector';

            % Create DetectorEditField
            app.DetectorEditField = uieditfield(app.Panel4, 'text');
            app.DetectorEditField.HorizontalAlignment = 'right';
            app.DetectorEditField.FontSize = 18;
            app.DetectorEditField.Position = [692 127 97 26];
            app.DetectorEditField.Value = 'APD';

            % Create PoweruWEditFieldLabel
            app.PoweruWEditFieldLabel = uilabel(app.Panel4);
            app.PoweruWEditFieldLabel.HorizontalAlignment = 'right';
            app.PoweruWEditFieldLabel.FontSize = 18;
            app.PoweruWEditFieldLabel.FontWeight = 'bold';
            app.PoweruWEditFieldLabel.Position = [519 57 104 22];
            app.PoweruWEditFieldLabel.Text = 'Power (uW)';

            % Create PoweruWEditField
            app.PoweruWEditField = uieditfield(app.Panel4, 'numeric');
            app.PoweruWEditField.FontSize = 18;
            app.PoweruWEditField.Position = [691 57 98 23];
            app.PoweruWEditField.Value = 2;

            % Create WavelengthnmEditFieldLabel
            app.WavelengthnmEditFieldLabel = uilabel(app.Panel4);
            app.WavelengthnmEditFieldLabel.HorizontalAlignment = 'right';
            app.WavelengthnmEditFieldLabel.FontSize = 18;
            app.WavelengthnmEditFieldLabel.FontWeight = 'bold';
            app.WavelengthnmEditFieldLabel.Position = [519 16 150 22];
            app.WavelengthnmEditFieldLabel.Text = 'Wavelength (nm)';

            % Create WavelengthnmEditField
            app.WavelengthnmEditField = uieditfield(app.Panel4, 'numeric');
            app.WavelengthnmEditField.FontSize = 18;
            app.WavelengthnmEditField.Position = [692 14 97 23];
            app.WavelengthnmEditField.Value = 532;

            % Create RemainingTimeScansEditFieldLabel
            app.RemainingTimeScansEditFieldLabel = uilabel(app.Panel4);
            app.RemainingTimeScansEditFieldLabel.HorizontalAlignment = 'center';
            app.RemainingTimeScansEditFieldLabel.FontSize = 20;
            app.RemainingTimeScansEditFieldLabel.FontWeight = 'bold';
            app.RemainingTimeScansEditFieldLabel.Position = [530 244 245 24];
            app.RemainingTimeScansEditFieldLabel.Text = 'Remaining Time Scan (s)';

            % Create RemainingTimeScansEditField
            app.RemainingTimeScansEditField = uieditfield(app.Panel4, 'numeric');
            app.RemainingTimeScansEditField.Editable = 'off';
            app.RemainingTimeScansEditField.HorizontalAlignment = 'center';
            app.RemainingTimeScansEditField.FontSize = 20;
            app.RemainingTimeScansEditField.FontWeight = 'bold';
            app.RemainingTimeScansEditField.Position = [604 201 100 25];

            % Create Panel5
            app.Panel5 = uipanel(app.GridLayout);
            app.Panel5.AutoResizeChildren = 'off';
            app.Panel5.Title = 'Panel5';
            app.Panel5.Layout.Row = [6 12];
            app.Panel5.Layout.Column = [4 6];

            % Create UpYButton
            app.UpYButton = uibutton(app.Panel5, 'state');
            app.UpYButton.ValueChangedFcn = createCallbackFcn(app, @UpYButtonValueChanged, true);
            app.UpYButton.Text = 'Up Y';
            app.UpYButton.FontSize = 15;
            app.UpYButton.FontWeight = 'bold';
            app.UpYButton.Position = [115 214 100 26];

            % Create DownYButton
            app.DownYButton = uibutton(app.Panel5, 'state');
            app.DownYButton.ValueChangedFcn = createCallbackFcn(app, @DownYButtonValueChanged, true);
            app.DownYButton.Text = 'Down Y';
            app.DownYButton.FontSize = 15;
            app.DownYButton.FontWeight = 'bold';
            app.DownYButton.Position = [115 138 100 26];

            % Create RightXButton
            app.RightXButton = uibutton(app.Panel5, 'state');
            app.RightXButton.ValueChangedFcn = createCallbackFcn(app, @RightXButtonValueChanged, true);
            app.RightXButton.Text = 'Right X';
            app.RightXButton.FontSize = 15;
            app.RightXButton.FontWeight = 'bold';
            app.RightXButton.Position = [214 176 100 26];

            % Create LeftXButton
            app.LeftXButton = uibutton(app.Panel5, 'state');
            app.LeftXButton.ValueChangedFcn = createCallbackFcn(app, @LeftXButtonValueChanged, true);
            app.LeftXButton.Text = 'Left X';
            app.LeftXButton.FontSize = 15;
            app.LeftXButton.FontWeight = 'bold';
            app.LeftXButton.Position = [15 176 100 26];

            % Create DecZButton
            app.DecZButton = uibutton(app.Panel5, 'state');
            app.DecZButton.ValueChangedFcn = createCallbackFcn(app, @DecZButtonValueChanged, true);
            app.DecZButton.Text = 'Dec. Z';
            app.DecZButton.BackgroundColor = [0.9804 0.0784 0.0784];
            app.DecZButton.FontSize = 18;
            app.DecZButton.FontWeight = 'bold';
            app.DecZButton.Position = [309 12 100 29];

            % Create IncZButton
            app.IncZButton = uibutton(app.Panel5, 'state');
            app.IncZButton.ValueChangedFcn = createCallbackFcn(app, @IncZButtonValueChanged, true);
            app.IncZButton.Text = 'Inc. Z';
            app.IncZButton.BackgroundColor = [0.1686 0.549 0.9294];
            app.IncZButton.FontSize = 18;
            app.IncZButton.FontWeight = 'bold';
            app.IncZButton.Position = [309 334 100 29];

            % Create MovenmEditFieldLabel
            app.MovenmEditFieldLabel = uilabel(app.Panel5);
            app.MovenmEditFieldLabel.HorizontalAlignment = 'right';
            app.MovenmEditFieldLabel.FontSize = 18;
            app.MovenmEditFieldLabel.FontWeight = 'bold';
            app.MovenmEditFieldLabel.Position = [60 291 95 22];
            app.MovenmEditFieldLabel.Text = {'Move (nm)'; ''};

            % Create MovenmEditField
            app.MovenmEditField = uieditfield(app.Panel5, 'numeric');
            app.MovenmEditField.Limits = [0 2000];
            app.MovenmEditField.ValueDisplayFormat = '%11.3g';
            app.MovenmEditField.FontSize = 18;
            app.MovenmEditField.FontWeight = 'bold';
            app.MovenmEditField.Position = [170 290 100 23];
            app.MovenmEditField.Value = 30;

            % Create MaxZEditFieldLabel
            app.MaxZEditFieldLabel = uilabel(app.Panel5);
            app.MaxZEditFieldLabel.HorizontalAlignment = 'right';
            app.MaxZEditFieldLabel.FontSize = 18;
            app.MaxZEditFieldLabel.FontWeight = 'bold';
            app.MaxZEditFieldLabel.Position = [78 71 62 22];
            app.MaxZEditFieldLabel.Text = 'Max. Z';

            % Create MaxZEditField
            app.MaxZEditField = uieditfield(app.Panel5, 'numeric');
            app.MaxZEditField.Limits = [0 80];
            app.MaxZEditField.ValueChangedFcn = createCallbackFcn(app, @MaxZEditFieldValueChanged, true);
            app.MaxZEditField.FontSize = 18;
            app.MaxZEditField.FontWeight = 'bold';
            app.MaxZEditField.Position = [93 40 44 23];
            app.MaxZEditField.Value = 80;

            % Create MinZEditFieldLabel
            app.MinZEditFieldLabel = uilabel(app.Panel5);
            app.MinZEditFieldLabel.HorizontalAlignment = 'right';
            app.MinZEditFieldLabel.FontSize = 18;
            app.MinZEditFieldLabel.FontWeight = 'bold';
            app.MinZEditFieldLabel.Position = [200 71 57 22];
            app.MinZEditFieldLabel.Text = 'Min. Z';

            % Create MinZEditField
            app.MinZEditField = uieditfield(app.Panel5, 'numeric');
            app.MinZEditField.Limits = [0 80];
            app.MinZEditField.ValueChangedFcn = createCallbackFcn(app, @MinZEditFieldValueChanged, true);
            app.MinZEditField.FontSize = 18;
            app.MinZEditField.FontWeight = 'bold';
            app.MinZEditField.Position = [210 40 44 23];

            % Create ActPanelButton
            app.ActPanelButton = uibutton(app.Panel5, 'push');
            app.ActPanelButton.ButtonPushedFcn = createCallbackFcn(app, @ActPanelButtonPushed, true);
            app.ActPanelButton.BackgroundColor = [1 0.4118 0.1608];
            app.ActPanelButton.FontSize = 18;
            app.ActPanelButton.FontWeight = 'bold';
            app.ActPanelButton.Position = [15 360 133 44];
            app.ActPanelButton.Text = 'Act. Panel';

            % Create Goto000Button
            app.Goto000Button = uibutton(app.Panel5, 'state');
            app.Goto000Button.ValueChangedFcn = createCallbackFcn(app, @Goto000ButtonValueChanged, true);
            app.Goto000Button.Text = 'Go to (0, 0, 0)';
            app.Goto000Button.BackgroundColor = [0.2157 0.9804 0.1765];
            app.Goto000Button.FontSize = 18;
            app.Goto000Button.FontWeight = 'bold';
            app.Goto000Button.Position = [164 360 129 44];

            % Create ZSliderLabel
            app.ZSliderLabel = uilabel(app.Panel5);
            app.ZSliderLabel.HorizontalAlignment = 'right';
            app.ZSliderLabel.FontSize = 18;
            app.ZSliderLabel.FontWeight = 'bold';
            app.ZSliderLabel.Position = [309 175 25 22];
            app.ZSliderLabel.Text = 'Z';

            % Create ZSlider
            app.ZSlider = uislider(app.Panel5);
            app.ZSlider.Limits = [0 80];
            app.ZSlider.Orientation = 'vertical';
            app.ZSlider.ValueChangingFcn = createCallbackFcn(app, @ZSliderValueChanging, true);
            app.ZSlider.FontSize = 18;
            app.ZSlider.FontWeight = 'bold';
            app.ZSlider.Position = [350 59 3 254];

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