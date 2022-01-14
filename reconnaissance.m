function [M,v] = reconnaissance() 
l=0;
  for i = 1:10
      %generer le nom des images separees
     image_name=strcat('images/apprentissage/img',num2str(i));
     image_url=strcat(image_name,'.png');

             % Question 2 - lire l'image
        I = imread(image_url); 

        % Question 3 - Binariser l'image
        I_gray = rgb2gray(I); % convertir en niveau de gris


        I_binary = ~im2bw(I_gray,0.39); % binariser l'image avec ecriture en blanc et fond en noir ("~" réalise un complément de im2bw)

        % Comparaison de l'image après binarisation

%         figure;

%         subplot(3,2,1);
%         imshow(I);
%         title('Image RGB');
% 
%         subplot(3,2,2);
%         imshow(I_gray);
%         title('Image d''intensité');
% 
%         subplot(3,2,3);
%         imshow(I_binary);
%         title('Image binarisée');

        % Question 4
        
        % Comparaison des images après traitement
        I_border = imclearborder(I_binary);

        I_bware = bwareaopen(I_border,100);

%         subplot(2,1,1);
%         imshow(I_border);
%         title('Image imclearborder');
% 
%         subplot(2,1,2);
%         imshow(I_bware);
%         title('Image bwareaopen');

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
%             figure;
%             imshow(crope);
            % end question 6

            [t,cavite_centre,cavite_est,cavite_ouest,cavite_nord,cavite_sud] = cavite(crope);


%             figure;
%             subplot(3,2,1);
%             imshow(cavite_centre);
%             title('cavite centre')
%             subplot(3,2,2);
%             imshow(cavite_est);
%             title('cavite est')
%             subplot(3,2,3);
%             imshow(cavite_ouest);
%             title('cavite ouest')
%             subplot(3,2,4);
%             imshow(cavite_nord);
%             title('cavite nord')
%             subplot(3,2,5);
%             imshow(cavite_sud);
%             title('cavite sud');

            %creer la matrice 50x5
            l=l+1;
            M(l, :)=t;
            
            
%             v(1)=mean(M((i-1)*5+1:5,:));
%             v(1)=mean(M(6:10,:));
%             v(1)=mean(M(11:15,:));
%             v(1)=mean(M(16:20,:));
%             v(1)=mean(M(1:5,:));
%             v(1)=mean(M(1:5,:));
%             v(1)=mean(M(1:5,:));
            %afficher le contenu du vecteur t a chaque instance pour verifier les
            %surfaces
        % g=sprintf('%d ', t);
        % fprintf('Answer: %s\n', g);


         end
    %pour forcer tous les NaN a 0 
    M(isnan(M)~=0)=0;
     
  end
 
  %un vecteur des cavités moyennes (de taille 10x5).
  for c = 1:10
      v(c,:)= mean( M( (c-1)*5+1 : (c-1)*5+5 , : ));
  end
  
 