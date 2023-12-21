% Assuming 'data' is your table read from Excel
data1 = readtable('hour_2016.xlsx'); 
data2 = readtable('daily_2016.xlsx'); 
data3 = readtable('monthly_2016.xlsx'); 
input1 = 'wind_2016.xlsx';

% Extract month and hour information from the 'DateTime' column
hours = hour(data1.Date);
daily= day(data2.Date);
months = month(data3.Date);

%Read
h = xlsread(input1,'Sheet1', 'B:B');
d = xlsread(input1,'Sheet1', 'D:D'); 
m = xlsread(input1,'Sheet1', 'F:F');

%variable
A1=0;
A2=0;
A3=0;
A4=0;
B1=0;
B2=0;
B3=0;
B4=0;
C1=0;
C2=0;
C3=0;
C4=0;
x = zeros(size(hours));
y = zeros(size(daily));
z = zeros(size(months));

for i = 1:numel(hours)
  A1 = A1 + hours(i);
  A2 = A2 + h(i);
  A3 = A3 + hours(i)^2;
  A4 = A4 + (hours(i)* h(i));
end

for i = 1:numel(daily)
  B1 = B1 + daily(i);
  B2 = B2 + d(i);
  B3 = B3 + daily(i)^2;
  B4 = B4 + (daily(i)*d(i));
end

for i = 1:numel(months)
  C1 = C1 + months(i);
  C2 = C2 + m(i);
  C3 = C3 + months(i)^2;
  C4 = C4 + (months(i)* m(i));
end

%constant
X0=10.11;
X1=0.123;
Y0=11.4;
Y1= 6.361*10^-3;
Z0=12.41 ;
Z1=-0.136 ;

for i = 1:numel(hours)
    x(i)= X0 + (X1*hours(i));
end

for i = 1:numel(daily)
    y(i)= Y0 + (Y1*daily(i));
end

for i = 1:numel(months)
    z(i)= Z0 + (Z1*months(i));
end

% plot with two y-axis
figure(1);
scatter(hours, h, 'o', 'DisplayName', 'Y1');
hold on;  % Allow multiple plots on the same figure
plot(hours, x, '-x', 'DisplayName', 'Y2');
hold off;
title('Actual wind speed for hours vs Forecast speed');
xlabel('Hours');
ylabel('Wind Speed (mph)');
legend;

% plot with two y-axis
figure(2);
scatter(daily, d, 'o', 'DisplayName', 'Y1');
hold on;  % Allow multiple plots on the same figure
plot(daily, y, '-x', 'DisplayName', 'Y2');
hold off;
title('Actual wind speed for daily vs Forecast speed');
xlabel('Daily');
ylabel('Wind Speed (mph)');

% plot with two y-axis
figure(3);
scatter(months, m, 'o', 'DisplayName', 'Y1');
hold on;  % Allow multiple plots on the same figure
plot(months, z, '-x', 'DisplayName', 'Y2');
hold off;
title('Actual wind speed for months vs Forecast speed');
xlabel('Months');
ylabel('Wind Speed (mph)');
