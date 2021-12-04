{ Dans cette Unité, nous pouvons trouver les différentes procédures et fonctions
  qui affichent dans la console les différents menus du jeux grâce aux objets
  de l’unité suivantes. }
unit affichagemenu;
{$codepage UTF8}
{$mode objfpc}{$H+}

interface
uses
  Classes, SysUtils, GestionEcran, affichageObjet,perso,inventaire,utilities;

function afficheMenuPrincipale():Boolean; // menu de la ville

procedure regles(); // affiche les règles et le synopsis
function afficheCreationPerso():player; // menu de la création du personnage
procedure afficheCredit(); // Affichage des crédits

function afficheVille():Integer; // Affichage du menu d'une partie

function afficheMarchand():Integer; // affiche le marchand pour savoir s'il on veut vendre ou acheter
procedure affichePasAssezArgent(); // indique au joueur qu'il n'a pas assez de PO
function afficheVente(po:Integer):Integer; // afffichage des ventes du marchand
function afficheAchat(po:Integer):Integer; // afffichage des achats du marchand

function afficheCantine():Integer; // Affichage de la cantine

function afficheForge(forge:array of armure):Integer; // afffichage de la forge

function afficheChambre():Integer; // Menu de la chambre qui donne accès à l'inventaire et au repos
procedure afficheDormir(dormie:Boolean); // Petite sieste
function afficheInventaireChambre(joueur:player):Integer; // afffichage de l'inventaire depuis la chambre

function afficheInventaireCombat(joueur:player):Integer; // afffichage de l'inventaire depuis un combat
procedure precombat(); // ecran de liaison entre la ville et le combat
procedure afficheCombat(monstre:Integer); // fenêtre de combat
function afficheMenuCombat():Boolean; // choix de combattre ou aller dans l'inventaire
procedure afficheMajVie(pvMonstre,PvMaxMonstre,pvHero,pvMaxHero:Integer); // renouvelle les pv à chaque tour
procedure vie(pv,pvMax,x,y:Integer); // affiche la barre de vie et le nombre de pv sur les pv max
procedure afficheVictoire(); // affiche l'écran de victoire
procedure afficheDeadMenu(); // affiche l'écran de défaite

implementation

procedure afficheDeadMenu();
var
  x,y:Integer;
