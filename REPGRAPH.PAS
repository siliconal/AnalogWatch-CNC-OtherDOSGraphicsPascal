program rep_graph;
uses crt,graph;

var i,j,x,y,yp:word;
    GM,GD:integer;

begin
     GD:=9;
     gm:=2;
     initgraph(GD,GM,'E:\TASM\tp\bgi');
     SETCOLOR(15);
     setlinestyle(solidln,0,normwidth);
     line(0,240,640,240);
     line(320,0,320,480);
     yp:=240-round(1.3*sin((0*5+320)*pi/180)*100);
     putpixel(0,yp,6);
     for x:=1 to 640 do
     begin
         y:=240-round(1.3*sin((x*5+320)*pi/180)*100);
         putpixel(x,y,6);
         if abs(y-yp)>1 then
         if y<yp then for i:=y to yp-1 do putpixel(x,i,6) else for i:=y downto yp+1 do putpixel(x,i,6);
         yp:=y;
     end;
     REPEAT UNTIL KEYPRESSED;
end.
