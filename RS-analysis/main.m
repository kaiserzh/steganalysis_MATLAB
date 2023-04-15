%% 
% Description: plot RS diagram with the x label of embedding rate and y label of Rm,R_m,Sm,S_m
% Author: kuan zhong
% Email: kaizhou5878@outlook.com
% Date:2022.3.9
% Xiamen University
%% Plot the RS diagram of the LSB methods and User method.
% Fix the rawStegoPath( Path for the raw carrier image) for your computer
% Default mask = [1,0,1,0],suit for the image size 512*512，you can change the mask in the RS.m。
%% 画出LSB和自己的方法的 RS图
% 文件路径和文件名需要自己修改
% 默认mask = [1,0,1,0] 如果图片尺寸不合，在RS.m中自行修改mask变量

clc
clear
close

rawStegoPath = './cover/peppers512.bmp'; % carrier image (载体图路径)
LSBStegoPath = 'lsb_stego.bmp'; % stego image produced by LSB method （LSB嵌入后的载体图路径）
ourStegoPath = 'our_stego.bmp'; % stego image produced by the proposed method

% Record the values of rm,sm, r_m, and s_m in different embedding rate.
% 记录新旧两种办法得到的 rm sm r_m s_m值
rawValue = zeros(4,11); % 1-4:rm sm r_m s_m
lsbValue = zeros(4,11);
ourValue = zeros(4,11);

ER = 0; % Embdding rate 嵌入率
for i=1:11
    % embedding 嵌入
    lsb(rawStegoPath,ER,LSBStegoPath); %LSB嵌入
    embed(rawStegoPath,ER,ourStegoPath);%我们的方法嵌入
    [rawValue(1,i),rawValue(2,i),rawValue(3,i),rawValue(4,i)] = RS(rawStegoPath);
    [lsbValue(1,i),lsbValue(2,i),lsbValue(3,i),lsbValue(4,i)] = RS(LSBStegoPath);
    [ourValue(1,i),ourValue(2,i),ourValue(3,i),ourValue(4,i)] = RS(ourStegoPath);
    ER = ER+0.1;     
end

% Scale the range of values from [0,1] to [0,100] 将S_m等数值缩放到[0,100]
rawValue = 100*rawValue;
lsbValue = 100*lsbValue;
ourValue = 100*ourValue;

x=0:10:100;%x轴上的数据，第一个值代表数据开始，第二个值代表间隔，第三个值代表终止
figure(1)
%% RS diagram for normal image 无嵌入图像的RS图
plot(x,rawValue(1,:),'-*b',x,rawValue(2,:),'-or',x,rawValue(3,:),'--xb',x,rawValue(4,:),'--.r'); 
axis([0,100,35,70])  %确定x轴与y轴框图大小

legend('Rm','Sm','R-m','S-m');   %右上角标注
xlabel('Percentage of pixels')  %x轴坐标描述
ylabel('Percentage of R and S groups') %y轴坐标描述
% title('raw image');

figure(2)
%% RS diagram for stego-image produced by LSB method 经过LSB嵌入的图像的RS图
plot(x,lsbValue(1,:),'-*b',x,lsbValue(2,:),'-or',x,lsbValue(3,:),'--xb',x,lsbValue(4,:),'--.r'); 
axis([0,100,15,90])  %确定x轴与y轴框图大小

legend('Rm','Sm','R-m','S-m');   %右上角标注
xlabel('Percentage of pixels (%)')  %x轴坐标描述
ylabel('Percentage of R and S groups (%)') %y轴坐标描述
% title('LSB');

figure(3)
%% RS diagram for stego-image produced by the proposed method 本文提出的方法对应的RS图
plot(x,ourValue(1,:),'-*b',x,ourValue(2,:),'-or',x,ourValue(3,:),'--xb',x,ourValue(4,:),'--.r'); 
axis([0,100,15,90])  %确定x轴与y轴框图大小

legend('Rm','Sm','R-m','S-m');   %右上角标注
xlabel('Percentage of coefficients (%)')  %x轴坐标描述
ylabel('Percentage of R and S groups (%)') %y轴坐标描述
% title('proposed scheme');
