% Skal kunne modtage data fra Ni-DAQ'en
% Skal kunne afbillede data'en i en graf
% Sp�ndingen skal udtrykkes som grader
% M�lingen skal kunne startes ved tryk p� en knap og stoppes ved tryk p� en anden knap
% Skal kunne gemme de m�lte data ved tryk p� en knap
% Det skal v�re muligt at zoome ind/ud p� grafen og at markere specifikke
% punkter p� m�lingen

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
% End initialization code - DO NOT EDIT


% --- Executes just before SoftwareForsoeg is made visible.
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

% UIWAIT makes SoftwareForsoeg wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SoftwareForsoeg_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
xlabel('Tid [Sek]');
xlim auto;
ylabel('H�ldning [Grader]');
ylim([-90 90]);
refline(0,13)
refline(0,8)
refline(0,-8)
refline(0,-13)
hold on
% Get default command line output from handles structure
varargout{1} = handles.output;







% --- Executes on button press in StartKnap.
function StartKnap_Callback(hObject, eventdata, handles)
% hObject    handle to StartKnap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global s %Definerer vores s til at v�re global s� den kan kaldes fra andre funktioner.
 device = daq.getDevices;%Finder vores nidaq device. 
s = daq.createSession('ni');%Starter en session s
aich = addAnalogInputChannel(s, 'Dev1', 'ai0', 'Voltage');%Tilf�jer vores kanal p�
%nidaqen til matlab, s� der vides hvorfra der skal hentes data.
%aich.InputType = 'SingleEnded'
%s.Channels.TerminalConfig = 'SingleEnded'; %Definerer vores m�ling til at v�re singleended
s.IsContinuous = true; %Specificerer en kontinuer m�ling
s.Rate = 500 % fs = samplerate 
s.NotifyWhenDataAvailableExceeds = 25; %Indstiller hvor meget signal der skal optages f�r listener kaldes
lh = addlistener(s, 'DataAvailable',@plotData); %Listener der aktiveres n�r 
%NotifyWhenDataAvailableExceeds kommer over vores specificerede l�ngde. Kalder funktionen plotdata
s.startBackground;%Starter optagelsen af signaler i baggrunden



function plotData(src,event) %Funktion der kaldes fra vores listener
    ax = gca; %Finder det koordinatsystemet der er i GUI'en og gemmer det i ax
    refline(ax, 0,13) %Indstiller en refline i vores koordinatsystem i GUI'en
    refline(ax, 0,8)%Indstiller en refline i vores koordinatsystem i GUI'en
    refline(ax, 0,-8)%Indstiller en refline i vores koordinatsystem i GUI'en
    refline(ax, 0,-13)%Indstiller en refline i vores koordinatsystem i GUI'en
    hold on %G�r at vores reflines ikke forsvinder

    data = event.Data+1.3988; %Plussser med offsettet fra nidaqen
     if data>0
         data = data*(90/3.0147)
     end
     if data<0
         data = data*(90/2.9417)
     end
    plot(ax, event.TimeStamps, data, 'r'); %Plotter vores data som kommer
    
    %fra listeneren, i vores koordinatsystem
     

% datany = data-1.6325; % minusser dataen med offsettet s� vi b�de f�r + og - v�rdier
% datany(datany>0)*271.657108361; %ganger alle dem over 0 med s� det passer med at 1g er lig 90 grader
% datany(datany<0)*278.379214352;%ganger alle dem over 0 med s� det passer med at 1g er lig -90 grader

% --- Executes on button press in StopKnap.
function StopKnap_Callback(hObject, eventdata, handles)
% hObject    handle to StopKnap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s %Finder vores globale variabel s
stop(s); %Stopper vores session s
release(s);




% --- Executes on button press in SletKnap.
function SletKnap_Callback(hObject, eventdata, handles)
% hObject    handle to SletKnap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h = findobj(gca, 'color', 'red'); %Finder et objekt der er r�dt i vores koordinatsystem og gemmer det i h
delete(h); %Sletter h, som er det r�de i vores koordinatsystem



% --- Executes on button press in GemKnap.
function GemKnap_Callback(hObject, eventdata, handles)
% hObject    handle to GemKnap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uiputfile({'*.jpg;*.tif;*.png;*.gif','All Image Files';...
          '*.*','All Files' },'Save Image',...
          'C:\Work\newfile.jpg') %G�r at der kommer en popup, der beder om navn, 
      %typen som filen kan gemmes som er ogs� defineret her

fig = gcf; %Henter vores figur som den ser ud i GUI'en
fig.PaperPositionMode = 'auto'; %Auto skalarer vores fig s� den ser ud som den g�r i vores GUI
print(filename,'-dpng','-r0') %Gemmer grafer. 
