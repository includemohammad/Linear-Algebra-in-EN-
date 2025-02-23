clc;
clear all 
close all 


A = [1 0 5;2 -4 7];
B =[1 2;-8 6;3 -4];

AB = A*B;
BA = B*A ;
AB_trace = trace(AB);
AB_trace = trace(BA);
