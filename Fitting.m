% Define the input and output file paths
inputFilePath = 'New York 2015.xlsx';   
outputFilePath = 'output.xlsx'; 

%Read
data = xlsread(inputFilePath,'Sheet1', 'A:A'); 

% Fit the data to using normal distribution functions
pd_normal = fitdist(data, 'Normal');

% Compute the P-values for each fit
%[h,p] = chi2gof(data, 'Alpha', 0.05);
[h,p] = ttest(data,0.05);

% Display the P-values
disp(['h-value for Normal Distribution Fit: ' num2str(h)]);
disp(['p-value for Normal Distribution Fit: ' num2str(p)]);

figure(1)
y1 = pdf(pd_normal,data);
plot(data,y1)
histfit(data)
xlabel("Wind Speed (mph)")
ylabel("Frequency")

