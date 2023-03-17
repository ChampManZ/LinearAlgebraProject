function [outputArr] = matrix_invert_self(inputArr)
%METRIC_INVERT self made matrix invert function
%   self made matrix invert function
det = det_self(inputArr);

if det == 0
   error('Error: the determinant of input matrix = 0')
end

coffector = cofactor_self(inputArr);
outputArr = (1/det).*transpose(coffector);
end

