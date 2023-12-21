% Define the input and output file paths
input1 = 'New York weather year 2014-2016.xlsx';
input2 = 'NYC_2016_update.xlsx'; 

%Read
I= xlsread(input2,'Sheet1', 'B:B');
temp = xlsread(input1,'New York 2016', 'D:D'); 
speed = xlsread(input1,'New York 2016', 'H:H');
weather= xlsread(input1,'New York 2016', 'Y:Y');

%constant

n= 0.25 % PV efficiency
A= 1000 % PV size 1000 m^2


P = zeros(size(speed)); % Initialize power output vector

% Calculate power output based on wind speed conditions
for i = 1:numel(temp)
    T(i) = 30+ [0.0175*(I(i)-300)]+[1.14*(temp(i)-25)];

    if weather(i)==1
        P(i) = 1*n*A*I(i)*[1-(0.005*(T(i)-25))];
    
    elseif weather(i)==2
        P(i) = 0.7*n*A*I(i)*[1-(0.005*(T(i)-25))];
   
    elseif weather(i)==3
        P(i) = 0.5*n*A*I(i)*[1-(0.005*(T(i)-25))];

    elseif weather(i)==4
        
        P(i) = 0.3*n*A*I(i)*[1-(0.005*(T(i)-25))];
    
    elseif weather(i)==5
        P(i) = 0.2*n*A*I(i)*[1-(0.005*(T(i)-25))];

    elseif weather(i)==6 || weather(i)==7 || weather(i)==8
        P(i) = 0.1*n*A*I(i)*[1-(0.005*(T(i)-25))];
    else
         P(i) = 0;
    end

end


output_data = [speed, P]; % Combine wind speed and power data

xlswrite('output_power_2.xlsx', output_data, 'Sheet1');

% Create a plot
plot(speed, P);

% Label the axes and add a title
xlabel('Wind Speed (m/s)');
ylabel('Power (W)');
title('Wind Speed vs. Power');

% Display the grid
grid on;
