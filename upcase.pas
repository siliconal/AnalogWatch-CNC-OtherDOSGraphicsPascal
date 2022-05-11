program upcase;
uses crt;
var str:string;

procedure uppercasein(var strg:string);
begin
     inline
     ($c4/$be/strg/
     $26/$8a/$0d/
     $fe/$c1/
     $fe/$c9/
     $74/$13/
     $47/
     $26/$80/$3d/$61/
     $72/$f5/
     $26/$80/$3d/$7a/
     $77/$ef/
     $26/$80/$2d/$20/
     $eb/$e9);
end;

procedure uppercaseas(var strg:string);assembler;
asm
        les di,strg
        mov cl,es:[di]
        inc cl
@l1:    dec cl
        jz @l2
        inc di
        cmp es:byte ptr[di],'a'
        jb @l1
        cmp es:byte ptr[di],'z'
        ja @l1
        sub es:byte ptr[di],20h
        jmp @l1
@l2:
end;


begin
     clrscr;
     write('entrer une chaine de caracteres: ');
     read(str);
     uppercasein(str);
     clrscr;
     writeln('upcase en inline:');
     write(str);

     writeln;
     writeln;
     writeln;

     uppercaseas(str);
     writeln('upcase en assebleur:');
     write(str);
     repeat until keypressed;
end.


