Le fichier "TP.m" correspond à la partie de l'analyse du code postal que l'on a écrit et pris en photo. 

Dans ce fichier, le fichier "cavite.m" est utilisé. 
Il permet le calcul des cavités Sud, Nord, Ouest, Est et Nord.

Le fichier "reconnaissance.m" contient une fonction permettant de calculer la surface des cavités de chaque type de chiffre et également la moyenne des cavités de chaque type de chiffre. La fonction retournera ainsi deux matrices, une matrice "M" (taille 50x5) pour toutes les cavités et une autre matrice "v" (taille 10x5) pour les cavités moyennes.

Le fichier "reconnaissance_images.m" contient également une fonction permettant cette fois-ci de retourner sous une matrice "M_CP" (taille 5x5), la surface des cavités de chaque chiffre du code postal à tester.

Le fichier "detection.m" permet la détection de chaque code postal contenu dans notre base de test (chemin /images/test) à l'aide des méthodes du plus proche voisin et du barycentre (distance euclidienne et distance de Manhattan).

Le fichier "ReconnaissanceCorrelation.m" permet la détection de code postal en mesurant la corrélation entre l'image d'un chiffre modèle et le code postal à analyser.