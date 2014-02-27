function varargout = gui(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @gui_OpeningFcn, ...
    'gui_OutputFcn',  @gui_OutputFcn, ...
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

function [] = enableAll(handles)
    set(handles.ButtonSave, 'Enable', 'on');
    set(handles.RadioSmall, 'Enable', 'on');
    set(handles.RadioBig, 'Enable', 'on');
    set(handles.RadioMedium, 'Enable', 'on');
    set(handles.RadioEnabled, 'Enable', 'on');
    set(handles.RadioDisabled, 'Enable', 'on');
    set(handles.SizeSlider, 'Enable', 'on');
    set(handles.TextWidth, 'Enable', 'on');
    set(handles.TextHeight, 'Enable', 'on');
    set(handles.TextColors, 'Enable', 'on');
    set(handles.TextIn, 'Enable', 'on');
    set(handles.TextCm, 'Enable', 'on');
end

function [] = disableAll(handles)
    set(handles.EditTextURL, 'string' , '');
    cla(handles.ImageBox,'reset');
    set(handles.ImageBox, 'Visible', 'off');
    set(handles.ButtonSave, 'Enable', 'off');
    set(handles.RadioSmall, 'Enable', 'off');
    set(handles.RadioBig, 'Enable', 'off');
    set(handles.RadioMedium, 'Enable', 'off');
    set(handles.RadioEnabled, 'Enable', 'off');
    set(handles.RadioDisabled, 'Enable', 'off');
    set(handles.SizeSlider, 'Enable', 'off');
    set(handles.TextWidth, 'Enable', 'off');
    set(handles.TextHeight, 'Enable', 'off');
    set(handles.TextColors, 'Enable', 'off');
    set(handles.TextIn, 'Enable', 'off');
    set(handles.TextCm, 'Enable', 'off');
end

function ButtonExplore_Callback(hObject, eventdata, handles)

[handles.filename, handles.pathname] = uigetfile({'*.png;*.tif;*.bmp;*.jpg','Images';'*.*','All files' },'Select an image');
set(handles.EditTextURL, 'string' , [handles.pathname handles.filename]);

if (~isempty(get(handles.EditTextURL, 'string')))
    img = imread([handles.pathname handles.filename]);
    
    [okImage errorMsg] = hbIsImage(img);
    
    if (1 == okImage)

        map = xlsread('completeMap.xlsx');
        map = map./255;
        
        axes(handles.ImageBox);
        [imgS, mapS] = rgb2ind(img, map, 'nodither');
        imshow(imgS, mapS);
        
        enableAll(handles);
        
        %TODO calculate pixels, sizes and colors
    else
        
        warndlg(errorMsg);
        disableAll(handles);
    end
    
end
%
%             map = xlsread('completeMap.xlsx');
%             map = map./255;
%
%             axes(handles.ImageBox);
%             [imgNoDit, mapNoDit]=rgb2ind(img, map, 'nodither');
%             imshow(imgNoDit, mapNoDit);
%
%             axes(handles.ImageDither);
%             [imgDit, mapDit] = rgb2ind(img, map, 'dither');
%             imshow(imgDit, mapDit);
%
%             set(handles.ButtonDitherSave, 'Enable', 'on');
%             set(handles.ButtonSave, 'Enable', 'on');
%             set(handles.RadioEnabled, 'Enable', 'on');
%             set(handles.RadioDisabled, 'Enable', 'on');
%
%             %TODO function getCountColors and change the labels
%
%         else
%             warndlg(errorMsg);
%             set(handles.EditTextURL, 'string' , '');
%             cla(handles.ImageBox,'reset');
%             cla(handles.ImageDither,'reset');
%             set(handles.ImageBox, 'Visible', 'off');
%             set(handles.ImageDither, 'Visible', 'off');
%
%         end
%     end

end

function EditTextURL_Callback(hObject, eventdata, handles)

end

function EditTextURL_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
end

function UIPanel_SelectionChangeFcn(hObject, eventdata, handles)
%     switch get(eventdata.NewValue,'Tag') % Get Tag of selected object.
%         case 'RadioEnabled'
%             warning('Color adjustment methods not implemented. The behavior of this software could be unstable from now on.');
%
%
%             %for q=1:2 % yeah it makes no sense, I know. Try to delete and see what happens.
%                 %cla(handles.ImageBox,'reset');
%                 %cla(handles.ImageDither,'reset');
%                 set(handles.ImageBox, 'Visible', 'off');
%                 set(handles.ImageDither, 'Visible', 'off');
%
%                 img = imread(get(handles.EditTextURL, 'string'));
%                 map = xlsread('completeMap.xlsx');
%                 map = map./255;
%                 imgDith = getimage(handles.ImageDither);
%                 imgNoDith = getimage(handles.ImageBox);
%
%                 % NO DITHER
%                 histNoDith = hbHistogram (imgNoDith);
%                 newMap = [];
%                 [M, N] = size (histNoDith);
%                 for i=1:M
%                     nCol = cell2mat(histNoDith(i, 2));
%                     if (nCol > 1000) %FIXME improve this, slide and let the user set the threshold?
%                         newMap = [newMap map(i,:)'];
%                     end
%                 end
%
%                 newMap = newMap';
%
%                 [imgNoDit, mapNoDit] = rgb2ind(img, newMap, 'nodither');
%                 guidata(hObject, handles);
%                 %axes(handles.ImageBox);
%                 imshow(imgNoDit, mapNoDit, 'Parent', handles.ImageBox);
%
%                 %DITHER
%                 histDith = hbHistogram (imgDith);
%                 newMap = [];
%                 [M, N] = size (histDith);
%                 for i=1:M
%                     nCol = cell2mat(histDith(i, 2));
%                     if (nCol > 1000) %FIXME improve this, slide and let the user set the threshold?
%                         newMap = [newMap map(i,:)'];
%                     end
%                 end
%
%                 newMap = newMap';
%
%                 guidata(hObject, handles);
%                 %axes(handles.ImageDither);
%                 [imgDit, mapDit] = rgb2ind(img, newMap, 'dither');
%                 imshow(imgDit, mapDit, 'Parent', handles.ImageDither);
%
%             %end
%
%             %TODO function getCountColors and change the labels
%
%         case 'RadioDisabled'
%             warning('Color adjustment methods not implemented. The behavior of this software could be unstable from now on.');
%
%             set(handles.ImageBox, 'Visible', 'off');
%             set(handles.ImageDither, 'Visible', 'off');
%
%             img = imread(get(handles.EditTextURL, 'string'));
%             map = xlsread('completeMap.xlsx');
%             map = map./255;
%
%             axes(handles.ImageBox);
%             [imgNoDit, mapNoDit]=rgb2ind(img, map, 'nodither');
%             imshow(imgNoDit, mapNoDit);
%
%             axes(handles.ImageDither);
%             [imgDit, mapDit] = rgb2ind(img, map, 'dither');
%             imshow(imgDit, mapDit);
%
%     end
end


function ButtonSave_Callback(hObject, eventdata, handles)

%  %  get(handles.RadioEnabled,'Value');
%     url = get(handles.EditTextURL, 'string');
%     img = imread(url);
%     map = xlsread('completeMap.xlsx');
%     map = map ./ 255;
%     [newImage, newMap] = rgb2ind(img, map, 'nodither');
%
%     imwrite(newImage,newMap,'hama no dither.png','png');
end


% --- Executes on slider movement.
function SizeSlider_Callback(hObject, eventdata, handles)

end

% --- Executes during object creation, after setting all properties.
function SizeSlider_CreateFcn(hObject, eventdata, handles)
    if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor',[.9 .9 .9]);
    end

end

function BeadSize_SelectionChangeFcn(hObject, eventdata, handles)

end

function ColorAdjustmentPanel_SelectionChangeFcn(hObject, eventdata, handles)

end
