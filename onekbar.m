%This displays ten resistors and their variation from the nominal value
x = 1:10;
nominal = [1 1 1 1 1 1 1 1 1 1];
R = [0.979 0.992 0.989 0.979 0.991 0.989 0.988 0.983 0.984 0.989];
for i=1:length(R)
    P = (1-double(R))/1;
end
fig = figure;
b = bar(x, nominal);
hold on
c = bar(x, R,'r');

%add legend
legend('Nominal Value','Measured Value');
title('10x 1000 \Omega Resistors')
xlabel('Resistor') % x-axis label
ylabel('Resistance (k\Omega)')
dim = [.16 .6 .25 .15];
annotation('textbox',dim,'BackgroundColor', 'w','String', '2.1%  0.8%  1.1%  2.1%  0.9%  1.1%  1.2%  1.7%  1.6%  1.1%','FitBoxToText','on');