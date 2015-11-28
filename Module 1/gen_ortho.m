function varargout = gen_ortho(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gen_ortho_OpeningFcn, ...
                   'gui_OutputFcn',  @gen_ortho_OutputFcn, ...
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

function gen_ortho_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);

function varargout = gen_ortho_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)

function edit1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)

function edit2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)

function edit3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)

function edit4_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% End initialization code - DO NOT EDIT ---


% My main Function - Ignoring all the warnings 
% --- Executes on button press in pushbutton1.
% --- Runs all the algorithms on Button push

function pushbutton1_Callback(hObject, eventdata, handles)
% Varying the angles from 0-90
N = str2double(get(handles.edit5,'String'));
EL = str2double(get(handles.edit1,'String'));
ET = str2double(get(handles.edit2,'String'));
GLT = str2double(get(handles.edit3,'String'));
NuLT = str2double(get(handles.edit4,'String'));

NuTL = NuLT*(ET/EL);

delt = pi/180*N;

theta = 0:delt:pi/2;
d = zeros(size(theta,2),8);
Ex = zeros(size(theta,2),1);
Ey = zeros(size(theta,2),1);
Nuxy = zeros(size(theta,2),1);
Nuyx = zeros(size(theta,2),1);
mx = zeros(size(theta,2),1);
my = zeros(size(theta,2),1);
Gxy = zeros(size(theta,2),1);

for j=1:size(theta,2)
    Ex(j) = 1/( (cos(theta(j))^4)/EL + (sin(theta(j))^4)/ET + (1/4)*(1/GLT-2*NuLT/EL)*sin(2*theta(j))^2);
    Ey(j) = 1/( (sin(theta(j))^4)/EL + (cos(theta(j))^4)/ET + (1/4)*(1/GLT-2*NuLT/EL)*sin(2*theta(j))^2);
    
    Nuxy(j) = Ex(j)*( NuLT/EL - 0.25*(1/EL+2*NuLT/EL+1/ET-1/GLT)*(sin(2*theta(j)))^2 );
    Nuyx(j) = Ey(j)*( NuTL/ET - 0.25*(1/EL+2*NuLT/EL+1/ET-1/GLT)*(sin(2*theta(j)))^2 );
    
    mx(j) = sin(2*theta(j))*(NuLT + EL/ET - EL/(2*GLT) - (cos(theta(j))^2)*(1+2*NuLT + EL/ET - EL/GLT) );
    my(j) = sin(2*theta(j))*(NuLT + EL/ET - EL/(2*GLT) - (sin(theta(j))^2)*(1+2*NuLT + EL/ET - EL/GLT) );
    
    Gxy(j) = 1/(1/EL + 2*NuLT/EL + 1/ET - (1/EL + 2*NuLT/EL + 1/ET - 1/GLT)*(cos(2*theta(j)))^2);
    
    cname = {'Theta','Ex','Ey','Nuxy','Nuyx','mx','my','Gxy'};
    d(j,:) = [theta(j)*180/pi Ex(j) Ey(j) Nuxy(j) Nuyx(j) mx(j) my(j) Gxy(j)];
end


hold off
cla(handles.axes1);
set(gca,'fontsize',15)
hold on
plot(theta*180/pi,Ex/EL,theta*180/pi,Gxy/GLT,theta*180/pi,Nuxy,theta*180/pi,mx,theta*180/pi,my);
xlabel('\theta');
legend('E_{x}/E_{L}','G_{xy}/G_{LT}','\nu_{xy}','m_x','m_y','Location','Northwest');
h = handles.uitable1;
set(h,'Data',d,'ColumnName',cname);


function edit5_Callback(hObject, eventdata, handles)

function edit5_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
