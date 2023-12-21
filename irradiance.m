% Assuming 'data' is your table read from Excel
data = readtable('sorted_New-York-2015.xlsx'); 

% Extract month and hour information from the 'DateTime' column
months = month(data.date);
hours = hour(data.date);

% Initialize the new column
data.Irradiance = zeros(size(data.date));

% Assign values based on conditions
for i = 1:numel(data.date)
    if ismember(months(i), [1:4, 9:12]) % January to April and September to December are winter
         if hours(i) == 6
            data.Irradiance(i) = 60;
         elseif hours(i) == 7
            data.Irradiance(i) = 277;
        elseif hours(i) == 8
            data.Irradiance(i) = 465;
        elseif hours(i) == 9
            data.Irradiance(i) = 612;
        elseif hours(i) == 10
            data.Irradiance(i) = 704;
        elseif hours(i) == 11
            data.Irradiance(i) = 736;
        elseif hours(i) == 12
            data.Irradiance(i) = 704;
        elseif hours(i) == 13
            data.Irradiance(i) = 612;
        elseif hours(i) == 14
            data.Irradiance(i) = 465;
        elseif hours(i) == 15
            data.Irradiance(i) = 277;
        elseif hours(i) == 16
            data.Irradiance(i) = 60;    
        else
            data.Irradiance(i) = 0;
         end    

    else  % May to August are summer
         if hours(i) == 6
            data.Irradiance(i) = 170;
         elseif hours(i) == 7
            data.Irradiance(i) = 386;
        elseif hours(i) == 8
            data.Irradiance(i) = 585;
        elseif hours(i) == 9
            data.Irradiance(i) = 743;
        elseif hours(i) == 10
            data.Irradiance(i) = 844;
        elseif hours(i) == 11
            data.Irradiance(i) = 878;
        elseif hours(i) == 12
            data.Irradiance(i) = 844;
        elseif hours(i) == 13
            data.Irradiance(i) = 743;
        elseif hours(i) == 14
            data.Irradiance(i) = 585;
        elseif hours(i) == 15
            data.Irradiance(i) = 386;
        elseif hours(i) == 16
            data.Irradiance(i) = 170;    
        else
            data.Irradiance(i) = 0;
         end   
    end
end

% Write the updated table to a new Excel file
writetable(data, 'NYC_2016_update.xlsx'); % Adjust the filename accordingly
