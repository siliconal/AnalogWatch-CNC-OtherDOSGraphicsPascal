unit boutunit;

interface

uses crt,graph,sourunit;

var i:integer;
    gs,gm:integer;
    c:string[9];
    ch:char;
    caractbouton:array[1..99,1..5] of word;

procedure Contenu(colonne,ligne,largeur,hauteur:word;texte:string);

procedure contour(colonne,ligne,largeur,hauteur:word;epaisseur:byte;videoinv:boolean);

procedure BoutonRepos(codebouton:byte);

Procedure BoutonAppuie(codebouton:byte);

Procedure BoutonSelect(codebouton:byte);

Procedure BoutonDeSelect(codebouton:byte);

Procedure AffBouton(colonne,ligne,largeur,hauteur:word;textcontenu:string;codebouton:byte);

procedure Aff2Bouton(colonne,ligne,largeur,hauteur:word;textcontenu:string;codebouton:byte);

{============================================================================}

implementation

{===ecriture du texte contu‚nu dans le bouton===}
procedure Contenu(colonne,ligne,largeur,hauteur:word;texte:string);

begin
     settextjustify(centertext,centertext);
     setcolor(15);
     outtextXY(colonne+(largeur div 2)-1,ligne+(hauteur div 2)+1,texte);
     setcolor(0);
     outtextXY(colonne+(largeur div 2),ligne+(hauteur div 2),texte);
end;

{===trace du contour===}
procedure contour(colonne,ligne,largeur,hauteur:word;epaisseur:byte;videoinv:boolean);
var epais,x,y,x1,y1:word;
    coulombre,couleclaire:byte;
begin
     if videoinv then
                 begin
                      coulombre:=15;
                      couleclaire:=8;
                 end
                 else
                 begin
                      coulombre:=8;
                      couleclaire:=15;
                 end;
     {===contour ombre===}
     epais:=0;
     for y:=ligne to ligne+hauteur do
     begin
          for x:=colonne to colonne+epais do
               putpixel(x,y,coulombre);
          if epais<epaisseur then inc(epais);
     end;
     epais:=epaisseur;
     for y:=ligne+hauteur-epais to hauteur+ligne do
     begin
          for x:=colonne to colonne+largeur-epais do
              putpixel(x,y,coulombre);
          dec(epais);
     end;

     {===contour eclaire===}
     epais:=0;
     for y1:=y downto ligne do
     begin
          for x1:=x downto colonne-epais+largeur do
              putpixel(x1,y1,couleclaire);
          if epais<epaisseur then inc(epais);
     end;
     epais:=epaisseur;
     for y1:=ligne+epais downto ligne do
     begin
          for x1:=x-epais downto colonne+epais do
              putpixel(x1,y1,couleclaire);
          dec(epais);
     end;

end;


{===trace du bouton au repos===}
procedure BoutonRepos(codebouton:byte);
var x:byte;
    ligne,colonne,largeur,hauteur:word;
    size:word;
    img:pointer;
begin
     effsouris;
     x:=1;
     while (x<=99) and (caractbouton[x,5]<>codebouton) do inc(x);
     if x<=99 then
     begin
          ligne:=caractbouton[x,1];
          colonne:=caractbouton[x,2];
          largeur:=caractbouton[x,3];
          hauteur:=caractbouton[x,4];
     end;

     {===trace de la ligne exterieure===}
     setlinestyle(0,0,1);
     setcolor(0);
     rectangle(colonne,ligne+1,colonne+largeur,ligne+hauteur-1);
     rectangle(colonne+1,ligne,colonne+largeur-1,ligne+hauteur);

     contour(colonne+1,ligne+1,largeur-2,hauteur-2,1,false);

     size:=imagesize(colonne+5,ligne+3,colonne+largeur-3,ligne+hauteur-5);
     getmem(img,size);
     getimage(colonne+5,ligne+3,colonne+largeur-3,ligne+hauteur-5,img^);
     setfillstyle(1,7);
     bar(colonne+4,ligne+4,colonne+largeur-4,ligne+hauteur-4);
     putimage(colonne+4,ligne+4,img^,copyput);
     freemem(img,size);
     affsouris;
