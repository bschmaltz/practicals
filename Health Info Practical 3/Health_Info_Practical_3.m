function varargout = Health_Info_Practical_3(varargin)
% HEALTH_INFO_PRACTICAL_3 MATLAB code for Health_Info_Practical_3.fig
%      HEALTH_INFO_PRACTICAL_3, by itself, creates a new HEALTH_INFO_PRACTICAL_3 or raises the existing
%      singleton*.
%
%      H = HEALTH_INFO_PRACTICAL_3 returns the handle to a new HEALTH_INFO_PRACTICAL_3 or the handle to
%      the existing singleton*.
%
%      HEALTH_INFO_PRACTICAL_3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HEALTH_INFO_PRACTICAL_3.M with the given input arguments.
%
%      HEALTH_INFO_PRACTICAL_3('Property','Value',...) creates a new HEALTH_INFO_PRACTICAL_3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Health_Info_Practical_3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Health_Info_Practical_3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Health_Info_Practical_3

% Last Modified by GUIDE v2.5 21-Nov-2013 21:19:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Health_Info_Practical_3_OpeningFcn, ...
                   'gui_OutputFcn',  @Health_Info_Practical_3_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Health_Info_Practical_3 is made visible.
function Health_Info_Practical_3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Health_Info_Practical_3 (see VARARGIN)

% Choose default command line output for Health_Info_Practical_3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Health_Info_Practical_3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = Health_Info_Practical_3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function start_time_Callback(hObject, eventdata, handles)
% hObject    handle to start_time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of start_time as text
%        str2double(get(hObject,'String')) returns contents of start_time as a double


% --- Executes during object creation, after setting all properties.
function start_time_CreateFcn(hObject, eventdata, handles)
% hObject    handle to start_time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function end_time_Callback(hObject, eventdata, handles)
% hObject    handle to end_time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of end_time as text
%        str2double(get(hObject,'String')) returns contents of end_time as a double


% --- Executes during object creation, after setting all properties.
function end_time_CreateFcn(hObject, eventdata, handles)
% hObject    handle to end_time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function hr_Callback(hObject, eventdata, handles)
% hObject    handle to hr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hr as text
%        str2double(get(hObject,'String')) returns contents of hr as a double


% --- Executes during object creation, after setting all properties.
function hr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function avg_rr_Callback(hObject, eventdata, handles)
% hObject    handle to avg_rr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of avg_rr as text
%        str2double(get(hObject,'String')) returns contents of avg_rr as a double


% --- Executes during object creation, after setting all properties.
function avg_rr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to avg_rr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in quit.
function quit_Callback(hObject, eventdata, handles)
% hObject    handle to quit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;

% --- Executes on button press in save.
function save_Callback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isfield(handles,'hr')
    processed = handles.processed_data;
    avg_rr = get(handles.avg_rr, 'String');
    hr = get(handles.hr, 'String');
    start = get(handles.start_time, 'String');
    stop = get(handles.end_time, 'String');
    uisave({'processed', 'avg_rr', 'hr', 'start', 'stop'},'health practical 1 save');
else
	disp 'load a wave';
end

