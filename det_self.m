function [outputDet] = det_self(inputArr)
%DET_SELF Summary of this function goes here
%   Detailed explanation goes here
size = length(inputArr);

ansArr = [];
if size >2
    for i = 1:size
        tempArr = inputArr;
        tempArr(:,i,:) = [];
        tempArr(1,:) = [];

        localDet = det_self(tempArr);
        aimedEle = inputArr(1,i);
        ansArr(end+1) = aimedEle*localDet;
    end
    coeffect = ones([1 size]);
    for l = 1:size
        coeffect(l) = -1*(-1)^l;
    end
    ansArr=ansArr*transpose(coeffect);
else
    for i = 1:size
        aimedEle = inputArr(1,i);
        tempArr = inputArr;
        tempArr(:,i) = [];
        tempArr(1,:) = [];
        ansArr(end+1) = aimedEle.*tempArr;
    end
    coeffect = ones([1 size]);
    for l = 1:size
        coeffect(l) = -1*(-1)^l;
    end
    ansArr = ansArr*transpose(coeffect);
end

outputDet = ansArr;
end

