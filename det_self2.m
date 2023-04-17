function [outputDet] = det_self2(inputArr)
%DET_SELF Summary of this function goes here
%   Detailed explanation goes here
size = length(inputArr);
ref = echelon(inputArr);
detAns = 1;
for i = 1:size
    detAns = detAns*ref(i,i);
end
outputDet = detAns;
end