end;

{===dessin du bouton appuie===}
Procedure BoutonAppuie(codebouton:byte);
var x:byte;
    ligne,colonne,largeur,hauteur:word;
    size:word;
    img:pointer;
begin
     effsouris;
     x:=1;
     while (x<=99) and (caractbouton[x,5]<>codebouton) do inc(x);
     if x<=99 then
     begin
          ligne:=caractbouton[x,1];
          colonne:=caractbouton[x,2];
          largeur:=caractbouton[x,3];
          hauteur:=caractbouton[x,4];
     end;

     contour(colonne+1,ligne+1,largeur-2,hauteur-2,0,true);
     delay(50);
     size:=imagesize(colonne+4,ligne+4,colonne+largeur-4,ligne+hauteur-4);
     getmem(img,size);
     getimage(colonne+4,ligne+4,colonne+largeur-4,ligne+hauteur-4,img^);
     putimage(colonne+5,ligne+3,img^,copyput);
     freemem(img,size);
     affsouris;
end;

{===dessin du bouton selectionne===}
Procedure BoutonSelect(codebouton:byte);
var x:byte;
    ligne,colonne,largeur,hauteur:word;
    size:word;
    img:pointer;
begin
     effsouris;
     x:=1;
     while (x<=99) and (caractbouton[x,5]<>codebouton) do inc(x);
     if x<=99 then
     begin
          ligne:=caractbouton[x,1];
          colonne:=caractbouton[x,2];
          largeur:=caractbouton[x,3];
          hauteur:=caractbouton[x,4];
     end;

     {===sauvegarde du contenu du bouton===}
     size:=imagesize(colonne+4,ligne+4,colonne+largeur-4,ligne+hauteur-4);
     getmem(img,size);
     getimage(colonne+4,ligne+4,colonne+largeur-4,ligne+hauteur-4,img^);
     setfillstyle(1,7);
     putimage(colonne+4,ligne+4,img^,notput);
     freemem(img,size);
     affsouris;
end;

{===dessin du bouton deselectionne===}
Procedure BoutonDeSelect(codebouton:byte);
begin
     boutonselect(codebouton);
end;

{===dessin du bouton===}
Procedure AffBouton(colonne,ligne,largeur,hauteur:word;textcontenu:string;codebouton:byte);
var x:byte;
begin
     x:=1;
     while (x<=99) and (caractbouton[x,5]<>codebouton) do inc(x);
     if x>99 then
     begin
          inc(i);
          caractbouton[i,1]:=ligne;
          caractbouton[i,2]:=colonne;
          caractbouton[i,3]:=largeur;
          caractbouton[i,4]:=hauteur;
          caractbouton[i,5]:=codebouton;
     end;
     {===trace du contour externe===}
     {contour(colonne-1,ligne-1,largeur+2,hauteur+2,2,false);}

     {===sommet du bouton===}
     setfillstyle(1,7);
     bar(colonne+2,ligne+2,colonne+largeur-2,ligne+hauteur-2);

     {===affichage du contenu===}
     contenu(colonne,ligne,largeur,hauteur,textcontenu);

     {===trace de la ligne exterieure===}
     setlinestyle(0,0,1);
     setcolor(0);
     rectangle(colonne,ligne+1,colonne+largeur,ligne+hauteur-1);
     rectangle(colonne+1,ligne,colonne+largeur-1,ligne+hauteur);

     contour(colonne+1,ligne+1,largeur-2,hauteur-2,1,false);
end;

procedure Aff2Bouton(colonne,ligne,largeur,hauteur:word;textcontenu:string;codebouton:byte);
begin
     affbouton(colonne,ligne,largeur,hauteur,textcontenu,codebouton);
     putpixel(colonne,ligne,0);
     putpixel(colonne+largeur,ligne,0);
     putpixel(colonne,ligne+hauteur,0);
     putpixel(colonne+largeur,ligne+hauteur,0);
end;

END.
