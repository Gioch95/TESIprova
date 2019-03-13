function matrix=JamoviPSDspaziale(epoch,fs,PSDepochFNSZ,PSDepochGNSZ)
chan=19;%19 canali
epoch=6;%da 5 secondi
bande=5;%delta,gamma,beta,alpha,theta
%qui ho inserito un \ in pi�
fs=250;
estensione='*.mat';
%EPOCHE
        FN=zeros(1,chan*bande+1);
GN=FN;
inDirFNSZ='C:\Users\gioiachiodi\Documents\MATLAB\PSDepochFNSZ\';
inDirGNSZ='C:\Users\gioiachiodi\Documents\MATLAB\PSDepochGNSZ\';
outDirepoche='C:\Users\gioiachiodi\Documents\MATLAB\Epoche\';
cases1=dir(fullfile(inDirFNSZ,estensione));
cases2=dir(fullfile(inDirGNSZ,estensione))
for i=1:length(cases1)
    load(strcat(inDirFNSZ,cases1(i).name));
    FN=[FN;"FNSZ",PSDepoch(:)'];
end
for i=1:length(cases2)
    load(strcat(inDirGNSZ,cases2(i).name));
    GN=[GN;"GNSZ",PSDepoch(:)'];
end 
FN(1,:)=[];
GN(1,:)=[];
matrix=[FN;GN];
        
filenameepoche=strcat(outDirepoche,'_Jamovi');
save(strcat(filenameepoche,'Epoche'),'matrix')

end