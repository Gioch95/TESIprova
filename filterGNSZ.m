function EEGOUT=filterGNSZ(Y)

inDir='C:\Users\gioiachiodi\Documents\MATLAB\GNSZ 30 secondi\';
outDir='C:\Users\gioiachiodi\Documents\MATLAB\GNSZFilter\';%qui ho inserito un \ in pi�
fs=250;

estensione='*.mat';
cases=dir(fullfile(inDir,estensione));
for i=1:length(cases)
     load(strcat(inDir,cases(i).name));
     EEG.mydata=Y;
     locutoff= 1;
     hicutoff= 40;
    EEGOUT = eegfilt( EEG.mydata, fs, locutoff, hicutoff);
save(strcat(outDir,(strtok(cases(i).name,'.')),'filt.mat'),'EEGOUT')

end