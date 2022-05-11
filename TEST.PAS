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
     initgraph(GS,GM,'D:\tp\bgi');

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

     cleardevice;

     {===remplissage de la surface de la montre===}
     setfillstyle(solidfill,6);
     sector(320,240,130,150,179,179);
     setfillstyle(solidfill,0);
     sector(320,240,130,150,163,163);
     setfillstyle(solidfill,6);
     sector(320,240,10,30,179,179);
     setfillstyle(solidfill,0);
     sector(320,240,10,30,163,163);
     setfillstyle(solidfill,6);
     sector(320,240,199,220,179,179);
     setfillstyle(solidfill,0);
     sector(320,240,199,220,163,163);
     setfillstyle(solidfill,6);
     sector(320,240,300,330,179,179);
     setfillstyle(solidfill,0);
     sector(320,240,300,330,163,163);
     setfillstyle(linefill,9);
     bar(500,210,520,270);
     setfillstyle(hatchfill,9);
     bar(520,215,525,265);
     bar(525,230,527,250);
     setlinestyle(solidln,0,3);
     setcolor(8);
     circle(320,240,160);
     setlinestyle(solidln,0,1);
     circle(320,240,165);
     circle(320,240,180);
     setfillstyle(widedotfill,1);
     fillellipse(320,240,160,160);
     setfillstyle(ltbkslashfill,8);
     fillellipse(320,240,85,85);
     line(175,130,190,30);
     line(640-175,130,640-190,30);
     line(175,480-130,190,480-30);
     line(640-175,480-130,640-190,480-30);
     line(200,105,200,30);
     line(640-200,105,640-200,30);
     line(200,480-105,200,480-30);
     line(640-200,480-105,640-200,480-30);
     line(190,30,200,30);
     line(640-190,30,640-200,30);
     line(190,480-30,200,480-30);
     line(640-190,480-30,640-200,480-30);
     setfillstyle(solidfill,3);
     bar(201,35,204,50);
     bar(640-201,35,640-204,50);
     bar(201,480-35,204,480-50);
     bar(640-201,480-35,640-204,480-50);
     setfillstyle(xhatchfill,2);
     bar(205,2,640-205,57);
     bar(205,480-2,640-205,480-57);
     setcolor(0);
     setlinestyle(solidln,0,1);
     line(205,30,640-205,30);
     line(205,480-30,640-205,480-30);

     {===ecriture du jour===}
     setfillstyle(solidfill,0);
     setcolor(0);
     bar(347,235,408,249);
     setlinestyle(solidln,0,1);
     setcolor(3);
     rectangle(346,234,409,250);
     getdate(annee,mois,jour,joursem);
     case joursem of
          0:c:='DIMANCHE';
          1:c:='LUNDI';
          2:c:='MARDI';
          3:c:='MERCREDI';
          4:c:='JEUDI';
          5:c:='VENDREDI';
          6:c:='SAMEDI';
     end;
     settextstyle(smallfont,0,5);
     settextjustify(centertext,centertext);
     outtextXY(378,240,c);

     {====dessin des numeros====}
     setcolor(7);
     circle(320,240,2);
     circle(320,240,3);
     settextstyle(sansseriffont,horizdir,4);
     angle:=0;
     numero:=1;
     while numero<13 do
     begin
          x:=tabpt[numero,1];
          y:=tabpt[numero,2];
          setlinestyle(solidln,0,1);
          if numero<>3 then
          begin
               setcolor(15);
               circle(x,y,1);
               circle(x,y,2);
               circle(x,y,3);
          end
          else
          begin
               setfillstyle(emptyfill,0);
               fillellipse(x-3,y+2,13,13);
               setlinestyle(solidln,0,3);
               setcolor(10);
               circle(x-3,y+2,16);
               xcercle:=x-3;
               ycercle:=y+2;
               setcolor(8);
               setlinestyle(solidln,0,1);
               circle(x-3,y+2,13);
               setcolor(7);
               settextstyle(triplexfont,horizdir,1);
               settextjustify(centertext,centertext);
               getdate(annee,mois,jour,joursem);
               str(jour,text);
               outtextXY(x-2,y-1,text);
               settextstyle(sansseriffont,horizdir,4);
          end;
          x:=tabnum[numero,1];
          y:=tabnum[numero,2];
          setcolor(7);
          settextjustify(centertext,centertext);
          str(numero,text);
          outtextXY(x,y,text);
          inc(numero);
          angle:=angle+30;
     end;

     {===signature===}
     setcolor(7);
     settextstyle(smallfont,horizdir,4);
     settextjustify(centertext,centertext);
     outtextXY(320,280,'Made in Morocco by');
     settextstyle(gothicfont,horizdir,2);
     outtextXY(320,293,'Abderrahim');
     outtextXY(320,310,'Sahli');

     size:=imagesize(220,140,420,340);
     getmem(image1,size);
     getimage(220,140,420,340,image1^);
     taille:=imagesize(347,235,420,249);
     getmem(image4,taille);
     getimage(347,235,420,249,image4^);

     gettime(hr,min,sec,ctsec);

     {=====heures====}

     i:=min;
     if hr>12 then hr1:=hr-12 else hr1:=hr;
     z:=(hr1*5)+(min div 12);
     while not keypressed do
     begin
          if (hr=0) and (min=0) and (sec=0) then
          begin
               freemem(image4,taille);
               z:=0;
               setfillstyle(emptyfill,0);
               fillellipse(xcercle,ycercle,12,12);
               setcolor(7);
               settextstyle(triplexfont,horizdir,1);
               settextjustify(centertext,centertext);
               getdate(annee,mois,jour,joursem);
               str(jour,text);
               outtextXY(xcercle+1,ycercle-3,text);
               setfillstyle(solidfill,0);
               setcolor(0);
               bar(347,235,408,249);
               setcolor(3);
               case joursem of
                    0:c:='DIMANCHE';
                    1:c:='LUNDI';
                    2:c:='MARDI';
                    3:c:='MERCREDI';
                    4:c:='JEUDI';
                    5:c:='VENDREDI';
                    6:c:='SAMEDI';
               end;
               settextstyle(smallfont,0,5);
               settextjustify(centertext,centertext);
               outtextXY(378,240,c);

               taille:=imagesize(347,235,420,249);
               getmem(image4,taille);
               getimage(347,235,420,249,image4^);
          end;
          setcolor(15);
          setlinestyle(solidln,0,3);
          x:=tabhr[z,1];
          y:=tabhr[z,2];
          x1:=tabhr1[z,1];
          y1:=tabhr1[z,2];
          putimage(220,140,image1^,copyput);
          putimage(347,235,image4^,copyput);

          line(320,240,x,y);
          setcolor(0);
          setlinestyle(solidln,0,2);
          line(320,240,x1,y1);

          getmem(image2,size);
          getimage(220,140,420,340,image2^);

          {====minutes=====}
          if i>59 then i:=0;
          while ((i mod 12)<>0) and (not keypressed) do
          begin
               gettime(hr,min,sec,ctsec);
               setcolor(15);
               setlinestyle(solidln,0,3);
               x:=tabmin[min,1];
               y:=tabmin[min,2];
               x1:=tabmin1[min,1];
               y1:=tabmin1[min,2];
               x2:=tabmin2[min,1];
               y2:=tabmin2[min,2];
               putimage(220,140,image2^,copyput);
               line(320,240,x,y);
               setcolor(0);
               setlinestyle(solidln,0,2);
               line(x2,y2,x1,y1);

               getmem(image3,size);
               getimage(220,140,420,340,image3^);

               {====secondes===}
               setlinestyle(solidln,0,1);
               repeat
                    sound(490);
                    delay(4);
                    nosound;
                    x:=tabsec[sec,1];
                    y:=tabsec[sec,2];
                    x1:=tabsec1[sec,1];
                    y1:=tabsec1[sec,2];
                    setcolor(10);
                    putimage(220,140,image3^,copyput);
                    circle(320,240,2);
                    line(320,240,x,y);
                    line(320,240,x1,y1);
                    setcolor(0);
                    circle(320,240,1);
                    sound(340);
                    delay(4);
                    nosound;
                    x1:=sec;
                    repeat
                          gettime(hr,min,sec,ctsec);
                    until sec<>x1;
               until (sec=0) or (keypressed);
               inc(i);
               freemem(image3,size);
          end;
          inc(z);
          inc(i);
          freemem(image2,size);
     end;
     freemem(image1,size);
     closegraph;
END.
