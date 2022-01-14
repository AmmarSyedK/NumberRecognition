function [M_CP] = reconnaissance_images(image_url)
l = 0;
%generer le nom des images separe

             % Question 2 - lire l'image
        I = imread(image_url); 

        % Question 3 - Binariser l'image
        I_gray = rgb2gray(I); % convertir en niveau de gris

        % binariser l'image avec ecriture en blanc et fond en noir ("~" réalise un complément de im2bw)
        I_binary = ~im2bw(I_gray,0.39); % binariser l'image avec ecriture en blanc et fond en noir ("~" réalise un complément de im2bw)


        I_border = imclearborder(I_binary);

        I_bware = bwareaopen(I_border,100);

        % définir les régions avec la fonction bwlabel
        [L,N] = bwlabel(I_bware); % L l'image indexée, N le nombre de région (= 5)
        I_label2img=label2rgb(L);
%         subplot(2,3,5);
%         imshow(I_label2img);
%         title('Image label2img');

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
            % end question 6

            [t,cavite_centre,cavite_est,cavite_ouest,cavite_nord,cavite_sud] = cavite(crope);

            %creer la matrice 5x5
            l=l+1;
            M_CP(l, :)=t;
            
         end
         
    %pour forcer tous les NaN a 0 
    M_CP(isnan(M_CP)~=0)=0;
end
 