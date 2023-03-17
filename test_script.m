%x=randi([-50,50],3);
x = [1 2 3; 4 5 6; 7 8 9];
disp(x)

y=matrix_invert_self(x);

disp(y)
disp(x^-1)