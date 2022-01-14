clear all;
close all;

%lire l'image qu'on veut detecter
Image_cp = imread('images/test/img18.png');
figure;

for i = 0:9
    %pour generer les 10 images automatiquement (de 0 a 9)
    image = strcat('images/test/',num2str(i));
    image2 = strcat(image,'.png');
    modele = imread(image2);
%     imshow(modele);
    %transformation en gris du modele
    modele2gray = rgb2gray(modele);
    %transformation en gris du code postal
    Image_cp2gray = rgb2gray(Image_cp);
    
    %realisation de la correlation entre le modele et le code postal apres
    %les binarisees
    c = normxcorr2(modele2gray,Image_cp2gray);
    
    %ces 3 lignes seuleuement pour afficher le resultat de la correlation
    %comme surface 
%     surf(c);
%     shading flat;
%     figure;
    

    Res = im2bw(c,0.75);
    %determiner la position des pixels du point blanc pour savoir la
    %position du chiffre dans l'image
    [row,col] = find(Res);

    %pour detecter la position du chiffre dans l'image
    %et l'jouter dans le vecteur code_postal afin de l'afficher apres
    if size(col) ~= 0
        if col(1)>=50 && col(1)<=71
            code_postal(1)=int2str(i);
        end
        if col(1)>=72 && col(1)<=85
            code_postal(2)=int2str(i);
        end
        if col(1)>=86 && col(1)<=115
            code_postal(3)=int2str(i);
        end
        if col(1)>=116 && col(1)<=140
            code_postal(4)=int2str(i);
        end
        if col(1)>=141 && col(1)<=170
            code_postal(5)=int2str(i);
        end
    end
        
    combImg = imfuse(modele, Res); 
    subplot(6,2,i+1);
      imshow(combImg);
end
      subplot(6,2,11);
      imshow(Image_cp);
      title(strcat('le code postale est : ',code_postal));





