%% G�nseli �OLAK / 18253069

%% a)Resim 2 boyutlu Fourier transformu alarak bu g�r�nt�ye ait frekans b�lgesi g�sterimi

clear all,clc,close all
IOrj = imread('peppers.png'); % G�r�nt�y� okudum.
IOrj = rgb2gray(IOrj); % G�r�nt�y� gri seviyeye �evirir.
f = double(IOrj); % �zerinde �al��mak i�in double forma d�n��t�rd�m
f1 = fft2(f); % 2 boyutlu DFT yapar, ��k��� matristir.
f2 = fftshift(f1); % Bir tranformasyonu kayd�r�r. 

%% plot
subplot(3,3,1), imshow(uint8(f)); title('G�r�nt�n�n Gri Hali'); %% g�r�nt�n�n gri hali
subplot(3,3,2), imshow(log(abs(f1)),[]); title('Fourier Transformlu G�r�nt�');
subplot(3,3,3), imshow(log(abs(f2)),[]); title (' Merkezde Toplanm�� Hali');
subplot(3,3,5), mesh(abs(f1)); title('Fourier Transformlu Frekans B�lgesi');
subplot(3,3,6), mesh(abs(f2)); title('Merkezde Toplanm�� Frekans B�lgesi');

%% b)Resim �zerine harici olarak 
%% 10dB beyaz g�r�lt� ekleyerek a se�ene�inde belirtilen g�sterimi

%% AGS
clear all,clc,close all
IOrj = imread('peppers.png'); % G�r�nt�y� okudum
IOrj=rgb2gray(IOrj);
I = double(IOrj); % �zerinde �al��mak i�in double forma d�n��t�rd�m
[N M] = size(I);
%SNR = input ('dB olarak deger girin: ');
SNR = 10;
PS = sum(sum(I.^2))/(N*M); %power of signal
sigma = PS./(10^(0.1*SNR));
W = sqrt(sigma).*randn(N,M); %PN %% N M lik g�r�lt� haline d�n��t�rd�m. %% G�r�lt�y� olu�tuduk.
A = plus(I,W); % g�r�nt�n�n �zerine ekledik art�k A bozulmu� g�r�nt� oldu.

%% Fourier Transformu
A1=fft2(A); 
A2=fftshift(A1);

%% plot 
subplot(3,3,1), imshow(IOrj); title('G�r�nt�n�n Gri Hali'); 
subplot(3,3,2), imshow(uint8(A)); title('G�r�lt� Eklenmi� Hali'); % 10 db beyaz g�r�lt� eklenmi� g�r�nt�
subplot(3,3,3), imshow(log(abs(A1)),[]); title('Fourier Transformlu G�r�nt�');
subplot(3,3,4), imshow(log(abs(A2)),[]); title('Merkezde Toplanm�� Hali'); 
subplot(3,3,5), mesh(abs(A1)); title('Fourier Transformlu Frekans B�lgesi');
subplot(3,3,6), mesh(abs(A2)); title('Merkezde Toplanm�� Frekans B�lgesi');
 
%% c)Aradaki fark� yorumlay�n�z.

%% Orjinal resim i�in 2 boyutlu Fourier Transformu alarak(a) ve resim
%% �zerine 10 dB beyaz g�r�lt� ekleyip Fourier Transformu alarak(b) elde 
%% etti�im g�r�nt�ler birbirinden farkl� olmas�na ra�men frekans b�lgesi
%% g�sterimi birbirinin ayn�d�r.
% a'da daha net ve canl�, beyaz nokta parlak g�r�nt� elde ettim. 
% b'de daha bulan�k ve soluk, beyaz nokta soluk g�r�nt� elde ettim.
% A ve B ��kk�nda da fourier transformlu frekans b�lgesi g�sterimi genlikleri 
% k���k, merkezde toplanm�� frekans b�lgesi g�steriminde ise genlikler y�ksek 
% de�erlere sahiptir.