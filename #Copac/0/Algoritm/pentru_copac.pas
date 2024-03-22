unit pentru_copac;
interface
uses crt;

procedure deschide_fisierul(s:string);

procedure inchide_fisierul;

procedure deseneaza_copacul;

procedure sterge_tot;

procedure asteapta(x:integer);

procedure scrie(mesaj:string);

function  este_apasata_tasta_X:boolean;



implementation
var f:text;
procedure deschide_fisierul(s:string);
begin
assign(f,s);
reset(f);
end;

procedure inchide_fisierul;
begin
{$i-}close(f);{$i+}
end;

procedure deseneaza_copacul;
var c:char;
begin
gotoxy(2,1);
while not eof(f) do
begin
read(f,c);
if c='/' then
          begin
           textbackground(black);
           writeln;
          end
else
if c=' ' then
          begin
           textbackground(black);
           write(' ')
          end
else
if c='m' then
          begin
           textbackground(brown);
           write(' ');
          end
else
if c='v' then
          begin
           textbackground(green);
           write(' ');
          end;
end;

end;

procedure sterge_tot;
begin
clrscr;
end;

function  este_apasata_tasta_X:boolean;
var c:char;
begin
este_apasata_tasta_X:=false;
if keypressed then
begin
c:=readkey;
if c='x' then este_apasata_tasta_X:=true;
end;
end;

procedure scrie(mesaj:string);
begin
writeln(mesaj);
end;

procedure asteapta(x:integer);
begin
delay(x);
end;

begin
cursoroff;
end.
