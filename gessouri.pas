program gessouris;
uses boutunit,crt,dos,graph,sourunit;

var regs:registers;
    mx,my:word;
    s:string[30];
    intver,decver,typ,numirq:byte;
    gs,gm:smallint;
    boutselect:boolean;
    sort1,sortir:boolean;
    c,cc:char;

function xclickgauche:byte;
begin
     regs.ax:=5;
     regs.bx:=0;
     intr($33,regs);
     xclickgauche:=regs.cx;
end;

function yclickgauche:byte;
begin
     regs.ax:=5;
     regs.bx:=0;
     intr($33,regs);
     yclickgauche:=regs.dx;
end;

function xclickdroit:byte;
begin
     regs.ax:=5;
     regs.bx:=1;
     intr($33,regs);
     xclickdroit:=regs.cx;
end;

function yclickdroit:byte;
begin
     regs.ax:=5;
     regs.bx:=1;
     intr($33,regs);
     yclickdroit:=regs.dx;
end;


BEGIN
     if not initsouris then
     begin
          writeln('driver souris non installe');
          halt;
     end;

     {====deplace la souris dans la position 100,100===}
     place_souris(10,10);


     {===passage en mode graphique====}
     gs:=9;
     gm:=2;
     initgraph(gs,gm,'\tp\bgi');
     setcolor(1);
     bar(20,20,360,160);
     affbouton(50,40,80,40,'Oualid',1);
     bar(420,80,560,160);
     affbouton(150,40,80,40,'Hanane',2);
     affbouton(250,40,80,40,'Touria',3);
     affbouton(50,100,80,40,'Saadia',4);
     affbouton(150,100,80,40,'khalid',5);
     affbouton(250,100,80,40,'Afaf',6);
     initsouris;
     fenetre_souris(20,20,360,160);
     place_souris(50,40);
     affsouris;
     sortir:=false;
     c:=#0;
     cc:=#0;
     repeat
           if (boutongauche) and (mousex>50) and (mousex<130) and (mousey>40) and (mousey<80) then
           begin
                effsouris;
                boutonappuie(1);
                affsouris;
                writeln('vous avez appuie sur le bouton oualid');
                while (boutongauche) and (mousex>50) and (mousex<130) and (mousey>40) and (mousey<80) do;
                effsouris;
                boutonrepos(1);
                affsouris;
           end;
           if (boutongauche) and (mousex>150) and (mousex<230) and (mousey>40) and (mousey<80) then
           begin
                effsouris;
                boutonappuie(2);
                affsouris;
                while (boutongauche) and (mousex>150) and (mousex<230) and (mousey>40) and (mousey<80) do;
                effsouris;
                boutonrepos(2);
                affsouris;
           end;
           if (boutongauche) and (mousex>250) and (mousex<330) and (mousey>40) and (mousey<80) then
           begin
                effsouris;
                boutonappuie(3);
                affsouris;
                while (boutongauche) and (mousex>250) and (mousex<330) and (mousey>40) and (mousey<80) do;
                effsouris;
                boutonrepos(3);
                affsouris;
           end;
           if (boutongauche) and (mousex>50) and (mousex<130) and (mousey>100) and (mousey<140) then
           begin
                effsouris;
                boutonappuie(4);
                affsouris;
                while (boutongauche) and (mousex>50) and (mousex<130) and (mousey>100) and (mousey<140) do;
                effsouris;
                boutonrepos(4);
                affsouris;
           end;
           if (boutongauche) and (mousex>150) and (mousex<230) and (mousey>100) and (mousey<140) then
           begin
                effsouris;
                boutonappuie(5);
                affsouris;
                while (boutongauche) and (mousex>150) and (mousex<230) and (mousey>100) and (mousey<140) do;
                effsouris;
                boutonrepos(5);
                affsouris;
           end;
           if (boutongauche) and (mousex>250) and (mousex<330) and (mousey>100) and (mousey<140) then
           begin
                effsouris;
                boutonappuie(6);
                affsouris;
                while (boutongauche) and (mousex>250) and (mousex<330) and (mousey>100) and (mousey<140) do;
                effsouris;
                boutonrepos(6);
                affsouris;
           end;
           if keypressed then
           begin
                c:=readkey;
                if c=#0 then cc:=readkey;
           end;
           if (c=#0) and (cc=#13) then cc:=#0;
           sortir:=(c<>#0) or (cc<>#0) or ((boutongauche) and (mx>50) and (mx<130) and (my>40) and (my<80));
     until sortir;
     closegraph;
END.

