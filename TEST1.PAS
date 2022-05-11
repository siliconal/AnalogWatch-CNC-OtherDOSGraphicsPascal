program test;
uses crt,graph,dos;
type coordon=record
          coordx,coordy:word;
     end;

var angle,x,y,x1,y1,x2,y2,i,z,xcercle,ycercle,annee,mois,jour,joursem:word;
    c:string[9];
    gs,gm:integer;
    arcinfo1,arcinfo2,arcinfo3:arccoordstype;
    str,str1,str2,text:string[2];
    numero:byte;
    size,taille:word;
    image1,image2,image3,image4:pointer;
    tabnum,tabpt:array[1..12,1..2] of word;
    tabsec,tabsec1,tabmin,tabmin1,tabmin2,tabhr,tabhr1,tabhr2:array[1..60,1..2] of word;
    hr,hr1,min,sec,ctsec:word;
    coord:coordon;
    fichnum,fichpt,fichsec,fichsec1,fichsec2,fichmin,fichmin1,fichmin2,fichhr,fichhr1,fichhr2:file of coordon;

BEGIN
     clrscr;
     GS:=9;
     GM:=2;
     initgraph(GS,GM,'D:\tp\bgi');

     {===affichage du message d'attente===}
     settextstyle(triplexfont,0,5);
     settextjustify(centertext,centertext);
     for i:=1 to 10 do
     begin
          setcolor(i);
          outtextXY(320+i,150+i,'Patientez un peu SVP...');
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

     {===ecriture des coordonnees des numeros et des points===}
     assign(fichnum,'c:\prgtpas\fichnum.dat');
     rewrite(fichnum);
     for i:=1 to 12 do
     begin
          coord.coordx:=tabnum[i,1];
          coord.coordy:=tabnum[i,2];
          write(fichnum,coord);
     end;
     close(fichnum);

     assign(fichpt,'c:\prgtpas\fichpt.dat');
     rewrite(fichpt);
     for i:=1 to 12 do
     begin
          coord.coordx:=tabpt[i,1];
          coord.coordy:=tabpt[i,2];
          write(fichpt,coord);
     end;
     close(fichpt);


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
          arc(320,240,0,450-x,95);
          getarccoords(arcinfo1);
          with arcinfo1 do
          begin
               tabmin[x1,1]:=xend;
               tabmin[x1,2]:=yend;
          end;
          arc(320,240,0,450-x,80);
          getarccoords(arcinfo1);
          with arcinfo1 do
          begin
               tabmin1[x1,1]:=xend;
               tabmin1[x1,2]:=yend;
          end;
          arc(320,240,0,450-x,25);
          getarccoords(arcinfo1);
          with arcinfo1 do
          begin
               tabmin2[x1,1]:=xend;
               tabmin2[x1,2]:=yend;
          end;
          arc(320,240,0,450-x,65);
          getarccoords(arcinfo1);
          with arcinfo1 do
          begin
               tabhr[x1,1]:=xend;
               tabhr[x1,2]:=yend;
          end;
          arc(320,240,0,450-x,50);
          getarccoords(arcinfo1);
          with arcinfo1 do
          begin
               tabhr1[x1,1]:=xend;
               tabhr1[x1,2]:=yend;
          end;
          x:=x+6;
          inc(x1);
     end;

     {===ecriture des coordonnees des sec,min et hr===}
     assign(fichsec,'c:\prgtpas\fichsec.dat');
     rewrite(fichsec);
     for i:=1 to 60 do
     begin
          coord.coordx:=tabsec[i,1];
          coord.coordy:=tabsec[i,2];
          write(fichsec,coord);
     end;
     close(fichsec);

     assign(fichsec1,'c:\prgtpas\fichsec1.dat');
     rewrite(fichsec1);
     for i:=1 to 60 do
     begin
          coord.coordx:=tabsec1[i,1];
          coord.coordy:=tabsec1[i,2];
          write(fichsec1,coord);
     end;
     close(fichsec1);

     assign(fichmin,'c:\prgtpas\fichmin.dat');
     rewrite(fichmin);
     for i:=1 to 60 do
     begin
          coord.coordx:=tabmin[i,1];
          coord.coordy:=tabmin[i,2];
          write(fichmin,coord);
     end;
     close(fichmin);

     assign(fichmin1,'c:\prgtpas\fichmin1.dat');
     rewrite(fichmin1);
     for i:=1 to 60 do
     begin
          coord.coordx:=tabmin1[i,1];
          coord.coordy:=tabmin1[i,2];
          write(fichmin1,coord);
     end;
     close(fichmin1);

     assign(fichmin2,'c:\prgtpas\fichmin2.dat');
     rewrite(fichmin2);
     for i:=1 to 60 do
     begin
          coord.coordx:=tabmin2[i,1];
          coord.coordy:=tabmin2[i,2];
          write(fichmin2,coord);
     end;
     close(fichmin2);

     assign(fichhr,'c:\prgtpas\fichhr.dat');
     rewrite(fichhr);
     for i:=1 to 60 do
     begin
          coord.coordx:=tabhr[i,1];
          coord.coordy:=tabhr[i,2];
          write(fichhr,coord);
     end;
     close(fichhr);

     assign(fichhr1,'c:\prgtpas\fichhr1.dat');
     rewrite(fichhr1);
     for i:=1 to 60 do
     begin
          coord.coordx:=tabhr1[i,1];
          coord.coordy:=tabhr1[i,2];
          write(fichhr1,coord);
     end;
     close(fichhr1);

     assign(fichhr2,'c:\prgtpas\fichhr2.dat');
     rewrite(fichhr2);
     for i:=1 to 60 do
     begin
          coord.coordx:=tabhr2[i,1];
          coord.coordy:=tabhr2[i,2];
          write(fichhr2,coord);
     end;
     close(fichhr2);

     cleardevice;


     closegraph;
END.
