program TOURS_DE_HANOI;
uses crt;

type tige=1..3;
var nd,i:integer;
    ch:char;

procedure HANOI(a,c:tige);
begin
     dec(nd);
     if nd=0 then  begin
                        inc(i);
                        ch:=readkey;
                        writeln(i:5,':       ',a,' -------> ',c);
                  end
            else
            begin
                 HANOI(a,6-(a+c));
                 inc(i);
                 ch:=readkey;
                 writeln(i:5,':       ',a,' -------> ',c);
                 HANOI(6-(a+c),c);
            end;
     inc(nd);
end;

BEGIN
     clrscr;
     write('combien de disques a deplacer ?     ');read(ND);
     i:=0;
     HANOI(1,3);
     ch:=readkey;
     ch:=readkey;
     ch:=readkey;
end.



