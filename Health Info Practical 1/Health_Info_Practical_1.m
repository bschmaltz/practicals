function varargout = Health_Info_Practical_1(varargin)
% HEALTH_INFO_PRACTICAL_1 MATLAB code for Health_Info_Practical_1.fig
%      HEALTH_INFO_PRACTICAL_1, by itself, creates a new HEALTH_INFO_PRACTICAL_1 or raises the existing
%      singleton*.
%
%      H = HEALTH_INFO_PRACTICAL_1 returns the handle to a new HEALTH_INFO_PRACTICAL_1 or the handle to
%      the existing singleton*.
%
%      HEALTH_INFO_PRACTICAL_1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HEALTH_INFO_PRACTICAL_1.M with the given input arguments.
%
%      HEALTH_INFO_PRACTICAL_1('Property','Value',...) creates a new HEALTH_INFO_PRACTICAL_1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Health_Info_Practical_1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Health_Info_Practical_1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Health_Info_Practical_1

% Last Modified by GUIDE v2.5 25-Sep-2013 03:07:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Health_Info_Practical_1_OpeningFcn, ...
                   'gui_OutputFcn',  @Health_Info_Practical_1_OutputFcn, ...
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


% --- Executes just before Health_Info_Practical_1 is made visible.
function Health_Info_Practical_1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Health_Info_Practical_1 (see VARARGIN)

% Choose default command line output for Health_Info_Practical_1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Health_Info_Practical_1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = Health_Info_Practical_1_OutputFcn(hObject, eventdata, handles) 
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



function avg_rr_interval_Callback(hObject, eventdata, handles)
% hObject    handle to avg_rr_interval (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of avg_rr_interval as text
%        str2double(get(hObject,'String')) returns contents of avg_rr_interval as a double


% --- Executes during object creation, after setting all properties.
function avg_rr_interval_CreateFcn(hObject, eventdata, handles)
% hObject    handle to avg_rr_interval (see GCBO)
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
keyboard;

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
else
  disp('start and stop times entered, loading plot...');
  wave_num = get(hObject,'Value');
  if wave_num == 10
      wave_num=0;
  end
  axes(handles.original);
  [tm,signal]=rdsamp(strcat('mitdb/10', num2str(wave_num)),1,stop,start,true);
  plot(tm,signal), xlim([start,stop]);
  
  sigma = 2;
  width = 30;
  x = linspace(-width/2, width/2, width);
  b = exp(-x.^2 / (2*sigma ^2));
  b = b/ sum(b);
  signal = conv(signal, b, 'same');
  ds = diff(signal)./diff(tm);
  ds = conv(ds, b, 'same');
  ds = ds.^2;

  dds = diff(ds)./diff(tm(2:end));
  dds = 1.3*ds(2:end) + 1.1*dds;

  thres = 0.5 * max(dds(width:(end-width)));
  min_dist = 90;
  [~, final_s] = findpeaks(dds, 'MINPEAKDISTANCE', min_dist, 'MINPEAKHEIGHT', thres);
  
  % Remove detected peaks at the very beginning and end due to convolution
  % errors
  final_s(final_s > (length(signal) - width)) = [];
  final_s(final_s < width) = [];

  beats = zeros(1, length(dds));
  beats(final_s) = 1;

  heartrate = sum(beats) / (stop-start) * 360 * 60; 
  rr = diff(final_s);
  avg_rr = mean(rr) / 360;
  axes(handles.processed);
  plot(tm(3:end), beats), xlim([start,stop]);
  disp 'graph plotted'
end


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
