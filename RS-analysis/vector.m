function [output] = vector(input)
% row-wise scan a matrix to a vector
% 按行扫描矩阵并转成向量  
[m,n] = size(input);
output = zeros(1,m*n);
for i=1:m
    output((i-1)*m+1:(i-1)*m+n) = input(i,:);
end
end

