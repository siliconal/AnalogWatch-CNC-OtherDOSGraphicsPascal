program HUIT_REINES;
USES CRT;
type ind=0..8;
var col:array[1..8] of ind;
    i,j,k:ind;
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
                            gotoxy(40,10);
                            writeln('impasse en colonne:',i);
                            i:=i-2;
                        end
                   else begin
                             repeat
                                   col[i]:=succ(col[i]);
                             until (col[i]=8) or (ok(i));
                             if ok(i) then begin

                                                FOR k:=1 TO 8 DO
                                                begin
                                                     GOTOXY((K*4)-1,I*2+5);
                                                     write('   ');
                                                end;
                                                gotoxy((4*col[i])-1,i*2+5);
                                                write('RN',I);
                                                c:=readkey;
                                                gotoxy(40,10);
                                                writeln('                    ');
                                            end
                                       else begin
                                                 col[i]:=0;
                                                 gotoxy(40,10);
                                                 writeln('impasse en colonne:',i);
                                                 i:=i-2;
                                            end;
                        end;
                        
end;(*placer_reine*)

BEGIN
     clrscr;
     repeat
           write('combien de solution voulez-vous?    ');read(ns);
     until ns<8;
     for j:=1 to ns do
     begin
          CLRSCR;
          writeln(j,'ø SOLUTION DES HUITS REINES:');
          writeln('-----------------------------');
          writeln;
          writeln('            COLONNES   ');
          writeln('   1   2   3   4   5   6   7   8');
          writeln(' ÚÄÄÄÂÄÄÄÂÄÄÄÂÄÄÄÂÄÄÄÂÄÄÄÂÄÄÄÂÄÄÄ¿');
          WRITELN(' ³   ³   ³   ³   ³   ³   ³   ³   ³');
          for i:=1 to 7 do
          BEGIN
               writeln(' ÃÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄ´');
               WRITELN(' ³   ³   ³   ³   ³   ³   ³   ³   ³');
          end;
          writeln(' ÀÄÄÄÁÄÄÄÁÄÄÄÁÄÄÄÁÄÄÄÁÄÄÄÁÄÄÄÁÄÄÄÙ');
          for i:=1 to 8 do col[i]:=ns-j;
          i:=0;
          repeat
                i:=succ(I);
                PLACER_REINE;
          until i=8;

          GOTOXY(40,10);
          write('RESULTAT FINAL:');
          GOTOXY(40,11);
          write('---------------');
          for i:=1 to 8 do
          BEGIN
               gotoxy(40,12+i);
               write('LA REINE: ',i,'    est en COLONNE: ',col[i]);
          end;
          writeln;
          c:=readkey;
          c:=readkey;
          c:=readkey;
     end;

END.





