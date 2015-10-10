function varargout = ortho(varargin)
% ORTHO MATLAB code for ortho.fig
%      ORTHO, by itself, creates a new ORTHO or raises the existing
%      singleton*.
%
%      H = ORTHO returns the handle to a new ORTHO or the handle to
%      the existing singleton*.
%
%      ORTHO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ORTHO.M with the given input arguments.
%
%      ORTHO('Property','Value',...) creates a new ORTHO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ortho_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ortho_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ortho

% Last Modified by GUIDE v2.5 06-Oct-2015 19:56:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ortho_OpeningFcn, ...
                   'gui_OutputFcn',  @ortho_OutputFcn, ...
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


% --- Executes just before ortho is made visible.
function ortho_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ortho (see VARARGIN)

% Initialize variables
handles.choice = 1;

% Choose default command line output for ortho
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ortho wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ortho_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
Vf1 = str2double(get(handles.edit1,'String'));
foo = num2cell(getComposite(handles.choice));
[Ef,Em,vf,vm,Gf,Gm] = foo{:};

foo = num2cell(pplValues(Ef,Em,vf,vm,Gf,Gm,Vf1));
[EL,ET,GLT,vLT] = foo{:};

delt = str2double(get(handles.edit2,'String'));
theta = 0:delt*pi/180:pi/2;
d = zeros(7);
for j=1:size(theta,2)
    foo = num2cell(transForm(EL,ET,GLT,vLT,theta(j)));
    [theta(j),Ex,Ey,Gxy,vxy,mx,my] = foo{:};
    d(j,:) = [theta(j)*180/pi,Ex,Ey,Gxy,vxy,mx,my];    
end
cname = {'Theta','Ex','Ey','Gxy','Nuxy','mx','my'};
h = handles.uitable1;
set(h,'Data',d,'ColumnName',cname);

plot(d(:,1),d(:,2)/EL, d(:,1),d(:,4)/GLT, d(:,1),d(:,5), d(:,1),d(:,6), d(:,1),d(:,7));
xlabel('\theta');
legend('E_{x}/E_{L}','G_{xy}/G_{LT}','\nu_{xy}','m_x','m_y','Location','Northwest');


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
str = get(hObject,'String');
val = get(hObject,'Value');

switch str{val}
    case 'Choose the type of Composite'
        handles.choice = 0;
    case '1. Glass-Epoxy Composite'
        handles.choice = 1;
    case '2. Graphite-Epoxy Composite'
        handles.choice = 2;
    case '3. Kevlar-Epoxy Composite'
        handles.choice = 3;
    case '4. Boron-Aluminium Composite'
        handles.choice = 4;
end
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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
