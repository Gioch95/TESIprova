function matrix=JamoviPSDglobale(bande,fs,PSDmediaFNSZ,PSDmediaGNSZ)
chan=19;%19 canali
epoch=6;%da 5 secondi
bande=5;%delta,gamma,beta,alpha,theta
%qui ho inserito un \ in pi�
fs=250;
estensione='*.mat';

%BANDEMEDIA
        FN=zeros(1,bande+1);
GN=FN;
inDirFNSZ='C:\Users\gioiachiodi\Documents\MATLAB\PSDmediaFNSZ\';
inDirGNSZ='C:\Users\gioiachiodi\Documents\MATLAB\PSDmediaGNSZ\';
outDirbande='C:\Users\gioiachiodi\Documents\MATLAB\Bande\';
cases1=dir(fullfile(inDirFNSZ,estensione));
cases2=dir(fullfile(inDirGNSZ,estensione))
for i=1:length(cases1)
    load(strcat(inDirFNSZ,cases1(i).name));
    FN=[FN;"FNSZ",PSDmedia];
end
for i=1:length(cases2)
    load(strcat(inDirGNSZ,cases2(i).name));
    GN=[GN;"GNSZ",PSDmedia];
end 
FN(1,:)=[];
GN(1,:)=[];
matrix=[FN;GN];
filenamebande=strcat(outDirbande,'_Jamovi');
save(strcat(filenamebande,'MediaBande'),'matrix')
end