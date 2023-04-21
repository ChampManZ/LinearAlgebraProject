function [outputArr] = echelon(inputArr)
%ECHELON Summary of this function goes here
%   Detailed explanation goes here
size = length(inputArr);
for j=1:size-1
%disp(tempArr)
    for i = j+1:size
        tempArr = inputArr(j,:)*(inputArr(i,j)/inputArr(j,j));
        inputArr(i,:)= inputArr(i,:)- tempArr;
        %disp(inputArr(i,j)/inputArr(j,j))
    end
end
for i=1:size
    for j=1:size
        if abs(inputArr(i,j))<=0.001
            inputArr(i,j) = 0;
        end
    end
end

disp(inputArr)
outputArr = inputArr;
end

