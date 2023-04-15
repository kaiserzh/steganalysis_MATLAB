function lsb( imagePath,rate,stegoPath )
% embed information in the cover image by LSB method 对图像以嵌入率为rate进行顺序LSB嵌入
%   input:
%           imagePath: path of the carrier image 载体图路径
%           rate: embedding rate, the percentage of used pixels in the
%           carrier image 嵌入率，即载体图中用于嵌入的像素比例，取值在[0,1]
%           stegoPath: path of the stego image
%   output:
%           None

cover=imread(imagePath);
ste_cover=double(cover); 
[m,n]=size(ste_cover); 

% generate the embedded message msg,the length is determined by the rate and
% image size
% 依据rate计算秘密信息位的长度，并生成秘密信息msg
msglen=floor(m*n*rate);
msg= rand(1,msglen);  %randint 也可以直接用randint
for i=1:msglen
    if msg(i)>=0.5
        msg(i)=1;
    else
        msg(i)=0;
    end
end
 
% embedding
p=1;
for f2=1:n
    for f1=1:m      
       if p>=msglen
         break;
       end
       ste_cover(f1,f2)=ste_cover(f1,f2)-mod(ste_cover(f1,f2),2)+msg(1,p);
       p=p+1;
    end
    if p==msglen
        break;
    end
end 

 ste_cover=uint8( ste_cover);
 % save the stego image in the stegoPath 保存stego图
 imwrite(ste_cover,stegoPath);
end

