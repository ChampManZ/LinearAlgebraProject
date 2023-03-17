function [outputCofactor] = cofactor_self(inputArr)
%COFACTOR_SELF Summary of this function goes here
%   Detailed explanation goes here
size = length(inputArr);
coeffectOdd = ones([1 size]);
coeffectEven = ones([1 size]);
for l = 1:size
    coeffectOdd(l) = -1*(-1)^l;
    coeffectEven(l) = (-1)^l;
end

for i = 1:size
    for l = 1:size
        tempArr = inputArr;
        tempArr(i,:) = [];
        tempArr(:,l,:) = [];
        
        cofector(i,l)=det_self(tempArr);
    end
end

for k = 1:length(cofector)
    if mod(k,2) == 0
        cofector(k,:) = cofector(k,:).*coeffectEven;
    else
        cofector(k,:) = cofector(k,:).*coeffectOdd;
    end
end

outputCofactor = cofector;
end

