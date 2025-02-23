clc; 
clear all 
close all 



A = [2 3 4;1 5 3;4 6 4];
B = det (A); % Now this det is zero tnen we are donmt like it and for this problem continu 
%%jabejae sater ha 
C = [A(1,:);A(3,:);A(2,:)];
D = det(C); 

%%sum of row in the on Matrix 
f = [A(1,:);A(2,:)+A(3,:);A(3,:)]; 
F = det (f) ;
%%product k scalr number in one row in matrix 

k = 2;
r = [k.*A(1,:);A(3,:)+k.*A(2,:);A(3,:)];
R = det(r);


