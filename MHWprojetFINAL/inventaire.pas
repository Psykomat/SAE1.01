unit inventaire;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, utilities, perso;

procedure initialisationinv();//INITIALISATION DE L'INVENTAIRE
procedure ajouterinvarme(obj:arme);//AJOUT D'UN ITEM DANS L'INVENTAIRE ARME
procedure ajouterinvbombe(obj:bombe);//AJOUT D'UN ITEM DANS L'INVENTAIRE BOMBE
procedure ajouterinvpotion(obj:potion);//AJOUT D'UN ITEM DANS L'INVENTAIRE POTION
procedure equipercasque(epe:armure);//EQUIPER UN CASQUE
procedure equiperplastron(epe:armure);//EQUIPER UN PLASTRON
procedure equiperjambiere(epe:armure);//EQUIPER UNE JAMBIERE
procedure equiperbottes(epe:armure);//EQUIPER DES BOTTES
procedure equiperbouclier(epe:armure);//EQUIPER UN BOUCLIER
procedure equiperepee(joueur:player;obj:arme);//EQUIPER UNE EPEE
procedure afficheinv(joueur:player);//TEMP POUR LES TEST DE L'INV

implementation

procedure initialisationinv();
var i:integer;
begin
  for i:=1 to length(invarme) do
     invarme[i]:=nullarm;
  for i:=1 to length(invbombe) do
     invbombe[i]:=nullbombe;
  for i:=1 to length(invpotion) do
     invpotion[i]:=nullpotion;
  for i:=1 to length(invarmure) do
     invarmure[i]:=nullarmure;
end;
procedure equiperepee(joueur:player;obj:arme);
begin
  joueur.epee:=obj;
end;

procedure ajouterinvarme(obj:arme);
var
  fini:Boolean;
  y:integer;
begin
  y:=1;
  fini:=False;
  while fini = False do
  begin
    if invarme[y].nom = 'null' then
    begin
       invarme[y]:=obj;
       fini:=True
    end;
    if invarme[y].nom <> 'null' then
    begin
       y:=y+1;
       if y > length(invarme) then
       begin
          fini:=True;
          write('inventory full');
       end;
    end;
  end;
end;

procedure ajouterinvbombe(obj:bombe);
var
  fini:Boolean;
  y:integer;
begin
  y:=1;
  fini:=False;
  while fini = False do
  begin
    if invbombe[y].nom = 'null' then
    begin
       invbombe[y]:=obj;
       fini:=True
    end;
    if invbombe[y].nom <> 'null' then
    begin
       if y > length(invbombe) then
       begin
          fini:=True;
          writeln('inventory full');
       end;
       y:=y+1;
    end;
  end;
end;
procedure ajouterinvpotion(obj:potion);
var
  fini:Boolean;
  y:integer;
begin
  y:=1;
  fini:=False;
  while fini = False do
  begin
    if invpotion[y].nom = 'null' then
    begin
       invpotion[y]:=obj;
       fini:=True
    end;
    if invpotion[y].nom <> 'null' then
    begin
       y:=y+1;
       if y > length(invpotion) then
       begin
          fini:=True;
          writeln('inventory full');
       end;
    end;
  end;
end;
procedure equipercasque(epe:armure);
begin
  invarmure[1]:=epe;
end;
procedure equiperplastron(epe:armure);
begin
  invarmure[2]:=epe;
end;
procedure equiperjambiere(epe:armure);
begin
  invarmure[3]:=epe;
end;
procedure equiperbottes(epe:armure);
begin
  invarmure[4]:=epe;
end;
procedure equiperbouclier(epe:armure);
begin
  invarmure[5]:=epe;
end;

procedure afficheinv(joueur:player);
var i:integer;
begin
     writeln('----------------------------------------- Objet');
     for i:=1 to length(joueur.materiaux) do
        writeln(i,'  ',joueur.materiaux[i] );
     writeln('----------------------------------------- Arme');
     for i:=1 to length(invarme) do
        writeln(IntToStr(i) + ':' + invarme[i].nom);
     writeln('----------------------------------------- Bombe');
     for i:=1 to length(invbombe) do
        writeln(IntToStr(i) + ':' + invbombe[i].nom);
     writeln('----------------------------------------- Potion');
     for i:=1 to length(invpotion) do
        writeln(IntToStr(i) + ':' + invpotion[i].nom);
     writeln('----------------------------------------- Armure');
     for i:=1 to length(invarmure) do
        writeln(IntToStr(i) + ':' + invarmure[i].nom);
  end;

end.

