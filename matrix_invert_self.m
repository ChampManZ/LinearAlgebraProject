function [outputArr] = matrix_invert_self(inputArr)
%METRIC_INVERT self X value made matrix invert function
%   self made matrix invert function
if size(inputArr,1) ~= size(inputArr,2)
    error('Error: the matrix is not a square metrix')
end

det = det_self2(inputArr);
disp('Determinant: ')
disp(det);

if det == 0
   error('Error: the determinant of input matrix = 0')
end

coffector = cofactor_self(inputArr);
outputArr = (1/det).*transpose(coffector);
end

