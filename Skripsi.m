function varargout = Skripsi(varargin)
% SKRIPSI MATLAB code for Skripsi.fig
%      SKRIPSI, by itself, creates a new SKRIPSI or raises the existing
%      singleton*.
%
%      H = SKRIPSI returns the handle to a new SKRIPSI or the handle to
%      the existing singleton*.
%
%      SKRIPSI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SKRIPSI.M with the given input arguments.
%
%      SKRIPSI('Property','Value',...) creates a new SKRIPSI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Skripsi_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Skripsi_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Skripsi

% Last Modified by GUIDE v2.5 27-Jun-2021 18:48:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Skripsi_OpeningFcn, ...
                   'gui_OutputFcn',  @Skripsi_OutputFcn, ...
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


% --- Executes just before Skripsi is made visible.
function Skripsi_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Skripsi (see VARARGIN)

% Choose default command line output for Skripsi
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Skripsi wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Skripsi_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in tombolUpload.
function tombolUpload_Callback(hObject, eventdata, handles)
% hObject    handle to tombolUpload (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 try
 [filename, pathname] = uigetfile({'.xlsx'},'File Selector');
 fullpathname = strcat(pathname, filename);
 buka = xlsread(fullpathname);
 set(handles.tabelData, 'Data', buka);
 set(handles.textLokasi,'String',fullpathname);
 assignin('base','buka',buka);
 catch
     f = warndlg('Data yang anda masukkan salah atau tidak sesuai dengan format','Peringatan');
 end


function textLokasi_Callback(hObject, eventdata, handles)
% hObject    handle to textLokasi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textLokasi as text
%        str2double(get(hObject,'String')) returns contents of textLokasi as a double


% --- Executes during object creation, after setting all properties.
function textLokasi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textLokasi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in tombolPreprocessing.
function tombolPreprocessing_Callback(hObject, eventdata, handles)
% hObject    handle to tombolPreprocessing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
dataAwal=get(handles.textLokasi,'String');
[num,txt,~] = xlsread(dataAwal);
norm = normalisasi(num,txt);
set(handles.tabelPreprocessing, 'Data', norm);
assignin('base','norm',norm);
catch
     f = warndlg('Data yang anda masukkan salah atau tidak sesuai dengan format','Peringatan');
end

% --- Executes on button press in tombolUploadUji.
function tombolUploadUji_Callback(hObject, eventdata, handles)
% hObject    handle to tombolUploadUji (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 try
 [filename, pathname] = uigetfile({'.xlsx'},'File Selector');
 fullpathname = strcat(pathname, filename);
 open = xlsread(fullpathname);
 set(handles.tabelUji, 'Data', open);
 catch
     f = warndlg('Data yang anda masukkan salah atau tidak sesuai dengan format','Peringatan');
 end

% --- Executes on button press in tombolKlasifikasi.
function tombolKlasifikasi_Callback(hObject, eventdata, handles)
% hObject    handle to tombolKlasifikasi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
f = waitbar(1,'Please wait...');
pause(1)

num = get(handles.tabelData,'data');
norm = get(handles.tabelPreprocessing,'data');
KTerbaik = evalin('base','KTerbaik');

ukuranData = size(norm,2);
jumData = size(norm,1);
tunggal = jumData;
dataTunggal = norm(1:tunggal,1:ukuranData-1);
totalDataTunggal = dataTunggal;

classTunggal = norm(1:tunggal,ukuranData);
totalClassTunggal = classTunggal;

uji = get(handles.tabelUji,'data');
varJumlah = (uji(:,1));
varAset = (uji(:,2));
varOmset = (uji(:,3));
varTahun = (uji(:,4));
[m,~] = size(uji);
dataUji = uji;

for i = 1:m
    dataUji(i,1) = varJumlah(i);
    dataUji(i,2) = varAset(i);
    dataUji(i,3) = varOmset(i);
    dataUji(i,4) = varTahun(i);
end

[m,~] = size(dataUji);
for i=1:m
    if dataUji(i,2)>=0 && dataUji(i,2)<= 50000000 dataUji(i,2)=1;
    elseif dataUji(i,2)> 50000000 && dataUji(i,2)<= 500000000 dataUji(i,2)=2;
    elseif dataUji(i,2)> 500000000 && dataUji(i,2)<= 10000000000 dataUji(i,2)=3;
    end
    if dataUji(i,3)>=0 && dataUji(i,3)<= 300000000 dataUji(i,3)=1;
    elseif dataUji(i,3)> 300000000 && dataUji(i,3)<= 2500000000 dataUji(i,3)=2;
    elseif dataUji(i,3)> 2500000000 && dataUji(i,3)<= 50000000000 dataUji(i,3)=3;
    end
    dataUji(i,4) = 2018 - dataUji(i,4);
end

dat = double(num(:,1:end));
mn1 = mean(dat(:,1));
st1 = std(dat(:,1));

num(:,4) = 2018 - num(:,4);
mn4 = mean(num(:,4));
st4 = std(num(:,4));

xjumlah = (dataUji(:,1)-mn1)/(st1);
xaset = (dataUji(:,2));
xomset = (dataUji(:,3));
xtahun = (dataUji(:,4)-mn4)/(st4);
[n,~] = size(dataUji);
dataku = dataUji;

for j = 1:n
    dataku(j,1) = xjumlah(j);
    dataku(j,2) = xaset(j);
    dataku(j,3) = xomset(j);
    dataku(j,4) = xtahun(j);
end

euclidean_train6 = pdist2(totalDataTunggal,totalDataTunggal,'euclidean');
label_euclidean6 = fungsi_s(totalDataTunggal, KTerbaik, totalClassTunggal, euclidean_train6);
validity6 = hitung_validitas(label_euclidean6, KTerbaik);
euclidean6 = pdist2(totalDataTunggal,dataku,'euclidean');
weight6 = hitung_weight(dataku, totalDataTunggal, validity6, euclidean6);
hasil_prediksi6 = prediksi(dataku, totalDataTunggal, KTerbaik, totalClassTunggal, weight6);
output6 = label_prediksi(dataku, KTerbaik, hasil_prediksi6);
hasil = [uji,output6];
set(handles.tabelUji, 'Data', hasil);
assignin('base','hasil',hasil);
close(f);
catch
     f = warndlg('Data yang anda masukkan salah atau tidak sesuai dengan format','Peringatan');
end

function textKriteria_Callback(hObject, eventdata, handles)
% hObject    handle to textKriteria (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textKriteria as text
%        str2double(get(hObject,'String')) returns contents of textKriteria as a double


% --- Executes during object creation, after setting all properties.
function textKriteria_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textKriteria (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in tombolProsesUji.
function tombolProsesUji_Callback(hObject, eventdata, handles)
% hObject    handle to tombolProsesUji (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
f = waitbar(1,'Please wait...');
pause(1)

num = get(handles.tabelData,'data');
norm = get(handles.tabelPreprocessing,'data');
KTerbaik = evalin('base','KTerbaik');

ukuranData = size(norm,2);
jumData = size(norm,1);
tunggal = jumData;
dataTunggal = norm(1:tunggal,1:ukuranData-1);
totalDataTunggal = dataTunggal;

classTunggal = norm(1:tunggal,ukuranData);
totalClassTunggal = classTunggal;

textJumlah = str2num(get(handles.textJumlah,'String'));
textAset = str2num(get(handles.textAset,'String'));
textOmset = str2num(get(handles.textOmset,'String'));
textTahun = str2num(get(handles.textTahun,'String'));

dataUji=[textJumlah textAset textOmset textTahun];

[m,~] = size(dataUji);
for i=1:m
if dataUji(i,2)>=0 && dataUji(i,2)<= 50000000 dataUji(i,2)=1;
elseif dataUji(i,2)> 50000000 && dataUji(i,2)<= 500000000 dataUji(i,2)=2;
elseif dataUji(i,2)> 500000000 && dataUji(i,2)<= 10000000000 dataUji(i,2)=3;
end
if dataUji(i,3)>=0 && dataUji(i,3)<= 300000000 dataUji(i,3)=1;
elseif dataUji(i,3)> 300000000 && dataUji(i,3)<= 2500000000 dataUji(i,3)=2;
elseif dataUji(i,3)> 2500000000 && dataUji(i,3)<= 50000000000 dataUji(i,3)=3;
end
dataUji(i,4) = 2018 - dataUji(i,4);
end

dat = double(num(:,1:end));
mn1 = mean(dat(:,1));
st1 = std(dat(:,1));

num(:,4) = 2018 - num(:,4);
mn4 = mean(num(:,4));
st4 = std(num(:,4));

xjumlah = (dataUji(:,1)-mn1)/(st1);
xaset = (dataUji(:,2));
xomset = (dataUji(:,3));
xtahun = (dataUji(:,4)-mn4)/(st4);
xnorm = [xjumlah xaset xomset xtahun];

euclidean_train6 = pdist2(totalDataTunggal,totalDataTunggal,'euclidean');
label_euclidean6 = fungsi_s(totalDataTunggal, KTerbaik, totalClassTunggal, euclidean_train6);
validity6 = hitung_validitas(label_euclidean6, KTerbaik);
euclidean6 = pdist2(totalDataTunggal,xnorm,'euclidean');
weight6 = hitung_weight(xnorm, totalDataTunggal, validity6, euclidean6);
hasil_prediksi6 = prediksi(xnorm, totalDataTunggal, KTerbaik, totalClassTunggal, weight6);
output6 = label_prediksi(xnorm, KTerbaik, hasil_prediksi6);

idd = round(output6);

if(idd==1)
    mikro=char('Mikro');
    set(handles.textKriteria, 'string', char(mikro));
elseif(idd==2)
    kecil=char('Kecil');
    set(handles.textKriteria, 'string', char(kecil));
elseif(idd==3)
    menengah=char('Menengah');
    set(handles.textKriteria, 'string', char(menengah));
end
close(f);
catch
     f = warndlg('Data yang anda masukkan salah atau tidak sesuai dengan format','Peringatan');
end

% --- Executes on button press in tombolResetUji.
function tombolResetUji_Callback(hObject, eventdata, handles)
% hObject    handle to tombolResetUji (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.textJumlah,'String','');
set(handles.textAset,'String','');
set(handles.textOmset,'String','');
set(handles.textTahun,'String','');
set(handles.textKriteria,'String','');

% --- Executes on button press in tombolSimpan.
function tombolSimpan_Callback(hObject, eventdata, handles)
% hObject    handle to tombolSimpan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
hasil = evalin('base','hasil');
[filename, pathname] = uiputfile('*.xlsx', 'Choose a file name');
outname = fullfile(pathname, filename);
xlswrite(outname, hasil);
catch
     f = warndlg('Data yang anda masukkan salah atau tidak sesuai dengan format','Peringatan');
end


function textJumlah_Callback(hObject, eventdata, handles)
% hObject    handle to textJumlah (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textJumlah as text
%        str2double(get(hObject,'String')) returns contents of textJumlah as a double


% --- Executes during object creation, after setting all properties.
function textJumlah_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textJumlah (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function textAset_Callback(hObject, eventdata, handles)
% hObject    handle to textAset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textAset as text
%        str2double(get(hObject,'String')) returns contents of textAset as a double


% --- Executes during object creation, after setting all properties.
function textAset_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textAset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function textOmset_Callback(hObject, eventdata, handles)
% hObject    handle to textOmset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textOmset as text
%        str2double(get(hObject,'String')) returns contents of textOmset as a double


% --- Executes during object creation, after setting all properties.
function textOmset_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textOmset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function textTahun_Callback(hObject, eventdata, handles)
% hObject    handle to textTahun (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textTahun as text
%        str2double(get(hObject,'String')) returns contents of textTahun as a double


% --- Executes during object creation, after setting all properties.
function textTahun_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textTahun (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function textAkurasi_Callback(hObject, eventdata, handles)
% hObject    handle to textAkurasi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textAkurasi as text
%        str2double(get(hObject,'String')) returns contents of textAkurasi as a double


% --- Executes during object creation, after setting all properties.
function textAkurasi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textAkurasi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in tombolProses.
function tombolProses_Callback(hObject, eventdata, handles)
% hObject    handle to tombolProses (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
f = waitbar(0,'Loading data');
pause(1)

waitbar(.50,f,'Processing data');
pause(1)

waitbar(1,f,'Please wait...');
pause(1)

RadioButton1 = get(handles.radio3,'Value');
RadioButton2 = get(handles.radio5,'Value');

norm = get(handles.tabelPreprocessing,'data');

textBatasB = str2num(get(handles.textBatasB,'String'));
textBatasA = str2num(get(handles.textBatasA,'String'));
x = 1;

% batasB = handles.popupmenu1.String;     
% indexB = handles.popupmenu1.Value;
% textBatasB = str2num(batasB{indexB});
% 
% batasA = handles.popupmenu2.String;     
% indexA = handles.popupmenu2.Value;
% textBatasA = str2num(batasA{indexA});

if (RadioButton1)
    for nilaiK = textBatasB:textBatasA
        [KTrain1, KTest1, LabelTrain1, LabelTest1] = threeFoldCross(norm, 1);
        euclidean_train1 = pdist2(KTrain1,KTrain1,'euclidean');
        label_euclidean1 = fungsi_s(KTrain1, nilaiK, LabelTrain1, euclidean_train1);
        validity1 = hitung_validitas(label_euclidean1, nilaiK);
        euclidean1 = pdist2(KTrain1,KTest1,'euclidean');
        weight1 = hitung_weight(KTest1, KTrain1, validity1, euclidean1);
        hasil_prediksi1 = prediksi(KTest1, KTrain1, nilaiK, LabelTrain1, weight1);
        output1 = label_prediksi(KTest1, nilaiK, hasil_prediksi1);
        confusion1 = confusionmat(LabelTest1,output1);
        akurasiK1 = (sum(diag(confusion1))/sum(sum(confusion1)))*100;
        
        [KTrain2, KTest2, LabelTrain2, LabelTest2] = threeFoldCross(norm, 2);
        euclidean_train2 = pdist2(KTrain2,KTrain2,'euclidean');
        label_euclidean2 = fungsi_s(KTrain2, nilaiK, LabelTrain2, euclidean_train2);
        validity2 = hitung_validitas(label_euclidean2, nilaiK);
        euclidean2 = pdist2(KTrain2,KTest2,'euclidean');
        weight2 = hitung_weight(KTest2, KTrain2, validity2, euclidean2);
        hasil_prediksi2 = prediksi(KTest2, KTrain2, nilaiK, LabelTrain2, weight2);
        output2 = label_prediksi(KTest2, nilaiK, hasil_prediksi2);
        confusion2 = confusionmat(LabelTest2,output2);
        akurasiK2 = (sum(diag(confusion2))/sum(sum(confusion2)))*100;

        [KTrain3, KTest3, LabelTrain3, LabelTest3] = threeFoldCross(norm, 3);
        euclidean_train3 = pdist2(KTrain3,KTrain3,'euclidean');
        label_euclidean3 = fungsi_s(KTrain3, nilaiK, LabelTrain3, euclidean_train3);
        validity3 = hitung_validitas(label_euclidean3, nilaiK);
        euclidean3 = pdist2(KTrain3,KTest3,'euclidean');
        weight3 = hitung_weight(KTest3, KTrain3, validity3, euclidean3);
        hasil_prediksi3 = prediksi(KTest3, KTrain3, nilaiK, LabelTrain3, weight3);
        output3 = label_prediksi(KTest3, nilaiK, hasil_prediksi3);
        confusion3 = confusionmat(LabelTest3,output3);
        akurasiK3 = (sum(diag(confusion3))/sum(sum(confusion3)))*100;

        JmlHasil = akurasiK1+akurasiK2+akurasiK3;
        akurasiKF(x) = (JmlHasil)/3;
        x = x+1;
    end
    
    akurasi = [akurasiKF];
    akurasiMax = max(akurasi);
    [~,value] = maxk(akurasiKF,1);
    limit = [textBatasB:textBatasA];
    KTerbaik = limit(:,value);
    
    akurasiKF1 = akurasiKF';
    assignin('base','akurasiKF',akurasiKF1);
    assignin('base','KTerbaik',KTerbaik);
    set(handles.textKTerbaik,'String',num2str(KTerbaik));
    set(handles.textAkurasi,'String',num2str(akurasiMax));
    
    axes(handles.graph);
    y = [textBatasB:textBatasA];
    z = [akurasiKF];
    plot(y,z,'-bo','linewidth',1,'markeredgecolor','k','markerfacecolor','k')
    grid on
    
else
    for nilaiK = textBatasB:textBatasA
        [KTrain1, KTest1, LabelTrain1, LabelTest1] = fiveFoldCross(norm, 1);
        euclidean_train1 = pdist2(KTrain1,KTrain1,'euclidean');
        label_euclidean1 = fungsi_s(KTrain1, nilaiK, LabelTrain1, euclidean_train1);
        validity1 = hitung_validitas(label_euclidean1, nilaiK);
        euclidean1 = pdist2(KTrain1,KTest1,'euclidean');
        weight1 = hitung_weight(KTest1, KTrain1, validity1, euclidean1);
        hasil_prediksi1 = prediksi(KTest1, KTrain1, nilaiK, LabelTrain1, weight1);
        output1 = label_prediksi(KTest1, nilaiK, hasil_prediksi1);
        confusion1 = confusionmat(LabelTest1,output1);
        akurasiK1 = (sum(diag(confusion1))/sum(sum(confusion1)))*100;
        
        [KTrain2, KTest2, LabelTrain2, LabelTest2] = fiveFoldCross(norm, 2);
        euclidean_train2 = pdist2(KTrain2,KTrain2,'euclidean');
        label_euclidean2 = fungsi_s(KTrain2, nilaiK, LabelTrain2, euclidean_train2);
        validity2 = hitung_validitas(label_euclidean2, nilaiK);
        euclidean2 = pdist2(KTrain2,KTest2,'euclidean');
        weight2 = hitung_weight(KTest2, KTrain2, validity2, euclidean2);
        hasil_prediksi2 = prediksi(KTest2, KTrain2, nilaiK, LabelTrain2, weight2);
        output2 = label_prediksi(KTest2, nilaiK, hasil_prediksi2);
        confusion2 = confusionmat(LabelTest2,output2);
        akurasiK2 = (sum(diag(confusion2))/sum(sum(confusion2)))*100;
        
        [KTrain3, KTest3, LabelTrain3, LabelTest3] = fiveFoldCross(norm, 3);
        euclidean_train3 = pdist2(KTrain3,KTrain3,'euclidean');
        label_euclidean3 = fungsi_s(KTrain3, nilaiK, LabelTrain3, euclidean_train3);
        validity3 = hitung_validitas(label_euclidean3, nilaiK);
        euclidean3 = pdist2(KTrain3,KTest3,'euclidean');
        weight3 = hitung_weight(KTest3, KTrain3, validity3, euclidean3);
        hasil_prediksi3 = prediksi(KTest3, KTrain3, nilaiK, LabelTrain3, weight3);
        output3 = label_prediksi(KTest3, nilaiK, hasil_prediksi3);
        confusion3 = confusionmat(LabelTest3,output3);
        akurasiK3 = (sum(diag(confusion3))/sum(sum(confusion3)))*100;
        
        [KTrain4, KTest4, LabelTrain4, LabelTest4] = fiveFoldCross(norm, 4);
        euclidean_train4 = pdist2(KTrain4,KTrain4,'euclidean');
        label_euclidean4 = fungsi_s(KTrain4, nilaiK, LabelTrain4, euclidean_train4);
        validity4 = hitung_validitas(label_euclidean4, nilaiK);
        euclidean4 = pdist2(KTrain4,KTest4,'euclidean');
        weight4 = hitung_weight(KTest4, KTrain4, validity4, euclidean4);
        hasil_prediksi4 = prediksi(KTest4, KTrain4, nilaiK, LabelTrain4, weight4);
        output4 = label_prediksi(KTest4, nilaiK, hasil_prediksi4);
        confusion4 = confusionmat(LabelTest4,output4);
        akurasiK4 = (sum(diag(confusion4))/sum(sum(confusion4)))*100;
        
        [KTrain5, KTest5, LabelTrain5, LabelTest5] = fiveFoldCross(norm, 5);
        euclidean_train5 = pdist2(KTrain5,KTrain5,'euclidean');
        label_euclidean5 = fungsi_s(KTrain5, nilaiK, LabelTrain5, euclidean_train5);
        validity5 = hitung_validitas(label_euclidean5, nilaiK);
        euclidean5 = pdist2(KTrain5,KTest5,'euclidean');
        weight5 = hitung_weight(KTest5, KTrain5, validity5, euclidean5);
        hasil_prediksi5 = prediksi(KTest5, KTrain5, nilaiK, LabelTrain5, weight5);
        output5 = label_prediksi(KTest5, nilaiK, hasil_prediksi5);
        confusion5 = confusionmat(LabelTest5,output5);
        akurasiK5 = (sum(diag(confusion5))/sum(sum(confusion5)))*100;
        
        JmlHasil = akurasiK1+akurasiK2+akurasiK3+akurasiK4+akurasiK5;
        akurasiKF(x) = (JmlHasil)/5;
        x = x+1;
    end
    
    akurasi = [akurasiKF];
    akurasiMax = max(akurasi);
    [~,value] = maxk(akurasiKF,1);
    limit = [textBatasB:textBatasA];
    KTerbaik = limit(:,value);
    
    akurasiKF1 = akurasiKF';
    assignin('base','akurasiKF',akurasiKF1);
    assignin('base','KTerbaik',KTerbaik);
    set(handles.textKTerbaik,'String',num2str(KTerbaik));
    set(handles.textAkurasi,'String',num2str(akurasiMax));

    axes(handles.graph);
    y = [textBatasB:textBatasA];
    z = [akurasiKF];
    plot(y,z,'-bo','linewidth',1,'markeredgecolor','k','markerfacecolor','k')
    grid on
    
end

close(f);
catch
     f = warndlg('Data yang anda masukkan salah atau tidak sesuai dengan format','Peringatan');
end

% --- Executes on button press in tombolReset.
function tombolReset_Callback(hObject, eventdata, handles)
% hObject    handle to tombolReset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% set(handles.textBatasB,'String','');
set(handles.textBatasA,'String','');
set(handles.textAkurasi,'String','');
set(handles.textKTerbaik,'String','');
axes(handles.graph);
cla reset;

% --- Executes on button press in radio3.
function radio3_Callback(hObject, eventdata, handles)
% hObject    handle to radio3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radio3


% --- Executes on button press in radio5.
function radio5_Callback(hObject, eventdata, handles)
% hObject    handle to radio5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radio5



function textBatasB_Callback(hObject, eventdata, handles)
% hObject    handle to textBatasB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textBatasB as text
%        str2double(get(hObject,'String')) returns contents of textBatasB as a double


% --- Executes during object creation, after setting all properties.
function textBatasB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textBatasB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function textBatasA_Callback(hObject, eventdata, handles)
% hObject    handle to textBatasA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textBatasA as text
%        str2double(get(hObject,'String')) returns contents of textBatasA as a double


% --- Executes during object creation, after setting all properties.
function textBatasA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textBatasA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function textKTerbaik_Callback(hObject, eventdata, handles)
% hObject    handle to textKTerbaik (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textKTerbaik as text
%        str2double(get(hObject,'String')) returns contents of textKTerbaik as a double


% --- Executes during object creation, after setting all properties.
function textKTerbaik_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textKTerbaik (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


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


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function menu_Callback(hObject, eventdata, handles)
% hObject    handle to menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function bantuan_Callback(hObject, eventdata, handles)
% hObject    handle to bantuan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox({
    '1.Pilih "upload data" untuk memasukkan data ke program, data berupa file excel.',
    '',
    '2.Lakukan transformasi data dengan cara klik "transformasi".',
    '',
    '3.Lakukan perhitungan akurasi dengan menentukan pilihan pada cross validation. Tentukan batas atas k untuk mengetahui akurasi dan jumlah k terbaik yang dihasilkan.',
    '',
    '4.Pilih "proses" hasil akan ditampilkan dalam kotak akurasi dan kotak k terbaik. Grafik akurasi pada setiap jumlah k juga ditampilkan dalam bentuk plot grafik.',
    '',
    '5.Pilih "upload data" untuk memasukkan data. Pilih "klasifikasi" untuk melakukan pengujian data.',
    '',
    '6.Pilih "simpan" untuk menyimpan data hasil klasifikasi ke dalam komputer.',
    '',
    '7.Pilih "reset" untuk mengatur ulang masukkan pada program.'},'Bantuan');


% --------------------------------------------------------------------
function keluar_Callback(hObject, eventdata, handles)
% hObject    handle to keluar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(Skripsi)
