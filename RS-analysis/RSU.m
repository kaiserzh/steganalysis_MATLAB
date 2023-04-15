function [r,s,u] = RSU(orgImgMtr,mask,flag)
% calculate the groups of R,S,and U   计算并输入图片的R,S,U 个数
%   input: 
%           orgImgMtr : original image Matrix of grayscale image,which is cover or stego
%                   image. you have to provide processed image matrix.
%           mask: the mask of apply smoothness function on group,you have
%                   to give it expilicly
%           flag: if flag is true, 1 in the mask is treat as 1, or as -1
%   output:
%           r: number of regular group
%           s: number of singular group
%           u: number of unusable group
%% prepare
maskLen = size(mask,2); % equal to the size of group
[m,n] = size(orgImgMtr);

%% zigzag or row-wise read the matrix to a vector
% orgVec = vector(orgImgMtr);
orgVec = zigzag(orgImgMtr);
%% do F function with mask
shiftVec = F(orgVec,mask,flag);
%% calculate smoothness value of each group
orgSmoothVal=smoothness(orgVec,maskLen);
shiSmoothVal=smoothness(shiftVec,maskLen);

r=0;
s=0;
u=0;
%% calculate the number of r,s,u
groupNum = size(orgSmoothVal,2);
%debug code
if groupNum ~= (m*n)/maskLen
    fprint('group number ');
end
for i=1:(m*n)/maskLen
    if orgSmoothVal(1,i) < shiSmoothVal(1,i)
        r=r+1;
    elseif orgSmoothVal(1,i) > shiSmoothVal(1,i)
        s=s+1;
    else
        u=u+1;
    end
end

end

