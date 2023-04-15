function [rm,sm,r_m,s_m] = RS(imgPath)
% RS analysis for an image 对一张图片进行RS分析
%   input: 
%           imgPath: the path of the image to be analyzed
%   output:
%           the valuse of rm,sm,r_m,s_m (Range [0,1])
img = imread(imgPath);
img = double(img);
mask = [1,0,1,0]; % mask 根据图片尺寸自行调整
%% process with mask
[r,s,u] = RSU(img,mask,true);
rm = r/(r+s+u);
sm = s/(r+s+u);
%% process with inverse mask
[r,s,u] = RSU(img,mask,false);
r_m = r/(r+s+u);
s_m = s/(r+s+u);
end
