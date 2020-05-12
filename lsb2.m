%extracting message - lsb steganography
clc;clear all;close all;
img=imread('steganographic1.bmp');
% img=imread('steganographic2.bmp'); figure;imshow(img);title('steganographic image'); [m,n]=size(img);
for i=1:m
for j=1:n
img_b7(i,j)=bitand(img(i,j),128); %msb of image img_b6(i,j)=bitand(img(i,j),64);
11
img_b5(i,j)=bitand(img(i,j),32);
img_b4(i,j)=bitand(img(i,j),16);
img_b3(i,j)=bitand(img(i,j),8);
% bitand(steg2(i,j),4)=msg_b7; img_b2(i,j)=bitand(img(i,j),4);
img_b1(i,j)=bitand(img(i,j),2); img_b0(i,j)=bitand(img(i,j),1); %lsb of image
end
end
message = img_b0*128 + img_b1*64 + img_b2*32 + img_b3*16; figure;imshow(message);title('extracted message image'); imwrite(message,'retrieved_lsb1.bmp');
%imwrite(message,'retrieved_lsb2.bmp');
% figure;
% subplot(4,4,1);imshow(img3_b0);title('lsb');
% subplot(4,4,2);imshow(img3_b1);
% subplot(4,4,3);imshow(img3_b2);
% subplot(4,4,4);imshow(img3_b3);
% subplot(4,4,5);imshow(img3_b4);
% subplot(4,4,6);imshow(img3_b5);
% subplot(4,4,7);imshow(img3_b6);
% subplot(4,4,8);imshow(img3_b7);title('msb');
% ext=zeros(size(img));
% ext=bitset(ext,8,bitget(img,4));
% ext=bitset(ext,7,bitget(img,3));
% ext=bitset(ext,6,bitget(img,2));
% ext=bitset(ext,5,bitget(img,1));
% figure,imshow(ext);
% imwrite(steg,'4layers.bmp');