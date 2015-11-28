function varargout = failure(varargin)
% FAILURE MATLAB code for failure.fig
%      FAILURE, by itself, creates a new FAILURE or raises the existing
%      singleton*.
%
%      H = FAILURE returns the handle to a new FAILURE or the handle to
%      the existing singleton*.
%
%      FAILURE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FAILURE.M with the given input arguments.
%
%      FAILURE('Property','Value',...) creates a new FAILURE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before failure_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to failure_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help failure

% Last Modified by GUIDE v2.5 28-Nov-2015 08:17:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @failure_OpeningFcn, ...
                   'gui_OutputFcn',  @failure_OutputFcn, ...
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


% --- Executes just before failure is made visible.
function failure_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to failure (see VARARGIN)

% Choose default command line output for failure
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes failure wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = failure_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
theta = str2num(get(handles.edit5,'String'));
T = str2num(get(handles.edit6,'String'));
EL = str2num(get(handles.edit1,'String'));
ET = str2num(get(handles.edit2,'String'));
GLT = str2num(get(handles.edit7,'String'));
VLT = str2num(get(handles.edit8,'String'));
SLU = str2num(get(handles.edit3,'String'));
STU = str2num(get(handles.edit4,'String'));


if(size(theta,1) ~= size(T,1) || size(theta,1) ~=size(EL,1) || size(theta,1)...
        ~=size(ET,1) || size(theta,1) ~=size(GLT,1) || size(theta,1) ~=size(VLT,1))
    error('Sizes not equal');
end

VTL = (ET./EL).*VLT;

% Number of laminae
N = size(theta,1);

% Failure using maximum strain theory.
Nx = zeros(2,1); % Force
ex = zeros(2,1); % Strain
% Initializing k
k=N;
for i=1:2
    T = T(1:k); % To consider only the 0 deg ply after eliminating 90 deg
     
    Compl_ppl = zeros(3,3,N);
    stiffness = zeros(3,3,N);
    for j=1:N
        Compl_ppl(:,:,j) = [1/EL(j), -VTL(j)/ET(j), 0; -VLT(j)/EL(j), 1/ET(j), 0; 0, 0, 1/GLT(j)];
        Stiff_ppl = Compl_ppl(:,:,j)\eye(3);
    %Stiff_ppl = [20 0.7 0; 0.7 2 0; 0 0 0.7];

        T1 = [cosd(theta(j))^2, sind(theta(j))^2, sind(2*theta(j)); ...
        sind(theta(j))^2, cosd(theta(j))^2, -sind(2*theta(j)); ...
        -sind(2*theta(j))/2, sind(2*theta(j))/2, cosd(2*theta(j))];
    
    
        T2 = [cosd(theta(j))^2, sind(theta(j))^2, 0.5*sind(2*theta( j)); ...
        sind(theta(j))^2, cosd(theta(j))^2, -0.5*sind(2*theta(j)); ...
        -sind(2*theta(j)), sind(2*theta(j)), cosd(2*theta(j))];

        stiffness(:,:,j) = (T1\eye(3))*Stiff_ppl*T2;
    end

    B = fliplr(T');
    C = cumsum(B);
    D = fliplr(C)';

    H = sum(T)/2 - D;
    H = [H;sum(T)/2];

    A = zeros(3,3);
    for j=2:N+1
        A = A + stiffness(:,:,j-1)*(H(j)-H(j-1));
    end
    if(i==1) % 90 deg ply fails first
        ex(i) = (STU/ET(1))*10^-3;
        ey = -A(2,1)/A(2,2)*(ex(i));
        Nx(i) = A(1,1)*ex(i) + A(1,2)*ey;
    else
        ex(i) = (SLU/EL(1))*10^-3;
        ey = -A(2,1)/A(2,2)*(ex(i)-ex(i-1));
        Nx(i) = A(1,1)*(ex(i)-ex(i-1)) + A(1,2)*ey;
    end
    
    for k=1:N
        if(theta(k)==max(theta))
            EL1 = EL(k);
            ET1 = ET(k);
            GLT1 = GLT(k);
            VLT1 = VLT(k);
            t1 = T(k);
        end
    end
    theta = theta(theta~=max(theta));
%     EL = EL(EL~=EL1);
%     ET = ET(ET~=ET1);
%     GLT = GLT(GLT~=GLT1)
%     VLT = VLT(VLT~=VLT1)
    %T = T(T~=t1);
    N = size(theta,1);
end
NX = zeros(2,1);
NX(1) = Nx(1);
NX(2) = Nx(1)+Nx(2);
NX = [0;NX];
ex = [0;ex];
cla(handles.axes1);
set(gca,'fontsize',15)
hold on
plot([ex(1),ex(2)],[NX(1),NX(2)],'LineWidth',1.5);
hold on
plot([ex(2),ex(3)],[NX(2),NX(3)],'LineWidth',1.5);
hold on
plot(ex(2),NX(2),'*',ex(3),NX(3),'*');
str = ['(',num2str(ex(2)), '  ,  ', num2str(NX(2)),')']; 
text(ex(2),NX(2),str);
str = ['(',num2str(ex(3)), '  ,  ', num2str(NX(3)),')']; 
text(ex(3),NX(3),str);
xlabel('Strain (\epsilon)');
ylabel('Load (N_x)');
title('Load vs Strain Curve');


function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
