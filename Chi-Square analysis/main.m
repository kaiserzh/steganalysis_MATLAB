%% Chi square test 卡方测试
% Description: plot line chart that shows the variation of P-value at different embedding rates
% Author: kuan zhong
% Email: kaizhou5878@outlook.com
% Date:2022.3.10
% Xiamen University 

% Use the image from rawStegoPath as the carrier image
% 修改 rawImagePath，即可绘制出嵌入率在 0 到 1之间的概率值折线图，间隔为0.1

clc
clear

rawImagePath = './res/cover/peppers512.bmp'; % normal image used as the carrier
LSBStegoPath = 'lsb_stego.bmp'; % stego image produced by LSB method
ourStegoPath = 'our_stego.bmp'; % stego image produced by the proposed method

rawPValue = zeros(1,11);
lsbPValue = zeros(1,11);
ourPValue = zeros(1,11);

ER = 0; %embedding rate, range from 0 to 1, step 0.1
for i=1:11
    % embedding 嵌入
    lsb(rawImagePath,ER,LSBStegoPath);
    embed(rawImagePath,ER,ourStegoPath);
    lsbPValue(i) = chi2Test(LSBStegoPath);
    ourPValue(i) = chi2Test(ourStegoPath);
    ER = ER+0.1;     
end

x=0:0.1:1;%x轴上的数据，第一个值代表数据开始，第二个值代表间隔，第三个值代表终止

figure(1)
plot(x,lsbPValue,'-*b'); 
axis([0,1.01,-0.01,1.01])  %确定x轴与y轴框图大小
% legend('LSB','our scheme');   %右上角标注
xlabel('Percentage of pixels')  %x轴坐标描述
ylabel('Probability of embedding') %y轴坐标描述


figure(2)
plot(x,ourPValue,'-or'); 
axis([0,1.01,-0.01,1.01])  %确定x轴与y轴框图大小
% legend('LSB','our scheme');   %右上角标注
xlabel('Percentage of coefficients')  %x轴坐标描述
ylabel('Probability of embedding') %y轴坐标描述
