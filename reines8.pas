program HUIT_REINES;
USES CRT;
type ind=0..8;
var col:array[1..8] of ind;
    i,j:ind;
    ns:byte;
    c:char;

procedure PLACER_REINE;

function OK(i:ind):boolean;
var j:ind;
    oui:boolean;
begin
     if i=1 then OK:=true
            else begin
                      j:=0;
                      oui:=true;
                      repeat
                            j:=succ(J);
                            if (col[i]=col[j]) or (i-j=abs(col[i]-col[j])) then oui:=false;
                      until (j=i-1) or not(oui);
                      ok:=oui;
            end;
end;(*OK*)

begin
     if col[i]=8 then begin
                            col[i]:=0;
                            writeln('impasse en colonne:',i);
                            i:=i-2;
                        end
                   else begin
                             repeat
                                   col[i]:=succ(col[i]);
                             until (col[i]=8) or (ok(i));
                             if ok(i) then begin
                                                writeln('on place LA REINE: ',i,'    en  COLONNE: ',col[i]);
                                                writeln;
                                                c:=readkey;
                                            end
                                       else begin
                                                 col[i]:=0;
                                                 writeln('impasse en colonne:',i);
                                                 i:=i-2;
                                            end;
                        end;
end;(*placer_reine*)

BEGIN
     clrscr;
     writeln('LES HUITS REINES:');
     repeat
           write('combien de solution voulez-vous?    ');read(ns);
     until ns<8;
     for j:=1 to ns do
     begin
          writeln;
          writeln(j,'� SOLUTION:');
          writeln('-------------');
          writeln;
          for i:=1 to 8 do col[i]:=ns-j;
          i:=0;
 �R 0          (0,9,9,9,1,1,1,1,1,1,1,1,1,1,1,1,9,9,9,0), 1          (0,0,9,9,1,1,1,1,1,1,1,1,1,1,1,1,9,9,0,0));      &          O8: array[0..19,0..19] of byte=(       0          (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0), 0          (0,9,0,0,0,9,0,0,0,9,0,0,0,9,0,0,0,9,0,0), 0          (9,9,9,0,9,9,9,0,9,9,9,0,9,9,9,0,9,9,9,0), 0          (9,9,9,0,9,9,9,0,9,9,9,0,9,9,9,0,9,9,9,0), 0          (1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1), 0          (1,1,1,