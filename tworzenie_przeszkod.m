global s A1 A2 B1 B2 C1 C2 D1 D2

A1 = [2, 2, 9, 9, 2]; %x
A2 = [7, 10, 10, 7, 7]; %y
B1 = [2, 2, 8, 8, 2];
B2 = [0, 2, 2, 0, 0];
C1 = [2, 3, 6, 8, 4, 2];
C2 = [1, 3, 3, 2, 0, 1];
D1 = [3, 3, 4, 4, 3];
D2 = [4, 5, 4, 5, 4];
% 
field1 = 'Ax';  value1 = A1;
field2 = 'Ay';  value2 = A2;
field3 = 'Bx';  value3 = B1;
field4 = 'By';  value4 = B2;
field5 = 'Cx';  value5 = C1;
field6 = 'Cy';  value6 = C2;
field7 = 'Dx';  value7 = D1;
field8 = 'Dy';  value8 = D2;

 s = struct(field1, value1, field2, value2, field3, value3, field4, value4, field5, value5, field6, value6, field7, value7, field8, value8);
% s = struct(field1, value1, field2, value2);