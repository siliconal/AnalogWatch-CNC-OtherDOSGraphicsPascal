{$r+}
program perceuse;
uses crt,dos,graph,sourunit,boutunit;
{const}
type pl= record
         xtrou,ytrou,diametre:byte;
     end;
     fichier=file of pl;
     string12=string[12];
     string30=string[30];
var  gs,gm:integer;
     size:word;
     img:pointer;
     size1:word;
     img1:pointer;
     size2:word;
     img2:pointer;
     i:word;
     plan:array [1..1024,1..3] of byte;
     colonne,ligne:word;
     derxtrou,derytrou:word;
     enrplan:pl;
     fich_plan:fichier;
     nomfichier:string12;
     depaschor,depascver:byte;
     ancX,ancY:WORD;
     

{===dessin des outils utilises pour la saisie du plan de percage===}
Procedure Outil(colonne,ligne,largeur,hauteur:word;cle:byte);

const  O1: array[0..19,0..19] of byte=(

      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,1,1,1,0,0,0,0,0,0,1,1,1,0,0,0,0),
      (0,0,0,1,0,0,0,1,0,0,0,0,1,0,0,0,1,0,0,0),
      (0,0,0,1,0,0,0,1,0,0,0,0,1,0,0,0,1,0,0,0),
      (0,0,0,1,0,0,0,1,0,0,0,0,0,1,1,1,0,0,0,0),
      (0,0,0,1,0,0,0,1,0,0,0,0,1,0,0,0,1,0,0,0),
      (0,0,0,1,0,0,0,1,0,1,1,0,1,0,0,0,1,0,0,0),
      (0,0,0,1,0,0,0,1,0,1,1,0,1,0,0,0,1,0,0,0),
      (0,0,0,0,1,1,1,0,0,0,1,0,0,1,1,1,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0));

      O2: array[0..19,0..19] of byte=(

      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0));

      O3: array[0..19,0..19] of byte=(
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,1,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0),
      (0,0,0,1,1,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0),
      (0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0),
      (0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0),
      (0,0,0,0,1,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0),
      (0,0,0,0,1,0,0,0,1,1,0,0,1,0,0,0,0,0,0,0),
      (0,0,0,0,1,0,0,0,1,1,0,1,0,0,0,0,0,0,0,0),
      (0,0,0,1,1,1,0,0,0,1,0,1,1,1,1,1,0,0,0,0),
      (0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0));

      O4: array[0..19,0..19] of byte=(
      (0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,1,1,0,0,0,1,1,0,0,0,0,0,0),
      (0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0),
      (0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0),
      (0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0),
      (0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0),
      (0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0),
      (0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0),
      (0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0),
      (0,0,0,0,0,0,0,1,1,0,0,0,1,1,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,1,1,1,0,0),
      (0,0,0,0,1,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0),
      (0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0),
      (0,0,0,0,0,1,0,0,0,0,0,0,1,0,1,1,1,0,0,0),
      (0,0,0,0,0,1,0,0,0,0,0,0,1,1,0,0,0,1,0,0),
      (0,0,0,0,0,1,0,0,0,1,1,0,0,0,0,0,0,1,0,0),
      (0,0,0,0,0,1,0,0,0,1,1,0,1,0,0,0,0,1,0,0),
      (0,0,0,0,1,1,1,0,0,0,1,0,0,1,1,1,1,0,0,0),
      (0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0));

      O5: array[0..19,0..19] of byte=(

      (0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0));

      O6: array[0..19,0..19] of byte=(
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,1,1,0,0,0,1,1,0,0,0,0,0,0,0,0,0,1,1,0),
      (1,0,0,1,0,1,0,0,1,0,0,0,0,0,0,0,1,0,0,1),
      (1,0,0,1,0,1,0,0,1,0,0,1,0,1,0,0,1,0,0,1),
      (0,1,1,0,0,0,1,1,0,0,0,0,0,0,0,0,0,1,1,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0));

      O7: array[0..19,0..19] of byte=(
      (0,0,0,0,1,1,1,9,1,1,1,1,9,1,1,1,0,0,0,0),
      (0,0,9,9,1,1,1,9,1,1,1,1,9,1,1,1,9,9,0,0),
      (0,9,9,9,1,1,1,9,1,1,1,1,9,1,1,1,9,9,9,0),
      (0,0,9,9,1,1,1,1,9,9,9,9,1,1,1,1,9,9,0,0),
      (0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0),
      (0,0,9,9,1,1,1,1,1,1,1,1,1,1,1,1,9,9,0,0),
      (0,9,9,9,1,1,1,1,1,1,1,1,1,1,1,1,9,9,9,0),
      (0,0,9,9,1,1,1,1,1,1,1,1,1,1,1,1,9,9,0,0),
      (0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0),
      (0,0,9,9,1,1,1,1,1,1,1,1,1,1,1,1,9,9,0,0),
      (0,9,9,9,1,1,1,1,1,1,1,1,1,1,1,1,9,9,9,0),
      (0,0,9,9,1,1,1,1,1,1,1,1,1,1,1,1,9,9,0,0),
      (0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0),
      (0,0,9,9,1,1,1,1,1,1,1,1,1,1,1,1,9,9,0,0),
      (0,9,9,9,1,1,1,1,1,1,1,1,1,1,1,1,9,9,9,0),
      (0,0,9,9,1,1,1,1,1,1,1,1,1,1,1,1,9,9,0,0),
      (0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0),
      (0,0,9,9,1,1,1,1,1,1,1,1,1,1,1,1,9,9,0,0),
      (0,9,9,9,1,1,1,1,1,1,1,1,1,1,1,1,9,9,9,0),
      (0,0,9,9,1,1,1,1,1,1,1,1,1,1,1,1,9,9,0,0));

      O8: array[0..19,0..19] of byte=(

      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,9,0,0,0,9,0,0,0,9,0,0,0,9,0,0,0,9,0,0),
      (9,9,9,0,9,9,9,0,9,9,9,0,9,9,9,0,9,9,9,0),
      (9,9,9,0,9,9,9,0,9,9,9,0,9,9,9,0,9,9,9,0),
      (1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),
      (1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),
      (1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),
      (1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,9,9,9),
      (1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,9,1,1,1),
      (1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,9,1,1,1),
      (1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,9,1,1,1),
      (1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,9,1,1,1),
      (1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,9,9,9),
      (1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),
      (1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),
      (1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),
      (9,9,9,0,9,9,9,0,9,9,9,0,9,9,9,0,9,9,9,0),
      (9,9,9,0,9,9,9,0,9,9,9,0,9,9,9,0,9,9,9,0),
      (0,9,0,0,0,9,0,0,0,9,0,0,0,9,0,0,0,9,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0));

      O9: array[0..19,0..19] of byte=(

      (0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0));

      O10: array[0..19,0..19] of byte=(

      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0),
      (0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0),
      (1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1),
      (1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1),
      (0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0),
      (0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0));

      O11: array[0..19,0..19] of byte=(

      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0),
      (0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0),
      (0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0),
      (0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0));

      O12: array[0..19,0..19] of byte=(

      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0),
      (0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0),
      (0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0),
      (0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0));

      O13: array[0..19,0..19] of byte=(

      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0),
      (0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0),
      (0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0),
      (0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0));

      O14: array[0..19,0..19] of byte=(

      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0),
      (0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0),
      (0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0),
      (0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0));


      O15: array[0..19,0..19] of byte=(

      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0));

var x,y:byte;
begin
     for y:=0 to 19 do
     begin
          for x:=0 to 19 do
              case cle of
                   15:if O15[y,x]<>0 then putpixel(colonne+((largeur-20) div 2)+x,ligne+((hauteur-20) div 2)+y+1,O15[y,x]-1);
                   14:if O14[y,x]<>0 then putpixel(colonne+((largeur-20) div 2)+x,ligne+((hauteur-20) div 2)+y+1,O14[Y,X]-1);
                   13:if O13[y,x]<>0 then putpixel(colonne+((largeur-20) div 2)+x,ligne+((hauteur-20) div 2)+y+1,O13[Y,X]-1);
                   12:if O12[y,x]<>0 then putpixel(colonne+((largeur-20) div 2)+x,ligne+((hauteur-20) div 2)+y+1,O12[Y,X]-1);
                   11:if O11[y,x]<>0 then putpixel(colonne+((largeur-20) div 2)+x,ligne+((hauteur-20) div 2)+y+1,O11[y,x]-1);
                   10:if O10[y,x]<>0 then putpixel(colonne+((largeur-20) div 2)+x,ligne+((hauteur-20) div 2)+y+1,O10[Y,X]-1);
                   9:if O9[y,x]<>0 then putpixel(colonne+((largeur-20) div 2)+x,ligne+((hauteur-20) div 2)+y+1,O9[Y,X]-1);
                   8:if O8[y,x]<>0 then putpixel(colonne+((largeur-20) div 2)+x,ligne+((hauteur-20) div 2)+y+1,O8[Y,X]-1);
                   7:if O7[y,x]<>0 then putpixel(colonne+((largeur-20) div 2)+x,ligne+((hauteur-20) div 2)+y+1,O7[y,x]-1);
                   6:if O6[y,x]<>0 then putpixel(colonne+((largeur-20) div 2)+x,ligne+((hauteur-20) div 2)+y+1,O6[Y,X]-1);
                   5:if O5[y,x]<>0 then putpixel(colonne+((largeur-20) div 2)+x,ligne+((hauteur-20) div 2)+y+1,O5[Y,X]-1);
                   4:if O4[y,x]<>0 then putpixel(colonne+((largeur-20) div 2)+x,ligne+((hauteur-20) div 2)+y+1,O4[Y,X]-1);
                   3:if O3[y,x]<>0 then putpixel(colonne+((largeur-20) div 2)+x,ligne+((hauteur-20) div 2)+y+1,O3[Y,X]-1);
                   2:if O2[y,x]<>0 then putpixel(colonne+((largeur-20) div 2)+x,ligne+((hauteur-20) div 2)+y+1,O2[Y,X]-1);
                   1:if O1[Y,x]<>0 then putpixel(colonne+((largeur-20) div 2)+x,ligne+((hauteur-20) div 2)+y+1,O1[Y,X]-1);
              end;
     end;
end;

{===appel de la procedure de dessin des outils en lui passant les caracteristiques des boutons contenant les outils===}
Procedure POutil(codebouton,signe:Byte);
var ligne,colonne,largeur,hauteur:word;
    z:byte;
begin
     z:=1;
     while (z<=80) and (caractbouton[z,5]<>codebouton) do inc(z);
     if z<=80 then
     begin
          ligne:=caractbouton[z,1];
          colonne:=caractbouton[z,2];
          largeur:=caractbouton[z,3];
          hauteur:=caractbouton[z,4];
     end;
     outil(colonne,ligne,largeur,hauteur,signe);
end;

