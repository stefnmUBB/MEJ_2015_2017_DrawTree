program copac3;
{$APPTYPE GUI}
{$mode objfpc}
{$Coperators+}
uses wingraph, wincrt, winmouse;
Label start;

procedure Init();
Var GraphDriver, GraphMode: SmallInt;
begin
  GraphDriver:=noPalette;
  Graphmode:=MCustom;
  SetWindowSize(800,800);
  initgraph(GraphDriver, GraphMode, 'Copac | L''arbre');
end;

const o00 = 0; //(-,-)
      o01 = 1; //(+,-)
      o10 = 2; //(-,+)
      o11 = 3; //(+,+)

type coordinates = record x,y:integer; end;

function setcoord(x,y:integer):coordinates;
begin
  result.x:=x;
  result.y:=y;
end;

Var colors:boolean;

function angle(pos:coordinates;l,u,o:integer):coordinates;
var v1,v2: integer;
    semn: coordinates;
begin
  v1:=trunc(l*cos(Pi*u/180));
  v2:=trunc(l*sin(Pi*u/180));
  case o of
  o00: semn:=setcoord(-1,-1);
  o01: semn:=setcoord(-1, 1);
  o10: semn:=setcoord( 1,-1);
  o11: semn:=setcoord( 1, 1);
  end;
  result:=setcoord(pos.x+semn.x*v1,
                   pos.y+semn.y*v2);
  //////////////////////////////
  if colors then setcolor(brown)
            else setcolor(white);
  //////////////////////////////
  line(pos.x,pos.y,result.x,result.y);
end;

type  pbrench= ^brench;

      brench= record
             nod:coordinates;
             b1,b2:pbrench;
           end;

procedure Draw(b:pbrench;u,l:integer);
var aux:pbrench;
    pos:Coordinates;
    l1:integer;
begin
  new(b^.b1); new(b^.b2);
  l:=3*l div 4;
  b^.b1^.nod:=angle(b^.nod,l,90-random(u),o00);
  b^.b2^.nod:=angle(b^.nod,l,90-random(u),o10);
  aux:=b;
  l1:=l;
  if l>0 then
  begin
  b:=b^.b1;
  u:=u;
  Draw(b,u,l);
  aux:=aux^.b2;
  Draw(aux,u,l1);
  end;
  /////////////////////////////
  if colors then
  Begin
  setcolor(green);
  if b^.b1=Nil then circle(b^.nod.x,b^.nod.y,10);
  if aux^.b1=Nil then circle(aux^.nod.x,aux^.nod.y,10);
  end;
end;

var b:brench;
    c:char;
begin
  Init();
  colors:=false;
  Repeat
  clearDevice();
  b.nod:=angle(setcoord(400,800),200,random(180),o00);
  Draw(@b,60,200);
  c:=readkey;
  if c='c' then colors:=true;
  Until closegraphrequest;
  CloseGraph;
end.

