function [smoothVal] = smoothness(imgVec,interval)
% smoothness funciton: calculate the f value for each group 
% 平滑函数：计算每个group的平滑度
%   input:
%        imgVec : 1 by m*n vector
%       interval: the size of a group
%   output:
%       smoothVal : 1 by m*n/interval vector, f value for group,x(1) is the f value of
%           sum(abs(imgVec(i+1)-imgVec(i)), i=1:interval-1
%  
n = size(imgVec,2);
groupNum = n/interval;
smoothVal = zeros(1,groupNum);
for i=1:groupNum
    sum = 0;
    for j=1:interval-1
        sum = sum + abs(imgVec(1,(i-1)*interval+j+1)-imgVec(1,(i-1)*interval+j));
    end 
    smoothVal(1,i) = sum;
end

end

