% Define the input and output file paths
input1 = 'monthly_averages_2015.xlsx';  
input2 = 'monthly_averages_2016.xlsx'; 

%Read
data_1 = xlsread(input1,'Sheet1', 'B:B'); 
data_2 = xlsread(input2,'Sheet1', 'B:B'); 

% Set the desired confidence level (95% in this case)
alpha = 0.05;

% Perform the two-sample t-test
[h, p] =  vartest2(data_1, data_2, alpha, 'both');

% 'h' is the test decision (1 if H0 is rejected, 0 if not)
% 'p' is the P-value

% Check if the P-value is smaller than alpha to determine statistical significance
if p < alpha
    disp('Reject the null hypothesis (H0). The variances are significantly different.');
else
    disp('Fail to reject the null hypothesis (H0). The variances are not significantly different.');
end