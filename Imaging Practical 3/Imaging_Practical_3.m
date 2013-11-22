function varargout = Imaging_Practical_3(varargin)
% IMAGING_PRACTICAL_3 MATLAB code for Imaging_Practical_3.fig
%      IMAGING_PRACTICAL_3, by itself, creates a new IMAGING_PRACTICAL_3 or raises the existing
%      singleton*.
%
%      H = IMAGING_PRACTICAL_3 returns the handle to a new IMAGING_PRACTICAL_3 or the handle to
%      the existing singleton*.
%
%      IMAGING_PRACTICAL_3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMAGING_PRACTICAL_3.M with the given input arguments.
%
%      IMAGING_PRACTICAL_3('Property','Value',...) creates a new IMAGING_PRACTICAL_3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Imaging_Practical_3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Imaging_Practical_3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Imaging_Practical_3

% Last Modified by GUIDE v2.5 20-Nov-2013 03:57:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Imaging_Practical_3_OpeningFcn, ...
                   'gui_OutputFcn',  @Imaging_Practical_3_OutputFcn, ...
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


% --- Executes just before Imaging_Practical_3 is made visible.
function Imaging_Practical_3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Imaging_Practical_3 (see VARARGIN)

% Choose default command line output for Imaging_Practical_3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Imaging_Practical_3 wait for user response (see UIRESUME)
% uiwait(handles.orig);
Load_Images(hObject, eventdata, handles, 10);

function Load_Images(hObject, eventdata, handles, n)
%load image
orig = load('Image1.mat');
orig = orig.I;

axes(handles.orig_image);
imshow(orig);

axes(handles.blue_image);
h =fspecial('gaussian', [n n], n/5);
padded_blue=padarray(orig(:, :, 1), [n*5 n*5], 255);
padded_blue = imfilter(padded_blue, h);
blue=padded_blue(n*5+1:end-n*5-1, n*5+1:end-n*5-1);
imshow(blue);

axes(handles.edge_image);
blue(blue<min(min(blue))+3*mean(std(double(blue))))=0;
edges = edge(blue,'canny');
imshow(edges);

% --- Outputs from this function are returned to the command line.
function varargout = Imaging_Practical_3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function filter_size_slider_Callback(hObject, eventdata, handles)
% hObject    handle to filter_size_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
new_val = round(get(hObject,'Value'));
set(handles.filter_size_text,'String',strcat('Size of Filter = ', num2str(new_val)));
set(hObject, 'Value', new_val);
Load_Images(hObject, eventdata, handles, new_val);

% --- Executes during object creation, after setting all properties.
function filter_size_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to filter_size_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
set(hObject, 'Value', 10);

% --- Executes on slider movement.
function min_radius_slider_Callback(hObject, eventdata, handles)
% hObject    handle to min_radius_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
new_val = round(get(hObject,'Value'));
if(get(handles.max_radius_slider, 'Value')<new_val)
    new_val=get(handles.max_radius_slider, 'Value');
end
set(handles.min_radius_text,'String',strcat('Min Radius = ', num2str(new_val)));
set(hObject, 'Value', new_val);

% --- Executes during object creation, after setting all properties.
function min_radius_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to min_radius_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
set(hObject, 'Value', 5);

% --- Executes on slider movement.
function max_radius_slider_Callback(hObject, eventdata, handles)
% hObject    handle to max_radius_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
new_val = round(get(hObject,'Value'));
if(get(handles.min_radius_slider, 'Value')>new_val)
    new_val=get(handles.min_radius_slider, 'Value');
end
set(handles.max_radius_text,'String',strcat('Max Radius = ', num2str(new_val)));
set(hObject, 'Value', new_val);

% --- Executes during object creation, after setting all properties.
function max_radius_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to max_radius_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
set(hObject, 'Value', 30);

% --- Executes on button press in fit_circle.
function fit_circle_Callback(hObject, eventdata, handles)
% hObject    handle to fit_circle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
orig = getimage(handles.orig_image);
blue = getimage(handles.blue_image);
edges = getimage(handles.edge_image);
min_radius=get(handles.min_radius_slider, 'Value');
max_radius=get(handles.max_radius_slider, 'Value');

ha = Generate_Accum(edges, min_radius, max_radius);

R_range = zeros(max_radius-min_radius+1,1);
for i=1:size(R_range,1)
    R_range(i)=min_radius+i-1
end
peaks = Detect_Peaks(ha, R_range)


    
    
    