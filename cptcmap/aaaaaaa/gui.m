function varargout = gui(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
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

end
% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)


% Choose default command line output for gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
end

function varargout = gui_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;

end

function pushbutton1_Callback(hObject, eventdata, handles)
    [handles.filename, handles.pathname] = uigetfile({'*.png;*.bmp;*.jpg','Imágenes';'*.*','Todos los archivos' },'Seleccionar imagen base');
    set(handles.edit1,'string' , [handles.pathname handles.filename]);
    
    img=imread([handles.pathname handles.filename]);

    map=xlsread('completeMap.xlsx');
    map=map./255;

    figure();
    subplot(1,3,1);
    imshow(img);
    title('Original')
    subplot(1,3,2);
    [handles.dout1, handles.dout1map]=rgb2ind(img, map, 'nodither');
    imshow(handles.dout1, handles.dout1map);
    title('Sin dither')
    subplot(1,3,3);
    [handles.dout2, handles.dout2map]=rgb2ind(img, map, 'dither');
    imshow(handles.dout2, handles.dout2map);
    title('Con dither')

end

function edit1_Callback(hObject, eventdata, handles)
    
end
function edit1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function pushbutton2_Callback(hObject, eventdata, handles)
    destino=get(handles.edit1,'string');
    img=imread(destino);
    map=xlsread('completeMap.xlsx');
    map=map./255;
    [dout1, dout1map]=rgb2ind(img, map, 'nodither');
    
    imwrite(dout1,dout1map,'sin dither.png','png');

end

function pushbutton3_Callback(hObject, eventdata, handles)

end
