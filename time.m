% Load data from Excel
[numData, txtData, raw] = xlsread('New York 2014.xlsx');

% Extract the wind speed and timestamp columns
hourlyWindSpeed = numData(:, 1);  % Assuming wind speed is in the first column
timestamps = datetime(txtData(2:end, 2), 'InputFormat', 'MM/dd/yyyy hh:mm:ss a');

% Create a timetable
timetableData = timetable(timestamps, hourlyWindSpeed);

% daily averages
dailyAverages = retime(timetableData, 'daily', 'mean');

% weekly averages
weeklyAverages = retime(timetableData, 'weekly', 'mean');

% monthly averages
monthlyAverages = retime(timetableData, 'monthly', 'mean');

% Flatten the timetable
%flatTable1 = splitvars(weeklyAverages);
%flatTable2 = splitvars(monthlyAverages);
flatTable3 = splitvars(dailyAverages);

% Save weekly averages to Excel
%writetimetable(flatTable1, 'weekly_averages_2016.xlsx');
%writetimetable(flatTable2, 'monthly_averages_2016.xlsx');
writetimetable(flatTable3, 'daily_averages_2014.xlsx');