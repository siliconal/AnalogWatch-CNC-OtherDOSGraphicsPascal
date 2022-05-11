program assembleur;
uses crt,dos;
var c:char;
    regs:registers;
    i:byte;

{===cette procedure efface l'ecran===}
procedure clearscr;assembler;
asm
     push ax
     push bx
     push cx
     push dx

     mov al,0
     mov ah,6

     mov bh,7
     mov cx,0
     mov dh,24
     mov dl,79
     int 10h

     pop dx
     pop cx
     pop bx
     pop ax

end;

procedure ecrit(car:byte);
var codecar:byte;
begin
     codecar:=ord(car);
     regs.ah:=9;
     regs.al:=car;
     regs.bh:=0;
     regs.bl:=7;
     regs.cx:=$fff;
     intr($10,regs);
end;

begin
     {write('qwertyuiop†„sdfghjkl”„''<zxcvbnm,.-');}
     for i:=65 to 120 do
     begin
          ecrit(i);
          delay(100);
     end;
     clearscr;
     delay(500);
     ecrit(ord('_'));
     repeat until keypressed;
end.


