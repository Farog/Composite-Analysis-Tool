function varargout = stack(varargin)
% STACK MATLAB code for stack.fig
%      STACK, by itself, creates a new STACK or raises the existing
%      singleton*.
%
%      H = STACK returns the handle to a new STACK or the handle to
%      the existing singleton*.
%
%      STACK('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in STACK.M with the given input arguments.
%
%      STACK('Property','Value',...) creates a new STACK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before stack_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to stack_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help stack

% Last Modified by GUIDE v2.5 23-Nov-2015 16:16:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @stack_OpeningFcn, ...
                   'gui_OutputFcn',  @stack_OutputFcn, ...
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


% --- Executes just before stack is made visible.
function stack_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to stack (see VARARGIN)

% Choose default command line output for stack
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes stack wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = stack_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

theta = str2num(get(handles.edit2,'String'));
T = str2num(get(handles.edit3,'String'));
EL = str2num(get(handles.edit4,'String'));
ET = str2num(get(handles.edit5,'String'));
GLT = str2num(get(handles.edit6,'String'));
VLT = str2num(get(handles.edit7,'String'));

if(size(theta,1) ~= size(T,1) || size(theta,1) ~=size(EL,1) || size(theta,1)...
        ~=size(ET,1) || size(theta,1) ~=size(GLT,1) || size(theta,1) ~=size(VLT,1) )
    error('Sizes not equal');
end

VTL = (ET./EL).*VLT;

% Number of laminae
N = size(theta,1);

Compl_ppl = zeros(3,3,N);
stiffness = zeros(3,3,N);
for j=1:N
    Compl_ppl(:,:,j) = [1/EL(j), -VTL(j)/ET(j), 0; -VLT(j)/EL(j), 1/ET(j), 0; 0, 0, 1/GLT(j)];
    Stiff_ppl = Compl_ppl(:,:,j)\eye(3);
    %Stiff_ppl = [20 0.7 0; 0.7 2 0; 0 0 0.7];

    T1 = [cosd(theta(j))^2, sind(theta(j))^2, sind(2*theta(j)); ...
        sind(theta(j))^2, cosd(theta(j))^2, -sind(2*theta(j)); ...
        -sind(2*theta(j))/2, sind(2*theta(j))/2, cosd(2*theta(j))];
    
    
    T2 = [cosd(theta(j))^2, sind(theta(j))^2, 0.5*sind(2*theta(j)); ...
        sind(theta(j))^2, cosd(theta(j))^2, -0.5*sind(2*theta(j)); ...
        -sind(2*theta(j)), sind(2*theta(j)), cosd(2*theta(j))];

    stiffness(:,:,j) = (T1\eye(3))*Stiff_ppl*T2
end

B = fliplr(T');
C = cumsum(B);
D = fliplr(C)';

H = sum(T)/2 - D;
H = [H;sum(T)/2];

A = zeros(3,3);
B = zeros(3,3);
C = zeros(3,3);
for j=2:N+1
    A = A + stiffness(:,:,j-1)*(H(j)-H(j-1));
    B = B + 0.5*stiffness(:,:,j-1)*(H(j)^2-H(j-1)^2);
    C = C + (1/3)*stiffness(:,:,j-1)*(H(j)^3-H(j-1)^3);
end
h1 = handles.uitable2;
set(h1,'Data',A);
h2 = handles.uitable3;
set(h2,'Data',B);
h2 = handles.uitable4;
set(h2,'Data',C);


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
