unit fractal1;

{$mode objfpc}{$H+}

interface

uses
  wingraph;


type coordinates = record x,y:integer; end;
function setcoord(x,y:integer):coordinates;

Procedure tree(x,y,l, width,u:integer);
Procedure switchcolor();
function angle(pos:coordinates;l,u:integer):coordinates;

implementation

function setcoord(x,y:integer):coordinates;
begin
  result.x:=x;
  result.y:=y;
end;

Var colors:boolean=false;
    terminal:boolean=false;

Procedure switchcolor();
Begin
  colors:=not colors;
end;

function angle(pos:coordinates;l,u:integer):coordinates;
var v1,v2: integer;
begin
  terminal:=false;
  if l<=5 then terminal:=true;
  v1:=trunc(l*cos(Pi*u/180));
  v2:=trunc(l*sin(Pi*u/180));
  result:=setcoord(pos.x-v1,
                   pos.y-v2);
  if colors then
             if terminal then
                           Begin
                            setcolor(green);
                            circle(result.x,result.y,10);
                           end
                         else setcolor(brown)
            else setcolor(white);
  line(pos.x,pos.y,result.x,result.y);
end;

type  pbrench= ^brench;

      brench= record
             nod:coordinates;
             b1,b2:pbrench;
           end;

procedure Draw(b:pbrench;u,l,width:integer);
var aux:pbrench;
    l1:integer;
begin
  new(b^.b1); new(b^.b2);
  l:=3*l div 5;
  if width>1 then width:=3*width div 5;
  SetLineStyle(SolidLn,0,width);
  b^.b1^.nod:=angle(b^.nod,l,random(u));
  b^.b2^.nod:=angle(b^.nod,l,90+random(u));
  aux:=b;
  l1:=l;
  if l>0 then
  begin
  b:=b^.b1;
  Draw(b,u,l, width);
  aux:=aux^.b2;
  Draw(aux,u,l1, width);
  end;
end;

var b:brench;

Procedure tree(x,y,l,width,u:integer);
begin
  SetLineStyle(SolidLn,0,width);
  b.nod:=angle(setcoord(x,y),l,u);
  Draw(@b,60,l, width);
end;


end.

