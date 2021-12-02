unit perso;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, utilities;

type
  //RECORD DU JOUEUR
  player = packed record
    nom:string;
    sexe:string;
    vieActu:integer;
    vieNue:integer;
    def:integer;
    atk:integer;
    materiaux:array[1..6] of integer;
    eqarmure:array[1..5] of armure;
    xp:integer;
    epee:arme;
  end;

function createjoueur(nom,sexe:string):player;//INITIALISATION DU JOUEUR

implementation

function createjoueur(nom,sexe:string):player;
var joueur:player;
begin
  joueur.nom:=nom;
  joueur.sexe:=sexe;
  joueur.vieActu:=300;
  joueur.vieNue:=300;
  joueur.def:=0;
  joueur.atk:=0;
  joueur.materiaux[1]:=0;
  joueur.materiaux[2]:=0;
  joueur.materiaux[3]:=0;
  joueur.materiaux[4]:=0;
  joueur.materiaux[5]:=0;
  joueur.materiaux[6]:=0;
  joueur.eqarmure[1]:=nullarmure;
  joueur.eqarmure[2]:=nullarmure;
  joueur.eqarmure[3]:=nullarmure;
  joueur.eqarmure[4]:=nullarmure;
  joueur.eqarmure[5]:=nullarmure;
  joueur.eqarmure[6]:=nullarmure;
  joueur.xp:=0;
  joueur.epee:=nullarm;

  result := joueur;
end;
end.
