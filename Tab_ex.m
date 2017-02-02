function varargout = Tab_ex(varargin)
% TAB_EX MATLAB code for Tab_ex.fig
%      TAB_EX, by itself, creates a new TAB_EX or raises the existing
%      singleton*.
%
%      H = TAB_EX returns the handle to a new TAB_EX or the handle to
%      the existing singleton*.
%
%      TAB_EX('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TAB_EX.M with the given input arguments.
%
%      TAB_EX('Property','Value',...) creates a new TAB_EX or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Tab_ex_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Tab_ex_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Tab_ex

% Last Modified by GUIDE v2.5 06-Dec-2016 17:25:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Tab_ex_OpeningFcn, ...
                   'gui_OutputFcn',  @Tab_ex_OutputFcn, ...
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




% --- Executes just before Tab_ex is made visible.
function Tab_ex_OpeningFcn(hObject, eventdata, handles, varargin)
% Choose default command line output for Tab_ex
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

%Create tab group
handles.tgroup = uitabgroup('Parent', handles.figure1,'TabLocation', 'top');
handles.tab1 = uitab('Parent', handles.tgroup, 'Title', 'Home');
handles.tab2 = uitab('Parent', handles.tgroup, 'Title', 'Learn');
handles.tab3 = uitab('Parent', handles.tgroup, 'Title', 'Practice');
handles.tab4 = uitab('Parent', handles.tgroup, 'Title', 'Analysis');
%Place panels into each tab
set(handles.P1,'Parent',handles.tab1)
set(handles.P2,'Parent',handles.tab2)
set(handles.P3,'Parent',handles.tab3)
set(handles.P4,'Parent',handles.tab4)
%Reposition each panel to same location as panel 1
set(handles.P2,'position',get(handles.P1,'position'));
set(handles.P3,'position',get(handles.P1,'position'));
set(handles.P4,'position',get(handles.P1,'position'));

%Initialize learn tab info
handles.Trig_Info = cell(10:1);
handles.Trig_Info{1} = 'Sine(theta)= Opposite/Hypotenus                    Cosine(theta)= Adjacent/Hypotenus                           Tangent(theta)= Opposite/Adjacent';
handles.Trig_Info{2} = 'Pythagorean Theorem:            a^2 + b^2 = c^2';
handles.Trig_Info{3} = 'Trig identities: These are very important for simplifying expressions';
handles.Trig_Info{4} = 'Use these to convert sec and csc and cot into cos';
handles.Trig_Info{5} = 'Use these to convert tan into sin and cos';
handles.Trig_Info{6} = 'Use this to convert csc into sin';
handles.Trig_Info{7} = 'Use these identities to solve for an angle from the two sides';

%Initialize Practice_text problems text
handles.Prac_text = cell(4:1);
handles.Prac_text{1} = 'Solve for side BC, knowing angle A = 40 deg and side AC = 6: (round to hundreths place)';
handles.Prac_text{2} = 'Solve for the height of the tree, knwoing theta = 32 degrees and x = 76 m (round to tenths place)';
handles.Prac_text{3} = 'Solve for the angle x, knowing the flag is 26 ft tall and the sun casts a shadow of 47 ft: (round to the nearest whole number)';
handles.Prac_text{4} = 'How high is this plane flying?';

%Initialize Practice problem answers
handles.Prac_ans = cell(4:1);
handles.Prac_ans{1} = 'tan(40) = 6/x:  x = 7.15';
handles.Prac_ans{2} = 'h = 76/tan(32):  h = 121.6';
handles.Prac_ans{3} = 'x = arctan(47/26):  x = 61';
handles.Prac_ans{4} = 'h = 1000*cos(60):  h = 500';

%Set Initial Values
handles.count = 1;
handles.count2 = 1;
handles.score = 0;
set(handles.Score_value,'String','0')
set(handles.Facts,'String',handles.Trig_Info{handles.count});
set(handles.Practice_text,'String',handles.Prac_text{1});


%Initialize Handles.DATA
handles.DATA = zeros(6,1);
handles.Numbers = zeros(6,1);
handles.Numbers(6) = 1;
handles.DATA(6) = 90;

%Show initial Image in Practice_text Panel
handles.Imag = cell(10:1);
handles.Imag{1} = imread('Trig1.jpg');
handles.Imag{2} = imread('Trig2.png');
handles.Imag{3} = imread('Trig3.png');
handles.Imag{4} = imread('Trig4.png');
handles.Imag{5} = imread('Trig5.png');
handles.Imag{6} = imread('Trig6.png');
handles.Imag{7} = imread('Trig7.jpg');
axes(handles.Imag1);
imshow(handles.Imag{1}, []);

%Show initial Practice_text image
handles.Prac = cell(4:1);
handles.Prac{1} = imread('Practice1.jpg');
handles.Prac{2} = imread('Practice2.jpg');
handles.Prac{3} = imread('Practice3.jpg');
handles.Prac{4} = imread('Practice4.jpg');
axes(handles.axes2);
imshow(handles.Prac{1}, []);


guidata(hObject,handles); 






% --- Outputs from this function are returned to the command line.
function varargout = Tab_ex_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Next.
function Next_Callback(hObject, eventdata, handles)
% hObject    handle to Next (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAcB
% handles    structure with handles and user data (see GUIDATA)
handles.count = handles.count + 1;
[dont_care,x] = size(handles.Trig_Info);
y = handles.count;
if x < y
    handles.count = 1;
end
set(handles.Facts,'String',handles.Trig_Info{handles.count}) ;
axes(handles.Imag1);
imshow(handles.Imag{handles.count}, []);
guidata(hObject,handles);  


function answer_Callback(hObject, eventdata, handles)
% hObject    handle to answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in submit.
function submit_Callback(hObject, eventdata, handles)

% Get values and check for corectness
Number = str2double(get(handles.answer,'String'));
answer = [7.15;121.6;61;500];
 [m,n] = size(answer);
 if handles.count2 < m 
     %Show problem image
    axes(handles.axes2);
    imshow(handles.Prac{handles.count2+1}, []);
    %Show problem text
    set(handles.Practice_text,'String',handles.Prac_text{handles.count2+1}) ;
    
    if answer(handles.count2) == Number
       handles.score = handles.score +1;
       set(handles.Response,'String',handles.Prac_ans{handles.count2});
       set(handles.Score_value,'String',int2str(handles.score));
       set(handles.Correct,'String','Answer Correct');
    else
        set(handles.Response,'String',handles.Prac_ans{handles.count2});
        set(handles.Correct,'String','Answer Incorrect');
    end
 else
     set(handles.Response,'String','No more problems.');
     if answer(handles.count2) == Number
       handles.score = handles.score +1;
       set(handles.Correct,'String','Answer Correct');
       set(handles.Score_value,'String',int2str(handles.score));
     else
       set(handles.Correct,'String','Answer Incorrect');
    end
 end
handles.count2 = handles.count2 + 1;
guidata(hObject,handles); 



% --- Executes on button press in Tab1_Button_Practice.
function Tab1_Button_Practice_Callback(hObject, eventdata, handles)
handles.tgroup.SelectedTab = handles.tab3;

% --- Executes on button press in Tab1_Button_Learn.
function Tab1_Button_Learn_Callback(hObject, eventdata, handles)
handles.tgroup.SelectedTab = handles.tab2;

% --- Executes on button press in Tab1_Button_Analysis.
function Tab1_Button_Analysis_Callback(hObject, eventdata, handles)
handles.tgroup.SelectedTab = handles.tab4;



function X_Callback(hObject, eventdata, handles)
handles.DATA(4) = str2double(get(handles.X,'String'));
handles.Numbers(4) = 1;
guidata(hObject,handles); 


% --- Executes during object creation, after setting all properties.
function X_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Y_Callback(hObject, eventdata, handles)
handles.DATA(5) = str2double(get(handles.Y,'String'));
handles.Numbers(5) = 1;
guidata(hObject,handles); 


% --- Executes during object creation, after setting all properties.
function Y_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function C_Callback(hObject, eventdata, handles)
handles.DATA(3) = str2double(get(handles.C,'String'));
handles.Numbers(3) = 1;
guidata(hObject,handles); 


% --- Executes during object creation, after setting all properties.
function C_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function B_Callback(hObject, eventdata, handles)
handles.DATA(2) = str2double(get(handles.B,'String'));
handles.Numbers(2) = 1;
guidata(hObject,handles); 


% --- Executes during object creation, after setting all properties.
function B_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function A_Callback(hObject, eventdata, handles)
handles.DATA(1) = str2double(get(handles.A,'String'));
handles.Numbers(1) = 1;
guidata(hObject,handles); 


% --- Executes during object creation, after setting all properties.
function A_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in Back.
function Back_Callback(hObject, eventdata, handles)
handles.count = handles.count - 1;
y = handles.count;
if y < 1
    handles.count = 1;
end
set(handles.Facts,'String',handles.Trig_Info{handles.count}) ;
axes(handles.Imag1);
imshow(handles.Imag{handles.count}, []);
guidata(hObject,handles);  


% --- Executes on button press in Enter.
function Enter_Callback(hObject, eventdata, handles)
% Get data from fields
set(handles.Error_text,'String','')
Best_data = zeros(5,1);
tableData = get(handles.my_table, 'Data');
[m,dont_care] = size(tableData);
% Have to add zeros and translate inputed data for some reason
for i = 1:m
    tableData{i,2} = 0;
   if isempty(tableData{i,1});
       tableData{i,1} = 0;
   else
       tableData{i,1} = tableData{i,1} - 48;
   end
end
% Concatenate cell array into a double integer array
for i = 1:m
    [dont_care,y] = size(tableData{i,1});
    if y == 2
        Data = tableData{i,1};
        Best_data(i,1) = Data(1,1)*10+Data(1,2);
    elseif y == 3
        Data = tableData{i,1};
        Best_data(i,1) = Data(1,1)*100+10*Data(1,2)+Data(1,3);
    else
        Best_data(i,1) = tableData{i,1};
    end  
end
handles.DATA = Best_data;
%disp(handles.DATA);
% Cacluate vector of zeros and ones if data is there
handles.Numbers = handles.DATA ~= 0 ;

%Finally calculate some values
if sum(handles.Numbers) <= 1
    %%Output not enough data
    set(handles.Error_text,'String','Not enough data')
elseif sum(handles.Numbers) > 2
        set(handles.Error_text,'String','Enter only two fields')
else
    
    % 2 Side lengths
    if handles.Numbers(3)&&handles.Numbers(4)||handles.Numbers(4)&&handles.Numbers(5)||handles.Numbers(3)&&handles.Numbers(5)
            
            %Calculate side 3
        if handles.Numbers(3)&&handles.Numbers(4)
            handles.DATA(5) = sqrt(handles.DATA(3)^2+handles.DATA(4)^2);
            tableData{5,1} = handles.DATA(5);
            set(handles.my_table,'Data',tableData);
            %Calculate side 1
        elseif handles.Numbers(4)&&handles.Numbers(5)
            %Verify C is the longest side
            if handles.DATA(3) >= handles.DATA(5) || handles.DATA(4) >= handles.DATA(5)
                set(handles.Error_text,'String','C should be longest side')
            end
            handles.DATA(3) = sqrt(handles.DATA(5)^2-handles.DATA(4)^2);
            tableData{3,1} = handles.DATA(3);
            set(handles.my_table,'Data',tableData);
            %Calculate side 2
        else
            %Verify C is the longest side
            if handles.DATA(3) >= handles.DATA(5) || handles.DATA(4) >= handles.DATA(5)
                set(handles.Error_text,'String','C should be longest side')
            end
            handles.DATA(4) = sqrt(handles.DATA(5)^2-handles.DATA(3)^2);
            tableData{4,1} = handles.DATA(4);
            set(handles.my_table,'Data',tableData);
        end
    
    
    %After 2 sides calculate 3 angles
    %Theta 1
    handles.DATA(1) = asind(handles.DATA(4)/handles.DATA(5));
    %Save and set to table
    tableData{1,1} = handles.DATA(1);
    set(handles.my_table,'Data',tableData);
    %Theta2
    handles.DATA(2) = asind(handles.DATA(3)/handles.DATA(5));
    %Save and set to table
    tableData{2,1} = handles.DATA(2);
    set(handles.my_table,'Data',tableData);
    % Plot Triangle now
    A = [0;handles.DATA(3)];
    B = [0;0];
    plot(A,B,'parent',handles.axes4);
    hold on;
    A = [0;handles.DATA(3)];
    B = [handles.DATA(4);0];
    plot(A,B,'parent',handles.axes4);

    % one side, one angle
    elseif handles.Numbers(1)&&handles.Numbers(3)||handles.Numbers(1)&&handles.Numbers(4)||handles.Numbers(1)&&handles.Numbers(5)||handles.Numbers(2)&&handles.Numbers(3)||handles.Numbers(2)&&handles.Numbers(4)||handles.Numbers(2)&&handles.Numbers(5)
        %Have A theta1
        if handles.Numbers(1)&&handles.Numbers(3)
            handles.DATA(2) = 90-handles.DATA(1);
            handles.DATA(5) = handles.DATA(3)/cosd(handles.DATA(1));
            handles.DATA(4) = handles.DATA(5)*sind(handles.DATA(1));
        %Have B theta1  
        elseif handles.Numbers(1)&&handles.Numbers(4)
            handles.DATA(2) = 90-handles.DATA(1);
            handles.DATA(5) = handles.DATA(4)/sind(handles.DATA(1));
            handles.DATA(3) = handles.DATA(5)*cosd(handles.DATA(1));
        %Have C theta1
        elseif handles.Numbers(1)&&handles.Numbers(5)
            handles.DATA(2) = 90-handles.DATA(1);
            handles.DATA(4) = handles.DATA(5)*sind(handles.DATA(1));
            handles.DATA(3) = handles.DATA(5)*cosd(handles.DATA(1));
        %Have A theta2
        elseif handles.Numbers(2)&&handles.Numbers(3)
            handles.DATA(1) = 90-handles.DATA(2);
            handles.DATA(5) = handles.DATA(3)/sind(handles.DATA(2));
            handles.DATA(4) = handles.DATA(5)*cosd(handles.DATA(2));
        %Have B theta2
        elseif handles.Numbers(2)&&handles.Numbers(4)
            handles.DATA(1) = 90-handles.DATA(2);
            handles.DATA(5) = handles.DATA(4)/cosd(handles.DATA(2));
            handles.DATA(3) = handles.DATA(5)*sind(handles.DATA(2));
        %Have C theta2    
        else
            handles.DATA(1) = 90-handles.DATA(2);
            handles.DATA(3) = handles.DATA(5)*sind(handles.DATA(2));
            handles.DATA(4) = handles.DATA(5)*cosd(handles.DATA(2));
        end
        %set data to table at end
    tableData{1,1} = handles.DATA(1);
    tableData{2,1} = handles.DATA(2);
    tableData{3,1} = handles.DATA(3);
    tableData{4,1} = handles.DATA(4);
    tableData{5,1} = handles.DATA(5);
    set(handles.my_table,'Data',tableData);
    %Plot data
    A = [0;handles.DATA(3)];
    B = [handles.DATA(4);0];
    axis square;
    plot(A,B,'parent',handles.axes4);
    axis square;
    %2 angles 
    %must assign random side bc only have ratios and need a reference side
    else 
        set(handles.Error_text,'String','Do not enter two angles')
    end
    % Set Lables
    set(handles.B_text,'String','B')
    set(handles.A_text,'String','A')
    set(handles.C_text,'String','C')
    set(handles.Theta1_text,'String','Theta1')
    set(handles.Theta2_text,'String','Theta2')
end
guidata(hObject,handles);


% --- Executes on button press in Reset_button.
function Reset_button_Callback(hObject, eventdata, handles)
%Resets values in table
C = cell(5,2);
% Rest data in table to an empty cell matrix
% Also remove tags from graph
set(handles.my_table,'Data',C);
set(handles.B_text,'String','')
set(handles.A_text,'String','')
set(handles.C_text,'String','')
set(handles.Theta1_text,'String','')
set(handles.Theta2_text,'String','')
set(handles.Error_text,'String','')
% Reset the line
plot([0 1],[0 0],'parent',handles.axes4);
