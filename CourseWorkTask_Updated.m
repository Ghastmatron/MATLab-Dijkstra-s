function [A_sparse, B] = CourseWorkTask_Updated();
%this funtion generate question 1  based on student number'
x=input('Please input your student number?     '); 
 randn('seed',100);
  rand('seed',100);
A=mod(x,5)/5 -  randn(6,6);
 

A=  abs(20*A) ; 
 
A=floor((A+A')/2); 
temp2=mean(A) ;
 for i=1:6
temp= randperm(6);

for j=1:3;

A(i,temp(j))=NaN;
end;
 end
  for i=1:6;
    A(i,i)=0;
 end;
 B= floor(temp2.*abs(randn(1,6))); 
display(['My student number is   ', num2str(x)]);
fprintf(2, 'Data information for Q1:\n ')
display( 'Initial adjacent matrix showing direct distances (miles)  amongst A, B, C, D, E, F is given by:'  );
 disp(A)
 fprintf(2, 'Data information for Q2 and Q3:\n ')
display( 'The distances from   G to { A, B, C, D, E, F} respectively, are given by: '   );
 disp(B)
 A_sparse = sparse(A);
 
