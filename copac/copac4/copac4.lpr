program copac4;
{ $APPTYPE GUI}
uses wingraph, wincrt, winmouse,LResources;

const brown=$327FCD;
      green=$228B22;

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

const n=15;

var p:pointer;
    a:AnimatType;

type
     Pbrench = ^tbrench;
     tnod = array[1..n] of pbrench;
     Tbrench = record
                posi,posf:coordinates;
                l:integer;
                u:integer;
                nod:tnod;
     end;

     Function GetImage(FName:String):Pointer;
     Var f:File;
         Size:Longint;
     Begin
       Assign(f,FName);
       {$i-}
         Reset(f,1);
       {$i+}
       Size:=FileSize(f);
       GetMem(GetImage,Size);
       If Ioresult<>0 Then Halt;
       BlockRead(f,GetImage^,Size);
       Close(f);
     End;

var colors:boolean=false;
    terminal:boolean=false;

     function angle(pos:coordinates;l,u:integer;show:boolean):coordinates;
     var v1,v2: integer;
         x:byte;
     begin
       if l>5 then terminal:=false
       else terminal:=true;
        if colors then
        if not terminal then setcolor(brown)
                                      else
                                        begin
                                          setcolor(green);
                                          circle(pos.x,pos.y,2);
                                          x:=random(1000);
                                          if x=5 then
                                          PutAnim(pos.x,pos.y,a,transput);
                                        end
                 else setcolor(white);
       v1:=trunc(l*cos(Pi*u/180));
       v2:=trunc(l*sin(Pi*u/180));
       result:=setcoord(pos.x-v1,pos.y-v2);
       if show then line(pos.x,pos.y,result.x,result.y);
     end;


function  brench(pos:coordinates;l,u:integer;show:boolean):tbrench;
begin
  brench.posi:=pos;
  brench.posf:=angle(pos,l,u,show);
  brench.u:=u;
  brench.l:=l;
end;

function f(b:tbrench;l:integer):coordinates;
begin
   f:=brench(b.posi,l,b.u,false).posf;
end;

function h(x:integer):integer; begin h:=5*x div 2; end;

procedure Build(var b:tbrench;u:integer;width:integer);
var aux:pbrench;
    i,l1,l2,u1,u2,w:integer;
begin
  l1:=b.l div 2;
  l2:=l1;
  w:=width;
  for i:=1 to n do
  begin
    setlinestyle(solidln,0,w);
    new(b.nod[i]);
    if i mod 2=1 then
    begin
    u1:=u div 2 +90;
    if l2>1 then l2:=l2 div 2;
    end
    else u1:=u;
    b.nod[i]^:=brench(f(b,l1),h(l2),u1,true);
    aux:=b.nod[i];
    u2:=90+(u+b.u);
    if w>2 then w:=w-1;
    if l2>1 then build(aux^,u2,w);
    l1:=l1+l2;
  end;
end;

procedure delfile(s:string); forward;

procedure BackGround();
var stream:TLazarusResourceStream;
    bitmap:pointer;
begin
  if paramstr(2)='' then cleardevice
  else
  if paramstr(2)='background+' then
  begin
  stream:=TLazarusResourceStream.Create('0',nil);
  stream.savetofile('0.bmp');
  bitmap:=GetImage('0.bmp');
  Delfile('0.bmp');
  PutImage(0,0,bitmap^,NormalPut);
  end
  else
  if paramstr(2)<>'background-' then
  halt
  else cleardevice;
end;

Procedure Unpackres(s:string);
var str:TLazarusResourceStream;
begin
  str:=TLazarusResourceStream.create(s,nil);
  str.savetofile(s+'.bmp');
end;
procedure delfile(s:string);
var f:text;
    begin
      assign(f,s);
      erase(f);
    end;

var r:tbrench;
    c:char;
    u:integer;
    s:boolean;

var u1,u2,l:integer;
    fn:string;
    fl:text;

begin
  {$i 0.lrs}
  {$i 2.lrs}
  {$i 3.lrs}
  {$i 4.lrs}
  assign(fl,'val.txt');
  reset(fl);
  read(fl,l,u);
  close(fl);
  c:=#0;  s:=false;
  if paramstr(1)<>'' then
  if paramstr(1)='colors+' then colors:=true
  else
  if paramstr(1)='colors-' then colors:=false
  else halt;
  init();
  UpdateGraph(UpdateOff);
  if paramstr(3)<>'' then
  begin
  fn:=paramstr(3);
  Unpackres(fn);
  p:=GetImage(fn+'.bmp');
  delfile(fn+'.bmp');
  PutImage(0,0,p^,normalput);
  GetAnim(0,0,24,24,White,a);
  ClearDevice;
  end;
  UpdateGraph(UpdateOn);
  u1:=u;
  repeat
  UpdateGraph(UpdateOff);
  BackGround();
  if colors then setcolor(brown)
            else setcolor(white);
  setlinestyle(solidln,0,12);
  u2:=90-u1;
  r:=brench(setcoord(350,600),h(l),u2+u,true);
  if s=false then if u>u1-10 then u:=u-1;
  if s=true then if u<u1+10 then u:=u+1;
  if u=u1-10 then s:=true;
  if u=u1+10 then s:=false;
  Build(r,u,5);
  UpdateGraph(UpdateOn);
  delay(25);
  if keypressed then c:=readkey;
  until c=#27;
end.

