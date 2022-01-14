function [t,cavite_centre,cavite_est,cavite_ouest,cavite_nord,cavite_sud] = cavite(region)
    
[longeur, largeur] = size(region);

    % élément structurant pour l'est (vecteur de taille qui vaut 2 fois la taille de l'image
    structE = [ones(1,2*largeur)]; 
    % On affecte des zéros à la première moitié de l'image
    structE(1:largeur) = 0; 
    
    structO = [ones(1,2*largeur)];
    structO(largeur:end) = 0;
    
    structN = [ones(1,2*longeur)]; 
    structN(1:longeur) = 0;
    
    % Même principe, on inverse le vecteur en inversant le vecteur
    structNV = structN'; 
    
    structS = [ones(1,2*longeur)];
    structS(longeur:end) = 0;
    structSV = structS';
    
    % dilatation avec chaque élément structurant créé
    cropO = imdilate(region,strel('arbitrary', structO));
    cropE = imdilate(region,strel('arbitrary', structE));
    cropN = imdilate(region,strel('arbitrary', structNV));
    cropS = imdilate(region,strel('arbitrary', structSV));
    
%     figure;
%     subplot(2,2,1);
%     imshow(cropN);
%     title('Nord');
% 
%     subplot(2,2,2);
%     imshow(cropS);
%     title('Sud');
% 
%     subplot(2,2,3);
%     imshow(cropO);
%     title('Ouest');
%     
%     subplot(2,2,4);
%     imshow(cropE);
%     title('Est');
     
     crop_complement = imcomplement(region); % complément de toute la région
     cavite_centre = cropN & cropO & cropE & cropS & crop_complement; % cavité centre
     cavite_est = cropN & crop_complement & cropS & imcomplement(cavite_centre) & cropE; % cavité est
     cavite_ouest = cropN & crop_complement & cropS & imcomplement(cavite_centre) & cropO; % cavité ouest
     cavite_nord = cropN & crop_complement & imcomplement(cavite_centre) & cropO & cropE; % cavité nord
     cavite_sud = cropO & crop_complement & imcomplement(cavite_centre) & cropS & cropE; % cavité sud

     %calcule de la surface de chaque cavite
    surface_centre = bwarea(cavite_centre);
    surface_est = bwarea(cavite_est);
    surface_ouest = bwarea(cavite_ouest);
    surface_nord = bwarea(cavite_nord);
    surface_sud = bwarea(cavite_sud);
    
    %normalisation
    somme_surface=surface_centre+surface_est+surface_ouest+surface_sud+surface_nord;
    t(1)=surface_centre/somme_surface;
    t(2)=surface_est/somme_surface;
    t(3)=surface_ouest/somme_surface;
    t(4)=surface_sud/somme_surface;
    t(5)=surface_nord/somme_surface;

% figure;
% imshow(cavite_centre);
% figure;
% imshow(cropE);
% figure;
% imshow(cropN);
% figure;
% imshow(cropS);



end