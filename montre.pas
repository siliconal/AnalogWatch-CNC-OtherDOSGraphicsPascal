program test;
uses crt,graph,dos;
var angle,x,y,x1,y1,x2,y2,i,z,xcercle,ycercle,annee,mois,jour,joursem:word;
    c:string[9];
    gs,gm:integer;
    arcinfo1,arcinfo2,arcinfo3:arccoordstype;
    text:string[2];
    numero:byte;
    size,taille:word;
    image1,image2,image3,image4:pointer;
    tabnum,tabpt:array[1..12,1..2] of word;
    tabsec,tabsec1,tabmin,tabmin1,tabmin2,tabhr,tabhr1,tabhr2:array[1..60,1..2] of word;
    hr,hr1,min,sec,ctsec:word;

BEGIN
     clrscr;
     GS:=9;
     GM:=2;
     initgraph(GS,GM,'\MONTRE');

     {===affichage du message d'attente===}
     settextstyle(triplexfont,0,5);
     settextjustify(centertext,centertext);
     for i:=1 to 10 do
     begin
          setcolor(i);
          outtextXY(320+i,65+i,'Patientez un peu SVP...');
     end;

     {===memorisation des coordonnes des numeros et des points===}
     numero:=1;
     angle:=0;
     while angle<360 do
     begin
          setcolor(0);
          arc(320,240,0,420-angle,135);
          getarccoords(arcinfo1);
          with arcinfo1 do
          begin
               tabnum[numero,1]:=xend;
               tabnum[numero,2]:=yend;
          end;
          arc(320,240,0,420-angle,110);
          getarccoords(arcinfo1);
          with arcinfo1 do
          begin
               tabpt[numero,1]:=xend;
               tabpt[numero,2]:=yend;
          end;
          angle:=angle+30;
          inc(numero);
     end;

     {===memorisation des coordonnes de deplacement sec,min,hr===}
     x1:=0;
     x:=0;
     while x<356 do
     begin
          setcolor(0);
          arc(320,240,0,450-x,100);
          getarccoords(arcinfo1);
          with arcinfo1 do
          begin
               tabsec[x1,1]:=xend;
               tabsec[x1,2]:=yend;
          end;
          arc(320,240,0,630-x,20);
          getarccoords(arcinfo1);
          with arcinfo1 do
          begin
               tabsec1[x1,1]:=xend;
               tabsec1[x1,2]:=yend;
          end;
