program rep_graph;
uses crt,graph;

var i,j,x,y,yp:word;
    GM,GD:integer;
    freq,ampl:real;
    xd,xf:word;
    couleur1,couleur2,couleur3:byte;

begin
     GD:=9;
     gm:=2;
     initgraph(GD,GM,'D:\tp\bgi');
     SETCOLOR(15);
     setlinestyle(solidln,0,normwidth);
     line(0,240,640,240);
     line(320,0,320,480);

     freq:= 2.04;
     ampl:=0.80;
     xd:=0;
     xf:=639;

     yp:=240-round(ampl*sin((0*freq+320)*pi/180)*100);

     repeat

     for x:=xd to xf do
     begin
         y:=240-round(ampl*sin((x*freq+320)*pi/180)*100);

         couleur1:=getpixel(x,y);
         couleur2:=getpixel(x+1,y);
         couleur3:=getpixel(x,y+1);

         putpixel(x,y,15);
         putpixel(x+1,y,15);
         putpixel(x,y+1,15);

         {delay(1);

         putpixel(x,y,couleur1);
         putpixel(x+1,y,couleur2);
         putpixel(x,y+1,couleur3);
         }
         if abs(y-yp)>1 then
         if y<yp then for i:=y to yp-1 do
         begin
              couleur1:=getpixel(x,i);
              couleur2:=getpixel(x+1,i);
              couleur3:=getpixel(x,i+1);

              putpixel(x,i,15);
              putpixel(x+1,i,15);
              putpixel(x,i+1,15);

              delay(1);

              putpixel(x,i,couleur1);
              putpixel(x+1,i,couleur2);
              putpixel(x,i+1,couleur3);
         end
                 else for i:=y downto yp+1 do
         begin
              couleur1:=getpixel(x,i);
              couleur2:=getpixel(x+1,i);
              couleur3:=getpixel(x,i+1);

              putpixel(x,i,15);
              putpixel(x+1,i,15);
              putpixel(x,i+1,15);

              delay(1);

              putpixel(x,i,couleur1);
              putpixel(x+1,i,couleur2);
              putpixel(x,i+1,couleur3);
         end;
         yp:=y;
     end;
     UNTIL KEYPRESSED;
end.
