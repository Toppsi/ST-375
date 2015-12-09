function varargout = SoftwareForsoeg(varargin)
% SOFTWAREFORSOEG MATLAB code for SoftwareForsoeg.fig
%      SOFTWAREFORSOEG, by itself, creates a new SOFTWAREFORSOEG or raises the existing
%      singleton*.
%
%      H = SOFTWAREFORSOEG returns the handle to a new SOFTWAREFORSOEG or the handle to
%      the existing singleton*.
%
%      SOFTWAREFORSOEG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SOFTWAREFORSOEG.M with the given input arguments.
%
%      SOFTWAREFORSOEG('Property','Value',...) creates a new SOFTWAREFORSOEG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SoftwareForsoeg_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SoftwareForsoeg_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SoftwareForsoeg

% Last Modified by GUIDE v2.5 06-Dec-2015 20:51:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SoftwareForsoeg_OpeningFcn, ...
                   'gui_OutputFcn',  @SoftwareForsoeg_OutputFcn, ...
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
% --- Køres lige før Patient_Oevelse gøres synlig.
function SoftwareForsoeg_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SoftwareForsoeg (see VARARGIN)
% Choose default command line output for SoftwareForsoeg
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
% --- Outputs fra denne funktion returneres til kommando linjen.
function varargout = SoftwareForsoeg_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
xlabel('Tid [Sek]');
xlim auto;
ylabel('Hældning [Grader]');
ylim([-90 90]);
refline(0,13)
refline(0,8)
refline(0,-8)
refline(0,-13)
hold on
% Get default command line output from handles structure
varargout{1} = handles.output;
% --- Ved tryk på StartKnap køres denne funktion.
function StartKnap_Callback(hObject, eventdata, handles)
% hObject    handle to StartKnap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global s %Definerer vores s til at være global så den kan kaldes fra andre funktioner.
 device = daq.getDevices;%Finder vores nidaq device. 
s = daq.createSession('ni');%Starter en session s
aich = addAnalogInputChannel(s, 'Dev1', 'ai0', 'Voltage');%Tilføjer vores kanal på
%nidaqen til matlab, så der vides hvorfra der skal hentes data.
%aich.InputType = 'SingleEnded'
%s.Channels.TerminalConfig = 'SingleEnded'; %Definerer vores måling til at være singleended
s.IsContinuous = true; %Specificerer en kontinuer måling
s.Rate = 500 % fs = samplerate 
s.NotifyWhenDataAvailableExceeds = 25; %Indstiller hvor meget signal der skal optages før listener kaldes
lh = addlistener(s, 'DataAvailable',@plotData); %Listener der aktiveres når 
%NotifyWhenDataAvailableExceeds kommer over vores specificerede længde. Kalder funktionen plotdata
s.startBackground;%Starter optagelsen af signaler i baggrunden
function plotData(src,event) %Funktion der kaldes fra vores listener
    ax = gca; %Finder det koordinatsystemet der er i GUI'en og gemmer det i ax
    refline(ax, 0,13) %Indstiller en refline i vores koordinatsystem i GUI'en
    refline(ax, 0,8)%Indstiller en refline i vores koordinatsystem i GUI'en
    refline(ax, 0,-8)%Indstiller en refline i vores koordinatsystem i GUI'en
    refline(ax, 0,-13)%Indstiller en refline i vores koordinatsystem i GUI'en
    hold on %Gør at vores reflines ikke forsvinder

    data = event.Data+1.3988; %Plussser med offsettet fra nidaqen
     if 0<=data
         data = data*(90/3.0147)
     
     elseif data<=0
         data = data*(90/2.9417)
     else
         data = data*(90/2.9417)
     end
    plot(ax, event.TimeStamps, data, 'r'); %Plotter vores data som kommer
    %fra listeneren, i vores koordinatsystem
% --- Executes on button press in StopKnap.
function StopKnap_Callback(hObject, eventdata, handles)
% hObject    handle to StopKnap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s %Finder vores globale variabel s
stop(s); %Stopper vores session s
release(s);
% --- Ved tryk på SletKnap køres denne funktion.
function SletKnap_Callback(hObject, eventdata, handles)
% hObject    handle to SletKnap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h = findobj(gca, 'color', 'red'); %Finder et objekt der er rødt i vores koordinatsystem og gemmer det i h
delete(h); %Sletter h, som er det røde i vores koordinatsystem
% --- Ved tryk på GemKnap køres denne funktion.
function GemKnap_Callback(hObject, eventdata, handles)
% hObject    handle to GemKnap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uiputfile({'*.jpg;*.tif;*.png;*.gif','All Image Files';...
          '*.*','All Files' },'Save Image',...
          'C:\Work\newfile.jpg') %Gør at der kommer en popup, der beder om navn, 
      %typen som filen kan gemmes som er også defineret her
name=fullfile(pathname, filename);
fig = gcf; %Henter vores figur som den ser ud i GUI'en
fig.PaperPositionMode = 'auto'; %Auto skalarer vores fig så den ser ud som den gør i vores GUI
print(name,'-dpng','-r0') %Gemmer grafer. 
