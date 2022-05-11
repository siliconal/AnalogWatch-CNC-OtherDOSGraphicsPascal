program souris;
uses graph,mamouse;
var gs,gm:integer;
    ligne,colonne:byte;
    boutgauche,boutdroit:boolean;
    lin,col:string[3];
procedure define_curseur;
const masqueecran:array[0..15] of word=($3fff,$1fff,$0fff,$07ff,$03ff,
                                 $01ff,$00ff,$007f,$003f,$001f,$01ff,
                                 $10ff,$30ff,$f87f,$f87f,$fc3f);
var masquesouris:array[0..15] of word;
begin
     asm
     mov  cx,16
     mov  si,offset masqueecran
     mov  di,offset masquesouris
     push ds
     pop  es
     rep  movsw
     mov  di,offset masquesouris
     mov  cx,16
@bo: not  word ptr [di]
     add  di,2
     loop @bo
     mov  ah,09
     mov  bx,0
     mov  cx,0
     mov  dx,offset masquesouris
     int  33h
     end;
end;
begin
     gs:=9;
     gm:=2;
     initgraph(gs,gm,'\montre');
     if not initialise_souris then halt(1);
     define_curseur;
     place_souris(10,10);
     affiche_souris;
     etat_souris(ligne,colonne,boutgauche,boutdroit);
     while not boutgauche do
     begin
        etat_souris(ligne,colonne,boutgauche,boutdroit);
        outtextxy(10,10,'colonne:              ligne:');
        str(colonne:3,col);
        str(ligne:3,lin);
        outtextxy(80,10,col);
        outtextxy(140,10,lin);
     end;
     cleardevice;
     etat_souris(ligne,colonne,boutgauche,boutdroit);
     while not boutdroit do
     begin
        etat_souris(ligne,colonne,boutgauche,boutdroit);
        outtextxy(10,10,'colonne:              ligne:');
        str(colonne:3,col);
        str(ligne:3,lin);
        outtextxy(80,10,col);
        outtextxy(140,10,lin);
     end;
     fenetre_souris(10,10,40,40);
     readln;
     cache_souris;
     closegraph;
     affiche_souris;
     etat_souris(ligne,colonne,boutgauche,boutdroit);
     while not boutgauche do
     begin
        etat_souris(ligne,colonne,boutgauche,boutdroit);
        write('colonne:',colonne:3,'     ligne:',ligne:3,#13);
     end;
     etat_souris(ligne,colonne,boutgauche,boutdroit);
     while not boutdroit do
     begin
        etat_souris(ligne,colonne,boutgauche,boutdroit);
        write('colonne:',colonne:3,'     ligne:',ligne:3,#13);
     end;
     fenetre_souris(10,10,20,20);
     readln;
     cache_souris;
end.
