%%
clear all;
close all;
clc;

%M_50 = la matrice 50x5 generee dans le fichier reconnaissance.m
%v = la matrice 10x5 des moyennes de la matrice 50x5
[M_50,v] = reconnaissance();

 figure;
for p = 11:20
     %generer le nom des images separe
     image_name=strcat('images/test/img',num2str(p));
     image_url=strcat(image_name,'.png');
     
% M = la matrice du code postal 5x5 (chaque ligne contient les cavites)     
[M] = reconnaissance_images(image_url);

% variable qui va contenir le code postal a la fin pour l'affiche
code_postal_string="";

%----------------------------------------------------------------------%
% Veuillez décommenter le code correspondant pour tester chaque méthode
%----------------------------------------------------------------------%
% Méthode des k-plus proches avec k = 1 et la distance de Manhattan
%----------------------------------------------------------------------%
% c=0;
% for k = 1:5
%   for j = 1:50
%   SM = sum(abs(M(k,:)-M_50(j,:))); %SM = somme de Manhattan
%    % V_SM est une matrice de 50x2 qui contient la somme avec le chiffre correspond
%   V_SM(j,1) = SM;
%   %V_SM(j,2) = j-1;
%    % cette codition a pour but d'afficher cinq 0 apres cinq 1 apres cinq 2
%    % etc... car chaque 5 ligne correspond a  un chiffre
%   if mod(j,5)== 0
%       V_SM(j,2) = c;
%       c=c+1;
%   else
%        V_SM(j,2) = c;
%   end
% 
%   end 
%   % le min de la somme des distances
%   SM_min = min(V_SM(:,1));
%   
%     for i = 1:50
%     % si le min de SM correspond a une case donc le chiffre qui correspond a cette case est le resultat
%        % apres on enregistre ce chiffre dqns un vecteur
%     if V_SM(i,1) == SM_min
%         chiffre = V_SM(i,2);
%         code_postal(k) = int2str(chiffre);
% 
%     end
%    
%     end
%     c=0;
% end
% 
%   subplot(5,2,p-10);
%  imshow(image_url);
%  title(code_postal);
% end

%----------------------------------------------------------------------%
% Méthode des k-plus proches avec k = 1 et la distance Euclidienne
%----------------------------------------------------------------------%
% c=0;
% for k = 1:5
%   for j = 1:50
%   SE = sqrt(sum(abs(M(k,:)-M_50(j,:)).^2)); % SE = somme euclidienne
%   V_SE(j,1) = SE;
%   %V_SM(j,2) = j-1;
%   if mod(j,5)== 0
%       V_SE(j,2) = c;
%       c=c+1;
%   else
%        V_SE(j,2) = c;
%   end
% 
%   end 
%   % le min de la somme des distances
%   SE_min = min(V_SE(:,1));
%   
%     for i = 1:50
%         
%     if V_SE(i,1) == SE_min
%         chiffre = V_SE(i,2);
%         code_postal(k) = int2str(chiffre);
% 
%     end
%    
%     end
%     c=0;
% end
% 
%   subplot(5,2,p-10);
%  imshow(image_url);
%  title(code_postal);
%  end

%----------------------------------------------------------------------%
% Méthode du plus proche barycentre et la distance de Manhattan
%----------------------------------------------------------------------%
% for k = 1:5
%   for j = 1:10
%   SM = sum(abs(M(k,:)-v(j,:))); % SM = somme de Manhattanb
%   V_SM(j,1) = SM;
%   V_SM(j,2) = j-1;
%   
%   end 
%   SM_min = min(V_SM(:,1));
%   
%     for i = 1:10
%         
%     if V_SM(i,1) == SM_min
%         chiffre = V_SM(i,2);
%         code_postal(k) = chiffre;
%         
%         code_postal_string = strcat(code_postal_string,num2str(chiffre));
%     end
%    
%     end
%     
% end
% 
%   subplot(5,2,p-10);
%  imshow(image_url);
%  title(code_postal_string);
% end

%----------------------------------------------------------------------%
% Méthode du plus proche barycentre et la distance euclidienne
%----------------------------------------------------------------------%
for k = 1:5
  for j = 1:10
  SE = sqrt(sum(abs(M(k,:)-v(j,:)).^2)); % SE = somme euclidienne
  V_SE(j,1) = SE;
  V_SE(j,2) = j-1;
  end 
  
  SE_min = min(V_SE(:,1));

for i = 1:10
    if V_SE(i,1) == SE_min
        chiffre = V_SE(i,2);
        code_postal(k) = chiffre;
        
        code_postal_string = strcat(code_postal_string,num2str(chiffre));
    end
   
    end
    
end

 subplot(5,2,p-10);
 imshow(image_url);
 title(code_postal_string);

 end
  
  
  