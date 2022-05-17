a = mamfis('Name', "Fuzzy"); %mamfis creates a mamdani fuzzy system
a.DefuzzificationMethod = "centroid"; %the center of area defuzzification method

a = addInput(a,  [7 16], "Name", "temperature"); %1st input
a = addMF(a , "temperature", 'trimf', [7 7 9], 'Name' , "VC");
a = addMF(a, "temperature", 'trimf', [7 9 11], 'Name' , "C" );
a = addMF(a, "temperature", 'trimf', [10 13 14], 'Name' , "N");
a = addMF(a, "temperature", 'trimf', [12 14 16], 'Name' , "H");
a = addMF(a, "temperature", 'trimf', [13 16 16], 'Name' , "VH");

a = addInput(a,  [1.75 4.00], "Name", "pressure"); %2nd input
a = addMF(a , "pressure", 'trimf', [1.75 1.75 2.25], 'Name' , "VB");
a = addMF(a, "pressure", 'trimf', [1.75 2.25 2.50], 'Name' , "B" );
a = addMF(a, "pressure", 'trimf', [2.25 2.75 3.25], 'Name' , "N");
a = addMF(a, "pressure", 'trimf', [2.5 3.25 3.50], 'Name' , "G");
a = addMF(a, "pressure", 'trimf', [2.75 4.00 4.00], 'Name' , "VG");


a = addOutput(a,  [2.0 6.0], "Name", "percentage"); %output
a = addMF(a , "percentage", 'trimf', [2 2 3], 'Name' , "VB");
a = addMF(a, "percentage", 'trimf', [2 3 4], 'Name' , "B" );
a = addMF(a, "percentage", 'trimf', [3 4 5], 'Name' , "N");
a = addMF(a, "percentage", 'trimf', [4 5 6], 'Name' , "G");
a = addMF(a, "percentage", 'trimf', [5 6 6], 'Name' , "VG");

ruleList = [
    1 1 3 1 1;
    1 2 3 1 1;
    1 3 4 1 1;
    1 4 5 1 1;
    1 5 5 1 1;
    2 1 2 1 1;
    2 2 4 1 1;
    2 3 4 1 1;
    2 4 4 1 1;
    2 5 5 1 1;
    3 1 2 1 1;
    3 2 3 1 1;
    3 3 3 1 1;
    3 4 4 1 1;
    3 5 5 1 1;
    4 1 2 1 1;
    4 2 2 1 1;
    4 3 3 1 1;
    4 4 3 1 1;
    4 5 4 1 1;
    5 1 1 1 1;
    5 2 2 1 1;
    5 3 3 1 1;
    5 4 3 1 1;
    5 5 4 1 1
    ]; 

%rule list respectively first two colums for input,
%3rd column for output, weight is stable 1, operator is AND=1

fuzz=addRule(a, ruleList);
output=evalfis(fuzz , [12.5 2.6])