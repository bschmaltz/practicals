function varargout = Imaging_Practical_1(varargin)
% IMAGING_PRACTICAL_1 MATLAB code for Imaging_Practical_1.fig
%      IMAGING_PRACTICAL_1, by itself, creates a new IMAGING_PRACTICAL_1 or raises the existing
%      singleton*.
%
%      H = IMAGING_PRACTICAL_1 returns the handle to a new IMAGING_PRACTICAL_1 or the handle to
%      the existing singleton*.
%
%      IMAGING_PRACTICAL_1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMAGING_PRACTICAL_1.M with the given input arguments.
%
%      IMAGING_PRACTICAL_1('Property','Value',...) creates a new IMAGING_PRACTICAL_1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Imaging_Practical_1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Imaging_Practical_1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Imaging_Practical_1

% Last Modified by GUIDE v2.5 16-Oct-2013 02:22:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Imaging_Practical_1_OpeningFcn, ...
                   'gui_OutputFcn',  @Imaging_Practical_1_OutputFcn, ...
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


% --- Executes just before Imaging_Practical_1 is made visible.
function Imaging_Practical_1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Imaging_Practical_1 (see VARARGIN)

% Choose default command line output for Imaging_Practical_1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Imaging_Practical_1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
Init_Function(hObject, eventdata, handles);

function Init_Function(hObject, eventdata, handles)
%load image
image = load('Test_Image_512.mat');
image = image.I_512;
r=image(:,:,1);
g=image(:,:,2);
b=image(:,:,3);

msgbox('Select a sample for each color in the order: blue-purple, white, pink and red.  Then, hit enter.');
axes(handles.image);
imshow(image);

%divide pixels into chosen clusters
pixels = impixel(image);
sampled_image = image;

h=waitbar(0,'Please wait...clustering');
%loop through each pixel and determine 
for row=1:size(image,1)
    for col=1:size(image,2)
        original_pixel = [image(row,col,1) image(row,col,2) image(row,col,3)];
        min_i=1;
        min_distance=pdist2(pixels(1,:), original_pixel);
        for i=2:4
            cur_distance = pdist2(pixels(i,:), original_pixel);
            if cur_distance<min_distance
                min_i=i;
                min_distance=cur_distance;
            end
        end
        new_pixel = pixels(min_i,:);
        sampled_image(row,col,1)=new_pixel(1);
        sampled_image(row,col,2)=new_pixel(2);
        sampled_image(row,col,3)=new_pixel(3);
    end
    waitbar((row/size(image,1))*0.65);
end
waitbar(0.65,h,'Please wait...calculating HSI')
imshow(sampled_image);

%calculate HSI
for row=1:size(image,1)
    for col=1:size(image,2)
        H(row,col)=acos((0.5*((r(row,col)-g(row,col))+(r(row,col)-b(row,col))))/((sqrt((r(row,col)-g(row,col))^2+(r(row,col)-b(row,col))*(g(row,col)-b(row,col))))));
        if(b(row,col)>g(row,col))
            H(row,col)=2*pi-H(row,col);
        end
        H(row,col)=H(row,col)/(2*pi);
    end
end
S=1-3.*(min(min(r,g),b))./(r+g+b);
I=(r+g+b)/3;
hsi=cat(3,H,S,I);

waitbar(0.7,h,'Please wait...creating scatter plot')
figure, scatter(H(:),S(:),1,[r(:) g(:) b(:)],'marker','.'),title('Color Distribution in HS space'),xlabel('Hue (H)'),ylabel('Saturation (S)'),colordef black;
waitbar(1,h,'Done!')
delete(h);


% --- Outputs from this function are returned to the command line.
function varargout = Imaging_Practical_1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in quit.
function quit_Callback(hObject, eventdata, handles)
% hObject    handle to quit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;

% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Init_Function(hObject, eventdata, handles);
