% Read information about the X location of the table in the file
string = "Enter the group of cells where X is located (for instance, A1:A6): ";
x_location = input(string, 's');

% Find ":" in the string
index = strfind(x_location, ':');
if size(index) ~= 1
    disp("Wrong X address!");
    return;
end

x_column = int8(lower(x_location(1))) - 96;
x_column_tmp = int8(lower(x_location(4))) - 96;
% If the columns are different, that is a mistake
if x_column ~= x_column_tmp
    disp("Wrong X address!");
    return;
end
x_row_b = str2double(x_location(2:(index - 1)));
x_row_e = str2double(x_location((index + 2) : strlength(x_location)));
if (x_row_e <= x_row_b)
   disp("Wrong X address!");
   return;
end

% Read information about the Y location of the table in the file
string = "Enter the group of cells where Y is located (for instance, B1:B6): ";
y_location = input(string, 's');

% Find ":" in the string
index = strfind(y_location, ':');
if size(index) ~= 1
    disp("Wrong Y address!");
    return;
end

y_column = int8(lower(y_location(1))) - 96;
y_column_tmp = int8(lower(y_location(4))) - 96;
% If the columns are different, that is a mistake
if y_column ~= y_column_tmp
    disp("Wrong Y address!");
    return;
end
y_row_b = str2double(y_location(2:(index - 1)));
y_row_e = str2double(y_location((index + 2) : strlength(y_location)));
if (y_row_e <= y_row_b)
   disp("Wrong Y address!");
   return;
end