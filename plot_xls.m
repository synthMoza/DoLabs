% Read the name of the input file
string = "Enter the name of the input Excel file (without the file extension): ";
xls_file = input(string, 's');

% Read data from the input file
[num, txt, raw] = xlsread(xls_file);

% Extract data for polyfitting
num = transpose(num);
x = num(1, :);
x_err = num(2, :);
y = num(3, :);
y_err = num(4, :);

% Polyfit the function and make a plot
hold on;
grid on;

x_length = max(x) - min(x);
p = polyfit(x, y, 1);
x_plot = (min(x) - x_length) : (max(x) + x_length);
plot(x_plot, polyval(p, x_plot), 'g-');
errorbar(x, y, y_err, -y_err, x_err, -x_err, 'ro');
xlabel(txt(2, 1));
ylabel(txt(2, 3));
title(txt(1, 1));

% Set origin to (0, 0) and change font size
fontSize = 12;
set(gca,'FontSize', fontSize);
ax = gca; % Get handles to axis.
ax.YAxisLocation = 'origin';
ax.XAxisLocation = 'origin';

hold off;
