program pcopac;

{$AppType GUI}    //Hide the console
{$Coperators+}    //use "+=","-=", etc.


uses
  Wincrt,     
  Wingraph,
  WinMouse,
  DateUtils, Sysutils,
  LResources; 

Label _End;



Function GetImage(FName:String;Weigh,Heigh:Integer):Pointer;
//convert "bmp" files to image pointer
Var f:File;
    Size:Longint;
Begin
  Size:=ImageSize(1,1,Weigh,Heigh);
  GetMem(GetImage,Size);
  Assign(f,FName);
  {$i-}
    Reset(f,1);
  {$i+}
  If Ioresult<>0 Then Halt;
  BlockRead(f,GetImage^,Size);
  Close(f);
End;

Procedure DrawImage(BitMap:Pointer;X,Y:Integer);
Begin
  PutImage(X,Y,BitMap^,NormalPut);
End;

Procedure Delete(s:String);
Var f:Text;
Begin
  Assign(f,s);
  Erase(f);
End;

Type Copac = Object
              Public
               var Pos:Record
                        x,y:Integer;
                        End;
                   Img:AnimatType;
                   Procedure Get(input:Byte);              
                   Procedure SetXY(Input1,Input2:Integer); 
                   Procedure Draw(Input1,Input2:Integer);  
              Private
                    Procedure Draw_(input1,input2:Integer);
                    Var Image:Pointer;
               End;

Procedure Copac.Get(Input:Byte);
Var Stream:TLazarusResourceStream;
    name:String;

Begin
  Str(Input,name);
  if length(name)=1 then name:='0'+name;
  name:='frame-'+name;
  Try
    Stream:=TLazarusResourceStream.Create(name,nil);
    name+='.bmp';
    Stream.SaveToFile(name);
    Image:=PCopac.GetImage(Name,275,200);
    Delete(name);
    Draw_(1,1);
    GetAnim(1,1,275,200,GetRGBColor(255,255,255),Img);
    finally
    Stream.Free;
  end;
end;

Procedure Copac.SetXY(input1,Input2:Integer);
Begin
  Pos.X:=Input1;
  Pos.Y:=Input2;
end;

Procedure Copac.Draw_(input1,input2:Integer);
Begin
  DrawImage(Image,Input1,Input2);
end;

Procedure Init;  //Init Graph window
Var GDriver,GMode:SmallInt;
Begin
  GDriver:=NoPalette;
  GMode:=MCustom;
  SetWindowSize(700,500);
  InitGraph(GDriver,GMode,'Copac.exe');
end;

Procedure Copac.Draw(Input1,Input2:Integer);
Begin
  PutAnim(Input1,Input2,Img,Transput);
end;

Function GetBackGround:Pointer; //Read Background BMP from resource image
Var Stream:TLazarusResourceStream;
Begin
  Try
    Stream:=TLazarusResourceStream.Create('0',nil);
    Stream.SaveToFile('0.bmp');
    GetBackGround:=PCopac.GetImage('0.bmp',700,500);
    Delete('0.bmp');
  finally
    Stream.Free;
  end;
end;

Var nCopac:Byte;

procedure wind();
var ch:char;
    s1:string;
Begin
  if keypressed then ch:=readkey;
  case ch of
  '+':if nCopac<>12 then nCopac+=1;
  '-':if nCopac<>1  then nCopac-=1;
  end;
  str(nCopac,s1);
  outtextxy(10,400,'Viteza vantului (+/-): '+s1);
end;

Var c:array[1..12] of Copac;
    i:Byte;
    BackGround:Pointer;

begin

//Include Image Resources
  {$I Resources/0.lrs}        //Background
  {$I Resources/frame-01.lrs} //"Copac" Custom:1
  {$I Resources/frame-02.lrs} //"Copac" Custom:2
  {$I Resources/frame-03.lrs} //"Copac" Custom:3
  {$I Resources/frame-04.lrs} //"Copac" Custom:4
  {$I Resources/frame-05.lrs} //"Copac" Custom:5
  {$I Resources/frame-06.lrs} //"Copac" Custom:6
  {$I Resources/frame-07.lrs} //"Copac" Custom:7
  {$I Resources/frame-08.lrs} //"Copac" Custom:8
  {$I Resources/frame-09.lrs} //"Copac" Custom:9
  {$I Resources/frame-10.lrs} //"Copac" Custom:10
  {$I Resources/frame-11.lrs} //"Copac" Custom:11
  {$I Resources/frame-12.lrs} //"Copac" Custom:12


  Init;
  BackGround:=GetBackGround;

  UpdateGraph(UpdateOff);
  For i:=1 to 12 do
  Begin
  c[i].get(i);
  ClearDevice;
  End;
  UpdateGraph(UpdateOn);

  DrawImage(BackGround,0,0);
  nCopac:=12;
  UpdateGraph(UpdateOff);

  Repeat
  For i:=1 to nCopac do
  Begin
  UpdateGraph(UpdateOff);
  DrawImage(BackGround,0,0);
  c[i].Draw(100,100);
  c[i].Draw(400,150);
  Wind();
  UpdateGraph(UpdateOn);
  Delay(200);
  End;

  until CloseGraphRequest;

  _End:
  CloseGraph;

end.