% --- Executes on selection change in waveform.
function waveform_Callback(hObject, eventdata, handles)
% hObject    handle to waveform (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns waveform contents as cell array
%        contents{get(hObject,'Value')} returns selected item from waveform
start = str2num(get(handles.start_time, 'String'));
stop = str2num(get(handles.end_time, 'String'));
if isempty(start)||isempty(stop)|| stop<=start || start<0 || stop>50000
  disp('enter a legal start and stop time');
  return
end
    wave_num = get(hObject,'Value')-1;

    %% Get Waveform
    disp('Retrieving data')
    annotator = 'atr';
    record = strcat('mitdb/10', num2str(wave_num));
    start = str2num(get(handles.start_time, 'String'));
    stop = str2num(get(handles.end_time, 'String'));

    Q = rdann(record, annotator);
    sfreq = Q(1).sampleNumber ./ Q(1).timeInSeconds;

    startStr = datestr(start/86400, 'HH:MM:SS');
    stopStr = datestr(stop/86400, 'HH:MM:SS');
        
    RAW = rdsamp(record, 'begin', startStr, 'stop', stopStr);
    t = 1:size(RAW,1);
    t = t / sfreq;
    M = size(RAW,1);

    disp('Data retrieved, starting analysis')
    axes(handles.original)
    plot(t', RAW(:,2));

    % Setting Values
    val = RAW;
    v1 = val(:,2) - val(1,2);
    z = zeros(100,1);
    A = v1';
    zc = A(1);
    A = [z; A'; z];

    % Filtering Raw Data
    disp('Filtering samples')
    s = A;
    ls = length(s);
    % Convert data to wavelet domain
    [c, l] = wavedec(s, 8, 'db4');
    % Convert the 2nd level of the wavelet domain back to remove noise
    base_corrected = appcoef(c, l, 'db4', 2);
    mbase = mean(base_corrected);
    y = base_corrected - mbase;
    K = M/length(y);
    t = 1:length(y);
    % Convert sample number to time, this time factoring the change in scale due
    % to the wavelet transformations
    t = t * K / sfreq;

    % Detect R peaks
    m1 = max(y)*.40;
    P = find(y > m1);

    axes(handles.processed)
    plot(t', y);
    
    % it will give two two points .. remove one point each
    P1 = P;
    last = P1(1);
    P2 = last;
    for i=2:length(P1)
        if(P1(i) > (last + 10))
            last = P1(i);
            P2 = [P2 last];
        end
    end

    Rpos = P2; 
    Qpos = [];
    Qstart = [];
    Qstop =  [];
    Tpos = [];
    Tstart = [];
    Tstop =  [];
    Spos = [];
    Sstart = [];
    Sstop =  [];
    Ppos = [];
    Pstart = [];
    Pstop =  [];

    for R = Rpos
            newQpos = findCenter(R, [-0.150 -0.03], y, sfreq, K, 'min');
            if ~isempty(newQpos)
                Qpos = [Qpos newQpos];
                Qstart = [Qstart findStart(newQpos, 0.055, y, sfreq, K, 'max')];
                Qstop =  [Qstop findStop(newQpos, 0.055, y, sfreq, K, 'max')];
            end
        
            newTpos = findCenter(R, [0.070 0.300], y, sfreq, K, 'max');
            if ~isempty(newTpos)
                Tpos = [Tpos newTpos];
                Tstart = [Tstart findStart(newTpos, 0.055, y, sfreq, K, 'min')];
                Tstop =  [Tstop findStop(newTpos, 0.055, y, sfreq, K, 'min')];
            end

            newPpos = findCenter(R, [-0.300 -0.030], y, sfreq, K, 'max');
            if ~isempty(newPpos)
                Ppos = [Ppos newPpos];
                Pstart = [Pstart findStart(newPpos, 0.055, y, sfreq, K, 'min')];
                Pstop =  [Pstop findStop(newPpos, 0.055, y, sfreq, K, 'min')];
            end

            newSpos = findCenter(R, [0.050 0.150], y, sfreq, K, 'min');
            if ~isempty(newSpos)
                Spos = [Spos newSpos];
                Sstart = [Sstart findStart(newSpos, 0.055, y, sfreq, K, 'max')];
                Sstop =  [Sstop findStop(newSpos, 0.055, y, sfreq, K, 'max')];
            end
    end
    
    % Remove extra/erroneous R-peaks
    Rpos = Rpos(Rpos > Ppos(1));
    Ramp = y(Rpos);
    Qamp = y(Qpos);
    Qstart_amp = y(Qstart);
    Qstop_amp = y(Qstop);
    Tamp = y(Tpos);
    Tstart_amp = y(Tstart);
    Tstop_amp = y(Tstop);
    Pamp = y(Ppos);
    Pstart_amp = y(Pstart);
    Pstop_amp = y(Pstop);
    Samp = y(Spos);
    Sstart_amp = y(Sstart);
    Sstop_amp = y(Sstop);
    
    % Calculate average RR and QR intervals and other statistics
    R_peaks = length(Rpos);
    avg_rr = mean(diff(Rpos))/sfreq*K;    
    avg_qr = mean(Rpos-Qpos)/sfreq*K;
    avg_pq = mean(Qpos-Ppos)/sfreq*K;
    avg_st = mean(Tpos-Spos)/sfreq*K;
    
    sd_rr = std(diff(Rpos))/sfreq*K;
    sd_qr = std(Rpos-Qpos)/sfreq*K;
    sd_pq = std(Qpos-Ppos)/sfreq*K;
    sd_st = std(Tpos-Spos)/sfreq*K;
    
    avg_Pamp = mean(Pamp);
    avg_Qamp = mean(Qamp);
    avg_Ramp = mean(Ramp);
    avg_Samp = mean(Samp);
    avg_Tamp = mean(Tamp);
    
    sd_Pamp = std(Pamp);
    sd_Qamp = std(Qamp);
    sd_Ramp = std(Ramp);
    sd_Samp = std(Samp);
    sd_Tamp = std(Tamp);
    
    heartrate = 60 / avg_rr;
    
    set(handles.avg_rr, 'String', num2str(avg_rr));   
    set(handles.hr, 'String', num2str(heartrate));
    set(handles.avg_qr, 'String', num2str(avg_qr));
    set(handles.avg_pq, 'String', num2str(avg_pq));
    set(handles.avg_st, 'String', num2str(avg_st));
    
    handles.processed_data = y;
    guidata(gcbo,handles);
    axes(handles.marked)
    plot(t, y, 'k-', ...
         Rpos/sfreq*K, Ramp, 'bo', ...
         Qstart/sfreq*K, Qstart_amp, 'g+', Qstop/sfreq*K, Qstop_amp, 'r+', Qpos/sfreq*K, Qamp, 'b+', ...
         Tstart/sfreq*K, Tstart_amp, 'g*', Tstop/sfreq*K, Tstop_amp, 'r*', Tpos/sfreq*K, Tamp, 'b*', ...
         Pstart/sfreq*K, Pstart_amp, 'gx', Pstop/sfreq*K, Pstop_amp, 'rx', Ppos/sfreq*K, Pamp, 'bx', ...
         Sstart/sfreq*K, Sstart_amp, 'gs', Sstop/sfreq*K, Sstop_amp, 'rs', Spos/sfreq*K, Samp, 'bs')
    
     % plot moving waveform
    xlim([0 2])
    yrange = ylim();
    ylim([yrange(1)*.95 yrange(2)*1.05])
    xmax = 2;
    step = 0.01;
    while(xmax < max(t))
        oldlim = xlim();
        xlim(oldlim+step);
        xmax = xmax + step;
        pause(0.05)
    end

function center = findCenter(position, offset, amplitude, sfreq, K, minmax)
    func = str2func(minmax);
    range = (position+floor(offset(1)*sfreq/K)):(position+ceil(offset(2)*sfreq/K));
    range = range(1 <= range & range <= length(amplitude));
    [~, l] = func(amplitude(range));
    center = range(l);

function start = findStart(position, offset, amplitude, sfreq, K, minmax)
    func = str2func(minmax);
    range = (position-ceil(offset*sfreq/K)):position;
    range = range(1 <= range & range <= length(amplitude));
    if sum(amplitude(range) < 0) == 0
        [~, l] = func(amplitude(range));
    else
        l = find(amplitude(range) < 0,1);
    end
    start = range(l);    

function stop = findStop(position, offset, amplitude, sfreq, K, minmax)
    func = str2func(minmax);
    range = position:(position+ceil(offset*sfreq/K));
    range = range(1 <= range & range <= length(amplitude));
    if sum(amplitude(range) > 0) == 0
        [~, l] = func(amplitude(range));
    else
        l = find(amplitude(range) > 0, 1);
    end
    stop = range(l);


% --- Executes during object creation, after setting all properties.
function waveform_CreateFcn(hObject, eventdata, handles)
% hObject    handle to waveform (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function avg_qr_Callback(hObject, eventdata, handles)
% hObject    handle to avg_qr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of avg_qr as text
%        str2double(get(hObject,'String')) returns contents of avg_qr as a double


% --- Executes during object creation, after setting all properties.
function avg_qr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to avg_qr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function avg_pq_Callback(hObject, eventdata, handles)
% hObject    handle to avg_pq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of avg_pq as text
%        str2double(get(hObject,'String')) returns contents of avg_pq as a double


% --- Executes during object creation, after setting all properties.
function avg_pq_CreateFcn(hObject, eventdata, handles)
% hObject    handle to avg_pq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function avg_st_Callback(hObject, eventdata, handles)
% hObject    handle to avg_st (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of avg_st as text
%        str2double(get(hObject,'String')) returns contents of avg_st as a double


% --- Executes during object creation, after setting all properties.
function avg_st_CreateFcn(hObject, eventdata, handles)
% hObject    handle to avg_st (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
