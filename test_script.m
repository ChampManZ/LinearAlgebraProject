x=randi([-5000,5000],5);
%x = [1 2 3; 2 5 2; 6 -3 1;];
disp(x)

y=matrix_invert_self(x);
%y=det_self(x);
%z=det_self2(x);
%y=echelon(x);
anw = x^-1;

disp(y)
disp(x^-1)
for i=1:length(x)
    for j=1:length(x)
        if y(i,j)~= anw(i,j)
            disp("correct")
        else
            disp("nah")
            disp(y(i,j))
            disp(anw(i,j))
        end
    end
end
%disp(re(x))