function varargout = main_pro(varargin)
% MAIN_PRO MATLAB code for main_pro.fig
%      MAIN_PRO, by itself, creates a new MAIN_PRO or raises the existing
%      singleton*.
%
%      H = MAIN_PRO returns the handle to a new MAIN_PRO or the handle to
%      the existing singleton*.
%
%      MAIN_PRO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN_PRO.M with the given input arguments.
%
%      MAIN_PRO('Property','Value',...) creates a new MAIN_PRO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main_pro_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main_pro_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main_pro

% Last Modified by GUIDE v2.5 23-Dec-2021 21:36:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_pro_OpeningFcn, ...
                   'gui_OutputFcn',  @main_pro_OutputFcn, ...
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


% --- Executes just before main_pro is made visible.
function main_pro_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main_pro (see VARARGIN)

% Choose default command line output for main_pro
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes main_pro wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = main_pro_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in up_img.
function up_img_Callback(hObject, eventdata, handles)
    [file,path] = uigetfile({'*.png';'*.jpg'},'Select a file');
    fullname = [path,file];
    myImage = imread(fullname);
    set(handles.dis_img,'Units','pixels');
    resizePos = get(handles.dis_img,'Position');
    myImage= imresize(myImage, [resizePos(3) resizePos(3)]);
    axes(handles.dis_img);
    imshow(myImage);
    set(handles.dis_img,'Units','normalized');
    % Update handles structure
    handles.myImage = myImage;
    guidata(hObject, handles);


