%lsb steganography
clc;clear all;close all;
%cover image
cvr = imread('cover1.bmp');
% cvr = imread('cover2.bmp');
% cvr = im2double(cvr); cvr = rgb2gray(cvr);
cvr=imnoise(cvr,'gaussian'); %adding gaussian noise figure;imshow(cvr);title('cover image');
%mesage image
msg = imread('message1.bmp');
% msg = imread('message2.bmp');
% msg = im2double(msg); msg = rgb2gray(msg);
figure;imshow(msg);title('message image');
m1=size(cvr,1);%height of cover image n1=size(cvr,2);%width of cover image m2=size(msg,1);%height of message image n2=size(msg,2);%width of message image
% cvr = imcrop(cvr, [0 0 n2 m2]); %make dimensions equal
% figure;imshow(cvr);% [m3,n3]=size(cvr);
% disp(m1);disp(n1);disp(m2);disp(n2);disp(m3);disp(n3);
%extract upper 4 bitplanes of message steg1=msg;
for i=1:m2
for j=1:n2
msg_b7(i,j)=bitand(steg1(i,j),128); %msb of message msg_b6(i,j)=bitand(steg1(i,j),64); msg_b5(i,j)=bitand(steg1(i,j),32);
10
msg_b4(i,j)=bitand(steg1(i,j),16);
end
end
%extract 8 bitplanes of cover image steg2=cvr;
for i=1:m2
for j=1:n2
cvr_b7(i,j)=bitand(steg2(i,j),128); %msb of coverimage cvr_b6(i,j)=bitand(steg2(i,j),64); cvr_b5(i,j)=bitand(steg2(i,j),32); cvr_b4(i,j)=bitand(steg2(i,j),16); cvr_b3(i,j)=bitand(steg2(i,j),8);
% bitand(steg2(i,j),4)=msg_b7; cvr_b2(i,j)=bitand(steg2(i,j),4);
cvr_b1(i,j)=bitand(steg2(i,j),2); cvr_b0(i,j)=bitand(steg2(i,j),1);
end
end
%use last 4 layers to store message image steg=zeros(size(cvr));%consider new blankimage
%msb of steg
steg=bitset(steg,8,cvr_b7); %msb of cover steg=bitset(steg,7,cvr_b6); steg=bitset(steg,6,cvr_b5); steg=bitset(steg,5,cvr_b4); %bit-plane 4 of cover steg=bitset(steg,4,msg_b7); %msb of message steg=bitset(steg,3,msg_b6); steg=bitset(steg,2,msg_b5);
%lsb of steg
steg=bitset(steg,1,msg_b4); %lsb of message steg=uint8(steg); figure,imshow(steg);title('steganographic image'); imwrite(steg,'steganographic1.bmp');
% imwrite(steg,'steganographic2.bmp');