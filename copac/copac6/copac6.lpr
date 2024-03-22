program copac6;
uses wingraph,wincrt;

procedure Init();
Var GraphDriver, GraphMode: SmallInt;
begin
  GraphDriver:=noPalette;
  Graphmode:=MCustom;
  SetWindowSize(700,500);
  initgraph(GraphDriver, GraphMode, 'Copac | L''arbre');
end;

type coordinates = record x,y,u:integer; end;
     function setcoord(x,y:integer):coordinates;
     begin
       result.x:=x;
       result.y:=y;
     end;

function angle(pos:coordinates;l,u:integer;show:boolean):coordinates;
     var v1,v2: integer;
         x:byte;
     begin
       v1:=trunc(l*cos(Pi*u/180));
       v2:=trunc(l*sin(Pi*u/180));
       result:=setcoord(pos.x-v1,pos.y-v2);
       result.u:=u;
       if show then line(pos.x,pos.y,result.x,result.y);
     end;

function f(x:integer):integer;
begin
  f:=3*x div 5;
end;

procedure build1(pos:coordinates;l,u:integer);
var p1,p2:coordinates;
begin
  p1:=angle(pos,f(l),-u+pos.u,true);
  p2:=angle(pos,f(l), u+pos.u,true);
  l:=f(l);
  if l>1 then
  begin
  build1(p1,l,u);
  build1(p2,l,u);
  end;
end;

procedure build2(pos:coordinates;l,u,n:integer);
var p1,aux:coordinates;
    i:integer=0;
begin
  if l>1 then
  begin
  for i:=1 to n do
  begin
    aux:=angle(pos,l div (2*(i mod 2+1)),pos.u,true);
    if i mod 2=0 then
    begin
    l:=f(l);
    u:=-u;
    end;
    p1:=angle(aux,f(l),u+aux.u,true);
    build2(p1,f(l),u,n);
  end;
  end;
  end;

var x:coordinates;
begin
  Init;
  updateGraph(updateoff);
  cleardevice;
  x:=angle(setcoord(500,400),50,90,true);
  build1(x,200,15);
  x:=angle(setcoord(200,400),50,90,true);
  //build2(x,100,20,10);
  updategraph(updateon);
  readkey;
end.

