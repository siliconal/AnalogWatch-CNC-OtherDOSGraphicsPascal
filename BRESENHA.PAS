program bresenham;
uses crt,graph;
var gs,gm:integer;

procedure putpix(x,y:word;coul:byte);assembler;
asm
        mov     ah,0ch
        mov     al,coul     {couleur bleu}
        mov     cx,x      {colonne}
        mov     dx,y     {ligne}
        int     10h
end;

procedure segment(coldep,ligdep,colarr,ligarr:word;couleur:byte);
var x,y:integer;
    coldep2,ligdep2,colarr2,ligarr2:word;
begin
     ligdep2:=ligdep;
     coldep2:=coldep;
     ligarr2:=ligarr;
     colarr2:=colarr;
     if ligarr<ligdep then ligdep2:=ligarr+(ligarr-ligdep);
     x:=coldep;
     y:=ligdep;
     while x<>colarr do
     begin
          putpix(x,y,couleur);
          if (colarr2-coldep2)<(ligarr2-ligdep2) then
          begin
               if (y-ligdep) mod ((ligarr2-ligdep2) div (colarr2-coldep2))=0 then
                  if ligdep<ligarr then inc(x) else dec(x);
               inc(y);
          end
          else
          begin
               if (x-coldep) mod ((colarr2-coldep2) div (ligarr2-ligdep2))=0 then
                  if ligdep<ligarr then inc(y) else dec(y);
               inc(x);
          end;
     end;
end;

begin
     clrscr;
     gs:=9;
     gm:=2;
     initgraph(gs,gm,'D:\TASM\TP\BGI');
     segment(90,100,600,250,1);
     repeat until keypressed;
     closegraph;
end.



