unit utilities;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  //RECORD BOMBE
  bombe = packed record
    nom:string;
    desc:string;
    degat:integer;
    prix:integer;
  end;
  //RECORD POTION
  potion = packed record
    nom:string;
    desc:string;
    effet:integer;
    prix:integer;
  end;
  //RECORD OBJET
  objet = packed record
    nom:string;
    desc:string;
    stack:integer;
  end;
  //RECORD ARME
  arme = packed record
    nom:string;
    desc:string;
    degat:integer;
    material:string;
    idmaterial: integer;
  end;
  //RECORD ARMURE
  armure = packed record
    nom:string;
    desc:string;
    partie:string;
    def:integer;
    material:string;
    idmaterial: integer;
  end;

var
  //INVENTAIRES
  invarme:array[1..15] of arme;
  invpotion:array[1..5] of potion;
  invbombe:array[1..3] of bombe;
  invarmure:array[1..5] of armure;
  choix,i:integer;
const
  //ARMURE
  nullarmure: armure = (
              nom:'null';
              desc:'null';
              partie:'null';
              def:0;
              material:'null';
              idmaterial: 0;
  );
//CUIRE
  casquecuire: armure = (
               nom:'casque en cuire';
               desc:'à mettre sur la tête';
               partie:'casque';
               def:150;
               material:'cuire';
               idmaterial: 1;
  );
  plastroncuire: armure = (
               nom:'plastron en cuire';
               desc:'à mettre sur le haut du corps';
               partie:'plastron';
               def:5;
               material:'cuire';
               idmaterial: 1;
  );
  jambierecuire: armure = (
               nom:'jambiere en cuire';
               desc:'à mettre sur le bas du corps';
               partie:'jambiere';
               def:150;
               material:'cuire';
               idmaterial: 1;
  );
  bottescuire: armure = (
               nom:'bottes en cuire';
               desc:'à mettre sur les pieds';
               partie:'bottes';
               def:150;
               material:'cuire';
               idmaterial: 1;
  );
//FER
  casquefer: armure = (
               nom:'casque en fer';
               desc:'à mettre sur la tête';
               partie:'casque';
               def:250;
               material:'fer';
               idmaterial: 2;
  );
  plastronfer: armure = (
               nom:'plastron en fer';
               desc:'à mettre sur le haut du corps';
               partie:'plastron';
               def:250;
               material:'fer';
               idmaterial: 2;
  );
  jambierefer: armure = (
               nom:'jambiere en fer';
               desc:'à mettre sur le bas du corps';
               partie:'jambiere';
               def:250;
               material:'fer';
               idmaterial: 2;
  );
  bottesfer: armure = (
               nom:'bottes en fer';
               desc:'à mettre sur les pieds';
               partie:'bottes';
               def:250;
               material:'fer';
               idmaterial: 2;
  );
  bouclierfer: armure = (
               nom:'bouclier en fer';
               desc:'pour se protéger';
               partie:'bouclier';
               def:250;
               material:'fer';
               idmaterial: 2;
  );
//ACIER
casqueacier: armure = (
               nom:'casque en acier';
               desc:'à mettre sur la tête';
               partie:'casque';
               def:15;
               material:'acier';
               idmaterial: 3;
  );
  plastronacier: armure = (
               nom:'plastron en acier';
               desc:'à mettre sur le haut du corps';
               partie:'plastron';
               def:15;
               material:'acier';
               idmaterial: 3;
  );
  jambiereacier: armure = (
               nom:'jambiere en acier';
               desc:'à mettre sur le bas du corps';
               partie:'jambiere';
               def:15;
               material:'acier';
               idmaterial: 3;
  );
  bottesacier: armure = (
               nom:'bottes en acier';
               desc:'à mettre sur les pieds';
               partie:'bottes';
               def:15;
               material:'acier';
               idmaterial: 3;
  );
  bouclieracier: armure = (
               nom:'bouclier en fer';
               desc:'pour se protéger';
               partie:'bouclier';
               def:15;
               material:'acier';
               idmaterial: 3;
  );
//ECAILLE DE DRAGON
casquescale: armure = (
               nom:'casque en écaille de dragon';
               desc:'à mettre sur la tête';
               partie:'casque';
               def:10;
               material:'scale';
               idmaterial: 4;
  );
  plastronscale: armure = (
               nom:'plastron en écaille de dragon';
               desc:'à mettre sur le haut du corps';
               partie:'plastron';
               def:10;
               material:'scale';
               idmaterial: 4;
  );
  jambierescale: armure = (
               nom:'jambiere en écaille de dragon';
               desc:'à mettre sur le bas du corps';
               partie:'jambiere';
               def:10;
               material:'scale';
               idmaterial: 4;
  );
  bottesscale: armure = (
               nom:'bottes en écaille de dragon';
               desc:'à mettre sur les pieds';
               partie:'bottes';
               def:10;
               material:'scale';
               idmaterial: 4;
  );
  bouclierscale: armure = (
               nom:'bouclier en écaille de dragon';
               desc:'pour se protéger';
               partie:'bouclier';
               def:10;
               material:'scale';
               idmaterial: 4;
  );
  //BOMBE
  nullbombe: bombe = (
             nom:'null';
             desc:'null';
             degat:0;
             prix:0;
  );
  bombepetite: bombe = (
         nom:'bombe petite';
         desc:'une bombe qui explose';
         degat:100;
         prix:3;
  );
  bombemoyenne: bombe = (
                nom:'bombe grande';
                desc:'une bombequi explose plus fort';
                degat:300;
                prix:7;
  );
  //POTION
  nullpotion: potion = (
              nom:'null';
              desc:'null';
              effet:0;
              prix:0;
  );
  petitepotion: potion = (
                nom:'petite';
                desc:'petite potion';
                effet:10;
                prix:5;
  );
  moyennepotion: potion = (
                nom:'moyenne';
                desc:'moyenne potion';
                effet:20;
                prix:10;
  );
  grandepotion: potion = (
                nom:'petite';
                desc:'grande potion';
                effet:30;
                prix:15;
  );
  //EPEE
  nullarm: arme = (
        nom:'null';
        desc:'null';
        degat:0;
        material:'null';
        idmaterial:0;
  );
  epeefer: arme = (
         nom:'epee en fer';
         desc:'pour le combat';
         degat:5;
         material: 'fer';
         idmaterial: 2;
  );
  epeeacier: arme = (
         nom:'epee en acier';
         desc:'pour le combat';
         degat:5;
         material: 'acier';
         idmaterial: 3;
  );
  epeescale: arme = (
         nom:'epee en écaille de dragon';
         desc:'pour le combat';
         degat:5;
         material: 'scale';
         idmaterial: 4;
  );
  epeedemo: arme = (
         nom:'epee en reste démoniaque';
         desc:'pour le combat';
         degat:5;
         material: 'reste';
         idmaterial:5;
  );

implementation

end.
