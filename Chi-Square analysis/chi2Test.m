function [p] = chi2Test(imgPath)
% Chi Square Test 输入图片路径，返回概率值p
%   input: 
%           imgPath:file path of image 测试图片路径
%   output:
%           p: p-value 概率值

  ste_cover = imread(imgPath);
  count=imhist(ste_cover);
  h_length=size(count);
  p_num=floor(h_length/2);  

  % r: Chi-square statistic, K-1：degrees of freedom
  % r为卡方统计量，K-1为自由度
  r=0; %记录卡方统计量
  k=0; %
  % p_num = p_num-1;

  x = zeros(p_num(1),1);
  y = zeros(p_num(1),1);
  d = zeros(p_num(1),1);

  for i=0:p_num(1)-1
    if(count(2*i+1)+count(2*i+2)) >= 5
%         r=r+(count(2*i-1)-count(2*i))^2/(2*(count(2*i-1)+count(2*i)));
        x(i+1) = count(2*i+1);
        y(i+1) = count(2*i+2);
        z = (count(2*i+1)+count(2*i+2))/2;
        d(i+1) = (count(2*i+1)-z)^2/z;
        r=r+d(i+1);
        k=k+1;
    else
        x(i+1) = 0;
        y(i+1) = 0;
    end
  end
 
  % disp(r)
  % disp(k) 
  flag = chi2cdf(r,k-1);
  p=1-flag; 
  % disp (p);

% Other methods 这种方法算出来结果一样  
% ap = 1-gammainc(r/2,(k-1)/2);
% disp(ap)

end
