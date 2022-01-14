%%
clear all;
close all;
clc;


% Question 2 - lire l'image
I = imread('code_postal.jpg'); 

% Question 3 - Binariser l'image
I_gray = rgb2gray(I); % convertir en niveau de gris


I_binary = ~im2bw(I_gray,0.39); % binariser l'image avec ecriture en blanc et fond en noir ("~" réalise un complément de im2bw)

% affichage après binarisation

figure;

subplot(1,3,1);
imshow(I);
title('Image originale');

subplot(1,3,2);
imshow(I_gray);
title('Image en niveau de gris');

subplot(1,3,3);
imshow(I_binary);
title('Image binarisée');

% Question 4

% Utilisation des fonctions morphologiques pour traiter l'image
I_dila = imdilate(I_binary,strel('rectangle',[20 10]));

I_bware = bwareaopen(I_dila,100);

% Affichage des figures après traitement
figure;

subplot(2,2,1);
imshow(I_dila);
title('Image dilatée');

subplot(2,2,2);
imshow(I_bware);
title('Suppression des régions de petites tailles');

% définir les régions avec la fonction bwlabel
[L,N] = bwlabel(I_bware); % L l'image indexée, N le nombre de région (= 5)
I_label2img=label2rgb(L);
subplot(2,3,5);
imshow(I_label2img);
title('Image label2img');

% question 6 
 for k = 1:N                     %parcours toutes les regions
     objet = (L==k);             %selectionne la region
    [x,y] = find(objet==1);      %affecte tous les pixels de la region qui verifie la condition précedente à 1
    xmin = min(x);
    ymin = min(y);
    xmax = max(x);
    ymax = max(y);
    
    longeur = xmax-xmin;
    largeur = ymax - ymin;
    
    crope= imcrop(objet,[ymin xmin largeur longeur]);  %rogne l'image selectionnée 
    figure;
    imshow(crope);
    % end question 6

    [t,cavite_centre,cavite_est,cavite_ouest,cavite_nord,cavite_sud] = cavite(crope);


    figure;
    subplot(3,2,1);
    imshow(cavite_centre);
    title('cavite centre')
    subplot(3,2,2);
    imshow(cavite_est);
    title('cavite est')
    subplot(3,2,3);
    imshow(cavite_ouest);
    title('cavite ouest')
    subplot(3,2,4);
    imshow(cavite_nord);
    title('cavite nord')
    subplot(3,2,5);
    imshow(cavite_sud);
    title('cavite sud');  
end

    






