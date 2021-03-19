%% Günseli ÇOLAK / 18253069

%% a)Resim 2 boyutlu Fourier transformu alarak bu görüntüye ait frekans bölgesi gösterimi

clear all,clc,close all
IOrj = imread('peppers.png'); % Görüntüyü okudum.
IOrj = rgb2gray(IOrj); % Görüntüyü gri seviyeye çevirir.
f = double(IOrj); % Üzerinde çalışmak için double forma dönüştürdüm
f1 = fft2(f); % 2 boyutlu DFT yapar, çıkışı matristir.
f2 = fftshift(f1); % Bir tranformasyonu kaydırır. 

%% plot
subplot(3,3,1), imshow(uint8(f)); title('Görüntünün Gri Hali'); %% görüntünün gri hali
subplot(3,3,2), imshow(log(abs(f1)),[]); title('Fourier Transformlu Görüntü');
subplot(3,3,3), imshow(log(abs(f2)),[]); title (' Merkezde Toplanmış Hali');
subplot(3,3,5), mesh(abs(f1)); title('Fourier Transformlu Frekans Bölgesi');
subplot(3,3,6), mesh(abs(f2)); title('Merkezde Toplanmış Frekans Bölgesi');

%% b)Resim üzerine harici olarak 
%% 10dB beyaz gürültü ekleyerek a seçeneğinde belirtilen gösterimi















%% AGS
clear all,clc,close all
IOrj = imread('peppers.png'); % Görüntüyü okudum
IOrj=rgb2gray(IOrj);
I = double(IOrj); % üzerinde çalışmak için double forma dönüştürdüm
[N M] = size(I);
%SNR = input ('dB olarak deger girin: ');
SNR = 10;
PS = sum(sum(I.^2))/(N*M); %power of signal
sigma = PS./(10^(0.1*SNR));
W = sqrt(sigma).*randn(N,M); %PN %% N M lik gürültü haline dönüştürdüm. %% Gürültüyü oluştuduk.
A = plus(I,W); % görüntünün üzerine ekledik artık A bozulmuş görüntü oldu.

%% Fourier Transformu
A1=fft2(A); 
A2=fftshift(A1);

%% plot 
subplot(3,3,1), imshow(IOrj); title('Görüntünün Gri Hali'); 
subplot(3,3,2), imshow(uint8(A)); title('Gürültü Eklenmiş Hali'); % 10 db beyaz gürültü eklenmiş görüntü
subplot(3,3,3), imshow(log(abs(A1)),[]); title('Fourier Transformlu Görüntü');
subplot(3,3,4), imshow(log(abs(A2)),[]); title('Merkezde Toplanmış Hali'); 
subplot(3,3,5), mesh(abs(A1)); title('Fourier Transformlu Frekans Bölgesi');
subplot(3,3,6), mesh(abs(A2)); title('Merkezde Toplanmış Frekans Bölgesi');
 
%% c)Aradaki farkı yorumlayınız.

%% Orjinal resim için 2 boyutlu Fourier Transformu alarak(a) ve resim
%% üzerine 10 dB beyaz gürültü ekleyip Fourier Transformu alarak(b) elde 
%% ettiğim görüntüler birbirinden farklı olmasına rağmen frekans bölgesi
%% gösterimi birbirinin aynıdır.
% a'da daha net ve canlı, beyaz nokta parlak görüntü elde ettim. 
% b'de daha bulanık ve soluk, beyaz nokta soluk görüntü elde ettim.
% A ve B şıkkında da fourier transformlu frekans bölgesi gösterimi genlikleri 
% küçük, merkezde toplanmış frekans bölgesi gösteriminde ise genlikler yüksek 
% değerlere sahiptir.
