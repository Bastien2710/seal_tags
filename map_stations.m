clear all, close all

%
%??????????????????????????????????????????????????
% Script test pour réaliser une carte des stations
%??????????????????????????????????????????????????
% MartinV, 7 mai 2020
%

figure('Color','w'); hold on;

%--- réalisation de la carte

coast = load('coast'); % structure qui contient les cotes

% liste des projections ici:
% https://fr.mathworks.com/help/map/summary-and-guide-to-projections.html
% projection polaire stereo
% axesm('stereo','Origin',[-90 0],'MapLatLimit',[-90 -60]) % definit les axes de la carte

% projection stéréographique de Gall (localisée pour une région)
axesm('gstereo','MapLonLimit', [-90, 20.],'MapLatLimit',[-80 -60]) % definit les axes de la carte
  
framem on % affiche le cadre
axis on   % affiche les axes
gridm on  % affiche la grille
mlabel on % affiche les étiquettes des méridiens
plabel on % affiche les étiquettes des parallèles

geoshow(coast.lat,coast.long, 'DisplayType','polygon', 'FaceColor', [135 206 250]/255.) % affiche le continent antarctique

%--- ajout des données des stations

N_sta = 2

lat_sta = [ -69.06889, -65 ] % ici tu dois remplacer par tes donnees lat / lon
lon_sta = [ -0.09944444, -15 ] % ici tu dois remplacer par tes données lat / lon

sta_type = [ 1, 2 ] % 1 pour ROV, 2 pour L-arm % ici faut remplir aussi

is_tag   = [ 1, 0 ] % 1 si on a de la donnee tag, 0 si pas % ici faut remplir aussi

for i_sta = 1:N_sta

    % stations de type 'ROV', avec du tag
    if ( sta_type(i_sta) == 1 & is_tag(i_sta) == 1) 
       scatterm( lat_sta(i_sta), lon_sta(i_sta), 30, 'ksq', 'MarkerFaceColor', 'k')
    end
    
    % stations de type 'ROV', sans tag
    % [ ajouter le code ici ]
    
    % stations de type 'L-arm', avec tag
    % [ ajouter le code ici ]
    
    % stations de type 'L-arm', sans tag
    if ( sta_type(i_sta) == 2 & is_tag(i_sta) == 0) 
       scatterm( lat_sta(i_sta), lon_sta(i_sta), 30, 'bo' )
    end
    
    
    
end


-----------------------------------------------------------------------------------------------------------------------
clear all, close all

% -------------------------------------------------
% Script test pour r�aliser une carte des stations
% -------------------------------------------------
% MartinV, 7 mai 2020

figure('Color','w'); 
hold on;


        % Réalisation de la carte

coast = load('coast'); % structure qui contient les cotes

% liste des projections ici:
% https://fr.mathworks.com/help/map/summary-and-guide-to-projections.html
% projection polaire stereo
% axesm('stereo','Origin',[-90 0],'MapLatLimit',[-90 -60]) % definit les axes de la carte

% projection stéréographique de Gall (localisée pour une région)
axesm('gstereo','MapLonLimit', [-65, 5],'MapLatLimit',[-80 -60]) % definit les axes de la carte
  
framem on % affiche le cadre
axis on  % affiche les axes
gridm on  % affiche la grille
mlabel on % affiche les étiquettes des méridiens
plabel on % affiche les étiquettes des parallèles

geoshow(coast.lat,coast.long, 'DisplayType','polygon', 'FaceColor', [135 206 250]/255.) % affiche le continent antarctique


        % Ajout des données des stations (latitude / longitude)
        
                % Stations abritant des donées tag

lat_larm = [-70.28556, -70.33583, -70.38528, -70.50056, -70.50111, -70.63361, -65.20111 ] % données latitude (ordre chronologique)
lon_larm = [-9.985833, -8.935278, -8.752222, -8.185, -9.166667, -9.901667, -45.935 ] %  données longitude (ordre chronologique)
H(1) = scatterm( lat_larm, lon_larm, 40, 'o', 'filled', 'MarkerFaceColor', 'k') % Ice Stations (L-Arm) --> rond noir avec données tag
%legend (H1, 'L-Arm Station')


lat_rov = [ -69.1024863, -70.1951665, -70.2991597, -70.4590423, -71.02668, -71.2415445, -67.6691357, -67.5325338, -65.5224318 ]
lon_rov = [ -0.0379608, -11.248467, -10.0443703, -8.3512282, -13.4930235, -19.6462462, -46.3136623, -46.3817188, -46.113281 ]
H(2) = scatterm( lat_rov, lon_rov, 40, 'd', 'filled', 'MarkerFaceColor', 'r') % Rov Stations --> losange rouge avec données tag


                % Stations n'abritant pas de données tag
                
lat_larm = [ -69.06889 ]
lon_larm = [ -0.09944444 ]
H(3) = scatterm( lat_larm, lon_larm, 80, 'o', 'k') % Ice Stations (L-Arm) --> rond noir vide = pas de données tag pour cette station


lat_rov = [ -70.3516683 ]
lon_rov = [ -8.975854 ]
H(4) = scatterm( lat_rov, lon_rov, 80, 'd', 'r') % Rov Stations --> losange rouge vide = pas de données tag pour cette station 

                % Axe, titre et légende
                