begin
    effacerEcran();
    x:= 10;
    y:=8;
    ecrireEnPositionXY(x,y,'               ,____                                          /   \                                          ____,');
    ecrireEnPositionXY(x,y+1,'               |---.\                                 )      ((   ))                                        /.---|');
    ecrireEnPositionXY(x,y+2,'       ___     |    `       (@)                      /|\      ))_((     /|\                                 `    |     ___');
    ecrireEnPositionXY(x,y+3,'      / .-\  ./=)           |-|                     / | \    (/\|/\)   / | \                      (@)           (=\.  /-. \');
    ecrireEnPositionXY(x,y+4,'     |  |"|_/\/|            | | -------------------/--|-voV---\`|''/--Vov-|--\---------------------|-|            |\/\_|"|  |');
    ecrireEnPositionXY(x,y+5,'     ;  |-;| /_|            |-|                         ''^`   (o o)  ''^`                          | |            |_\ |;-|  ;');
    ecrireEnPositionXY(x,y+6,'    / \_| |/ \ |            | |                               `\Y/''                               |-|            | / \| |_/ \');
    ecrireEnPositionXY(x,y+7,'   /      \/\( |            |-|                                                                   | |            | )/\/      \');
    ecrireEnPositionXY(x,y+8,'   |   /  |` ) |            | |                             YOU DIED !                            |-|            | ( ''|  \   |');
    ecrireEnPositionXY(x,y+9,'   /   \ _/    |            |-|                                                                   | |            |    \_ /   \');
    ecrireEnPositionXY(x,y+10,'  /--._/  \    |            | |                                                                   |-|            |    /  \_.--\');
    ecrireEnPositionXY(x,y+11,'  `/|)    |    /            |_|___________________________________________________________________| |            \    |    (|\`');
    ecrireEnPositionXY(x,y+12,'    /     |   |             (@)              l   /\ /         ( (       \ /\   l                `\|-|             |   |     \');
    ecrireEnPositionXY(x,y+13,'  .''      |   |                              l /   V           \ \       V   \ l                  (@)             |   |      ''.');
    ecrireEnPositionXY(x,y+14,' /         \  |                              l/                _) )_          \I                                  |  /         \');
    ecrireEnPositionXY(x,y+15,'(_.-.__.__./  /                                                `\ /''                                              \  \.__.__.-._)');
end;

procedure afficheVictoire();
var
  x,y:Integer;
begin
    x:= 34;
    y:=8;
    dessinerCadreXY(x-5,y-2,x+77,y+17,simple,white,black);
    ecrireEnPositionXY(x+34,y,'/   \');
    ecrireEnPositionXY(x+26,y+1,')      ((   ))     (');
    ecrireEnPositionXY(x,y+2,'(@)                      /|\      ))_((     /|\ ');
    ecrireEnPositionXY(x,y+3,'|-|                     / | \    (/\|/\)   / | \                      (@)');
    ecrireEnPositionXY(x,y+4,'| | -------------------/--|-voV---\`|''/--Vov-|--\---------------------|-|');
    ecrireEnPositionXY(x,y+5,'|-|                         ''^`   (o o)  ''^`                          | |');
    ecrireEnPositionXY(x,y+6,'| |                               `\Y/''                               |-|');
    ecrireEnPositionXY(x,y+7,'|-|                                                                   | |');
    ecrireEnPositionXY(x,y+8,'| |                             VICTOIRE !                            |-|');
    ecrireEnPositionXY(x,y+9,'|-|                                                                   | |');
    ecrireEnPositionXY(x,y+10,'| |                                                                   |-|');
    ecrireEnPositionXY(x,y+11,'|_|___________________________________________________________________| |');
    ecrireEnPositionXY(x,y+12,'(@)              l   /\ /         ( (       \ /\   l                `\|-|');
    ecrireEnPositionXY(x+17,y+13,'l /   V           \ \       V   \ l                  (@)');
    ecrireEnPositionXY(x+17,y+14,'l/                _) )_          \I');
    ecrireEnPositionXY(x+35,y+15,'`\ /''');
end;

procedure vie(pv,pvMax,x,y:Integer); // affiche la barre de vie et le nombre de pv sur les pv max
var
  i:Integer;
begin
    dessinerCadreXY(x,y,x+12,y+2,simple,white,black);
    deplacerCurseurXY(x+1,y+1);
    couleurTexte(Green);
    for i:=1 to (pv div(pvMax div 10)) do  // en fonction du pourcentage de vie remplie une barre de vie
        write('█');                       // par tranche de 10%
    deplacerCurseurXY(x+2,y+3);
    couleurTexte(white);
    write(pv,'/',pvMax);
end;

procedure afficheMajVie(pvMonstre,PvMaxMonstre,pvHero,pvMaxHero:Integer); // renouvelle les pv à chaque tour
begin
    vie(pvHero,pvMaxHero,19,27);
    vie(pvMonstre,pvMaxMonstre,99,27);
end;

function afficheMenuCombat():Boolean; // choix de combattre ou aller dans l'inventaire
var
  choix:Integer; // choix du menu
begin
    dessinerCadreXY(46,5,64,7,simple,white,black);
    ecrireEnPositionXY(48,6,'1 - Inventaire');
    dessinerCadreXY(46,9,64,11,simple,white,black);
    ecrireEnPositionXY(48,10,'2 - Combattre');
    dessinerCadreXY(46,13,64,15,simple,white,black);
    ecrireEnPositionXY(48,14,'Votre choix : ');
    readln(choix);
    case choix of
      1:Result:=False;
      2:Result:=True;
      else
        Result:=afficheMenuCombat();
    end;
end;

procedure afficheCombat(monstre:Integer); // fenêtre de combat
begin
    effacerEcran();
    affichage(15,5,'hero');
    case monstre of
      1:affichage(90,2,'griffon');
      3:affichage(70,13,'dragon1');
      2:affichage(95,3,'dragon2');
      4:affichage(80,2,'phoenix');
    end;
end;

procedure precombat(); // ecran de liaison entre la ville et le combat
begin

end;

function afficheInventaireCombat(joueur:player):integer; // afffichage de l'inventaire depuis un combat
var
  x,y,i,choix:Integer;
begin
    effacerEcran();
    dessinerCadreXY(1,1,148,33,simple,white,black);
    dessinerCadreXY(67,0,83,2,simple,white,black);
    ecrireEnPositionXY(70,1,'Inventaire');
    dessinerCadreXY(2,3,40,32,simple,white,black);
    dessinerCadreXY(42,3,146,32,simple,white,black);
    ecrireEnPositionXY(18,4,'Objet');
    // remplissage inventaire
    x:=5;
    y:=6;
    for i:=1 to length(invpotion) do
        ecrireEnPositionXY(x,y+2*i,(IntToStr(i)+':'+invpotion[i].nom));
    x:=17;
    for i:=1 to length(invbombe) do
        ecrireEnPositionXY(x,y+2*i,(IntToStr(i)+':'+invbombe[i].nom));
    // test statistique objet
    affichage(50,8,'epee');
    dessinerCadreXY(44,24,144,31,simple,white,black);
    readln(choix);
    Result:=choix;
end;
function afficheInventaireChambre(joueur:player):integer; // afffichage de l'inventaire depuis la chambre
var
  x,y,i,choix:Integer;
begin
    effacerEcran();
    dessinerCadreXY(1,1,148,33,simple,white,black);
    dessinerCadreXY(67,0,83,2,simple,white,black);
    ecrireEnPositionXY(70,1,'Inventaire');
    dessinerCadreXY(2,3,40,32,simple,white,black);
    dessinerCadreXY(42,3,146,32,simple,white,black);
    ecrireEnPositionXY(18,4,'Objet');
    // remplissage inventaire
    x:=5;
    y:=6;
    // Arme
    for i:=1 to length(invarme) do
        ecrireEnPositionXY(x,y+2*i,IntToStr(i) + ':' + invarme[i].nom);
    // Armure
    for i:=1 to length(invarmure) do
        writeln(IntToStr(i) + ':' + invarmure[i].nom);
    // Arme Equipe
    for i:=1 to length(joueur.eqarmure) do
        writeln(IntToStr(i) + ':' + joueur.eqarmure[i].nom);
    // Armure Equipe
    writeln(IntToStr(i) + ':' + joueur.epee.nom);
    for i:=1 to length(invarme) do
        writeln(IntToStr(i) + ':' + invarme[i].nom);
    dessinerCadreXY(44,24,144,31,simple,white,black);
    readln(choix);
    Result:=choix;
end;

procedure afficheDormir(dormie:Boolean); // Petite sieste
begin
    effacerEcran();
    affichage(10,2,'decoCelt');
    affichage(124,2,'decoCelt');
    if dormie=False then
    begin
      ecrireEnPositionXY(54,11,' ______');
      ecrireEnPositionXY(54,12,'|___  /    ______');
      ecrireEnPositionXY(54,13,'   / /    |___  /');
      ecrireEnPositionXY(54,14,'  / /        / /');
      ecrireEnPositionXY(54,15,' / /__      / /');
      ecrireEnPositionXY(54,16,'/_____|    / /__     ____');
      ecrireEnPositionXY(54,17,'          /_____|   |_  /');
      ecrireEnPositionXY(54,18,'                     / /     ____');
      ecrireEnPositionXY(54,19,'                    /___|   |_  /');
      ecrireEnPositionXY(54,20,'                             / /     ____');
      ecrireEnPositionXY(54,21,'                            /___|   |_  /');
      ecrireEnPositionXY(54,22,'                                     / /');
      ecrireEnPositionXY(54,23,'                                    /___|');
    end
    else
      ecrireEnPositionXY(45,17,'Vous n''êtes pas assez fatigué, vous devriez aller combattre.');
end;

function afficheChambre():Integer; // Menu de la chambre qui donne accès à l'inventaire et au repos
var choix:Integer;
begin
    effacerEcran();
    affichage(0,0,'plancher');
    affichage(22,10,'grCoffre');
    affichage(49,3,'armure');
    affichage(90,9,'grLit');
    ecrireEnPositionXY(20,2,'Voulez-vous : 1-Dormir, 2-Voir votre Inventaire et votre fiche Personange ou 3-Quitter : ');
    readln(choix);
    Result:=choix;
end;

function afficheForge(forge:array of armure):Integer; // afffichage de la forge
var
  x,y,i,choix:Integer;
begin
    effacerEcran();
    dessinerCadreXY(1,1,148,34,simple,white,black);
    dessinerCadreXY(71,0,79,2,simple,white,black);
    deplacerCurseurXY(73,1);
    write('Forge');
    dessinerCadreXY(2,3,40,30,simple,white,black);     // objets disponibles
    dessinerCadreXY(42,3,146,30,simple,white,black);  // crafts
    dessinerCadreXY(2,31,146,33,simple,white,black); // resources
    ecrireEnPositionXY(5,32,'Ressources Disponilbes : X trucs  X machins ....');
    ecrireEnPositionXY(18,4,'Objet');
    // remplissage forge
    x:=5;
    y:=6;
    for i:=0 to length(forge) do
        ecrireEnPositionXY(x,y+2*i,forge[i].nom);
    // statistique objet
    affichage(50,8,'epee');
    dessinerCadreXY(44,22,144,29,simple,white,black);
    readln(choix);
    Result:=choix;
end;

function afficheCantine():Integer; // Affichage de la cantine
var
  choix:Integer;
begin
    effacerEcran();
    dessinerCadreXY(2,5,48,30,simple,white,black);
    affichage(15,14,'burger');
    dessinerCadreXY(52,5,98,30,simple,white,black);
    affichage(60,18,'burger');
    affichage(80,8,'frite');
    dessinerCadreXY(102,5,148,30,simple,white,black);
    affichage(105,21,'burger');
    affichage(132,15,'frite');
    affichage(110,6,'biere');
    ecrireEnPositionXY(40,1,'Ces 3 menus s''offre à vous, lequel allez-vous prendre, le niveau 1 ?, 2 ?, 3 ? : ');
    readln(choix);
    Result:=choix;
end;

function afficheAchat(po:Integer):Integer; // afffichage des achats du marchand
var
  x,y,i,choix:Integer;
begin
    effacerEcran();
    dessinerCadreXY(1,1,148,34,simple,white,black);
    dessinerCadreXY(69,0,81,2,simple,white,black);
    ecrireEnPositionXY(71,1,'Marchand');
    dessinerCadreXY(2,3,40,30,simple,white,black);    // objets disponibles
    dessinerCadreXY(42,3,146,33,simple,white,black); // crafts
    dessinerCadreXY(2,31,40,33,simple,white,black); // resources
    ecrireEnPositionXY(5,32,('Pièces d''Or Disponilbes : '+IntToStr(po)));
    ecrireEnPositionXY(18,4,'Objet');
    // remplissage marchand potion
    x:=5;
    y:=6;
    for i:=1 to 2 do
        ecrireEnPositionXY(x,y+2*i,invPotion[i].nom);
    // remplissage marchand bombe
    x:=5;
    y:=10;
    for i:=1 to 2 do
        ecrireEnPositionXY(x,y+2*i,invBombe[i].nom);
    // test statistique objet
    affichage(50,8,'epee');
    dessinerCadreXY(44,25,144,32,simple,white,black);
    ecrireEnPositionXY(45,39,'Veuillez indiquer la ligne de l''objet à acheter ou 0 pour quitter : ');
    readln(choix);
    Result:=choix;
end;

procedure affichePasAssezArgent(); // indique au joueur qu'il n'a pas assez de PO
begin
    dessinerCadreXY(55,16,95,18,simple,white,black);
    ecrireEnPositionXY(57,17,'Vous n''avez pas assez de pièces d''or');
end;

function afficheVente(po:Integer):Integer; // afffichage des ventes du marchand
var
  x,y,i,choix:Integer;
begin
    effacerEcran();
    dessinerCadreXY(1,1,148,34,simple,white,black);
    dessinerCadreXY(69,0,81,2,simple,white,black);
    ecrireEnPositionXY(71,1,'Marchand');
    dessinerCadreXY(2,3,40,30,simple,white,black);    // objets disponibles
    dessinerCadreXY(42,3,146,33,simple,white,black); // crafts
    dessinerCadreXY(2,31,40,33,simple,white,black); // resources
    ecrireEnPositionXY(5,32,('Pièces d''Or Disponilbes : '+IntToStr(po)));
    ecrireEnPositionXY(18,4,'Objet');
    // remplissage marchand
    x:=5;
    y:=6;
    for i:=0 to length(invPotion) do
        ecrireEnPositionXY(x,y+2*i,invPotion[i].nom);
    // test statistique objet
    affichage(50,8,'epee');
    dessinerCadreXY(44,25,144,32,simple,white,black);
        ecrireEnPositionXY(45,39,'Veuillez indiquer la ligne de l''objet à vendre ou 0 pour quitter : ');
    readln(choix);
    Result:=choix;
end;
function afficheMarchand():Integer; // affiche le marchand pour savoir s'il on veut vendre ou acheter
var choix:Integer;
begin
    effacerEcran();
    dessinerCadreXY(1,1,148,34,simple,white,black);
    dessinerCadreXY(69,0,81,2,simple,white,black);
    ecrireEnPositionXY(71,1,'Marchand');
    dessinerCadreXY(2,3,40,30,simple,white,black);    // objets disponibles
    dessinerCadreXY(42,3,146,33,simple,white,black); // crafts
    dessinerCadreXY(2,31,40,33,simple,white,black); // resources
    ecrireEnPositionXY(40,10,'Voulez-vous 1-Acheter ou 2-Vendre ? ');
    readln(choix);
    Result:=choix;
end;

function afficheVille():Integer; // Affichage du menu d'une partie
var
  choix:Integer; // le choix de l'action du menu
begin
    effacerEcran();
    // Module Marchand
    dessinerCadreXY(3,0,37,16,simple,white,black);
    affichage(5,3,'marchand');
    ecrireEnPositionXY(15,15,'1 - Marchand');
    // Module Cantine
    dessinerCadreXY(41,0,75,16,simple,white,black);
    affichage(48,4,'burger');
    ecrireEnPositionXY(53,15,'2 - Cantine');
    // Module Forge
    dessinerCadreXY(79,0,113,16,simple,white,black);
    affichage(89,7,'enclume');
    ecrireEnPositionXY(93,15,'3 - Forge');
    // Module Chambre
    dessinerCadreXY(116,0,147,16,simple,white,black);
    affichage(122,1,'lit');
    ecrireEnPositionXY(128,15,'4 - Chambre');
    // Module Combat
    dessinerCadreXY(5,20,90,33,simple,white,black);
    affichage(8,21,'epee');
    ecrireEnPositionXY(43,32,'5 - Partir en Chasse');
    // Module Exit
    dessinerCadreXY(110,20,144,33,simple,white,black);
    affichage(120,21,'croix');
    ecrireEnPositionXY(121,32,'6 - Quitter');
    // Réponse (choix du menu)
    ecrireEnPositionXY(70,18,'Votre Choix : ');
    readln(choix);
    case choix of
      1:Result:=2;
      2:Result:=3;
      3:Result:=4;
      4:Result:=1;
      5:Result:=5;
      6:Result:=6;
      else
        Result:=afficheVille();
    end;
end;

procedure afficheCredit(); // Affichage des crédits
begin
    effacerEcran();
    affichage(10,2,'decoCelt');
    affichage(124,2,'decoCelt');
    dessinerCadreXY(38,1,112,8,simple,white,black);
    ecrireEnPositionXY(40,3,'  /\/\   ___  _ __  ___| |_ ___ _ __    /\  /\_   _ _ __ | |_ ___ _ __ ');
    ecrireEnPositionXY(40,4,' /    \ / _ \| ''_ \/ __| __/ _ \ ''__|  / /_/ / | | | ''_ \| __/ _ \ ''__|');
    ecrireEnPositionXY(40,5,'/ /\/\ \ (_) | | | \__ \ ||  __/ |    / __  /| |_| | | | | ||  __/ |');
    ecrireEnPositionXY(40,6,'\/    \/\___/|_| |_|___/\__\___|_|    \/ /_/  \__,_|_| |_|\__\___|_|');
    ecrireEnPositionXY(69,10,'Hideo KOJIMA');
    ecrireEnPositionXY(59,14,'Jeu commandé par Matthieu SIMONET');
    ecrireEnPositionXY(45,16,'Jeu réalisé par : Mattéo BADET, Aimeric ROURA, Loïc BOUCHER');
    ecrireEnPositionXY(63,18,'Inspiré par Hideo KOJIMA');
    readln;
end;

function afficheCreationPerso():player; // menu de la création du personnage
var
  joueur:player; // le personnage une fois créé
begin
    changerTailleConsole(150,35);
    affichage(10,2,'decoCelt');
    affichage(124,2,'decoCelt');
    ecrireEnPositionXY(60,12,'Quel est votre sexe ? ');
    ecrireEnPositionXY(60,15,'Quel est votre taille ? ');
    ecrireEnPositionXY(60,18,'Comment vous appelez-vous ? ');
    ecrireEnPositionXY(60,21,'Comment allez- vous ? ');
    deplacerCurseurXY(82,12);
    readln(joueur.sexe);
    deplacerCurseurXY(84,15);
    readln(joueur.taille);
    deplacerCurseurXY(88,18);
    readln(joueur.nom);
    Result:=joueur;
end;

procedure regles(); // affiche les règles et le synopsis
begin
    effacerEcran();
    affichage(10,2,'decoCelt');
    affichage(124,2,'decoCelt');
    ecrireEnPositionXY(35,13,'La commission des chasseurs est une institution chargée d’étudier et de chasser');
    ecrireEnPositionXY(35,14,'les grands monstres qui peuplent le monde. Lors de la cinquième expédition');
    ecrireEnPositionXY(35,15,'envoyée dans le nouveau monde, la commission des chasseurs à découvert l’existence');
    ecrireEnPositionXY(35,16,'d’une île mystérieuse : Aeternum, protégée par un étrange brouillard magique');
    ecrireEnPositionXY(35,17,'empêchant les navires de s’y rendre mais qui semble jouer un rôle important dans');
    ecrireEnPositionXY(35,18,'le cycle de migration des grands monstres. Après de nombreuses recherches, la');
    ecrireEnPositionXY(35,19,'commission a mis la main sur un artéfact magique ressemblant à une boussole,');
    ecrireEnPositionXY(35,20,'censé permettre d’accéder à l’île. Vous faites partie de la sixième grande');
    ecrireEnPositionXY(35,21,'expédition de chasseurs dont l’objectif est de découvrir les secret d’Aeternum.');
    readln;
end;

function afficheMenuPrincipale():Boolean; // menu de la ville
var
  choix:Integer; // contient le choix du menu
begin
    changerTailleConsole(150,35);
    dessinerCadreXY(38,1,112,8,simple,white,black);
    ecrireEnPositionXY(40,3,'  /\/\   ___  _ __  ___| |_ ___ _ __    /\  /\_   _ _ __ | |_ ___ _ __ ');
    ecrireEnPositionXY(40,4,' /    \ / _ \| ''_ \/ __| __/ _ \ ''__|  / /_/ / | | | ''_ \| __/ _ \ ''__|');
    ecrireEnPositionXY(40,5,'/ /\/\ \ (_) | | | \__ \ ||  __/ |    / __  /| |_| | | | | ||  __/ |');
    ecrireEnPositionXY(40,6,'\/    \/\___/|_| |_|___/\__\___|_|    \/ /_/  \__,_|_| |_|\__\___|_|');
    dessinerCadreXY(60,11,85,15,simple,white,black);
    dessinerCadreXY(60,17,85,21,simple,white,black);
    dessinerCadreXY(60,23,85,27,simple,white,black);
    ecrireEnPositionXY(62,13,'1 - Nouvelle Partie');
    ecrireEnPositionXY(62,19,'2 - Crédit');
    ecrireEnPositionXY(62,25,'3 - Quitter');
    affichage(10,2,'decoCelt');
    affichage(124,2,'decoCelt');
    dessinerCadreXy(60,29,85,33,simple,white,black);
    ecrireEnPositionXY(62,31,'Votre Choix : ');
    readln(choix);
    Case choix of
      1:Result:=True;
      2:Result:=False;
      3:write('');
      else
        Result:=afficheMenuPrincipale();
      end;
end;

end.


