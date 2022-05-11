program musicol;
uses crt;
type
    enreg=record
             dure,note,ind:integer;
    end;
    fichier=file of enreg;
    repertoire=file of string[8];
var
   nmel,mel:string[8];
   rep:repertoire;
   er:enreg;
   me:fichier;
   q:real;
   a1:char;
   a,b:char;
   p,g,i,j,c,l,x,h,k:integer;
   no:array[1..45] of integer;
   f:array[1..45] of integer;
   e:array[1..1000] of integer;
   d:array[1..1000,1..2] of integer;
   m:array[1..1000] of string[28];
   on1:char;

procedure f4;
begin
     for l:=x-2 to x+8 do
     begin
          gotoxy(c,l);write(a,a,b);
     end;
end;
procedure f1;
begin
     for l:=x-2 to x+4 do
     begin
          gotoxy(c,l);write(a,b);
     end;
     for l:=x+5 to x+8 do
     begin
          gotoxy(c,l);write(a,a,b);
     end;
end;
procedure f2;
begin
     for l:=x-2 to x+4 do
     begin
          gotoxy(c+1,l);write(b);
     end;
     for l:=x+5 to x+8 do
     begin
          gotoxy(c,l);
          write(a,a,b);
     end;
end;
procedure f3;
begin
     for l:=x-2 to x+4 do
     begin
          gotoxy(c+1,l);write(a,b);
     end;
     for l:=x+5 to x+8 do
     begin
          gotoxy(c,l);write(a,a,b);
     end;
end;
procedure f5;
begin
     for l:=x-2 to x+8 do
     begin
          gotoxy(c,l);write(a,a);
     end;
end;
procedure f6;
begin
     for l:=x-2 to x+4 do
     begin
          gotoxy(c-1,l);write('  ');
     end;
end;
procedure activ;
begin
     textbackground(9);
     p:=0;c:=0;
     for i:=1 to 45 do
     begin
         p:=p+1;c:=1+((p-1)*3);
         if j=i then
         begin
          textcolor(26);textbackground(16);
          case f[i] of
                1:f1;
                2:f2;
                3:f3;
                4:f4;
                5:f5;
                6:begin
                     textbackground(16);
                     for l:=x-2 to x+4 do
                     begin
                         gotoxy(c-1,l);write(a,a);
                     end;
                end;
          end;
          end;if f[i]=6 then p:=p-1;
     end;
     textbackground(16);
     textbackground(9);
end;
procedure clavier;
begin
     textbackground(9);
     x:=13;a:=chr(219);b:=chr(186);
     f[1]:=4;f[2]:=1;f[3]:=6;f[4]:=2;f[5]:=6;f[6]:=2;f[7]:=6;
     f[8]:=3;f[9]:=1;f[10]:=6;f[11]:=2;f[12]:=6;f[13]:=3;f[14]:=1;f[15]:=6 ;
     f[16]:=2;f[17]:=6;f[18]:=2;f[19]:=6;f[20]:=3;f[21]:=1;f[22]:=6;f[23]:=2;
     f[24]:=6;f[25]:=3;f[26]:=1;f[27]:=6;f[28]:=2;f[29]:=6;f[30]:=2;f[31]:=6;
     f[32]:=3;f[33]:=1;f[34]:=6;f[35]:=2;f[36]:=6;f[37]:=3;f[38]:=1;f[39]:=6;
     f[40]:=2;f[41]:=6;f[42]:=2;f[43]:=6;f[44]:=3;f[45]:=5;
     p:=0;i:=0;c:=0;
     while c<=76 do
     begin
          textcolor(15);textbackground(16);
          i:=i+1;
          p:=p+1;
          c:=1+((p-1)*3);
          case f[i] of
                1:f1;
                2:f2;
                3:f3;
                4:f4;
                5:f5;
                6:begin
                       textbackground(16);
                       f6;
                       p:=p-1;
                end;
          end;
     end;
end;
procedure eff_act;
begin
     textcolor(1);
     textbackground(9);
     p:=0;c:=0;
     for i:=1 to 45 do
     begin
         p:=p+1;
         c:=1+((p-1)*3);
         if j=i then
         begin
          textcolor(15);textbackground(16);
          case f[i] of
                1:f1;
                2:f2;
                3:f3;
                4:f4;
                5:f5;
                6:begin
                     textbackground(16);f6;
                end;
          end;
          end;
          if f[i]=6 then p:=p-1;
     end;
     textbackground(16);
     textbackground(9);
     textbackground(9);