{===affichage de la barre d'outils===}
Procedure affOutil;
const colonne=2;
      ligne=2;
begin
     setfillstyle(1,2);
     bar(colonne+5,ligne+5,colonne+41,ligne+471);
     contour(colonne,ligne,45,476,1,FALSE);
     contour(colonne+4,ligne+4,37,468,0,TRUE);
     affbouton(8+colonne,9+ligne,30,30,'',2);
     POutil(2,1);
     affbouton(8+colonne,9+ligne+33,30,30,'',3);
     POutil(3,2);
     affbouton(8+colonne,9+ligne+33*2,30,30,'',4);
     POutil(4,3);
     AFFBOUTON(8+colonne,9+ligne+33*3,30,30,'',5);
     POutil(5,4);
     AFFBOUTON(8+colonne,9+ligne+33*4,30,30,'',6);
     POutil(6,5);
     affbouton(8+colonne,9+ligne+33*5,30,30,'',7);
     POutil(7,6);
     AFFBOUTON(8+colonne,9+ligne+33*6,30,30,'',8);
     POutil(8,7);
     AFFBOUTON(8+colonne,9+ligne+33*7,30,30,'',9);
     POutil(9,8);
     AFFBOUTON(8+colonne,9+ligne+33*8,30,30,'',10);
     POutil(10,9);
     AFFBOUTON(8+colonne,9+ligne+33*9,30,30,'',11);
     POutil(11,10);
     AFFBOUTON(8+colonne,9+ligne+33*10,30,30,'',12);
     POutil(12,11);
     AFFBOUTON(8+colonne,9+ligne+33*11,30,30,'',13);
     POutil(13,12);
     AFFBOUTON(8+colonne,9+ligne+33*12,30,30,'',14);
     POutil(14,13);
     AFFBOUTON(8+colonne,9+ligne+33*13,30,30,'',15);
     POutil(15,14);
end;

{===dessin des fleches des ascenceurs===}
Procedure fleche(colonne,ligne,largeur,hauteur:word;signe:byte);

const     G : array[0..10,0..10] of byte=(
      (0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,1,0,0,0,0,0),
      (0,0,0,0,1,1,0,0,0,0,0),
      (0,0,0,1,1,1,0,0,0,0,0),
      (0,0,1,1,1,1,1,1,1,1,0),
      (0,1,1,1,1,1,1,1,1,1,0),
      (0,0,1,1,1,1,1,1,1,1,0),
      (0,0,0,1,1,1,0,0,0,0,0),
      (0,0,0,0,1,1,0,0,0,0,0),
      (0,0,0,0,0,1,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0));

       D : array[0..10,0..10] of byte=(
      (0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,1,0,0,0,0,0),
      (0,0,0,0,0,1,1,0,0,0,0),
      (0,0,0,0,0,1,1,1,0,0,0),
      (0,1,1,1,1,1,1,1,1,0,0),
      (0,1,1,1,1,1,1,1,1,1,0),
      (0,1,1,1,1,1,1,1,1,0,0),
      (0,0,0,0,0,1,1,1,0,0,0),
      (0,0,0,0,0,1,1,0,0,0,0),
      (0,0,0,0,0,1,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0));


      H : array[0..10,0..10] of byte=(
      (0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,1,0,0,0,0,0),
      (0,0,0,0,1,1,1,0,0,0,0),
      (0,0,0,1,1,1,1,1,0,0,0),
      (0,0,1,1,1,1,1,1,1,0,0),
      (0,1,1,1,1,1,1,1,1,1,0),
      (0,0,0,0,1,1,1,0,0,0,0),
      (0,0,0,0,1,1,1,0,0,0,0),
      (0,0,0,0,1,1,1,0,0,0,0),
      (0,0,0,0,1,1,1,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0));

      B : array[0..10,0..10] of byte=(
      (0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,1,1,1,0,0,0,0),
      (0,0,0,0,1,1,1,0,0,0,0),
      (0,0,0,0,1,1,1,0,0,0,0),
      (0,0,0,0,1,1,1,0,0,0,0),
      (0,1,1,1,1,1,1,1,1,1,0),
      (0,0,1,1,1,1,1,1,1,0,0),
      (0,0,0,1,1,1,1,1,0,0,0),
      (0,0,0,0,1,1,1,0,0,0,0),
      (0,0,0,0,0,1,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0));

var x,y:byte;
begin
     for y:=0 to 10 do
     begin
          for x:=0 to 10 do
              case signe of
                   1:if G[y,x]=1 then putpixel(colonne+((largeur-11) div 2)+x,ligne+((hauteur-11) div 2)+y+1,0);
                   2:if D[y,x]=1 then putpixel(colonne+((largeur-11) div 2)+x,ligne+((hauteur-11) div 2)+y+1,0);
                   3:if H[y,x]=1 then putpixel(colonne+((largeur-11) div 2)+x,ligne+((hauteur-11) div 2)+y+1,0);
                   4:if B[y,x]=1 then putpixel(colonne+((largeur-11) div 2)+x,ligne+((hauteur-11) div 2)+y+1,0);
              end;
     end;
end;

{===appel de la procedure de dessin des fleches en lui passant les caracteristiques des boutons contenant les fleches===}
Procedure Pfleche(codebouton,signe:byte);
var  ligne,colonne,largeur,hauteur:word;
     z:byte;
begin
     z:=1;
     while (z<=80) and (caractbouton[z,5]<>codebouton) do inc(z);
     if z<=80 then
     begin
          ligne:=caractbouton[z,1];
          colonne:=caractbouton[z,2];
          largeur:=caractbouton[z,3];
          hauteur:=caractbouton[z,4];
     end;
     fleche(colonne,ligne,largeur,hauteur,signe);
end;

{===affichage de l'icone du menu===}
procedure AffIcon;
const icon: array[0..19,0..19] of byte=(
      (1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1),
      (1,0,0,1,1,1,0,0,0,0,0,0,0,0,1,1,1,0,0,1),
      (1,5,5,0,0,0,1,1,1,0,0,1,1,1,0,0,0,5,0,1),
      (1,5,5,5,5,5,0,0,0,1,1,0,0,0,5,5,5,5,0,1),
      (1,0,0,5,5,5,5,5,0,1,1,5,5,5,5,5,5,0,0,1),
      (1,3,3,0,0,0,5,5,0,1,1,5,5,5,0,0,0,0,0,1),
      (1,0,0,3,3,3,0,0,0,1,1,0,0,0,3,3,0,0,0,1),
      (1,0,0,0,0,0,0,0,0,1,1,3,3,3,0,0,0,0,0,1),
      (1,3,3,0,0,0,0,0,0,1,1,0,0,0,2,2,2,0,0,1),
      (1,0,0,3,3,3,0,0,0,1,1,2,2,2,0,0,0,0,0,1),
      (1,0,0,0,0,0,3,0,0,1,1,0,0,0,0,0,0,7,0,1),
      (1,4,4,0,0,0,0,0,0,1,1,0,0,0,7,7,7,0,0,1),
      (1,0,0,4,4,0,0,0,0,1,1,7,7,7,0,0,0,0,0,1),
      (1,6,6,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,1),
      (1,0,0,6,6,6,0,0,0,1,1,0,0,0,6,6,6,0,0,1),
      (1,2,2,0,0,0,0,0,0,1,1,6,6,6,0,0,0,0,0,1),
      (1,1,1,2,2,0,0,0,0,1,1,0,0,0,0,0,0,1,1,1),
      (0,0,0,1,1,1,0,0,0,1,1,0,0,0,1,1,1,0,0,0),
      (0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0));

      colonne=612;
      ligne=5;
var x,y:word;
begin
     setfillstyle(1,7);
     bar(607,2,637,32);
     settextstyle(2,0,4);
     settextjustify(1,1);
     SETCOLOR(0);
     outtextxy(622,27,'Menu');
     for y:=0 to 19 do
     begin
          for x:=0 to 19 do
              if icon[y,x]<>0 then putpixel(colonne+x,ligne+y,icon[y,x]-1);
     end;
end;

{===grisage de l'icone du menu===}
procedure EffIcon;
const icon: array[0..19,0..19] of byte=(
      (1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1),
      (1,0,0,1,1,1,0,0,0,0,0,0,0,0,1,1,1,0,0,1),
      (1,5,5,0,0,0,1,1,1,0,0,1,1,1,0,0,0,5,0,1),
      (1,5,5,5,5,5,0,0,0,1,1,0,0,0,5,5,5,5,0,1),
      (1,0,0,5,5,5,5,5,0,1,1,5,5,5,5,5,5,0,0,1),
      (1,3,3,0,0,0,5,5,0,1,1,5,5,5,0,0,0,0,0,1),
      (1,0,0,3,3,3,0,0,0,1,1,0,0,0,3,3,0,0,0,1),
      (1,0,0,0,0,0,0,0,0,1,1,3,3,3,0,0,0,0,0,1),
      (1,3,3,0,0,0,0,0,0,1,1,0,0,0,2,2,2,0,0,1),
      (1,0,0,3,3,3,0,0,0,1,1,2,2,2,0,0,0,0,0,1),
      (1,0,0,0,0,0,3,0,0,1,1,0,0,0,0,0,0,7,0,1),
      (1,4,4,0,0,0,0,0,0,1,1,0,0,0,7,7,7,0,0,1),
      (1,0,0,4,4,0,0,0,0,1,1,7,7,7,0,0,0,0,0,1),
      (1,6,6,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,1),
      (1,0,0,6,6,6,0,0,0,1,1,0,0,0,6,6,6,0,0,1),
      (1,2,2,0,0,0,0,0,0,1,1,6,6,6,0,0,0,0,0,1),
      (1,1,1,2,2,0,0,0,0,1,1,0,0,0,0,0,0,1,1,1),
      (0,0,0,1,1,1,0,0,0,1,1,0,0,0,1,1,1,0,0,0),
      (0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0));

      colonne=612;
      ligne=5;
var x,y:word;
begin
     setfillstyle(1,8);
     bar(607,2,637,32);
     settextstyle(2,0,4);
     settextjustify(1,1);
     SETCOLOR(7);
     outtextxy(622,27,'Menu');
     for y:=0 to 19 do
     begin
          for x:=0 to 19 do
              if icon[y,x]<>0 then putpixel(colonne+x,ligne+y,7);
     end;
end;

{===dessin de l'ascenceur horizontal (immobile)===}
Procedure AscenHor;
const colonne=50;
      ligne=2;
begin
     setfillstyle(1,2);
     bar(colonne+5,ligne+5,colonne+300+249,ligne+25);
     contour(colonne,ligne,305+249,30,1,FALSE);
     contour(colonne+4,ligne+4,297+249,22,0,TRUE);
     AFF2BOUTON(5+colonne,5+ligne,20,20,'',16);
     Pfleche(16,1);
     AFF2BOUTON(colonne+300+229,5+ligne,20,20,'',17);
     Pfleche(17,2);
     aff2bouton(5+colonne+21,5+ligne,47,20,'',21);

     size1:=imagesize(5+colonne+21,5+ligne,5+colonne+68,5+ligne+20);
     getmem(img1,size1);
     getimage(5+colonne+21,5+ligne,5+colonne+68,5+ligne+20,img1^);

end;

{===dessin de l'ascenceur vertical (immobile)===}
procedure AscenVer;
const colonne=607;
      ligne=35;
begin
     setfillstyle(1,2);
     bar(colonne+5,ligne+5,colonne+25,ligne+410);
     contour(colonne,ligne,30,415,1,FALSE);
     contour(colonne+4,ligne+4,22,407,0,TRUE);
     AFF2BOUTON(5+colonne,5+ligne,20,20,'',18);
     Pfleche(18,3);
     AFF2BOUTON(5+colonne,5+ligne+385,20,20,'',19);
     Pfleche(19,4);
     aff2bouton(5+colonne,5+ligne+21+343-63,20,20+63,'',20);

     size2:=imagesize(5+colonne,5+ligne+21+343-63,5+colonne+20,5+ligne+21+343+20);
     getmem(img2,size2);
     getimage(5+colonne,5+ligne+21+343-63,5+colonne+20,5+ligne+21+343+20,img2^);
end;

{===affichage de la feuille de saisie===}
procedure Affeuille;
var i,j:byte;
    x,y:word;
    stri:string[3];
begin
     setfillstyle(1,6);
     bar(70,35,604,430);

     for i:=0 to 65 do
     begin
          x:=i*8+77;
          for j:=48 downto 0 do
          begin
               y:=j*8+40;
               putpixel(x,y,0);
          end;
     end;
end;

{===affichage de l'echelle===}
procedure affechelle;
begin
     setfillstyle(1,15);
     bar(50,432,68,450);
     setcolor(0);
     settextstyle(2,0,3);
     outtextxy(58,433,'x');
     outtextxy(60,439,'1,27');
     settextstyle(2,0,4);
     outtextxy(58,445,'mm');
end;

{===affichage de l'axe X===}
procedure AffAxeX(DepAscHor:byte);
var i,j:byte;
    x,y:word;
    stri:string[3];
begin
     setfillstyle(1,15);
     bar(70,432,604,450);
     setlinestyle(0,0,1);
     settextstyle(2,1,4);
     settextjustify(1,1);

     for i:=0 to 65 do
     begin
          x:=i*8+77;
          line(x,432,x,433);
          str(i+DepAscHor:3,stri);
          outtextxy(x-3,442,stri);
     end;
end;

{===affichage de l'axe Y===}
procedure AffAxeY(DepAscVer:byte);
var i,j:byte;
    x,y:word;
    stri:string[3];
begin
     setfillstyle(1,15);
     bar(50,35,68,430);
     settextstyle(2,0,4);
     setlinestyle(0,0,1);
     settextjustify(1,1);

     for i:=48 downto 0 do
     begin
          y:=i*8+40;
          line(67,y,68,y);
          str(48-i+DepAscVer:3,stri);
          outtextxy(57,y-1,stri);
     end;
end;

{===affichage de la barre d'etat et de messages===}
procedure AffBarEtatMess;
const colonne=50;
      ligne=452;
begin
     setfillstyle(1,7);
     bar(colonne,ligne,637,477);
     contour(500,455,130,18,1,true);
     contour(250,455,230,18,1,true);
end;

{===affichage des messages avec delai===}
procedure AffMess(mess:string30);
begin
     effsouris;
     setcolor(4);
     settextstyle(0,0,0);
     outtextxy(365,465,mess);
     sound(880);
     delay(400);
     nosound;
     sound(880);
     delay(100);
     nosound;
     delay(700);

     setfillstyle(1,7);
     bar(252,457,478,470);
     affsouris;
end;

{===affichage des messages ===}
procedure AffMess2(mess:string30);
begin
     effsouris;
     setcolor(0);
     settextstyle(0,0,0);
     outtextxy(365,465,mess);
     sound(880);
     delay(70);
     nosound;
     affsouris;
end;

{===effacement du message===}
procedure effmess;
begin
     effsouris;
     setfillstyle(1,7);
     bar(252,457,478,470);
     affsouris;
end;

{===affichage de la zone de position===}
procedure MessPos;
begin
     contour(102,455,126,18,1,true);
     settextstyle(0,0,0);
     outtextxy(123,465,'X: ');
     outtextxy(187,465,'Y: ');
end;

{===conversion de colonne en xlogic===}
function colonne_en_Xlogic(colonne:word;DepAscHor:byte):byte;
const colorg=77;
begin
     {$r-}
     colonne_en_Xlogic:=((colonne-colorg) div 8)+DepAscHor;
     {$r+}
end;

{===conversion de xlogic en colonne===}
function Xlogic_en_colonne(xlogic,DepAscHor:byte):word;
const colorg=77;
begin
     {$r-}
     Xlogic_en_colonne:=colorg+(Xlogic-depAscHor)*8;
     {$r+}
end;

{===conversion de ylogic en ligne===}
function Ylogic_en_ligne(ylogic,DepAscVer:byte):word;
Const LinOrg=40;
begin
     {$r-}
     Ylogic_en_ligne:=linorg-((ylogic-DepAscVer)-48)*8;
     {$r+}
end;

{===conversion de ligne en ylogic===}
function ligne_en_ylogic(ligne:word;DepAscVer:byte):byte;
const linorg=40;
begin
     {$r-}
     ligne_en_Ylogic:=48-((ligne-linorg) div 8)+DepAscVer;
     {$r+}
end;

{=affiche un trou au point de coordonn?es xtrou,ytrou de diametre "diametre"=}
PROCEDURE AffTrou(xtrou,ytrou:word;diametre:byte);
var j:word;
    exist:boolean;
begin

     if (xtrou>=77) and (xtrou<604) and (ytrou>=40) and (ytrou<426) then
     begin
          exist:=false;

     for j:=1 to i do
         if (plan[j,1]=colonne_en_xlogic(xtrou,DepAscHor)) and (plan[j,2]=ligne_en_ylogic(ytrou,DepAscVer)) then
         begin
              affmess('trou d?ja saisi !');
              exist:=true;
         end;
     if not exist then
     begin
          effsouris;
          if diametre=1 then
          begin
               setfillstyle(1,15);
               bar(xtrou-1,ytrou-1,xtrou+1,ytrou+1);
               setcolor(0);
               rectangle(xtrou-1,ytrou-1,xtrou+1,ytrou+1);
          end
          else
          begin
               setfillstyle(1,7);
               setcolor(0);
               fillellipse(xtrou,ytrou,diametre,diametre);
          end;
          affsouris;

          inc(i);
          plan[i,1]:=colonne_en_xlogic(xtrou,DepAscHor);
          plan[i,2]:=ligne_en_ylogic(ytrou,DepAscVer);
          plan[i,3]:=diametre;
     end;
     end
     else affmess('Trou hors de la surface..');


end;

{===mise a jour de l'affichage du plan de percage===}
procedure maj(DepAscHor,DepAscVer:byte;axe:char);
var j:word;
    xtrou,ytrou:word;
begin
     effsouris;
     AfFeuille;
     if axe='h' then AffAxeX(DepAscHor) else AffAxeY(DepAscVer);

     for j:=1 to i do
     begin
          if (plan[j,1]-DepAscHor>=0) and (plan[j,1]-DepAscHor<=65) then
          if (plan[j,2]-DepAscVer>=0) and (plan[j,2]-DepAscVer<=48) then
          begin

               xtrou:=Xlogic_en_colonne(plan[j,1],DepAscHor);
               ytrou:=ylogic_en_ligne(plan[j,2],DepAscVer);
               if plan[j,3]=1 then
               begin
                    setfillstyle(1,15);
                    bar(xtrou-1,ytrou-1,xtrou+1,ytrou+1);
                    setcolor(0);
                    rectangle(xtrou-1,ytrou-1,xtrou+1,ytrou+1);
               end
               else
               begin
                    setfillstyle(1,7);
                    fillellipse(Xtrou,Ytrou,plan[j,3],plan[j,3]);
               end;
          end;
     end;
     affsouris;
end;

{===activation des ascenceurs===}
procedure ascenceur;
begin
     if boutongauche then
           begin
           if (yclickgauche>7) and (yclickgauche<27) then
                begin
                if (xclickgauche>55) and (xclickgauche<75) then
                begin
                     boutonappuie(16);
                     while (boutongauche) and (mousex>55) and (mousex<75) and (mousey>7) and (mousey<27) do
                     begin
                          if DepAscHor>0 then
                          begin
                               setfillstyle(1,2);
                               EffSouris;
                               dec(DepAscHor);
                               bar(ancX+40,7,ancX+47,27);
                               putimage(76+DepAscHor*5,7,img1^,copyput);
                               ancX:=76+DepAscHor*5;

                               delay(10);
                               affsouris;
                          end;
                     end;
                     boutonrepos(16);
                     maj(DepAschor,DepAscVer,'h');
                end;
                if (xclickgauche>579) and (xclickgauche<599) then
                begin
                     boutonappuie(17);
                     while (boutongauche) and (mousex>579) and (mousex<599) and (mousey>7) and (mousey<27) do
                     begin
                          if DepAscHor<91 then
                          begin
                               setfillstyle(1,2);
                               effsouris;
                               inc(DepAscHor);
                               bar(ancX,7,ancX+7,27);
                               putimage(76+DepAscHor*5,7,img1^,copyput);
                               ancX:=76+DepAscHor*5;
                               delay(10);
                               affsouris;
                          end;
                     end;
                     boutonrepos(17);
                     maj(DepAscHor,DepAscVer,'h');
                end;
           end;
           end;

           if boutongauche then
           begin
           if (xclickgauche>612) and (xclickgauche<632) then
                begin
                if (yclickgauche>40) and (yclickgauche<60) then
                begin
                     boutonappuie(18);
                     while (boutongauche) and (mousex>612) and (mousex<632) and (mousey>40) and (mousey<60) do
                     begin
                          if DepAscVer<70 then
                          begin
                               setfillstyle(1,2);
                               effsouris;
                               inc(DepAscVer);
                               bar(612,ancY-26,632,ancY+20);
                               putimage(612,404-DepAscVer*4-63,img2^,copyput);
                               ancY:=404-DepAscVer*4;
                               delay(10);
                               affsouris;
                          end;
                     end;
                     boutonrepos(18);
                     maj(DepAscHor,DepAscVer,'v');
                end;
                if (yclickgauche>420) and (yclickgauche<440) then
                begin
                     boutonappuie(19);
                     while (boutongauche) and (mousex>612) and (mousex<632) and (mousey>420) and (mousey<440) do
                     begin
                          if DepAscVer>0 then
                          begin
                               setfillstyle(1,2);
                               effsouris;
                               dec(DepAscVer);
                               bar(612,ancY-63,632,ancY-57);
                               putimage(612,404-DepAscVer*4-63,img2^,copyput);
                               ancY:=404-DepAscVer*4;
                               delay(10);
                               affsouris;
                          end;
                     end;
                     boutonrepos(19);
                     maj(DepAscHor,DepAscVer,'v');
                end;
           end;
     end;
end;



{===affichage de la position de la souris en pas de 1,27 mm===}
procedure AffPos;
var strg1,strg2:string[3];
    xtrou,ytrou:word;
    mx,my:word;
begin
     mx:=mousex;
     my:=mousey;
     if (mx>77) or (mx<604) or (my>40) or (my<426) then
     begin
          if (mx-77) mod 8=0 then xtrou:=mx else
              begin
                   if (mx-77) mod 8<4 then xtrou:=mx-((mx-77) mod 8) else
                   xtrou:=mx-((mx-77) mod 8)+8;
              end;
              if (my-40) mod 8=0 then ytrou:=my else
              begin
                   if (my-40) mod 8<4 then ytrou:=my-((my-40) mod 8) else
                   ytrou:=my-((my-40) mod 8)+8;
              end;
          setcolor(0);
          settextstyle(0,0,0);
          setfillstyle(1,7);
          bar(140,460,165,470);
          str(colonne_en_xlogic(xtrou,DepAscHor),strg1);
          outtextxy(150,465,strg1);
          bar(200,460,223,470);
          str(ligne_en_ylogic(ytrou,DepAscver),strg2);
          outtextxy(211,465,strg2);
     end;
end;

{==effectue la saisie d'un trou de diametre "diametre",l'affiche et met ses
coordonn?es dans les variables colonne et ligne==}
procedure SaisieTrou(diametre:byte);
var xtrou,ytrou:word;
    ancmousex,ancmousey:word;
begin
     fenetre_souris(55,8,631,446);
     place_souris(341,232);

     ancmousex:=0;
     ancmousey:=0;

     repeat
           ascenceur;
           if (ancmousex<>mousex) or (ancmousey<>mousey) then AffPos;

           if boutongauche then
           begin
              if (xclickgauche-77) mod 8=0 then xtrou:=xclickgauche else
              begin
                   if (xclickgauche-77) mod 8<4 then xtrou:=xclickgauche-((xclickgauche-77) mod 8) else
                   xtrou:=xclickgauche-((xclickgauche-77)mod 8)+8;
              end;
              if (yclickgauche-40) mod 8=0 then ytrou:=yclickgauche else
              begin
                   if (yclickgauche-40) mod 8<4 then ytrou:=yclickgauche-((yclickgauche-40) mod 8) else
                   ytrou:=yclickgauche-((yclickgauche-40)mod 8)+8;
              end;
              if not ((derxtrou=xtrou) and (derytrou=ytrou)) then
              begin
                   afftrou(xtrou,ytrou,diametre);
                   colonne:=xtrou;
                   ligne:=ytrou;
                   derxtrou:=xtrou;
                   derytrou:=ytrou;
              end;
           end;
           ancmousex:=mousex;
           ancmousey:=mousey;

     until boutondroit;
     fenetre_souris(0,0,639,479);
end;

{==saisie d'un circuit SIL horizental==}
procedure SaisieSILH;
var c1,c2:char;
    valr:byte;
    code:integer;
    j,deroption:byte;
    sort:boolean;

begin
     effsouris;
     size:=imagesize(210,180,440,400);
     getmem(img,size);
     getimage(210,180,440,400,img^);

     setfillstyle(1,7);
     bar(210,180,440,400);
     contour(210,180,230,220,3,false);
     contour(220,190,210,200,2,true);
     contour(228,230,194,154,0,false);
     contour(228,197,194,28,1,true);
     SETFILLSTYLE(1,3);
     bar(230,199,420,223);
     setcolor(0);
     settextjustify(1,1);
     settextstyle(1,0,2);
     outtextxy(325,207,'Propriet?s "SIL"');
     settextstyle(0,0,0);
     outtextxy(306,260,'Nombre de broches:');
     setfillstyle(1,15);
     bar(385,250,415,270);
     contour(385,250,30,20,1,true);
     outtextxy(275,300,'Diametre :');
     outtextxy(350,300,'0,8 mm');
     outtextxy(358,320,'1 mm');
     outtextxy(350,340,'1,2 mm');
     outtextxy(350,360,'1,5 mm');

     setfillstyle(1,15);
     fillellipse(400,300,7,7);
     fillellipse(400,320,7,7);
     fillellipse(400,340,7,7);
     fillellipse(400,360,7,7);

     setcolor(0);
     circle(400,300,7);
     circle(400,320,7);
     circle(400,340,7);
     circle(400,360,7);

     setfillstyle(1,0);
     fillellipse(400,300,4,4);
     repeat
           setfillstyle(1,15);
           bar(385,250,415,270);
           contour(385,250,30,20,1,true);
           repeat
                 while not keypressed do
                 begin
                      setcolor(0);
                      line(390,255,390,265);
                      delay(100);
                      setcolor(15);
                      line(390,255,390,265);
                      delay(100);
                 end;
                 c1:=readkey;
           until (ord(c1)>47) and (ord(c1)<58);
           setcolor(0);
           outtextxy(392,261,c1);

           repeat
                 while not keypressed do
                 begin
                      setcolor(0);
                      line(400,255,400,265);
                      delay(100);
                      setcolor(15);
                      line(400,255,400,265);
                      delay(100);
                 end;
                 c2:=readkey;
           until ((ord(c2)>47) and (ord(c2)<58)) or (ord(c2)=13);
           if ord(c2)=13 then
           begin
                setcolor(15);
                outtextxy(392,261,c1);
                setcolor(0);
                outtextxy(402,261,c1);
                val(concat('0',c1),valr,code);
           end
           else
           begin
                setcolor(0);
                outtextxy(402,261,c2);
                val(concat(c1,c2),valr,code);
           end;
     until (valr<41) and (valr>0);

     affsouris;
     fenetre_souris(210,180,440,400);
     place_souris(325,290);
     deroption:=1;
     repeat
           sort:=false;
           if (xclickgauche>395) and (xclickgauche<405) then
           begin
                if (yclickgauche>295) and (yclickgauche<305) then
                begin
                     effsouris;
                     setfillstyle(1,15);
                     fillellipse(400,300+20*(deroption-1),7,7);
                     setcolor(0);
                     circle(400,300,7);
                     setfillstyle(1,0);
                     fillellipse(400,300,4,4);
                     while (boutongauche) and (mousex>395) and (mousex<405) and (mousey>295) and (mousey<305) do;
                     affsouris;
                     deroption:=1;
                     sort:=true;
                end;
                if (yclickgauche>315) and (yclickgauche<325) then
                begin
                     effsouris;
                     setfillstyle(1,15);
                     fillellipse(400,300+20*(deroption-1),7,7);
                     setcolor(0);
                     circle(400,320,7);
                     setfillstyle(1,0);
                     fillellipse(400,320,4,4);
                     while (boutongauche) and (mousex>395) and (mousex<405) and (mousey>315) and (mousey<325) do;
                     affsouris;
                     deroption:=2;
                     sort:=true;
                end;
                if (yclickgauche>335) and (yclickgauche<345) then
                begin
                     effsouris;
                     setfillstyle(1,15);
                     fillellipse(400,300+20*(deroption-1),7,7);
                     setcolor(0);
                     circle(400,340,7);
                     setfillstyle(1,0);
                     fillellipse(400,340,4,4);
                     while (boutongauche) and (mousex>395) and (mousex<405) and (mousey>335) and (mousey<345) do;
                     affsouris;
                     deroption:=3;
                     sort:=true;
                end;
                if (yclickgauche>355) and (yclickgauche<365) then
                begin
                     effsouris;
                     setfillstyle(1,15);
                     fillellipse(400,300+20*(deroption-1),7,7);
                     setcolor(0);
                     circle(400,360,7);
                     setfillstyle(1,0);
                     fillellipse(400,360,4,4);
                     while (boutongauche) and (mousex>395) and (mousex<405) and (mousey>355) and (mousey<365) do;
                     affsouris;
                     deroption:=4;
                     sort:=true;
                end;
           end;
     until sort;

     effsouris;
     putimage(210,180,img^,copyput);
     freemem(img,size);
     affsouris;

     saisietrou(deroption);

     for j:=1 to valr-1 do afftrou(colonne+j*16,ligne,deroption);
end;

{==saisie d'un circuit SIL vertical==}
procedure SaisieSILV;
var c1,c2:char;
    valr:byte;
    code:integer;
    j,deroption:byte;
    sort:boolean;

begin
     effsouris;
     size:=imagesize(210,180,440,400);
     getmem(img,size);
     getimage(210,180,440,400,img^);

     setfillstyle(1,7);
     bar(210,180,440,400);
     contour(210,180,230,220,3,false);
     contour(220,190,210,200,2,true);
     contour(228,230,194,154,0,false);
     contour(228,197,194,28,1,true);
     SETFILLSTYLE(1,3);
     bar(230,199,420,223);
     setcolor(0);
     settextjustify(1,1);
     settextstyle(1,0,2);
     outtextxy(325,207,'Propriet?s "SIL"');
     settextstyle(0,0,0);
     outtextxy(306,260,'Nombre de broches:');
     setfillstyle(1,15);
     bar(385,250,415,270);
     contour(385,250,30,20,1,true);
     outtextxy(275,300,'Diametre :');
     outtextxy(350,300,'0,8 mm');
     outtextxy(358,320,'1 mm');
     outtextxy(350,340,'1,2 mm');
     outtextxy(350,360,'1,5 mm');

     setfillstyle(1,15);
     fillellipse(400,300,7,7);
     fillellipse(400,320,7,7);
     fillellipse(400,340,7,7);
     fillellipse(400,360,7,7);

     setcolor(0);
     circle(400,300,7);
     circle(400,320,7);
     circle(400,340,7);
     circle(400,360,7);

     setfillstyle(1,0);
     fillellipse(400,300,4,4);
     repeat
           setfillstyle(1,15);
           bar(385,250,415,270);
           contour(385,250,30,20,1,true);
           repeat
                 while not keypressed do
                 begin
                      setcolor(0);
                      line(390,255,390,265);
                      delay(100);
                      setcolor(15);
                      line(390,255,390,265);
                      delay(100);
                 end;
                 c1:=readkey;
           until (ord(c1)>47) and (ord(c1)<58);
           setcolor(0);
           outtextxy(392,261,c1);

           repeat
                 while not keypressed do
                 begin
                      setcolor(0);
                      line(400,255,400,265);
                      delay(100);
                      setcolor(15);
                      line(400,255,400,265);
                      delay(100);
                 end;
                 c2:=readkey;
           until ((ord(c2)>47) and (ord(c2)<58)) or (ord(c2)=13);
           if ord(c2)=13 then
           begin
                setcolor(15);
                outtextxy(392,261,c1);
                setcolor(0);
                outtextxy(402,261,c1);
                val(concat('0',c1),valr,code);
           end
           else
           begin
                setcolor(0);
                outtextxy(402,261,c2);
                val(concat(c1,c2),valr,code);
           end;
     until (valr<41) and (valr>0);

     affsouris;
     fenetre_souris(210,180,440,400);
     place_souris(325,290);
     deroption:=1;
     repeat
           sort:=false;
           if (xclickgauche>395) and (xclickgauche<405) then
           begin
                if (yclickgauche>295) and (yclickgauche<305) then
                begin
                     effsouris;
                     setfillstyle(1,15);
                     fillellipse(400,300+20*(deroption-1),7,7);
                     setcolor(0);
                     circle(400,300,7);
                     setfillstyle(1,0);
                     fillellipse(400,300,4,4);
                     while (boutongauche) and (mousex>395) and (mousex<405) and (mousey>295) and (mousey<305) do;
                     affsouris;
                     deroption:=1;
                     sort:=true;
                end;
                if (yclickgauche>315) and (yclickgauche<325) then
                begin
                     effsouris;
                     setfillstyle(1,15);
                     fillellipse(400,300+20*(deroption-1),7,7);
                     setcolor(0);
                     circle(400,320,7);
                     setfillstyle(1,0);
                     fillellipse(400,320,4,4);
                     while (boutongauche) and (mousex>395) and (mousex<405) and (mousey>315) and (mousey<325) do;
                     affsouris;
                     deroption:=2;
                     sort:=true;
                end;
                if (yclickgauche>335) and (yclickgauche<345) then
                begin
                     effsouris;
                     setfillstyle(1,15);
                     fillellipse(400,300+20*(deroption-1),7,7);
                     setcolor(0);
                     circle(400,340,7);
                     setfillstyle(1,0);
                     fillellipse(400,340,4,4);
                     while (boutongauche) and (mousex>395) and (mousex<405) and (mousey>335) and (mousey<345) do;
                     affsouris;
                     deroption:=3;
                     sort:=true;
                end;
                if (yclickgauche>355) and (yclickgauche<365) then
                begin
                     effsouris;
                     setfillstyle(1,15);
                     fillellipse(400,300+20*(deroption-1),7,7);
                     setcolor(0);
                     circle(400,360,7);
                     setfillstyle(1,0);
                     fillellipse(400,360,4,4);
                     while (boutongauche) and (mousex>395) and (mousex<405) and (mousey>355) and (mousey<365) do;
                     affsouris;
                     deroption:=4;
                     sort:=true;
                end;
           end;
     until sort;

     effsouris;
     putimage(210,180,img^,copyput);
     freemem(img,size);
     affsouris;

     saisietrou(deroption);

     for j:=1 to valr-1 do afftrou(colonne,ligne+j*16,deroption);
end;

{==saisie d'un circuit DIL vertical==}
procedure SaisieDILV;
var c1,c2:char;
    valr,valrep:byte;
    code:integer;
    j,deroption:byte;
    sort:boolean;

begin
     effsouris;
     size:=imagesize(210,180,440,400);
     getmem(img,size);
     getimage(210,180,440,400,img^);

     setfillstyle(1,7);
     bar(210,180,440,400);
     contour(210,180,230,220,3,false);
     contour(220,190,210,200,2,true);
     contour(228,230,194,154,0,false);
     contour(228,197,194,28,1,true);
     SETFILLSTYLE(1,3);
     bar(230,199,420,223);
     setcolor(0);
     settextjustify(1,1);
     settextstyle(1,0,2);
     outtextxy(325,207,'Propriet?s "DIL"');
     settextstyle(0,0,0);
     outtextxy(306,250,'Nombre de broches:');
     outtextxy(306,275,'Largeur (x 2,54mm):');
     setfillstyle(1,15);
     bar(385,240,415,260);
     contour(385,240,30,20,1,true);
     bar(385,265,415,285);
     contour(385,265,30,20,1,true);
     outtextxy(275,300,'Diametre :');
     outtextxy(350,300,'0,8 mm');
     outtextxy(358,320,'1 mm');
     outtextxy(350,340,'1,2 mm');
     outtextxy(350,360,'1,5 mm');

     setfillstyle(1,15);
     fillellipse(400,300,7,7);
     fillellipse(400,320,7,7);
     fillellipse(400,340,7,7);
     fillellipse(400,360,7,7);

     setcolor(0);
     circle(400,300,7);
     circle(400,320,7);
     circle(400,340,7);
     circle(400,360,7);

     setfillstyle(1,0);
     fillellipse(400,300,4,4);
     repeat
           setfillstyle(1,15);
           bar(385,240,415,260);
           contour(385,240,30,20,1,true);
           repeat
                 while not keypressed do
                 begin
                      setcolor(0);
                      line(390,245,390,255);
                      delay(100);
                      setcolor(15);
                      line(390,245,390,255);
                      delay(100);
                 end;
                 c1:=readkey;
           until (ord(c1)>47) and (ord(c1)<58);
           setcolor(0);
           outtextxy(392,251,c1);

           repeat
                 while not keypressed do
                 begin
                      setcolor(0);
                      line(400,245,400,255);
                      delay(100);
                      setcolor(15);
                      line(400,245,400,255);
                      delay(100);
                 end;
                 c2:=readkey;
           until ((ord(c2)>47) and (ord(c2)<58)) or (ord(c2)=13);
           if ord(c2)=13 then
           begin
                setcolor(15);
                outtextxy(392,251,c1);
                setcolor(0);
                outtextxy(402,251,c1);
                val(concat('0',c1),valr,code);
           end
           else
           begin
                setcolor(0);
                outtextxy(402,251,c2);
                val(concat(c1,c2),valr,code);
           end;
     until (valr<41) and (valr>0);

     repeat
           setfillstyle(1,15);
           bar(385,265,415,285);
           contour(385,265,30,20,1,true);
           repeat
                 while not keypressed do
                 begin
                      setcolor(0);
                      line(390,270,390,280);
                      delay(100);
                      setcolor(15);
                      line(390,270,390,280);
                      delay(100);
                 end;
                 c1:=readkey;
           until (ord(c1)>47) and (ord(c1)<58);
           setcolor(0);
           outtextxy(392,276,c1);

           repeat
                 while not keypressed do
                 begin
                      setcolor(0);
                      line(400,270,400,280);
                      delay(100);
                      setcolor(15);
                      line(400,270,400,280);
                      delay(100);
                 end;
                 c2:=readkey;
           until ((ord(c2)>47) and (ord(c2)<58)) or (ord(c2)=13);
           if ord(c2)=13 then
           begin
                setcolor(15);
                outtextxy(392,276,c1);
                setcolor(0);
                outtextxy(402,276,c1);
                val(concat('0',c1),valrep,code);
           end
           else
           begin
                setcolor(0);
                outtextxy(402,276,c2);
                val(concat(c1,c2),valrep,code);
           end;
     until (valrep<9) and (valrep>0);

     affsouris;
     fenetre_souris(210,180,440,400);
     place_souris(325,290);
     deroption:=1;
     repeat
           sort:=false;
           if (xclickgauche>395) and (xclickgauche<405) then
           begin
                if (yclickgauche>295) and (yclickgauche<305) then
                begin
                     effsouris;
                     setfillstyle(1,15);
                     fillellipse(400,300+20*(deroption-1),7,7);
                     setcolor(0);
                     circle(400,300,7);
                     setfillstyle(1,0);
                     fillellipse(400,300,4,4);
                     while (boutongauche) and (mousex>395) and (mousex<405) and (mousey>295) and (mousey<305) do;
                     affsouris;
                     deroption:=1;
                     sort:=true;
                end;
                if (yclickgauche>315) and (yclickgauche<325) then
                begin
                     effsouris;
                     setfillstyle(1,15);
                     fillellipse(400,300+20*(deroption-1),7,7);
                     setcolor(0);
                     circle(400,320,7);
                     setfillstyle(1,0);
                     fillellipse(400,320,4,4);
                     while (boutongauche) and (mousex>395) and (mousex<405) and (mousey>315) and (mousey<325) do;
                     affsouris;
                     deroption:=2;
                     sort:=true;
                end;
                if (yclickgauche>335) and (yclickgauche<345) then
                begin
                     effsouris;
                     setfillstyle(1,15);
                     fillellipse(400,300+20*(deroption-1),7,7);
                     setcolor(0);
                     circle(400,340,7);
                     setfillstyle(1,0);
                     fillellipse(400,340,4,4);
                     while (boutongauche) and (mousex>395) and (mousex<405) and (mousey>335) and (mousey<345) do;
                     affsouris;
                     deroption:=3;
                     sort:=true;
                end;
                if (yclickgauche>355) and (yclickgauche<365) then
                begin
                     effsouris;
                     setfillstyle(1,15);
                     fillellipse(400,300+20*(deroption-1),7,7);
                     setcolor(0);
                     circle(400,360,7);
                     setfillstyle(1,0);
                     fillellipse(400,360,4,4);
                     while (boutongauche) and (mousex>395) and (mousex<405) and (mousey>355) and (mousey<365) do;
                     affsouris;
                     deroption:=4;
                     sort:=true;
                end;
           end;
     until sort;

     effsouris;
     putimage(210,180,img^,copyput);
     freemem(img,size);
     affsouris;

     saisietrou(deroption);

     for j:=1 to (valr div 2)-1 do afftrou(colonne,ligne+j*16,deroption);
     for j:=0 to (valr div 2)-1 do afftrou(colonne+valrep*16,ligne+j*16,deroption);
end;

{==saisie d'un circuit DIL horizental==}
procedure SaisieDILH;
var c1,c2:char;
    valr,valrep:byte;
    code:integer;
    j,deroption:byte;
    sort:boolean;

begin
     effsouris;
     size:=imagesize(210,180,440,400);
     getmem(img,size);
     getimage(210,180,440,400,img^);

     setfillstyle(1,7);
     bar(210,180,440,400);
     contour(210,180,230,220,3,false);
     contour(220,190,210,200,2,true);
     contour(228,230,194,154,0,false);
     contour(228,197,194,28,1,true);
     SETFILLSTYLE(1,3);
     bar(230,199,420,223);
     setcolor(0);
     settextjustify(1,1);
     settextstyle(1,0,2);
     outtextxy(325,207,'Propriet?s "DIL"');
     settextstyle(0,0,0);
     outtextxy(306,250,'Nombre de broches:');
     outtextxy(306,275,'Largeur (x 2,54mm):');
     setfillstyle(1,15);
     bar(385,240,415,260);
     contour(385,240,30,20,1,true);
     bar(385,265,415,285);
     contour(385,265,30,20,1,true);
     outtextxy(275,300,'Diametre :');
     outtextxy(350,300,'0,8 mm');
     outtextxy(358,320,'1 mm');
     outtextxy(350,340,'1,2 mm');
     outtextxy(350,360,'1,5 mm');

     setfillstyle(1,15);
     fillellipse(400,300,7,7);
     fillellipse(400,320,7,7);
     fillellipse(400,340,7,7);
     fillellipse(400,360,7,7);

     setcolor(0);
     circle(400,300,7);
     circle(400,320,7);
     circle(400,340,7);
     circle(400,360,7);

     setfillstyle(1,0);
     fillellipse(400,300,4,4);
     repeat
           setfillstyle(1,15);
           bar(385,240,415,260);
           contour(385,240,30,20,1,true);
           repeat
                 while not keypressed do
                 begin
                      setcolor(0);
                      line(390,245,390,255);
                      delay(100);
                      setcolor(15);
                      line(390,245,390,255);
                      delay(100);
                 end;
                 c1:=readkey;
           until (ord(c1)>47) and (ord(c1)<58);
           setcolor(0);
           outtextxy(392,251,c1);

           repeat
                 while not keypressed do
                 begin
                      setcolor(0);
                      line(400,245,400,255);
                      delay(100);
                      setcolor(15);
                      line(400,245,400,255);
                      delay(100);
                 end;
                 c2:=readkey;
           until ((ord(c2)>47) and (ord(c2)<58)) or (ord(c2)=13);
           if ord(c2)=13 then
           begin
                setcolor(15);
                outtextxy(392,251,c1);
                setcolor(0);
                outtextxy(402,251,c1);
                val(concat('0',c1),valr,code);
           end
           else
           begin
                setcolor(0);
                outtextxy(402,251,c2);
                val(concat(c1,c2),valr,code);
           end;
     until (valr<41) and (valr>0);

     repeat
           setfillstyle(1,15);
           bar(385,265,415,285);
           contour(385,265,30,20,1,true);
           repeat
                 while not keypressed do
                 begin
                      setcolor(0);
                      line(390,270,390,280);
                      delay(100);
                      setcolor(15);
                      line(390,270,390,280);
                      delay(100);
                 end;
                 c1:=readkey;
           until (ord(c1)>47) and (ord(c1)<58);
           setcolor(0);
           outtextxy(392,276,c1);

           repeat
                 while not keypressed do
                 begin
                      setcolor(0);
                      line(400,270,400,280);
                      delay(100);
                      setcolor(15);
                      line(400,270,400,280);
                      delay(100);
                 end;
                 c2:=readkey;
           until ((ord(c2)>47) and (ord(c2)<58)) or (ord(c2)=13);
           if ord(c2)=13 then
           begin
                setcolor(15);
                outtextxy(392,276,c1);
                setcolor(0);
                outtextxy(402,276,c1);
                val(concat('0',c1),valrep,code);
           end
           else
           begin
                setcolor(0);
                outtextxy(402,276,c2);
                val(concat(c1,c2),valrep,code);
           end;
     until (valrep<9) and (valrep>0);

     affsouris;
     fenetre_souris(210,180,440,400);
     place_souris(325,290);
     deroption:=1;
     repeat
           sort:=false;
           if (xclickgauche>395) and (xclickgauche<405) then
           begin
                if (yclickgauche>295) and (yclickgauche<305) then
                begin
                     effsouris;
                     setfillstyle(1,15);
                     fillellipse(400,300+20*(deroption-1),7,7);
                     setcolor(0);
                     circle(400,300,7);
                     setfillstyle(1,0);
                     fillellipse(400,300,4,4);
                     while (boutongauche) and (mousex>395) and (mousex<405) and (mousey>295) and (mousey<305) do;
                     affsouris;
                     deroption:=1;
                     sort:=true;
                end;
                if (yclickgauche>315) and (yclickgauche<325) then
                begin
                     effsouris;
                     setfillstyle(1,15);
                     fillellipse(400,300+20*(deroption-1),7,7);
                     setcolor(0);
                     circle(400,320,7);
                     setfillstyle(1,0);
                     fillellipse(400,320,4,4);
                     while (boutongauche) and (mousex>395) and (mousex<405) and (mousey>315) and (mousey<325) do;
                     affsouris;
                     deroption:=2;
                     sort:=true;
                end;
                if (yclickgauche>335) and (yclickgauche<345) then
                begin
                     effsouris;
                     setfillstyle(1,15);
                     fillellipse(400,300+20*(deroption-1),7,7);
                     setcolor(0);
                     circle(400,340,7);
                     setfillstyle(1,0);
                     fillellipse(400,340,4,4);
                     while (boutongauche) and (mousex>395) and (mousex<405) and (mousey>335) and (mousey<345) do;
                     affsouris;
                     deroption:=3;
                     sort:=true;
                end;
                if (yclickgauche>355) and (yclickgauche<365) then
                begin
                     effsouris;
                     setfillstyle(1,15);
                     fillellipse(400,300+20*(deroption-1),7,7);
                     setcolor(0);
                     circle(400,360,7);
                     setfillstyle(1,0);
                     fillellipse(400,360,4,4);
                     while (boutongauche) and (mousex>395) and (mousex<405) and (mousey>355) and (mousey<365) do;
                     affsouris;
                     deroption:=4;
                     sort:=true;
                end;
           end;
     until sort;

     effsouris;
     putimage(210,180,img^,copyput);
     freemem(img,size);
     affsouris;

     saisietrou(deroption);

     for j:=1 to (valr div 2)-1 do afftrou(colonne+j*16,ligne,deroption);
     for j:=0 to (valr div 2)-1 do afftrou(colonne+j*16,ligne+valrep*16,deroption);
end;

procedure SaisieDipH;
var c1,c2:char;
    valr,valrep:byte;
    code:integer;
    j,deroption:byte;
    sort:boolean;

begin
     effsouris;
     size:=imagesize(210,180,440,400);
     getmem(img,size);
     getimage(210,180,440,400,img^);

     setfillstyle(1,7);
     bar(210,180,440,400);
     contour(210,180,230,220,3,false);
     contour(220,190,210,200,2,true);
     contour(228,230,194,154,0,false);
     contour(228,197,194,28,1,true);
     SETFILLSTYLE(1,3);
     bar(230,199,420,223);
     setcolor(0);
     settextjustify(1,1);
     settextstyle(1,0,2);
     outtextxy(320,207,'Propriet?s dipole');
     settextstyle(0,0,0);
     outtextxy(306,275,'Largeur (x 2,54mm):');
     setfillstyle(1,15);
     bar(385,265,415,285);
     contour(385,265,30,20,1,true);

     outtextxy(275,300,'Diametre :');
     outtextxy(350,300,'0,8 mm');
     outtextxy(358,320,'1 mm');
     outtextxy(350,340,'1,2 mm');
     outtextxy(350,360,'1,5 mm');

     setfillstyle(1,15);
     fillellipse(400,300,7,7);
     fillellipse(400,320,7,7);
     fillellipse(400,340,7,7);
     fillellipse(400,360,7,7);

     setcolor(0);
     circle(400,300,7);
     circle(400,320,7);
     circle(400,340,7);
     circle(400,360,7);

     setfillstyle(1,0);
     fillellipse(400,300,4,4);

     repeat
           setfillstyle(1,15);
           bar(385,265,415,285);
           contour(385,265,30,20,1,true);
           repeat
                 while not keypressed do
                 begin
                      setcolor(0);
                      line(390,270,390,280);
                      delay(100);
                      setcolor(15);
                      line(390,270,390,280);
                      delay(100);
                 end;
                 c1:=readkey;
           until (ord(c1)>47) and (ord(c1)<58);
           setcolor(0);
           outtextxy(392,276,c1);

           repeat
                 while not keypressed do
                 begin
                      setcolor(0);
                      line(400,270,400,280);
                      delay(100);
                      setcolor(15);
                      line(400,270,400,280);
                      delay(100);
                 end;
                 c2:=readkey;
           until ((ord(c2)>47) and (ord(c2)<58)) or (ord(c2)=13);
           if ord(c2)=13 then
           begin
                setcolor(15);
                outtextxy(392,276,c1);
                setcolor(0);
                outtextxy(402,276,c1);
                val(concat('0',c1),valrep,code);
           end
           else
           begin
                setcolor(0);
                outtextxy(402,276,c2);
                val(concat(c1,c2),valrep,code);
           end;
     until (valrep<25) and (valrep>0);

     affsouris;
     fenetre_souris(210,180,440,400);
     place_souris(325,290);
     deroption:=1;
     repeat
           sort:=false;
           if (xclickgauche>395) and (xclickgauche<405) then
           begin
                if (yclickgauche>295) and (yclickgauche<305) then
                begin
                     effsouris;
                     setfillstyle(1,15);
                     fillellipse(400,300+20*(deroption-1),7,7);
                     setcolor(0);
                     circle(400,300,7);
                     setfillstyle(1,0);
                     fillellipse(400,300,4,4);
                     while (boutongauche) and (mousex>395) and (mousex<405) and (mousey>295) and (mousey<305) do;
                     affsouris;
                     deroption:=1;
                     sort:=true;
                end;
                if (yclickgauche>315) and (yclickgauche<325) then
                begin
                     effsouris;
                     setfillstyle(1,15);
                     fillellipse(400,300+20*(deroption-1),7,7);
                     setcolor(0);
                     circle(400,320,7);
                     setfillstyle(1,0);
                     fillellipse(400,320,4,4);
                     while (boutongauche) and (mousex>395) and (mousex<405) and (mousey>315) and (mousey<325) do;
                     affsouris;
                     deroption:=2;
                     sort:=true;
                end;
                if (yclickgauche>335) and (yclickgauche<345) then
                begin
                     effsouris;
                     setfillstyle(1,15);
                     fillellipse(400,300+20*(deroption-1),7,7);
                     setcolor(0);
                     circle(400,340,7);
                     setfillstyle(1,0);
                     fillellipse(400,340,4,4);
                     while (boutongauche) and (mousex>395) and (mousex<405) and (mousey>335) and (mousey<345) do;
                     affsouris;
                     deroption:=3;
                     sort:=true;
                end;
                if (yclickgauche>355) and (yclickgauche<365) then
                begin
                     effsouris;
                     setfillstyle(1,15);
                     fillellipse(400,300+20*(deroption-1),7,7);
                     setcolor(0);
                     circle(400,360,7);
                     setfillstyle(1,0);
                     fillellipse(400,360,4,4);
                     while (boutongauche) and (mousex>395) and (mousex<405) and (mousey>355) and (mousey<365) do;
                     affsouris;
                     deroption:=4;
                     sort:=true;
                end;
           end;
     until sort;

     effsouris;
     putimage(210,180,img^,copyput);
     freemem(img,size);
     affsouris;

     saisietrou(deroption);

     afftrou(colonne+valrep*16,ligne,deroption);
end;

procedure SaisieDipV;
var c1,c2:char;
    valr,valrep:byte;
    code:integer;
    j,deroption:byte;
    sort:boolean;

begin
     effsouris;
     size:=imagesize(210,180,440,400);
     getmem(img,size);
     getimage(210,180,440,400,img^);

     setfillstyle(1,7);
     bar(210,180,440,400);
     contour(210,180,230,220,3,false);
     contour(220,190,210,200,2,true);
     contour(228,230,194,154,0,false);
     contour(228,197,194,28,1,true);
     SETFILLSTYLE(1,3);
     bar(230,199,420,223);
     setcolor(0);
     settextjustify(1,1);
     settextstyle(1,0,2);
     outtextxy(320,207,'Propriet?s dipole');
     settextstyle(0,0,0);
     outtextxy(306,275,'Largeur (x 2,54mm):');
     setfillstyle(1,15);
     bar(385,265,415,285);
     contour(385,265,30,20,1,true);

     outtextxy(275,300,'Diametre :');
     outtextxy(350,300,'0,8 mm');
     outtextxy(358,320,'1 mm');
     outtextxy(350,340,'1,2 mm');
     outtextxy(350,360,'1,5 mm');

     setfillstyle(1,15);
     fillellipse(400,300,7,7);
     fillellipse(400,320,7,7);
     fillellipse(400,340,7,7);
     fillellipse(400,360,7,7);

     setcolor(0);
     circle(400,300,7);
     circle(400,320,7);
     circle(400,340,7);
     circle(400,360,7);

     setfillstyle(1,0);
     fillellipse(400,300,4,4);

     repeat
           setfillstyle(1,15);
           bar(385,265,415,285);
           contour(385,265,30,20,1,true);
           repeat
                 while not keypressed do
                 begin
                      setcolor(0);
                      line(390,270,390,280);
                      delay(100);
                      setcolor(15);
                      line(390,270,390,280);
                      delay(100);
                 end;
                 c1:=readkey;
           until (ord(c1)>47) and (ord(c1)<58);
           setcolor(0);
           outtextxy(392,276,c1);

           repeat
                 while not keypressed do
                 begin
                      setcolor(0);
                      line(400,270,400,280);
                      delay(100);
                      setcolor(15);
                      line(400,270,400,280);
                      delay(100);
                 end;
                 c2:=readkey;
           until ((ord(c2)>47) and (ord(c2)<58)) or (ord(c2)=13);
           if ord(c2)=13 then
           begin
                setcolor(15);
                outtextxy(392,276,c1);
                setcolor(0);
                outtextxy(402,276,c1);
                val(concat('0',c1),valrep,code);
           end
           else
           begin
                setcolor(0);
                outtextxy(402,276,c2);
                val(concat(c1,c2),valrep,code);
           end;
     until (valrep<25) and (valrep>0);

     affsouris;
     fenetre_souris(210,180,440,400);
     place_souris(325,290);
     deroption:=1;
     repeat
           sort:=false;
           if (xclickgauche>395) and (xclickgauche<405) then
           begin
                if (yclickgauche>295) and (yclickgauche<305) then
                begin
                     effsouris;
                     setfillstyle(1,15);
                     fillellipse(400,300+20*(deroption-1),7,7);
                     setcolor(0);
                     circle(400,300,7);
                     setfillstyle(1,0);
                     fillellipse(400,300,4,4);
                     while (boutongauche) and (mousex>395) and (mousex<405) and (mousey>295) and (mousey<305) do;
                     affsouris;
                     deroption:=1;
                     sort:=true;
                end;
                if (yclickgauche>315) and (yclickgauche<325) then
                begin
                     effsouris;
                     setfillstyle(1,15);
                     fillellipse(400,300+20*(deroption-1),7,7);
                     setcolor(0);
                     circle(400,320,7);
                     setfillstyle(1,0);
                     fillellipse(400,320,4,4);
                     while (boutongauche) and (mousex>395) and (mousex<405) and (mousey>315) and (mousey<325) do;
                     affsouris;
                     deroption:=2;
                     sort:=true;
                end;
                if (yclickgauche>335) and (yclickgauche<345) then
                begin
                     effsouris;
                     setfillstyle(1,15);
                     fillellipse(400,300+20*(deroption-1),7,7);
                     setcolor(0);
                     circle(400,340,7);
                     setfillstyle(1,0);
                     fillellipse(400,340,4,4);
                     while (boutongauche) and (mousex>395) and (mousex<405) and (mousey>335) and (mousey<345) do;
                     affsouris;
                     deroption:=3;
                     sort:=true;
                end;
                if (yclickgauche>355) and (yclickgauche<365) then
                begin
                     effsouris;
                     setfillstyle(1,15);
                     fillellipse(400,300+20*(deroption-1),7,7);
                     setcolor(0);
                     circle(400,360,7);
                     setfillstyle(1,0);
                     fillellipse(400,360,4,4);
                     while (boutongauche) and (mousex>395) and (mousex<405) and (mousey>355) and (mousey<365) do;
                     affsouris;
                     deroption:=4;
                     sort:=true;
                end;
           end;
     until sort;

     effsouris;
     putimage(210,180,img^,copyput);
     freemem(img,size);
     affsouris;

     saisietrou(deroption);

     afftrou(colonne,ligne+valrep*16,deroption);
end;

procedure SaisieTran1;
begin
     saisietrou(2);
     afftrou(colonne,ligne+16,2);
     afftrou(colonne+16,ligne+16,2);
end;

procedure SaisieTran2;
begin
     saisietrou(2);
     afftrou(colonne+16,ligne,2);
     afftrou(colonne+16,ligne-16,2);
end;
procedure SaisieTran3;
begin
     saisietrou(2);
     afftrou(colonne+16,ligne,2);
     afftrou(colonne+16,ligne+16,2);
end;

procedure SaisieTran4;
begin
     saisietrou(2);
     afftrou(colonne+16,ligne,2);
     afftrou(colonne,ligne+16,2);
end;

procedure nouveau;
begin
     effsouris;
     i:=0;
     affeuille;
     AffAxeX(DepAscHor);
     AffAxeY(DepAscVer);
     affsouris;
end;



{===test d'existance d'un fichier===}
function exist(nomfichier:string12):boolean;
begin
     {$i-}
     assign(fich_plan,concat('c:\perceuse\plan\',nomfichier));
     reset(fich_plan);
     {$i+}
     if ioresult=2 then exist:=false else exist:=true;
end;


{===sauvegarde du plan de percage dans un fichier===}
procedure enregistrer;
var j:word;
    c1,c2,c3,c4,c5,c6,c7,c8,c9:char;
    code:integer;
    sort:boolean;

begin
     if i>0 then
     begin
          sort:=false;
          effsouris;
          size:=imagesize(210,180,440,400);
          getmem(img,size);
          getimage(210,180,440,400,img^);

          setfillstyle(1,7);
          bar(210,180,440,400);
          contour(210,180,230,220,3,false);
          contour(220,190,210,200,2,true);
          contour(228,230,194,154,0,false);
          contour(228,197,194,28,1,true);
          SETFILLSTYLE(1,3);
          bar(230,199,420,223);
          setcolor(0);
          settextjustify(1,1);
          settextstyle(1,0,2);
          outtextxy(325,207,'Enregistrement');
          settextstyle(0,0,0);
          outtextxy(320,285,'Nom du fichier :');
          setfillstyle(1,15);


          repeat
                setfillstyle(1,15);
                bar(245,320,405,340);
                contour(245,320,160,20,1,true);
                repeat
                      while not keypressed do
                      begin
                           setcolor(0);
                           line(250,325,250,335);
                           delay(100);
                           setcolor(15);
                           line(250,325,250,335);
                           delay(100);
                      end;
                      c1:=readkey;
                until ((ord(c1)>33) and (ord(c1)<126)) or (ord(c1)=13);
                setcolor(0);
                outtextxy(255,330,c1);
                if ord(c1)<>13 then
                begin
                     repeat
                           while not keypressed do
                           begin
                                setcolor(0);
                                line(260,325,260,335);
                                delay(100);
                                setcolor(15);
                                line(260,325,260,335);
                                delay(100);
                           end;
                           c2:=readkey;
                     until ((ord(c2)>33) and (ord(c2)<126)) or (ord(c2)=13);
                     setcolor(0);
                     outtextxy(265,330,c2);
                     if ord(c2)<>13 then
                     begin
                          repeat
                                while not keypressed do
                                begin
                                     setcolor(0);
                                     line(270,325,270,335);
                                     delay(100);
                                     setcolor(15);
                                     line(270,325,270,335);
                                     delay(100);
                                end;
                                c3:=readkey;
                          until ((ord(c3)>33) and (ord(c3)<126)) or (ord(c3)=13);
                          setcolor(0);
                          outtextxy(275,330,c3);

                          if ord(c3)<>13 then
                          begin
                               repeat
                                     while not keypressed do
                                     begin
                                          setcolor(0);
                                          line(280,325,280,335);
                                          delay(100);
                                          setcolor(15);
                                          line(280,325,280,335);
                                          delay(100);
                                     end;
                                     c4:=readkey;
                               until ((ord(c4)>33) and (ord(c4)<126)) or (ord(c4)=13);

                               setcolor(0);
                               outtextxy(285,330,c4);

                               if ord(c4)<>13 then
                               begin
                                    repeat
                                    while not keypressed do
                                    begin
                                         setcolor(0);
                                         line(290,325,290,335);
                                         delay(100);
                                         setcolor(15);
                                         line(290,325,290,335);
                                         delay(100);
                                    end;
                                    c5:=readkey;
                               until ((ord(c5)>33) and (ord(c5)<126)) or (ord(c5)=13);
                               setcolor(0);
                               outtextxy(295,330,c5);

                               if ord(c5)<>13 then
                               begin
                                    repeat
                                          while not keypressed do
                                          begin
                                               setcolor(0);
                                               line(300,325,300,335);
                                               delay(100);
                                               setcolor(15);
                                               line(300,325,300,335);
                                               delay(100);
                                          end;
                                          c6:=readkey;
                                    until ((ord(c6)>33) and (ord(c6)<126)) or (ord(c6)=13);
                                    setcolor(0);
                                    outtextxy(305,330,c6);

                                    if ord(c6)<>13 then
                                    begin
                                         repeat
                                               while not keypressed do
                                               begin
                                                    setcolor(0);
                                                    line(310,325,310,335);
                                                    delay(100);
                                                    setcolor(15);
                                                    line(310,325,310,335);
                                                    delay(100);
                                               end;
                                               c7:=readkey;
                                         until ((ord(c7)>33) and (ord(c7)<126)) or (ord(c7)=13);
                                         setcolor(0);
                                         outtextxy(315,330,c7);
                                         if ord(c7)<>13 then
                                         begin
                                              repeat
                                                    while not keypressed do
                                                    begin
                                                         setcolor(0);
                                                         line(320,325,320,335);
                                                         delay(100);
                                                         setcolor(15);
                                                         line(320,325,320,335);
                                                         delay(100);
                                                    end;
                                                    c8:=readkey;
                                              until ((ord(c8)>33) and (ord(c8)<126)) or (ord(c8)=13);
                                              setcolor(0);
                                              outtextxy(325,330,c8);

                                              if ord(c8)<>13 then
                                              begin
                                                   nomfichier:=concat(c1,c2,c3,c4,c5,c6,c7,c8,'.pln');
                                                   setfillstyle(1,15);
                                                   bar(245,320,405,340);
                                                   contour(245,320,160,20,1,true);
                                                   setcolor(0);
                                                   outtextxy(320,330,nomfichier);
                                                   repeat
                                                         c9:=readkey;
                                                   until (ord(c9)=13) or (ord(c9)=27);
                                                   if ord(c9)=13 then sort:=true;

                                              end
                                              else
                                              begin
                                                   if ord(c8)=13 then nomfichier:=concat(c1,c2,c3,c4,c5,c6,c7,'.pln');
                                              end;
                                         end
                                         else
                                         begin
                                              nomfichier:=concat(c1,c2,c3,c4,c5,c6,'.pln');
                                              sort:=true;
                                         end;
                                    end
                                    else
                                    begin
                                         nomfichier:=concat(c1,c2,c3,c4,c5,'.pln');
                                         sort:=true;
                                    end;
                               end
                               else
                               begin
                                    nomfichier:=concat(c1,c2,c3,c4,'.pln');
                                    sort:=true;
                               end;
                          end
                          else
                          begin
                               nomfichier:=concat(c1,c2,c3,'.pln');
                               sort:=true;
                          end;
                     end
                     else
                     begin
                          nomfichier:=concat(c1,c2,'.pln');
                          sort:=true;
                     end;
                end
                else
                begin
                    nomfichier:=concat(c1,'.pln');
                    sort:=true;
                end;

           end;
     until sort;
     bar(245,320,405,340);
     contour(245,320,160,20,1,true);
     setcolor(0);
     outtextxy(320,330,nomfichier);
     delay(100);

     affsouris;

     effsouris;
     putimage(210,180,img^,copyput);
     freemem(img,size);
     affsouris;
          assign(fich_plan,concat('c:\perceuse\plan\',nomfichier));
          rewrite(fich_plan);
          for j:=1 to i do
          begin
               enrplan.xtrou:=plan[j,1];
               Enrplan.ytrou:=plan[j,2];
               EnrPlan.diametre:=plan[j,3];
               write(fich_plan,EnrPlan);
          end;
          close(fich_plan);
     end;
     {else AffMess('Aucun trou n'est saisi..');}

end;

{===chargement d'un plan de percage===}
procedure charger;
var j:word;
    c1,c2,c3,c4,c5,c6,c7,c8,c9:char;
    code:integer;
    sort:boolean;
    sortir1,sortir2,sortir:boolean;
begin
     repeat
          sort:=false;
          effsouris;
          size:=imagesize(210,180,440,400);
          getmem(img,size);
          getimage(210,180,440,400,img^);

          setfillstyle(1,7);
          bar(210,180,440,400);
          contour(210,180,230,220,3,false);
          contour(220,190,210,200,2,true);
          contour(228,230,194,154,0,false);
          contour(228,197,194,28,1,true);
          SETFILLSTYLE(1,3);
          bar(230,199,420,223);
          setcolor(0);
          settextjustify(1,1);
          settextstyle(1,0,2);
          outtextxy(325,207,'Ouverture');
          settextstyle(0,0,0);
          outtextxy(320,285,'Nom du fichier :');
          setfillstyle(1,15);

          repeat
                setfillstyle(1,15);
                bar(245,320,405,340);
                contour(245,320,160,20,1,true);
                repeat
                      while not keypressed do
                      begin
                           setcolor(0);
                           line(250,325,250,335);
                           delay(100);
                           setcolor(15);
                           line(250,325,250,335);
                           delay(100);
                      end;
                      c1:=readkey;
                until ((ord(c1)>33) and (ord(c1)<126)) or (ord(c1)=13);
                setcolor(0);
                outtextxy(255,330,c1);
                if ord(c1)<>13 then
                begin
                     repeat
                           while not keypressed do
                           begin
                                setcolor(0);
                                line(260,325,260,335);
                                delay(100);
                                setcolor(15);
                                line(260,325,260,335);
                                delay(100);
                           end;
                           c2:=readkey;
                     until ((ord(c2)>33) and (ord(c2)<126)) or (ord(c2)=13);
                     setcolor(0);
                     outtextxy(265,330,c2);
                     if ord(c2)<>13 then
                     begin
                          repeat
                                while not keypressed do
                                begin
                                     setcolor(0);
                                     line(270,325,270,335);
                                     delay(100);
                                     setcolor(15);
                                     line(270,325,270,335);
                                     delay(100);
                                end;
                                c3:=readkey;
                          until ((ord(c3)>33) and (ord(c3)<126)) or (ord(c3)=13);
                          setcolor(0);
                          outtextxy(275,330,c3);

                          if ord(c3)<>13 then
                          begin
                               repeat
                                     while not keypressed do
                                     begin
                                          setcolor(0);
                                          line(280,325,280,335);
                                          delay(100);
                                          setcolor(15);
                                          line(280,325,280,335);
                                          delay(100);
                                     end;
                                     c4:=readkey;
                               until ((ord(c4)>33) and (ord(c4)<126)) or (ord(c4)=13);

                               setcolor(0);
                               outtextxy(285,330,c4);

                               if ord(c4)<>13 then
                               begin
                                    repeat
                                    while not keypressed do
                                    begin
                                         setcolor(0);
                                         line(290,325,290,335);
                                         delay(100);
                                         setcolor(15);
                                         line(290,325,290,335);
                                         delay(100);
                                    end;
                                    c5:=readkey;
                               until ((ord(c5)>33) and (ord(c5)<126)) or (ord(c5)=13);
                               setcolor(0);
                               outtextxy(295,330,c5);

                               if ord(c5)<>13 then
                               begin
                                    repeat
                                          while not keypressed do
                                          begin
                                               setcolor(0);
                                               line(300,325,300,335);
                                               delay(100);
                                               setcolor(15);
                                               line(300,325,300,335);
                                               delay(100);
                                          end;
                                          c6:=readkey;
                                    until ((ord(c6)>33) and (ord(c6)<126)) or (ord(c6)=13);
                                    setcolor(0);
                                    outtextxy(305,330,c6);

                                    if ord(c6)<>13 then
                                    begin
                                         repeat
                                               while not keypressed do
                                               begin
                                                    setcolor(0);
                                                    line(310,325,310,335);
                                                    delay(100);
                                                    setcolor(15);
                                                    line(310,325,310,335);
                                                    delay(100);
                                               end;
                                               c7:=readkey;
                                         until ((ord(c7)>33) and (ord(c7)<126)) or (ord(c7)=13);
                                         setcolor(0);
                                         outtextxy(315,330,c7);
                                         if ord(c7)<>13 then
                                         begin
                                              repeat
                                                    while not keypressed do
                                                    begin
                                                         setcolor(0);
                                                         line(320,325,320,335);
                                                         delay(100);
                                                         setcolor(15);
                                                         line(320,325,320,335);
                                                         delay(100);
                                                    end;
                                                    c8:=readkey;
                                              until ((ord(c8)>33) and (ord(c8)<126)) or (ord(c8)=13) or (ord(c1)=27);
                                              setcolor(0);
                                              outtextxy(325,330,c8);

                                              if ord(c8)<>13 then
                                              begin
                                                   nomfichier:=concat(c1,c2,c3,c4,c5,c6,c7,c8,'.pln');
                                                   setfillstyle(1,15);
                                                   bar(245,320,405,340);
                                                   contour(245,320,160,20,1,true);
                                                   setcolor(0);
                                                   outtextxy(320,330,nomfichier);
                                                   repeat
                                                         c9:=readkey;
                                                   until (ord(c9)=13) or (ord(c9)=27);
                                                   if ord(c9)=13 then sort:=true;

                                              end
                                              else
                                              begin
                                                   if ord(c8)=13 then nomfichier:=concat(c1,c2,c3,c4,c5,c6,c7,'.pln');
                                              end;
                                         end
                                         else
                                         begin
                                              nomfichier:=concat(c1,c2,c3,c4,c5,c6,'.pln');
                                              sort:=true;
                                         end;
                                    end
                                    else
                                    begin
                                         nomfichier:=concat(c1,c2,c3,c4,c5,'.pln');
                                         sort:=true;
                                    end;
                               end
                               else
                               begin
                                    nomfichier:=concat(c1,c2,c3,c4,'.pln');
                                    sort:=true;
                               end;
                          end
                          else
                          begin
                               nomfichier:=concat(c1,c2,c3,'.pln');
                               sort:=true;
                          end;
                     end
                     else
                     begin
                          nomfichier:=concat(c1,c2,'.pln');
                          sort:=true;
                     end;
                end
                else
                begin
                    nomfichier:=concat(c1,'.pln');
                    sort:=true;
                end;

           end;
     until sort;

     bar(245,320,405,340);
     contour(245,320,160,20,1,true);
     setcolor(0);
     outtextxy(320,330,nomfichier);
     delay(100);

     putimage(210,180,img^,copyput);
     freemem(img,size);
     affsouris;

     if exist(nomfichier) then
     begin

     setfillstyle(1,7);
     bar(502,457,628,469);
     outtextxy(565,465,nomfichier);


     assign(fich_plan,concat('c:\perceuse\plan\',nomfichier));
     reset(fich_plan);
     j:=0;
     while not eof(fich_plan) do
     begin
          inc(j);
          read(fich_plan,EnrPlan);
          plan[j,1]:=EnrPlan.xtrou;
          plan[j,2]:=EnrPlan.ytrou;
          plan[j,3]:=EnrPlan.diametre;
     end;
     close(fich_plan);
     i:=j;
     maj(DepAscHor,DepAscVer,'v');
     maj(DepAscHor,DepAscVer,'h');

     end
     else affmess('Fichier introuvable..');

     until sortir;
end;

{===suppression d'un trou saisi===}
procedure supprimer;
var xtrou,ytrou:word;
    j,k:word;
    exist:boolean;
    ancmousex,ancmousey:word;
begin
     fenetre_souris(55,8,631,446);
     place_souris(341,232);
     affmess2('suppression de trous..');
     ancmousex:=0;
     ancmousey:=0;

     repeat
           ascenceur;
           if (ancmousex<>mousex) or (ancmousey<>mousey) then AffPos;
           if boutongauche then
           begin
              if (xclickgauche-77) mod 8=0 then xtrou:=xclickgauche else
              begin
                   if (xclickgauche-77) mod 8<4 then xtrou:=xclickgauche-((xclickgauche-77) mod 8) else
                   xtrou:=xclickgauche-((xclickgauche-77)mod 8)+8;
              end;
              if (yclickgauche-40) mod 8=0 then ytrou:=yclickgauche else
              begin
                   if (yclickgauche-40) mod 8<4 then ytrou:=yclickgauche-((yclickgauche-40) mod 8) else
                   ytrou:=yclickgauche-((yclickgauche-40)mod 8)+8;
              end;

              for j:=1 to i do
              begin
                   if (plan[j,1]=colonne_en_xlogic(xtrou,DepAscHor)) and (plan[j,2]=ligne_en_ylogic(ytrou,DepAscVer)) then
                   begin
                        effsouris;
                        setfillstyle(1,6);
                        fillellipse(xtrou,ytrou,4,4);
                        setcolor(6);
                        circle(xtrou,ytrou,4);
                        putpixel(xtrou,ytrou,0);
                        dec(i);
                        for k:=j to i do
                        begin
                             plan[k,1]:=plan[k+1,1];
                             plan[k,2]:=plan[k+1,2];
                             plan[k,3]:=plan[k+1,3];
                        end;
                        exist:=true;
                   end
                   else exist:=false;

                   colonne:=xtrou;
                   ligne:=ytrou;
                   derxtrou:=xtrou;
                   derytrou:=ytrou;
                   affsouris;
              end;

              {if not exist then
              begin
                   effmess;
                   affmess('trou inexistant !');
                   affmess2('suppression de trous..');
              end;}

           end;
           ancmousex:=mousex;
           ancmousey:=mousey;
     until boutondroit;
     fenetre_souris(0,0,639,479);
     effmess;
end;

{===transmission des trous saisis===}
procedure transmettre;
var j,k:word;
    c:char;
    cond1,cond2,cond3:boolean;
    xmax,ymax:byte;
    nbrdiam,coddiam:byte;
    NbrTrouDiam1,NbrTrouDiam2,NbrTrouDiam3,NbrTrouDiam4:word;
    regs:registers;

procedure son;
begin
     sound(880);
     delay(10);
     nosound;
     sound(800);
     delay(10);
     nosound;
end;
begin
     affmess2('transmission en cours...');
     regs.ah:=$00;
     regs.al:=$e3;
     intr($14,regs);
     for j:=1 to i-1 do
         for k:=j+1 to i do
         begin
             cond1:=(plan[j,3]>plan[k,3]);
             cond2:=((plan[j,3]=plan[k,3]) and (plan[j,2]>plan[k,2]));
             cond3:=(plan[j,3]=plan[k,3]) and (plan[j,2]=plan[k,2]) and (plan[j,1]>plan[k,1]);
             if  cond1 or cond2 or cond3 then
             begin
                  enrplan.diametre:=plan[j,3];
                  plan[j,3]:=plan[k,3];
                  plan[k,3]:=enrplan.diametre;

                  enrplan.xtrou:=plan[j,1];
                  plan[j,1]:=plan[k,1];
                  plan[k,1]:=enrplan.xtrou;

                  enrplan.ytrou:=plan[j,2];
                  plan[j,2]:=plan[k,2];
                  plan[k,2]:=enrplan.ytrou;
             end;
         end;

     Xmax:=plan[1,1];
     for j:=2 to i do if Xmax<plan[j,1] then Xmax:=plan[j,1];

     Ymax:=plan[1,2];
     for j:=2 to i do if Ymax<plan[j,2] then Ymax:=plan[j,2];

     NbrDiam:=1;
     if not (i=1) then
     begin
          j:=0;
          repeat
                inc(j);
                if (plan[j,3]<>plan[j+1,3]) then inc(NbrDiam);
          until j+1=i;
     end;

     NbrTrouDiam1:=0;
     for j:=1 to i do
          IF plan[j,3]=1 then inc(NbrTrouDiam1);

     NbrTrouDiam2:=0;
     for j:=1 to i do
          IF plan[j,3]=2 then inc(NbrTrouDiam2);

     NbrTrouDiam3:=0;
     for j:=1 to i do
          IF plan[j,3]=3 then inc(NbrTrouDiam3);

     NbrTrouDiam4:=0;
     for j:=1 to i do
          IF plan[j,3]=4 then inc(NbrTrouDiam4);



     port[$3f8]:=Xmax;
     son;
     port[$3f8]:=Ymax;
     son;
     port[$3f8]:=NbrDiam;
     son;

     if nbrtroudiam1<>0 then
     begin
          port[$3f8]:=1;
          son;
          port[$3f8]:=nbrtroudiam1;
          son;
          port[$3f8]:=nbrtroudiam1 div 256;
          son;
          j:=1;
          while plan[j,3]=1 do
          begin
               port[$3f8]:=plan[j,1];
               son;
               port[$3f8]:=plan[j,2];
               son;
               inc(j);
          end;
     end;

     if nbrtroudiam2<>0 then
     begin
          port[$3f8]:=2;
          son;
          port[$3f8]:=nbrtroudiam2;
          son;
          port[$3f8]:=nbrtroudiam2 div 256;
          son;
          j:=0;
          repeat inc(j) until plan[j,3]=2;
          while plan[j,3]=2 do
          begin
               port[$3f8]:=plan[j,1];
               son;
               port[$3f8]:=plan[j,2];
               son;

               inc(j);
          end;
     end;

     if nbrtroudiam3<>0 then
     begin
          port[$3f8]:=3;
          son;
          port[$3f8]:=nbrtroudiam3;
          son;
          port[$3f8]:=nbrtroudiam3 div 256;
          son;
          j:=0;
          repeat inc(j) until plan[j,3]=3;
          while plan[j,3]=3 do
          begin
               port[$3f8]:=plan[j,1];
               son;
               port[$3f8]:=plan[j,2];
               son;
               inc(j);
          end;
     end;

     if nbrtroudiam4<>0 then
     begin
          port[$3f8]:=4;
          son;
          port[$3f8]:=nbrtroudiam4;
          son;
          port[$3f8]:=nbrtroudiam4 div 256;
          son;
          j:=0;
          repeat inc(j) until plan[j,3]=4;
          while plan[j,3]=4 do
          begin
               port[$3f8]:=plan[j,1];
               son;
               port[$3f8]:=plan[j,2];
               son;
               inc(j);
          end;
     end;
     port[$3f8]:=$ff;
     son;
     port[$3f8]:=$ff;
     son;
     effmess;

end;

procedure saisie;
var outilsel,deroutil:byte;
     derop,OpSelect:byte;
     sort,sortir:boolean;
begin
     i:=0;
     derxtrou:=0;
     derytrou:=0;

     depaschor:=0;
     depascver:=0;

     ancX:=76;
     ancY:=61+343;

     affsouris;
     messpos;
     repeat
          place_souris(318,238);
          repeat
                sortir:=false;
                ascenceur;
                sort:=false;
                if (xclickgauche>10) and (xclickgauche<40) then
                     if (yclickgauche>11) and (yclickgauche<41) then
                     begin
                          outilsel:=2;
                          boutonappuie(outilsel);
                          while (boutongauche) and (mousey>11) and (mousey<41) and (mousex>10) and (mousex<40) do;
                          SaisieTrou(1);
                          boutonrepos(outilsel);
                          sort:=true;
                     end;
                if (xclickgauche>10) and (xclickgauche<40) then
                     if (yclickgauche>44) and (yclickgauche<74) then
                     begin
                        outilsel:=3;
                        boutonappuie(outilsel);
                        while (boutongauche) and (mousey>44) and (mousey<74) and (mousex>10) and (mousex<40) do;
                        SaisieTrou(2);
                        boutonrepos(outilsel);
                        sort:=true;
                     end;

                if (xclickgauche>10) and (xclickgauche<40) then
                     if (yclickgauche>77) and (yclickgauche<107) then
                     begin
                        outilsel:=4;
                        boutonappuie(outilsel);
                        while (boutongauche) and (mousey>77) and (mousey<107) and (mousex>10) and (mousex<40) do;
                        SaisieTrou(3);
                        boutonrepos(outilsel);
                        sort:=true;
                     end;

                if (xclickgauche>10) and (xclickgauche<40) then
                     if (yclickgauche>110) and (yclickgauche<140) then
                     begin
                        outilsel:=5;
                        boutonappuie(outilsel);
                        while (boutongauche) and (mousey>110) and (mousey<140) and (mousex>10) and (mousex<40) do;
                        SaisieTrou(4);
                        boutonrepos(outilsel);
                        sort:=true;
                     end;

                if (xclickgauche>10) and (xclickgauche<40) then
                     if (yclickgauche>143) and (yclickgauche<173) then
                     begin
                        outilsel:=6;
                        boutonappuie(outilsel);
                        while (boutongauche) and (mousey>143) and (mousey<173) and (mousex>10) and (mousex<40) do;
                        saisieSILV;
                        boutonrepos(outilsel);
                        sort:=true;
                     end;

                if (xclickgauche>10) and (xclickgauche<40) then
                     if (yclickgauche>176) and (yclickgauche<206) then
                     begin
                        outilsel:=7;
                        boutonappuie(outilsel);
                        while (boutongauche) and (mousey>176) and (mousey<206) and (mousex>10) and (mousex<40) do;
                        saisieSILH;
                        boutonrepos(outilsel);
                        sort:=true;
                     end;

                if (xclickgauche>10) and (xclickgauche<40) then
                     if (yclickgauche>209) and (yclickgauche<239) then
                     begin
                        outilsel:=8;
                        boutonappuie(outilsel);
                        while (boutongauche) and (mousey>209) and (mousey<239) and (mousex>10) and (mousex<40) do;
                        SaisieDILV;
                        boutonrepos(outilsel);
                        sort:=true;
                     end;

                if (xclickgauche>10) and (xclickgauche<40) then
                     if (yclickgauche>242) and (yclickgauche<272) then
                     begin
                        outilsel:=9;
                        boutonappuie(outilsel);
                        while (boutongauche) and (mousey>242) and (mousey<272) and (mousex>10) and (mousex<40) do;
                        SaisieDILH;
                        boutonrepos(outilsel);
                        sort:=true;
                     end;

                if (xclickgauche>10) and (xclickgauche<40) then
                     if (yclickgauche>275) and (yclickgauche<305) then
                     begin
                        outilsel:=10;
                        boutonappuie(outilsel);
                        while (boutongauche) and (mousey>275) and (mousey<305) and (mousex>10) and (mousex<40) do;
                        SaisieDipV;
                        boutonrepos(outilsel);
                        sort:=true;
                     end;

                if (xclickgauche>10) and (xclickgauche<40) then
                     if (yclickgauche>308) and (yclickgauche<338) then
                     begin
                        outilsel:=11;
                        boutonappuie(outilsel);
                        while (boutongauche) and (mousey>308) and (mousey<338) and (mousex>10) and (mousex<40) do;
                        SaisieDipH;
                        boutonrepos(outilsel);
                        sort:=true;
                     end;

                if (xclickgauche>10) and (xclickgauche<40) then
                     if (yclickgauche>341) and (yclickgauche<371) then
                     begin
                        outilsel:=12;
                        boutonappuie(outilsel);
                        while (boutongauche) and (mousey>341) and (mousey<371) and (mousex>10) and (mousex<40) do;
                        SaisieTran1;
                        boutonrepos(outilsel);
                        sort:=true;
                     end;

                if (xclickgauche>10) and (xclickgauche<40) then
                     if (yclickgauche>374) and (yclickgauche<404) then
                     begin
                        outilsel:=13;
                        boutonappuie(outilsel);
                        while (boutongauche) and (mousey>374) and (mousey<404) and (mousex>10) and (mousex<40) do;
                        SaisieTran2;
                        boutonrepos(outilsel);
                        sort:=true;
                     end;

                if (xclickgauche>10) and (xclickgauche<40) then
                     if (yclickgauche>407) and (yclickgauche<437) then
                     begin
                        outilsel:=14;
                        boutonappuie(outilsel);
                        while (boutongauche) and (mousey>407) and (mousey<437) and (mousex>10) and (mousex<40) do;
                        SaisieTran3;
                        boutonrepos(outilsel);
                        sort:=true;
                     end;

                if (xclickgauche>10) and (xclickgauche<40) then
                     if (yclickgauche>440) and (yclickgauche<470) then
                     begin
                        outilsel:=15;
                        boutonappuie(outilsel);
                        while (boutongauche) and (mousey>440) and (mousey<470) and (mousex>10) and (mousex<40) do;
                        SaisieTran4;
                        boutonrepos(outilsel);
                        sort:=true;
                     end;

                if (xclickgauche>607) and (xclickgauche<637) and (yclickgauche>2) and (yclickgauche<32) then
                begin
                     effsouris;
                     efficon;

                     size:=imagesize(210,180,440,400);
                     getmem(img,size);
                     getimage(210,180,440,400,img^);

                     setfillstyle(1,7);
                     bar(210,180,440,400);
                     contour(210,180,230,220,3,false);
                     contour(220,190,210,200,2,true);
                     contour(228,230,194,154,0,false);
                     contour(228,197,194,28,1,true);
                     SETFILLSTYLE(1,3);
                     bar(230,199,420,223);
                     setcolor(0);
                     settextjustify(1,1);
                     settextstyle(4,0,4);
                     outtextxy(325,205,'Menu');
                     settextstyle(0,0,1);
                     affbouton(240,240,170,18,'Nouveau',80);
                     affbouton(240,263,170,18,'Ouvrir',81);
                     affbouton(240,286,170,18,'Enregistrer',82);
                     affbouton(240,309,170,18,'Supprimer',83);
                     affbouton(240,332,170,18,'Transmettre',84);
                     affbouton(240,355,170,18,'Quitter',85);

                     affsouris;

                     fenetre_souris(210,180,440,400);
                     place_souris(325,290);

                     repeat
                           sort:=false;
                           if (xclickgauche>240) and (xclickgauche<410) then
                              if (yclickgauche>240) and (yclickgauche<240+18) then
                              begin
                                   OpSelect:=80;
                                   boutonappuie(OpSelect);
                              while (boutongauche) and (mousey>240) and (mousey<240+18) and (mousex>240) and (mousex<410) do;
                                   boutonrepos(OpSelect);
                                   effsouris;
                                   putimage(210,180,img^,copyput);
                                   freemem(img,size);
                                   fenetre_souris(3,3,636,476);
                                   afficon;
                                   affsouris;
                                   nouveau;
                                   sort:=true;
                              end;

                           if (xclickgauche>240) and (xclickgauche<410) then
                              if (yclickgauche>263) and (yclickgauche<263+18) then
                              begin
                                   OpSelect:=81;
                                   boutonappuie(OpSelect);
                              while (boutongauche) and (mousey>263) and (mousey<263+18) and (mousex>240) and (mousex<410) do;
                                   boutonrepos(OpSelect);
                                   effsouris;
                                   putimage(210,180,img^,copyput);
                                   freemem(img,size);
                                   fenetre_souris(3,3,636,476);
                                   afficon;
                                   affsouris;
                                   charger;
                                   sort:=true;
                              end;

                           if (xclickgauche>240) and (xclickgauche<410) then
                              if (yclickgauche>286) and (yclickgauche<286+18) then
                              begin
                                   OpSelect:=82;
                                   boutonappuie(OpSelect);
                              while (boutongauche) and (mousey>286) and (mousey<286+18) and (mousex>240) and (mousex<410) do;
                                   boutonrepos(OpSelect);
                                   effsouris;
                                   putimage(210,180,img^,copyput);
                                   freemem(img,size);
                                   fenetre_souris(3,3,636,476);
                                   afficon;
                                   affsouris;
                                   enregistrer;
                                   sort:=true;
                              end;

                           if (xclickgauche>240) and (xclickgauche<410) then
                              if (yclickgauche>309) and (yclickgauche<309+18) then
                              begin
                                   OpSelect:=83;
                                   boutonappuie(OpSelect);
                              while (boutongauche) and (mousey>309) and (mousey<309+18) and (mousex>240) and (mousex<410) do;
                                   boutonrepos(OpSelect);
                                   effsouris;
                                   putimage(210,180,img^,copyput);
                                   freemem(img,size);
                                   fenetre_souris(3,3,636,476);
                                   afficon;
                                   affsouris;
                                   supprimer;
                                   sort:=true;
                              end;

                           if (xclickgauche>240) and (xclickgauche<410) then
                              if (yclickgauche>332) and (yclickgauche<332+18) then
                              begin
                                   OpSelect:=84;
                                   boutonappuie(OpSelect);
                              while (boutongauche) and (mousey>332) and (mousey<332+18) and (mousex>240) and (mousex<410) do;
                                   boutonrepos(OpSelect);
                                   effsouris;
                                   putimage(210,180,img^,copyput);
                                   freemem(img,size);
                                   fenetre_souris(3,3,636,476);
                                   afficon;
                                   affsouris;
                                   transmettre;
                                   sort:=true;
                              end;

                           if (xclickgauche>240) and (xclickgauche<410) then
                              if (yclickgauche>355) and (yclickgauche<355+18) then
                              begin
                                   OpSelect:=85;
                                   boutonappuie(OpSelect);
                              while (boutongauche) and (mousey>355) and (mousey<355+18) and (mousex>240) and (mousex<410) do;
                                    boutonrepos(OpSelect);
                                    afficon;
                                    sort:=true;
                              end;
                     until sort{ or boutondroit};

                     affsouris;
                     {if boutondroit then sortir:=true;}
                end;

          until sort{ or sortir};
          {if boutondroit then
          begin
               effsouris;
               putimage(210,180,img^,copyput);
               freemem(img,size);
               fenetre_souris(3,3,636,476);
               affsouris;
          end;}

     until OpSelect=85;
end;

BEGIN
     gs:=9;
     gm:=2;
     initgraph(gs,gm,'c:\tp\bgi');
     affOutil;
     AscenHor;
     AscenVer;
     Affeuille;
     AffEchelle;
     AffAxeX(0);
     AffAxeY(0);
     AffBarEtatMess;
     AffIcon;
     initsouris;
     fixe_seuil_vitesse(106);
     place_souris(617,22);
     saisie;
     freemem(img1,size1);
     freemem(img2,size2);

     closegraph;
end.

