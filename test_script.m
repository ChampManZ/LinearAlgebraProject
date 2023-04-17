x=randi([-50,50],1);
%x = [1 2 3; 2 5 2; 6 -3 1;];
disp(x)

y=matrix_invert_self(x);
%y=det_self(x);
%z=det_self2(x);
%y=echelon(x);

disp(y)
disp(x^-1)
%disp(re(x))