% --- Executes on selection change in bro_img.
function bro_img_Callback(hObject, eventdata, handles)
    val = get(handles.bro_img ,'value');
    if val == 2
        myImage = imread('pout.tif');
        set(handles.dis_img,'Units','pixels');
        resizePos = get(handles.dis_img,'Position');
        myImage= imresize(myImage, [resizePos(3) resizePos(3)]);
        axes(handles.dis_img);
        imshow(myImage);
        set(handles.dis_img,'Units','normalized');
    end
    if val == 3
        myImage = imread('peppers.png');
        set(handles.dis_img,'Units','pixels');
        resizePos = get(handles.dis_img,'Position');
        myImage= imresize(myImage, [resizePos(3) resizePos(3)]);
        axes(handles.dis_img);
        imshow(myImage);
        set(handles.dis_img,'Units','normalized');
        
    end
    if val == 4
        myImage = imread('corn.tif',2);
        set(handles.dis_img,'Units','pixels');
        resizePos = get(handles.dis_img,'Position');
        myImage= imresize(myImage, [resizePos(3) resizePos(3)]);
        axes(handles.dis_img);
        imshow(myImage);
        set(handles.dis_img,'Units','normalized');
        
    end
    if val == 5
        myImage = imread('street1.jpg');
        set(handles.dis_img,'Units','pixels');
        resizePos = get(handles.dis_img,'Position');
        myImage= imresize(myImage, [resizePos(3) resizePos(3)]);
        axes(handles.dis_img);
        imshow(myImage);
        set(handles.dis_img,'Units','normalized');
        
    end
    if val == 6
        myImage = imread('street2.jpg');
        set(handles.dis_img,'Units','pixels');
        resizePos = get(handles.dis_img,'Position');
        myImage= imresize(myImage, [resizePos(3) resizePos(3)]);
        axes(handles.dis_img);
        imshow(myImage);
        set(handles.dis_img,'Units','normalized');
        
    end
    if val == 7 
        myImage = imread('ngc6543a.jpg');
        set(handles.dis_img,'Units','pixels');
        resizePos = get(handles.dis_img,'Position');
        myImage= imresize(myImage, [resizePos(3) resizePos(3)]);
        axes(handles.dis_img);
        imshow(myImage);
        set(handles.dis_img,'Units','normalized');
    end
    handles.myImage = myImage;
    guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function bro_img_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bro_img (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in filter.
function filter_Callback(hObject, eventdata, handles)
    val = get(handles.filter , 'value');
    if (val == 7 || val == 8)
        set(handles.thshold , 'enable' , 'on');
    else
        set(handles.thshold , 'enable' , 'off');
    end
    if (val == 9 || val == 10 || val == 11 || val == 12)
        set(handles.bri_dar_val , 'enable' , 'on');
    else
        set(handles.bri_dar_val , 'enable' , 'off');
    end
    if (val == 13)
        set(handles.gam_pow , 'enable' , 'on');
    else
        set(handles.gam_pow , 'enable' , 'off');
    end
    if (val == 14 || val == 15)
        set(handles.log_con , 'enable' , 'on');
    else
        set(handles.log_con , 'enable' , 'off');
    end
    
    if (val == 18 || val == 35 || val == 36 || val == 37)
        set(handles.min_val , 'enable' , 'on');
        set(handles.max_val , 'enable' , 'on');
    else
        set(handles.min_val , 'enable' , 'off');
        set(handles.max_val , 'enable' , 'off');
            
    end
    if (val == 21 || val == 22 || val == 23 || val == 24)
        set(handles.fsize , 'enable' , 'on');
    else
        set(handles.fsize , 'enable' , 'off');
    end
    if (val == 27 || val == 28 || val == 29 || val == 30 || val == 31 || val == 32)
        set(handles.deliemeter , 'enable' , 'on');
    else
        set(handles.deliemeter , 'enable' , 'off');
    end
    if (val == 33)
        set(handles.ps , 'enable' , 'on');
        set(handles.pp , 'enable' , 'on');
    else
        set(handles.ps , 'enable' , 'off');
        set(handles.pp , 'enable' , 'off');
    end
    if (val == 34 || val == 36 || val == 38)
        set(handles.start_gray , 'enable' , 'on');
        set(handles.end_gray , 'enable' , 'on');
    else
        set(handles.start_gray , 'enable' , 'off');
        set(handles.end_gray , 'enable' , 'off');
    end
    if (val == 35)
        set(handles.gamma , 'enable' , 'on');
        set(handles.mean , 'enable' , 'on');
    else
        set(handles.gamma , 'enable' , 'off');
        set(handles.mean , 'enable' , 'off');
    end
    if (val == 37)
        set(handles.end_gray , 'enable' , 'on');
    end
    
    
    
    

% --- Executes during object creation, after setting all properties.
function filter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
    cla;
    clear;
    clc;


% --- Executes on button press in exit.
function exit_Callback(hObject, eventdata, handles)
    close;



function thshold_Callback(hObject, eventdata, handles)
set(handles.thshold , 'enable' , 'off');

% --- Executes during object creation, after setting all properties.
function thshold_CreateFcn(hObject, eventdata, handles)
% hObject    handle to thshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in apply.
function apply_Callback(hObject, eventdata, handles)
h = get(handles.filter,'value');
    myImage = handles.myImage;
    switch h
        case 2
            fImage = RGBTOGRAY( myImage, 1 );
        case 3
            fImage = RGBTOGRAY( myImage, 2 );

        case 4
            fImage = RGBTOGRAY( myImage, 3 );

        case 5
            fImage = RGBTOGRAY( myImage, 4 );

        case 6
            fImage = RGBTOGRAY( myImage, 5 );
        case 7
            thshold = get(handles.thshold , 'string');
            thshold = str2double(thshold);
            fImage = graytobinary(myImage,thshold);
        case 8
            thshold = get(handles.thshold , 'string');
            thshold = str2double(thshold);
            fImage = rgbtobinary(myImage,thshold);
        case 9
            value = get(handles.bri_dar_val , 'string');
            value = str2double(value);
            fImage = Brightness_Darkness(myImage , '+',value);
        case 10
            value = get(handles.bri_dar_val , 'string');
            value = str2double(value);
            fImage = Brightness_Darkness(myImage , '*',value);
        case 11
            value = get(handles.bri_dar_val , 'string');
            value = str2double(value);
            fImage = Brightness_Darkness(myImage , '-',value);
        case 12
            value = get(handles.bri_dar_val , 'string');
            value = str2double(value);
            fImage = Brightness_Darkness(myImage , '/',value);
        case 13
            value = get(handles.gam_pow , 'string');
            value = str2double(value);
            fImage = Gamma(myImage ,value);
        case 14
            value = get(handles.log_con , 'string');
            value = str2double(value);
            fImage = Brightness_Darkness(myImage ,value);
       case 15
            value = get(handles.log_con , 'string');
            value = str2double(value);
            fImage = Brightness_Darkness(myImage,value);
       case 16
            fImage = Negative(myImage);
       case 17
            fImage = histogramm(myImage);
        case 18
            val1 = get(handles.min_val , 'string');
            val1 = str2double(val1);
            val2 = get(handles.max_val , 'string');
            val2 = str2double(val2);
            fImage = STRETCHING(myImage , val1 , val2);
        case 19
            fImage = HistEqualiztion(myImage);
        case 20
            fImage = Correlation(myImage);
        case 21
            value = get(handles.fsize , 'string');
            value = str2double(value);
            fImage = filters(myImage ,value,1);
        case 22
            value = get(handles.fsize , 'string');
            value = str2double(value);
            fImage = filters(myImage ,value,2);
        case 23
            value = get(handles.fsize , 'string');
            value = str2double(value);
            fImage = filters(myImage ,value,3);
        case 24
            value = get(handles.fsize , 'string');
            value = str2double(value);
            fImage = filters(myImage ,value,4);
        case 25
            fImage = DFTandIVT(myImage,1);
        case 26
            fImage = DFTandIVT(myImage,2);
        case 27
            value = get(handles.deliemeter , 'string');
            value = str2double(value);
            fImage = ideal(myImage,value,0);
        case 28
            value = get(handles.deliemeter , 'string');
            value = str2double(value);
            fImage = ideal(myImage,value,1);
        case 29
            value = get(handles.deliemeter , 'string');
            value = str2double(value);
            fImage = BUTTERWORTH(myImage,value,0);
        case 30
            value = get(handles.deliemeter , 'string');
            value = str2double(value);
            fImage = BUTTERWORTH(myImage,value,1);
        case 31
            value = get(handles.deliemeter , 'string');
            value = str2double(value);
            fImage = GAUSSIAN(myImage,value,0);
        case 32
            value = get(handles.deliemeter , 'string');
            value = str2double(value);
            fImage = GAUSSIAN(myImage,value,1);
        case 33
            val1 = get(handles.ps , 'string');
            val1 = str2double(val1);
            val2 = get(handles.pp , 'string');
            val2 = str2double(val2);
            fImage = soltandpepper(myImage , val1 , val2); 
        
        case 34
            val1 = get(handles.start_gray , 'string');
            val1 = str2double(val1);
            val2 = get(handles.end_gray , 'string');
            val2 = str2double(val2);
            fImage = uniform_noize(myImage , val1 , val2);
        case 35
            val1 = get(handles.gamma , 'string');
            val1 = str2double(val1);
            val2 = get(handles.mean , 'string');
            val2 = str2double(val2);
            val3 = get(handles.min_val , 'string');
            val3 = str2double(val3);
            val4 = get(handles.max_val , 'string');
            val4 = str2double(val4);
            fImage = gaussian_noise(myImage , val1 , val2 , val3 ,val4);
        case 36
           val1 = get(handles.start_gray , 'string');
            val1 = str2double(val1);
            val2 = get(handles.end_gray , 'string');
            val2 = str2double(val2);
            val3 = get(handles.min_val , 'string');
            val3 = str2double(val3);
            val4 = get(handles.max_val , 'string');
            val4 = str2double(val4);
            fImage = rayleigh_noise(myImage , val1 , val2 , val3 ,val4);
        case 37
            val2 = get(handles.end_gray , 'string');
            val2 = str2double(val2);
            val3 = get(handles.min_val , 'string');
            val3 = str2double(val3);
            val4 = get(handles.max_val , 'string');
            val4 = str2double(val4);
            fImage = exponential_noise(myImage ,val2 , val3 ,val4);
        case 38
            val1 = get(handles.start_gray , 'string');
            val1 = str2double(val1);
            val2 = get(handles.end_gray , 'string');
            val2 = str2double(val2);
            fImage = erlang_noise(myImage , val1 , val2);
    end

    set(handles.dis_img,'Units','pixels');
    resizePos = get(handles.faxes,'Position');
    fImage= imresize(fImage, [resizePos(3) resizePos(3)]);
    axes(handles.faxes);
    imshow(fImage);
    set(handles.faxes,'Units','pixels');


% --- Executes on button press in sa.
function sa_Callback(hObject, eventdata, handles)
    saveas(handles.faxes, 'test.png');



function bri_dar_val_Callback(hObject, eventdata, handles)
% hObject    handle to bri_dar_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bri_dar_val as text
%        str2double(get(hObject,'String')) returns contents of bri_dar_val as a double


% --- Executes during object creation, after setting all properties.
function bri_dar_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bri_dar_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function gam_pow_Callback(hObject, eventdata, handles)
% hObject    handle to gam_pow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of gam_pow as text
%        str2double(get(hObject,'String')) returns contents of gam_pow as a double


% --- Executes during object creation, after setting all properties.
function gam_pow_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gam_pow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function log_con_Callback(hObject, eventdata, handles)
% hObject    handle to log_con (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of log_con as text
%        str2double(get(hObject,'String')) returns contents of log_con as a double


% --- Executes during object creation, after setting all properties.
function log_con_CreateFcn(hObject, eventdata, handles)
% hObject    handle to log_con (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function min_val_Callback(hObject, eventdata, handles)
% hObject    handle to min_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of min_val as text
%        str2double(get(hObject,'String')) returns contents of min_val as a double


% --- Executes during object creation, after setting all properties.
function min_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to min_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function max_val_Callback(hObject, eventdata, handles)
% hObject    handle to max_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of max_val as text
%        str2double(get(hObject,'String')) returns contents of max_val as a double


% --- Executes during object creation, after setting all properties.
function max_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to max_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function fsize_Callback(hObject, eventdata, handles)
% hObject    handle to fsize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fsize as text
%        str2double(get(hObject,'String')) returns contents of fsize as a double


% --- Executes during object creation, after setting all properties.
function fsize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fsize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function deliemeter_Callback(hObject, eventdata, handles)
% hObject    handle to deliemeter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of deliemeter as text
%        str2double(get(hObject,'String')) returns contents of deliemeter as a double


% --- Executes during object creation, after setting all properties.
function deliemeter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to deliemeter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function gamma_Callback(hObject, eventdata, handles)
% hObject    handle to gamma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of gamma as text
%        str2double(get(hObject,'String')) returns contents of gamma as a double


% --- Executes during object creation, after setting all properties.
function gamma_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gamma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function mean_Callback(hObject, eventdata, handles)
% hObject    handle to mean (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mean as text
%        str2double(get(hObject,'String')) returns contents of mean as a double


% --- Executes during object creation, after setting all properties.
function mean_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mean (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function start_gray_Callback(hObject, eventdata, handles)
% hObject    handle to start_gray (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of start_gray as text
%        str2double(get(hObject,'String')) returns contents of start_gray as a double


% --- Executes during object creation, after setting all properties.
function start_gray_CreateFcn(hObject, eventdata, handles)
% hObject    handle to start_gray (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function end_gray_Callback(hObject, eventdata, handles)
% hObject    handle to end_gray (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of end_gray as text
%        str2double(get(hObject,'String')) returns contents of end_gray as a double


% --- Executes during object creation, after setting all properties.
function end_gray_CreateFcn(hObject, eventdata, handles)
% hObject    handle to end_gray (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ps_Callback(hObject, eventdata, handles)
% hObject    handle to ps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ps as text
%        str2double(get(hObject,'String')) returns contents of ps as a double


% --- Executes during object creation, after setting all properties.
function ps_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pp_Callback(hObject, eventdata, handles)
% hObject    handle to pp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pp as text
%        str2double(get(hObject,'String')) returns contents of pp as a double


% --- Executes during object creation, after setting all properties.
function pp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