set(gca,'xcolor','w') % rendre transparent l'axe x
set(gca, 'ycolor','w') % rendre transparent l'axe y
xlabel('Longitude', 'color', 'k') % changer la couleur du titre en abscisse
ylabel('Latitude', 'color', 'k') % changer la couleur du titre en ordonée
title( ['\fontsize {15}Carte des stations de mesures durant la mission PS117'])
legend (H, {'\fontsize {11}Ice (L-Arm) Station', '\fontsize {11}ROV Station', '\fontsize {11}Les symboles vides correpondent à des stations ne présentant pas de données issues du tag',''}, 'Location', 'southoutside')
legend ('boxoff') % Pas de cadre autour de la légende

--------------------------------------------------------------------------------------------------------------------

clear all, close all

% ----------------------------------------------------------------------------
% Script test pour réaliser une carte des stations (en utilisant une boucle)
% ----------------------------------------------------------------------------
% MartinV, 7 mai 2020

figure('Color','w'); 
hold on;


                % Réalisation de la carte

coast = load('coast'); % structure qui contient les cotes

% liste des projections ici:
% https://fr.mathworks.com/help/map/summary-and-guide-to-projections.html
% projection polaire stereo
% axesm('stereo','Origin',[-90 0],'MapLatLimit',[-90 -60]) % definit les axes de la carte

% projection stéréographique de Gall (localisée pour une région)
axesm('gstereo','MapLonLimit', [-65, 5],'MapLatLimit',[-80 -60]) % definit les axes de la carte
  
framem on % affiche le cadre
axis on  % affiche les axes
gridm on  % affiche la grille
mlabel on % affiche les étiquettes des méridiens
plabel on % affiche les étiquettes des parallèles

geoshow(coast.lat,coast.long, 'DisplayType','polygon', 'FaceColor', [135 206 250]/255.) % affiche le continent antarctique



                % Ajout des données des stations (latitude / longitude)

N_sta = 18
lat_sta = [-69.06889, -69.1024863, -70.1951665, -70.28556, -70.2991597, -70.33583, -70.3516683, -70.38528, -70.50056, -70.50111, -70.63361, -70.4590423, -71.02668, -71.2415445, -67.6691357, -67.5325338, -65.20111, -65.5224318 ] % données latitude (ordre chronologique)
lon_sta = [-0.09944444, -0.0379608, -11.248467, -9.985833, -10.0443703, -8.935278, -8.975854, -8.752222, -8.185,  -9.166667, -9.901667, -8.3512282, -13.4930235, -19.6462462 ,-46.3136623, -46.3817188, -45.935, -46.113281 ] % données longitude (ordre chronologique)

sta_type = [ 1, 2, 2, 1, 2, 1, 2, 1, 1, 1, 1, 2, 2, 2, 2, 2, 1, 2 ] % 1 pour L-arm, 2 pour ROV 

is_tag   = [ 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ] % 1 si de la donnée tag est présente, 0 dans le cas contraire

for i_sta = 1:N_sta

    % stations de type ROV, avec du tag
    if ( sta_type(i_sta) == 2 & is_tag(i_sta) == 1  ) 
       H(1) = scatterm( lat_sta(i_sta), lon_sta(i_sta), 40, 'd', 'filled', 'MarkerFaceColor', 'r') % Rov Stations avec données tag --> losange rouge
    end
    
    % stations de type ROV, sans tag
    if ( sta_type(i_sta) == 2 & is_tag(i_sta) == 0 )
        H(2) = scatterm( lat_sta(i_sta), lon_sta(i_sta), 80, 'd', 'r') % Rov Stations sans données tag --> losange rouge vide
    end
    
    % stations de type L-arm, avec tag
    if ( sta_type(i_sta) == 1 & is_tag(i_sta) == 1 )
        H(3) = scatterm( lat_sta(i_sta), lon_sta(i_sta), 40, 'o', 'filled', 'MarkerFaceColor', 'k') % Ice Stations (L-Arm) avec données tag --> rond noir
    end 
    
    % stations de type L-arm, sans tag
    if ( sta_type(i_sta) == 1 & is_tag(i_sta) == 0 ) 
       H(4) = scatterm( lat_sta(i_sta), lon_sta(i_sta), 80, 'o', 'k') % Ice Stations (L-Arm) sans données tag --> rond noir vide

    end
    
    
    
end

                % Axe, titre et légende

set(gca,'xcolor','w') % rendre transparent l'axe x
set(gca, 'ycolor','w') % rendre transparent l'axe y
xlabel('Longitude', 'color', 'k') % changer la couleur du titre en abscisse
ylabel('Latitude', 'color', 'k') % changer la couleur du titre en ordonnée
title( ['\fontsize {15}Carte des stations de mesures durant la mission PS117'])
legend (H, {'\fontsize {11}Ice (L-Arm) Station', '\fontsize {11}ROV Station', '\fontsize {11}Les symboles vides correpondent à des stations ne présentant pas de données issues du tag',''}, 'Location', 'southoutside')
legend ('boxoff') % Pas de cadre autour de la légende
