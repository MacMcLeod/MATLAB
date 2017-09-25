%Create an excel spreadsheet with gradepoint (ex. A=4) in column A and
%hours in column B
G = xlsread('Grades.xlsx','A:A');
H = xlsread('Grades.xlsx','B:B');
I = G .* H;
gradepoints = sum(I)
hours = sum(H)
GPA = gradepoints/hours



