program asc;
uses crt;
var i:integer;

begin
     clrscr;
     for i:=0 to 255 do
         write(i,':',chr(i),'   ');
     repeat until keypressed;
end.
