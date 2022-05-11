program espacedisque;
uses crt,dos;

var espacelibre,espacetotal:longint;
    espace:real;

begin
     clrscr;
     espacelibre:=diskfree(3);
     espacetotal:=disksize(3);
     espace:=espacelibre/(1024*1024);
     writeln('espace disque libre = ',espace:2:6,' Mo');
     writeln;
     writeln;
     espace:=espacetotal/(1024*1024);
     writeln('espace disque total = ',espace:2:6, 'Mo');
     repeat until keypressed;
end.