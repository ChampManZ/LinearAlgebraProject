%x=randi([-50,50],3);
x = [1 2 3; 2 5 2; 6 -3 1;];
disp(x)

y=matrix_invert_self(x);

disp(y)
disp(x^-1)