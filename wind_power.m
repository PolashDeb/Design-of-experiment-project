% Define the input and output file paths
input1 = 'wind speed 2016.xlsx';  

%Read
v = xlsread(input1,'Sheet1', 'A:A'); 

v_c = 2.0;  % Cut-in speed
v_r = 12.0; % Rated speed
v_s = 25.0; % Cut-off speed
P_m = 2.0;  % Power capacity in MW
h= 80; %height 80 meters
h_g= 10; % ground level height 10 meters
k= 0.34 % Hellman exponent

P = zeros(size(v)); % Initialize power output vector

% Calculate power output based on wind speed conditions
for i = 1:numel(v)
    %v(i)=(data(i) * (h/h_g)^k);
    if v(i) >= v_c && v(i) <= v_r
        P(i) = (v(i) / v_r)^3 * P_m;
    
    elseif v(i) < v_c || v(i) > v_s
        P(i) = 0;
   
    else
        P(i)=P_m;
    end

end

output_data = [v, P]; % Combine wind speed and power data

xlswrite('output_file.xlsx', output_data, 'Sheet1');

% Create a plot
plot(v, P);

% Label the axes and add a title
xlabel('Wind Speed (m/s)');
ylabel('Power (kW)');
title('Wind Speed vs. Power');

% Display the grid
grid on;