end;
procedure choix11;
begin
     case j of
      1..9:begin
                gotoxy(7,3);write('Grave');
      end;
      10..21:begin
                  gotoxy(22,3);write('Basse');
      end;
      22..33:begin
                  gotoxy(37,3);write('Aigue');
      end;
      34..45:begin
                  gotoxy(51,3);write('+Aigue');
      end;
      46:begin
              gotoxy(66,3);write('Silence');
      end;
      end;
end;
procedure choix12;
begin
      if (j=10) or (j=22) or (j=34) then
      begin
           gotoxy(2,4);write('DO#');
      end;
      if (j=11) or (j=23) or (j=35) then
      begin
           gotoxy(9,4);write('RE');
      end;
      if (j=12) or (j=24) or (j=36) then
      begin
           gotoxy(15,4);write('RE#');
      end;
      if (j=13) or (j=25) or (j=37) or (j=1) then
      begin
           gotoxy(22,4);write('MI');
      end;
      if (j=2) or (j=14) or (j=26) or (j=38) then
      begin
           gotoxy(28,4);write('FA');
      end;
      if (j=3) or (j=15) or (j=27) or (j=39) then
      begin
           gotoxy(34,4);write('FA#');
      end;
      if (j=4) or (j=16) or (j=28) or (j=40) then
      begin
           gotoxy(41,4);write('SOL');
      end;
      if (j=5) or (j=17) or (j=29) or (j=41) then
      begin
           gotoxy(48,4);write('SOL#');
      end;
      if (j=6) or (j=18) or (j=30) or (j=42) then
      begin
           gotoxy(56,4);write('LA');
      end;
      if (j=7) or (j=19) or (j=31) or (j=43) then
      begin
           gotoxy(62,4);write('LA#');
      end;
      if (j=8) or (j=20) or (j=32) or (j=44) then
      begin
           gotoxy(69,4);write('SI');
      end;
      if (j=9) or (j=21) or (j=45) or (j=33) then
      begin
           gotoxy(75,4);write('DO');
      end;
end;
procedure menu1;
begin
     gotoxy(7,3);write('Grave          Basse          Aigue         +Aigue         Silence');
     gotoxy(2,4);write('DO#    RE    RE#    MI    FA    FA#    SOL    SOL#    LA    LA#    SI    DO');
end;
procedure menu2;
begin
     gotoxy(2,6);
     writeln('DUREES:');
     write(' Triple croche   Double croche   Croche   Noire   Blanche   Ronde     (.)   (..)');
end;
procedure choix2;
begin
     case g of
     1:begin
            gotoxy(2,7);
            write('Triple croche');
     end;
     2:begin
            gotoxy(18,7);
            write('Double croche');
     end;
     3:begin
            gotoxy(34,7);
            write('Croche');
     end;
     4:begin
            gotoxy(43,7);
            write('Noire');
     end;
     5:begin
            gotoxy(51,7);
            write('Blanche');
     end;
     6:begin
            gotoxy(61,7);
            write('Ronde');
     end;
     end;
     case p of
     1:begin
            gotoxy(70,7);
            write('(.)');
     end;
     2:begin
            gotoxy(75,7);
            write('(..)');
     end;
     end;
