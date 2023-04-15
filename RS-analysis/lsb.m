function lsb( imagePath,rate,stegoPath )
% embed information in the cover image by LSB method ��ͼ����Ƕ����Ϊrate����˳��LSBǶ��
%   input:
%           imagePath: path of the carrier image ����ͼ·��
%           rate: embedding rate, the percentage of used pixels in the
%           carrier image Ƕ���ʣ�������ͼ������Ƕ������ر�����ȡֵ��[0,1]
%           stegoPath: path of the stego image
%   output:
%           None

cover=imread(imagePath);
ste_cover=double(cover); 
[m,n]=size(ste_cover); 

% generate the embedded message msg,the length is determined by the rate and
% image size
% ����rate����������Ϣλ�ĳ��ȣ�������������Ϣmsg
msglen=floor(m*n*rate);
msg= rand(1,msglen);  %randint Ҳ����ֱ����randint
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
 % save the stego image in the stegoPath ����stegoͼ
 imwrite(ste_cover,stegoPath);
end

