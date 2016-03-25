function varargout = interface(varargin)
%INTERFACE M-file for interface.fig
%      INTERFACE, by itself, creates a new INTERFACE or raises the existing
%      singleton*.
%
%      H = INTERFACE returns the handle to a new INTERFACE or the handle to
%      the existing singleton*.
%
%      INTERFACE('Property','Value',...) creates a new INTERFACE using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to interface_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      INTERFACE('CALLBACK') and INTERFACE('CALLBACK',hObject,...) call the
%      local function named CALLBACK in INTERFACE.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help interface

% Last Modified by GUIDE v2.5 24-Mar-2016 19:06:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @interface_OpeningFcn, ...
                   'gui_OutputFcn',  @interface_OutputFcn, ...
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


% --- Executes just before interface is made visible.
function interface_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for interface
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes interface wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = interface_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in createMap.
function createMap_Callback(hObject, eventdata, handles)
data = guidata(hObject);

try
%get images
leftImage = data.leftImage;
rightImage = data.rightImage;
catch
 h = msgbox('You must select a right and left image!');   
end

if(size(leftImage) ~= size(rightImage))
   h = msgbox('Left and right images must be the same size!'); 
else

    %get search window size
    contents = get(handles.searchWindowSize,'String'); 
    searchSize = str2num(contents{get(handles.searchWindowSize,'Value')});
    contents = get(handles.supportWindowSize,'String');
    supportSize = str2num(contents{get(handles.supportWindowSize,'Value')});

    contents = get(handles.algorithmType,'String'); 
    method = contents{get(handles.algorithmType,'Value')};
    
    mapHeight = round(get(handles.mapHeight,'Value'));

    mapWidth = round(get(handles.mapWidth,'Value')); 
    
    imageRect = get(handles.imageRect,'Value');

    
    if searchSize < supportSize
    h = msgbox('Search window must be larger than support window!');
    else    
    dispMap = DISP_MAP(leftImage, rightImage, supportSize, searchSize,mapWidth,mapHeight,method,imageRect);
     
    
    
    axes(handles.outputImage);
    colormap(handles.outputImage,'pink');
    imshow(dispMap,[]);
   
    
    %Show the disparity map and the save option. 
    set(handles.outputImage,'Visible','On');
    set(handles.saveMap,'Visible','On');
    
    %Output the disparity map to the GUI.
    data = guidata(hObject);
    data.outputMap = dispMap;
    guidata(hObject,data);
    
    end
end


function loadLeftImage_Callback(hObject, eventdata, handles)
%Let the user select their image. 
[fileName,pathName] = uigetfile({'*.jpg;*.tif;*.bmp;*.png;*.gif','All Image Files';...
          '*.*','All Files' },'Select image to process');

%get image name and read in image
imageName = [pathName,fileName];
image = convertImage(imageName);

%store image so it can be used to create the disparity map. 
data = guidata(hObject);
data.leftImage = image;
guidata(hObject,data);

%display image
axes(handles.leftAxis);
imshow(image);


if get(hObject,'Value')
    %Set slider fields to be shown to the user. 
    set(handles.mapHeightText,'Visible','On')
    set(handles.mapHeight,'Visible','On')
    set(handles.mapHeightLabel,'Visible','On')
    set(handles.createMap,'Visible','On')
    set(handles.mapWidthLabel,'Visible','On')
    set(handles.mapWidth,'Visible','On')
    set(handles.mapWidthText,'Visible','On')
    
    [height,width] = size(image);
    
    %Set sliders to the correct height and width values of the image loaded
    %in. 
    set(handles.mapHeight,'Min',1)
    set(handles.mapHeight,'Max',height)
    set(handles.mapHeight,'Value',height/2)
    set(handles.mapHeightText,'String',height/2)
    
    set(handles.mapWidth,'Min',1)
    set(handles.mapWidth,'Max',width)
    set(handles.mapWidth,'Value',width/2)
    set(handles.mapWidthText,'String',width/2)
    
end




% --- Executes on button press in loadRightImage.
function loadRightImage_Callback(hObject, eventdata, handles)

%Let the user select their image. 
[fileName,pathName] = uigetfile({'*.jpg;*.tif;*.bmp;*.png;*.gif','All Image Files';...
          '*.*','All Files' },'Select image to process');

%Get image name and read in image
imageName = [pathName,fileName];
image = convertImage(imageName);

%store image so it can be used to create the disparity map. 
data = guidata(hObject);
data.rightImage = image;
guidata(hObject,data);

%display image
axes(handles.rightAxis);
imshow(image);


% --- Executes on selection change in searchWindowSize.
function searchWindowSize_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function searchWindowSize_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in supportWindowSize.
function supportWindowSize_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function supportWindowSize_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function mapHeight_Callback(hObject, eventdata, handles)

%Set the text field to the image height value of the slider. 
set(handles.mapHeightText,'String',round(get(hObject,'Value')))



% --- Executes during object creation, after setting all properties.
function mapHeight_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function mapWidth_Callback(hObject, eventdata, handles)

%Set the text field to the image width value of the slider. 
set(handles.mapWidthText,'String',round(get(hObject,'Value')))



% --- Executes during object creation, after setting all properties.
function mapWidth_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on selection change in algorithmType.
function algorithmType_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function algorithmType_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in saveMap.
function saveMap_Callback(hObject, eventdata, handles)

data = guidata(hObject);

dispMap = data.outputMap;

[filename,pathname] = uiputfile({'*.jpg;*.tif;*.png;*.gif','All Image Files';...
          '*.*','All Files' },'Save Image'); 
 
      
 imwrite(dispMap,strcat(pathname,'/',filename));   
     


% --- Executes on button press in imageRect.
function imageRect_Callback(hObject, eventdata, handles)
% hObject    handle to imageRect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of imageRect
