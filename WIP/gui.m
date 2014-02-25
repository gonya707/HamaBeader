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

function ButtonExplore_Callback(hObject, eventdata, handles)
    set(handles.ButtonDitherSave, 'Enable', 'off');
    set(handles.ButtonNoDitherSave, 'Enable', 'off');

    [handles.filename, handles.pathname] = uigetfile({'*.png;*.tif;*.bmp;*.jpg','Images';'*.*','All files' },'Select an image');
    set(handles.EditTextURL, 'string' , [handles.pathname handles.filename]);
    
    if (~isempty(get(handles.EditTextURL, 'string')))
        img = imread([handles.pathname handles.filename]);

        [okImage errorMsg] = isImage(img);

        if (1 == okImage)
            
            map = xlsread('completeMap.xlsx');
            map = map./255;

            axes(handles.ImageNoDither);
            [imgNoDit, mapNoDit]=rgb2ind(img, map, 'nodither');
            imshow(imgNoDit, mapNoDit);

            axes(handles.ImageDither);
            [imgDit, mapDit] = rgb2ind(img, map, 'dither');
            imshow(imgDit, mapDit);

            set(handles.ButtonDitherSave, 'Enable', 'on');
            set(handles.ButtonNoDitherSave, 'Enable', 'on');

        else
            error(errorMsg);
        end
    end

end

function EditTextURL_Callback(hObject, eventdata, handles)
    
end

function EditTextURL_CreateFcn(hObject, eventdata, handles)

    if ispc && isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
end

function ButtonDitherSave_Callback(hObject, eventdata, handles)
    url = get(handles.EditTextURL, 'string');
    img = imread(url);
    map = xlsread('completeMap.xlsx');
    map = map ./ 255;
    [newImage, newMap] = rgb2ind(img, map, 'dither');
    
    imwrite(newImage,newMap,'hama dither.png','png');
end

function ButtonNoDitherSave_Callback(hObject, eventdata, handles)
    url = get(handles.EditTextURL, 'string');
    img = imread(url);
    map = xlsread('completeMap.xlsx');
    map = map ./ 255;
    [newImage, newMap] = rgb2ind(img, map, 'nodither');
    
    imwrite(newImage,newMap,'hama no dither.png','png');
end
