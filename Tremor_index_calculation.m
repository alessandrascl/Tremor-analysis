clear all;
cd 'C:\Users\muuzh\Desktop\For Ale\Sample data'; % Please replace with your own folder path.

%% Define parameter values.
Fs=100;
T=1/Fs;
Duration=3; % in seconds
L=Duration*Fs;
t=(0:L-1)*T;
f=Fs*(0:(L/2))/L;

%% Read data files.
file={dir('*.txt')};
numFiles = length(file{1}); 
no_of_minutes=20; %Recording session in minutes.
startRow = 2;
endRow = 60*no_of_minutes*Fs+1;
myData = cell(3,numFiles);

%% Fast fourier transformation and calculation of tremor index.
for fileNum = 1:numFiles
    fileNames = {file{1}.name};
    fileName = fileNames{fileNum};
    myData{1,fileNum} = importfile(fileName,startRow,endRow);
    [m,n]=size(myData{1,fileNum});
    row=m/Duration/Fs;
    data_reshaped=reshape(myData{1,fileNum},Duration*Fs,row);
    for i=1:row
        Y=fft(data_reshaped(:,i));
        P2=abs(Y/L);
        P1=P2(1:L/2+1);
        P1(2:end-1)=2*P1(2:end-1);
        P(i,:)=P1;
    end
    P_averaged=mean(P,1);
    myData{2,fileNum}=P_averaged';
    indexP=find(f>6&f<9);
    indexB=find(f>1&f<4);
    baseline=mean(P_averaged(indexB));
    myData{3,fileNum}=sum(P_averaged(indexP)-baseline);
end

%% Export results to an excel file.
result = 'Results.xlsx';
xlswrite(result,fileNames,'raw','A1');
xlswrite(result,fileNames,'FFT','A1');
xlswrite(result,fileNames,'power','A1');

for i=1:numFiles
    xlswrite(result,myData{1,i},'raw',strcat(num2abc(i),'2'));
    xlswrite(result,myData{2,i},'FFT',strcat(num2abc(i),'2'));
    xlswrite(result,myData{3,i},'power',strcat(num2abc(i),'2'));
end
