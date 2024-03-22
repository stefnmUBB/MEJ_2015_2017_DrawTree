program copac3;
{ $APPTYPE GUI}
{$mode objfpc}
{$Coperators+}
uses wingraph, wincrt, fractal_tree, LResources;

procedure Init();
Var GraphDriver, GraphMode: SmallInt;
begin
  GraphDriver:=noPalette;
  Graphmode:=MCustom;
  SetWindowSize(700,500);
  initgraph(GraphDriver, GraphMode, 'Copac | L''arbre');
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

procedure BackGround();
var stream:TLazarusResourceStream;
    bitmap:pointer;
begin
  stream:=TLazarusResourceStream.Create('0',nil);
  stream.savetofile('0.bmp');
  bitmap:=GetImage('0.bmp');
  PutImage(0,0,bitmap^,NormalPut);
end;

var l,u:integer;

begin
  {$i 0.lrs}
  writeln('l=');
  readln(l);
  writeln('u=');
  readln(u);
  Init();
  SwitchColor();
  repeat
  UpdateGraph(UpdateOff);
  BackGround();
  Arbre(400,400,l,u);
  UpdateGraph(UpdateOn);
  delay(100);
  readkey;
  until keypressed or closegraphrequest;
  CloseGraph;
end.


