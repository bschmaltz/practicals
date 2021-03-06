function varargout = Imaging_Practical_1(varargin)
%IMAGING_PRACTICAL_1 M-file for Imaging_Practical_1.fig
%      IMAGING_PRACTICAL_1, by itself, creates a new IMAGING_PRACTICAL_1 or raises the existing
%      singleton*.
%
%      H = IMAGING_PRACTICAL_1 returns the handle to a new IMAGING_PRACTICAL_1 or the handle to
%      the existing singleton*.
%
%      IMAGING_PRACTICAL_1('Property','Value',...) creates a new IMAGING_PRACTICAL_1 using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to Imaging_Practical_1_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      IMAGING_PRACTICAL_1('CALLBACK') and IMAGING_PRACTICAL_1('CALLBACK',hObject,...) call the
%      local function named CALLBACK in IMAGING_PRACTICAL_1.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Imaging_Practical_1

% Last Modified by GUIDE v2.5 22-Sep-2013 15:43:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Imaging_Practical_1_OpeningFcn, ...
                   'gui_OutputFcn',  @Imaging_Practical_1_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before Imaging_Practical_1 is made visible.
function Imaging_Practical_1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for Imaging_Practical_1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Imaging_Practical_1 wait for user response (see UIRESUME)
% uiwait(handles.gui);


% --- Outputs from this function are returned to the command line.
function varargout = Imaging_Practical_1_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function threshold_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to threshold_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
if isfield(handles,'color') && isfield(handles,'gray') 
    color = handles.color;
    gray = handles.gray;

    %redraw histogram with threshold line
    axes(handles.histogram);
    v = get(hObject,'Value');
    [M,F]=mode(double(gray(:)))
    h=imhist(gray), ylim([0,F]);
    imhist(gray), ylim([0,F]);
    hold on
    plot([v,v],[0,F],'r');
    hold off

    %draw threshold image
    axes(handles.threshold_Image);
    threshold=gray;
    threshold(threshold>=v)=255; %pixels from the treshold and above are white
    threshold(threshold<v)=0; %pixels below the threshold are black
    imshow(threshold);

    %draw colored image with mask
    axes(handles.color_Image);
    colormask = color;
    colormask_R=color(:,:,1);
    colormask_R(threshold==0)=0;
    colormask_G=color(:,:,2);
    colormask_G(threshold==0)=0;
    colormask_B=color(:,:,3);
    colormask_B(threshold==0)=0;

    colormask(:,:,1)= colormask_R;
    colormask(:,:,2)= colormask_G;
    colormask(:,:,3)= colormask_B;
    imshow(colormask);

    %draw gray scale image with mask
    axes(handles.gray_Image);
    graymask=gray;
    graymask(threshold==0)=0;
    imshow(graymask);
    
    %save changes to handles so they can be printed
    handles.colormask = colormask;
    handles.graymask = graymask;
    handles.threshold = threshold;
    handles.threshold_Value = v;
    handles.h = h;
    guidata(gcbo,handles);
else
    disp 'image not loaded'
end
% --- Executes during object creation, after setting all properties.
function threshold_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to threshold_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



% --- Executes on button press in save.
function save_Callback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isfield(handles,'colormask') && isfield(handles,'graymask') 
    colormask = handles.colormask;
    graymask = handles.graymask;
    threshold = handles.threshold;
    threshold_value = handles.threshold_Value
    histogram = handles.h;
    uisave({'colormask', 'graymask', 'threshold', 'histogram', 'threshold_value'},'image practical 1 figures');
else
	disp 'load image and set threshold';
end


% --- Executes on button press in load.
function load_Callback(hObject, eventdata, handles)
% hObject    handle to load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename pathname] = uigetfile({'*.jpg;*.tif;*.png;*.gif','All Image Files'},'Select Image');
if isequal(filename,0) || isequal(pathname,0) %make sure they didn't hit cancel
    disp 'Please load an image'
else
    %get images
    color = imread(strcat(pathname, filename));
    gray = rgb2gray(color);

    %put images on axes
    axes(handles.color_Image);
    imshow(color);

    axes(handles.gray_Image);
    imshow(gray);

    %make histogram
    axes(handles.histogram);
    [M,F]=mode(double(gray(:)))
    imhist(gray), ylim([0,F]);
    
    handles.color = color;
    handles.gray = gray;
    guidata(gcbo,handles)
end



% --- Executes on button press in print.
function print_Callback(hObject, eventdata, handles)
% hObject    handle to print (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isfield(handles,'colormask') && isfield(handles,'graymask') 
    %for each axes/figure make a png
    F=getframe(handles.color_Image);               %select axes in GUI
    figure();                                      %new figure
    image(F.cdata);                                %show selected axes in new figure
    saveas(gcf, 'color_Image', 'png');             %save figure
    close(gcf);                                    %and close it
    
    F=getframe(handles.gray_Image);                %select axes in GUI
    figure();                                      %new figure
    image(F.cdata);                                %show selected axes in new figure
    saveas(gcf, 'gray_image', 'png');              %save figure
    close(gcf);                                    %and close it
    
    F=getframe(handles.threshold_Image);                 %select axes in GUI
    figure();                                      %new figure
    image(F.cdata);                                %show selected axes in new figure
    saveas(gcf, 'threshold_image', 'png');         %save figure
    close(gcf);                                    %and close it
    
    F=getframe(handles.histogram);                 %select axes in GUI
    figure();                                      %new figure
    image(F.cdata);                                %show selected axes in new figure
    saveas(gcf, 'histogram', 'png');             %save figure
    close(gcf);                                    %and close it
else
	disp 'load image and set threshold';
end

% --- Executes on button press in quit.
function quit_Callback(hObject, eventdata, handles)
% hObject    handle to quit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;