end;
{procedure repert;
begin
     reset(rep);
     i:=0;
     j:=2;
     while not eof(rep) do
     begin
          i:=i+1;
          gotoxy(j,i);read(rep,nmel);write(nmel);
          if i>22 then
                  begin
                       i:=0;
                       j:=j+16;
                  end;
     end;
     close(rep);
end;
procedure ajout_rep;
begin
     while not eof(rep) do
           read(rep,nmel);
     write(rep,nmel);
end;}
procedure appel;
begin
     {repert;
     j:=0;
     reset(rep);}
     gotoxy(20,24);write('NOM DE LA MELODIE A APPELER: ');read(mel);
     {while not eof(rep) and (j=0) do
     begin
          read(rep,nmel);
          if mel=nmel then
                      begin
                           j:=1;}
                           assign(me,mel);
                           reset(me);
                           i:=0;
                           while not eof(me) do
                           begin
                                inc(i);
                                read(me,er);
                                d[i,1]:=er.note;
                                d[i,2]:=er.ind;
                                e[i]:=er.dure;
                           end;

                           while e[i]<>0 do
                           begin
                                e[i]:=0;
                                i:=i+1;
                           end;

                           for i:=1 to filesize(me) do
                           begin
                                sound(d[i,1]);
                                delay(e[i]);
                                nosound;
                                {eff_act;
                                j:=d[i,2];
                                activ;}
                                (*delay(100);*)
                           end;
                           close(me);
                      {end;
     end;
     if j:=0 then
             begin
                  gotoxy(20,24);
                  write('CETTE MELODIE N'EXISTE PAS DANS LE REPERTOIRE');
                  close(rep);
                  repeat until keypressed;.
                  appel;
             end;
     close(rep);}
end;
procedure enregist;
begin
     {repert;
     j:=0;
     k:=0;}
     gotoxy(20,24);write('NOM DE LA MELODIE A ENREGISTRER: ');
     read(mel);
     {reset(rep);
     while (not eof(rep)) and (j=0) and (k=0) do
     begin
          read(rep,nmel);
          if mel=nmel then
                      begin
                           gotoxy(20,24);
                           write('CETTE MELODIE EXISTE DEJA');
                           writeln('VOULEZ-VOUS LA REMPLACER?(O/N)');
                           r:=readkey;
                           if r='o' or r='O' then
                           begin}
                                i:=1;
                                assign(me,mel);
                                rewrite(me);
                                while e[i]<>0 do
                                begin
                                     er.note:=d[i,1];
                                     er.ind:=d[i,2];
                                     er.dure:=e[i];
                                     write(me,er);
                                     i:=i+1;
                                end;
                                close(me);
                                {ajout_rep;
                                k:=1;
                           end;
                      end;
                      else j:=1;
     close(me);
     end;
     if j=1 then
     begin
          close(rep);
          repert;
     end;
     if (j=0) and (k=0) then
     begin
          rewrite(me);
          i:=1;
          wkile e[i]<>0 do
          begin
               er.note:=d[i,1];
               er.ind:=d[i,2];
               er.dure:=e[i];
               write(me,er);
               i:=i+1;
          end;
          ajout_rep;
          close(me);
     end;
     close(rep);}
end;
begin
     clrscr;
     appel;

     textbackground(9);
     clrscr;gotoxy(1,24);write('________________________________________________________________________________');
     gotoxy(1,25);write(chr(027),':gauche ',chr(026),':droite');
     g:=1;
     j:=1;
     k:=0;
     textcolor(15);
     menu1;
     menu2;
     clavier;
     activ;
     textcolor(22);
     choix11;
     choix12;
     choix2;
     repeat
           k:=k+1;
           p:=0;h:=0;
           repeat
                 textcolor(15);
                 gotoxy(78,24);
                 a1:=readkey;
                 choix11;
                 choix12;
                 eff_act;
                      if ord(a1)=72 then h:=1;
                      if ord(a1)=80 then h:=0;
                      if h=0 then
                      begin
                           if ord(a1)=77 then j:=j+1;
                           if ord(a1)=75 then j:=j-1;
                           textcolor(22);
                           choix12;
                           textcolor(10);
                           choix11;
                      end
                      else
                      begin
                           if ord(a1)=77 then j:=j+12;
                           if ord(a1)=75 then j:=j-12;
                           textcolor(22);
                           choix11;
                           textcolor(10);
                           choix12;
                      end;
                      if j<1 then j:=46;
                      if j>46 then j:=1;
                 textcolor(22);
                 activ;
                 until ord(a1)=13;
                 repeat
                       a1:=readkey;
                       textcolor(15);
                       choix2;
                       if ord(a1)=77 then g:=g+1;
                       if ord(a1)=75 then g:=g-1;
                       if g<1 then g:=6;
                       if g>6 then g:=1;
                       (*  if a1='+' then
                                 begin
                                      p:=1;
                                      repeat
                                            a1:=readkey;
                                            if ord(a1)=77 then p:=2;
                                            if ord(a1)=75 then p:=1;
                                      until ord(a1)=13;
                                 end;*)
                       textcolor(22);
                       choix2;
                 until (ord(a1)=13) or (ord(a1)=27);
                  case j of
     1:begin
          d[k,1]:=164;
          d[k,2]:=1;
     end;
     2:begin
            d[k,1]:=174;
            d[k,2]:=2;
     end;
     3:begin
          d[k,1]:=185;
          d[k,2]:=3;
     end;
     4:begin
          d[k,1]:=196;
          d[k,2]:=4;
     end;
     5:begin
          d[k,1]:=208;
          d[k,2]:=5;
     end;
     6:begin
          d[k,1]:=220;
          d[k,2]:=6;
     end;
     7:begin
          d[k,1]:=233;
          d[k,2]:=7;
     end;
     8:begin
            d[k,1]:=246;
            d[k,2]:=8;
     end;
     9:begin
            d[k,1]:=261;
            d[k,2]:=9;
     end;
    10:begin
            d[k,1]:=277;
            d[k,2]:=10;
    end;
    11:begin
            d[k,1]:=294;
            d[k,2]:=11;
    end;
    12:begin
            d[k,1]:=311;
            d[k,2]:=12;
    end;
    13:begin
            d[k,1]:=330;
            d[k,2]:=13;
    end;
    14:begin
            d[k,1]:=349;
            d[k,2]:=14;
    end;
    15:begin
            d[k,1]:=373;
            d[k,2]:=15;
    end;
    16:begin
            d[k,1]:=392;
            d[k,2]:=16;
    end;
    17:begin
            d[k,1]:=416;
            d[k,2]:=17;
    end;
    18:begin
            d[k,1]:=440;
            d[k,2]:=18;
    end;
    19:begin
            d[k,1]:=466;
            d[k,2]:=19;
    end;
    20:begin
            d[k,1]:=494;
            d[k,2]:=20;
    end;
    21:begin
            d[k,1]:=523;
            d[k,2]:=21;
    end;
    22:begin
            d[k,1]:=555;
            d[k,2]:=22;
    end;
    23:begin
            d[k,1]:=587;
            d[k,2]:=23;
    end;
    24:begin
            d[k,1]:=622;
            d[k,2]:=24;
    end;
    25:begin
            d[k,1]:=659;
            d[k,2]:=25;
    end;
    26:begin
            d[k,1]:=698;
            d[k,2]:=26;
    end;
    27:begin
            d[k,1]:=741;
            d[k,2]:=27;
    end;
    28:begin
            d[k,1]:=784;
            d[k,2]:=28;
    end;
    29:begin
            d[k,1]:=833;
            d[k,2]:=29;
    end;
    30:begin
            d[k,1]:=880;
            d[k,2]:=30;
    end;
    31:begin
            d[k,1]:=938;
            d[k,2]:=31;
    end;
    32:begin
            d[k,1]:=988;
            d[k,2]:=32;
    end;
    33:begin
            d[k,1]:=1046;
            d[k,2]:=33;
    end;
    34:begin
            d[k,1]:=1111;
            d[k,2]:=34;
    end;
    35:begin
            d[k,1]:=1175;
            d[k,2]:=35;
    end;
    36:begin
            d[k,1]:=1244;
            d[k,2]:=36;
    end;
    37:begin
            d[k,1]:=1318;
            d[k,2]:=37;
    end;
    38:begin
            d[k,1]:=1397;
            d[k,2]:=38;
    end;
    39:begin
            d[k,1]:=1472;
            d[k,2]:=39;
    end;
    40:begin
            d[k,1]:=1568;
            d[k,2]:=40;
    end;
    41:begin
            d[k,1]:=1664;
            d[k,2]:=41;
    end;
    42:begin
            d[k,1]:=1760;
            d[k,2]:=42;
    end;
    43:begin
            d[k,1]:=1867;
            d[k,2]:=43;
    end;
    44:begin
            d[k,1]:=1975;
            d[k,2]:=44;
    end;
    45:begin
            d[k,1]:=2092;
            d[k,2]:=45;
    end;
    46:begin
            d[k,1]:=0;
            d[k,2]:=46;
    end;
     end;
     case g of
     1:e[k]:=100;
     2:e[k]:=200;
     3:e[k]:=400;
     4:e[k]:=800;
     5:e[k]:=1600;
     6:e[k]:=3200;
     end;
     (*k]:=e[k]*(1+q);*)
           until ord(a1)=27;
           clrscr;
           clavier;
           for i:=1 to k do
           begin

                sound(d[i,1]);
                delay(e[i]);
                nosound;
                {eff_act;
                j:=d[i,2];
                activ;}
                (*delay(100);*)
           end;
     clrscr;
     write('voulez-vous enregistrer ce morceau (o/n) ?');
     on1:=readkey;
     if (on1='o') or (on1='O') then enregist;
     
end.






