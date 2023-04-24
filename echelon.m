function [outputArr] = echelon(inputArr)
%ECHELON Summary of this function goes here
%   Detailed explanation goes here
size1 = length(inputArr);

% Create an augmented matrix with identity matrix as the right-hand side
n = size(inputArr,1);
inputArr = horzcat(inputArr, eye(n));

for j=1:size1-1
    if inputArr(j, j) == 0
        [targetPivot,idx] = max(abs(inputArr(j:end,j)));
        temp = inputArr(j,:);
        inputArr(j,:) = inputArr(idx+j-1,:);
        inputArr(idx+j-1,:) = temp;
    end
%disp(tempArr)
    for i = j+1:size1
        tempArr = inputArr(j,:)*(inputArr(i,j)/inputArr(j,j));
        inputArr(i,:)= inputArr(i,:)- tempArr;
        %disp(inputArr(i,j)/inputArr(j,j))
    end
end

%disp(inputArr)
%outputArr = inputArr(:, n+1:end);
outputArr = inputArr;
end

