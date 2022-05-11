program cosmic;
uses crt;
const   note:array[1..45] of word=(164,174,185,196,208,220,233,246,261,277,294,311,330,349,373,392,416,
             440,466,494,523,555,587,622,659,698,741,784,833,880,938,988,1046,1111,
             1175,1244,1318,1397,1472,1568,1664,1760,1975,2092,0);
        duree:array[1..9] of word=(50,75,100,150,200,300,400,600,800);
var     i,j:byte;

begin
     randomize;

     repeat
           i:=random(45);
           j:=random(9);
           sound(note[i]);
           delay(duree[j+0]*2);
           nosound;
     until keypressed;
end.





     1:e[k]:=100;
     2:e[k]:=200;
     3:e[k]:=400;
     4:e[k]:=800;
     5:e[k]:=1600;
     6:e[k]:=3200;
