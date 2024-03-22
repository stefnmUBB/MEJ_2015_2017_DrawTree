program copac;
{$AppType GUI}
uses wingraph, wincrt, winmouse,Lresources,sysutils;


//GENERIC///////////////////////////////////////////////////////////////////////

procedure unpack;
procedure saveres(res:string);
var stream:TLazarusResourceStream;
begin
  Stream:=TLazarusResourceStream.create(res,nil);
  Stream.SaveToFile('Images\'+res+'.bmp');
  stream.free();
end;

begin
  {$i Resources/background.lrs}  saveres('background');
  {$i Resources/background2.lrs} saveres('background2');
  {$i Resources/background3.lrs} saveres('background3');
  {$i Resources/background41.lrs}saveres('background41');
  {$i Resources/background42.lrs}saveres('background42');
  {$i Resources/background43.lrs}saveres('background43');
  {$i Resources/background44.lrs}saveres('background44');
  {$i Resources/background45.lrs}saveres('background45');
  {$i Resources/check.lrs}       saveres('check');
  {$i Resources/check0.lrs}      saveres('check0');
  {$i Resources/check1.lrs}      saveres('check1');
  {$i Resources/s1.lrs}          saveres('s1');
  {$i Resources/s2.lrs}          saveres('s2');
  {$i Resources/s3.lrs}          saveres('s3');
  {$i Resources/s4.lrs}          saveres('s4');
  {$i Resources/s11.lrs}         saveres('s11');
  {$i Resources/s21.lrs}         saveres('s21');
  {$i Resources/s31.lrs}         saveres('s31');
  {$i Resources/s41.lrs}         saveres('s41');
  {$i Resources/select1.lrs}     saveres('select1');
  {$i Resources/select2.lrs}     saveres('select2');
  {$i Resources/select3.lrs}     saveres('select3');
  {$i Resources/select4.lrs}     saveres('select4');
  {$i Resources/tree1.lrs}       saveres('tree1');
  {$i Resources/tree2.lrs}       saveres('tree2');
  {$i Resources/tree3.lrs}       saveres('tree3');
  {$i Resources/tree4.lrs}       saveres('tree4');
end;

procedure delete();
procedure delfile(s:string);
var f:text;
begin
  assign(f,'Images/'+s+'.bmp');
  erase(f);
end;

begin
  delfile('background');
  delfile('background2');
  delfile('background3');
  delfile('background41');
  delfile('background42');
  delfile('background43');
  delfile('background44');
  delfile('background45');
  delfile('check');
  delfile('check0');
  delfile('check1');
  delfile('s1');
  delfile('s2');
  delfile('s3');
  delfile('s4');
  delfile('s11');
  delfile('s21');
  delfile('s31');
  delfile('s41');
  delfile('select1');
  delfile('select2');
  delfile('select3');
  delfile('select4');
  delfile('tree1');
  delfile('tree2');
  delfile('tree3');
  delfile('tree4');
  removedir('Images');
end;

function LoadBMP(s:string):pointer;
var f:file;
    size:longint;
begin
  assign(f,s); {$i-} reset(f,1); {$i+}
  size:=FileSize(f);
  GetMem(LoadBMP,size);
  BlockRead(f,LoadBMP^,size);
  Close(f);
end;

Var check0,check1,leaf1,leaf11,leaf2,leaf21,leaf3,leaf31,
    leaf4,leaf41,check:AnimatType;
    wcolors: boolean;

procedure Init();
var gd,gm:smallint;
begin
  gd:=noPalette;
  gm:=mCustom;
  SetWindowSize(1000,600);
  InitGraph(gd,gm,'Dessine-moi un arbre');
end;

procedure create();
var bitmap:pointer;
begin
  writebuf(' ');
   UpdateGraph(UpdateOff);
  bitmap:=LoadBMP('Images/check0.bmp');
  PutImage(0,0,bitmap^,normalput);
  GetAnim(0,0,49,49,white,check0);
  bitmap:=LoadBMP('Images/check1.bmp');
  PutImage(0,0,bitmap^,normalput);
  GetAnim(0,0,49,49,white,check1);
  bitmap:=LoadBMP('Images/s1.bmp');
  PutImage(0,0,bitmap^,normalput);
  GetAnim(0,0,24,24,white,leaf1);
    bitmap:=LoadBMP('Images/s11.bmp');
  PutImage(0,0,bitmap^,normalput);
  GetAnim(0,0,24,24,white,leaf11);
    bitmap:=LoadBMP('Images/s2.bmp');
  PutImage(0,0,bitmap^,normalput);
  GetAnim(0,0,24,24,white,leaf2);
   bitmap:=LoadBMP('Images/s21.bmp');
  PutImage(0,0,bitmap^,normalput);
  GetAnim(0,0,24,24,white,leaf21);
    bitmap:=LoadBMP('Images/s3.bmp');
  PutImage(0,0,bitmap^,normalput);
  GetAnim(0,0,24,24,white,leaf3);
  bitmap:=LoadBMP('Images/s31.bmp');
  PutImage(0,0,bitmap^,normalput);
  GetAnim(0,0,24,24,white,leaf31);
  bitmap:=LoadBMP('Images/s4.bmp');
  PutImage(0,0,bitmap^,normalput);
  GetAnim(0,0,24,24,white,leaf4);
  bitmap:=LoadBMP('Images/s41.bmp');
  PutImage(0,0,bitmap^,normalput);
  GetAnim(0,0,24,24,white,leaf41);

  bitmap:=LoadBMP('Images/check.bmp');
  PutImage(0,0,bitmap^,normalput);
  GetAnim(0,0,19,19,white,check);
  freemem(bitmap);
  SetFillStyle(SolidFill,white);
  bar(0,0,1000,600);
  SetFillStyle(SolidFill,black);
  bar(0,0,700,500);
  Bar(200,510,700,580);
  PutAnim(10,510,check0,transput);
  SetColor(Black);
  OutTextXY(70,525,'Colors');
  Rectangle(750,10,950,100);
  Putimage(751,11,LoadBMP('Images/tree1.bmp')^,NormalPut);
  Rectangle(750,110,950,200);
  Putimage(751,111,LoadBMP('Images/tree2.bmp')^,NormalPut);
  Rectangle(750,210,950,300);
  Putimage(751,211,LoadBMP('Images/tree3.bmp')^,NormalPut);
  Rectangle(750,310,950,400);
  Putimage(751,311,LoadBMP('Images/tree4.bmp')^,NormalPut);
  Rectangle(750,450,800,500);
  Rectangle(800,450,850,500);
  Rectangle(850,450,900,500);
  Rectangle(900,450,950,500);
  wcolors:=false;
  UpdateGraph(UpdateOn);
end;

procedure GetColorB();
begin
  UpdateGraph(UpdateOn);
  if (GetMouseX>=10) and(GetMouseX<=60) and
    (GetMouseY>=510)and(GetMouseY<=560) and
     ((GetMouseButtons and MouseLeftButton)<>0)  then
    begin
      Repeat Until GetMouseButtons and MouseActionDown=0;
      if not wcolors then
                   PutAnim(10,510,check1,transput)
      else
                   putAnim(10,510,check0,transput);
     wcolors:=not wcolors;
    end;
  UpdateGraph(UpdateOff);
end;

var select:byte=0;

procedure getsel;
begin
    UpdateGraph(UpdateOff);
    putimage(750,450,LoadBMP('Images/select1.bmp')^,NormalPut);
    if select=1 then putanim(750,450,check,transput);
    putimage(800,450,LoadBMP('Images/select2.bmp')^,NormalPut);
    if select=2 then putanim(800,450,check,transput);
    putimage(850,450,LoadBMP('Images/select3.bmp')^,NormalPut);
    if select=3 then putanim(850,450,check,transput);
    putimage(900,450,LoadBMP('Images/select4.bmp')^,NormalPut);
    if select=4 then putanim(900,450,check,transput);
    Rectangle(750,450,800,500);
    Rectangle(800,450,850,500);
    Rectangle(850,450,900,500);
    Rectangle(900,450,950,500);
  UpdateGraph(UpdateOn);
  SetLineStyle(SolidLn,0,1);
  if (GetMouseX>=750) and(GetMouseX<=800) and
    (GetMouseY>=450)and(GetMouseY<=500) and
     ((GetMouseButtons and MouseLeftButton)<>0)  then
    begin
      select:=1;
      setcolor(red);
      rectangle(750,450,800,500);
      Repeat Until GetMouseButtons and MouseActionDown=0;
    end
      else
    begin
      setcolor(black);
      rectangle(750,450,800,500);
    end;

    if (GetMouseX>=800) and(GetMouseX<=850) and
    (GetMouseY>=450)and(GetMouseY<=500) and
     ((GetMouseButtons and MouseLeftButton)<>0)  then
    begin
      select:=2;
      setcolor(red);
      rectangle(800,450,850,500);
      Repeat Until GetMouseButtons and MouseActionDown=0;
    end
      else
    begin
      setcolor(black);
      rectangle(800,450,850,500);
    end;

     if (GetMouseX>=850) and(GetMouseX<=900) and
    (GetMouseY>=450)and(GetMouseY<=500) and
     ((GetMouseButtons and MouseLeftButton)<>0)  then
    begin
      select:=3;
      setcolor(red);
      rectangle(850,450,900,500);
      Repeat Until GetMouseButtons and MouseActionDown=0;
    end
      else
    begin
      setcolor(black);
      rectangle(850,450,900,500);
    end;

    if (GetMouseX>=900) and(GetMouseX<=950) and
    (GetMouseY>=450)and(GetMouseY<=500) and
     ((GetMouseButtons and MouseLeftButton)<>0)  then
    begin
      select:=4;
      setcolor(red);
      rectangle(900,450,950,500);
      Repeat Until GetMouseButtons and MouseActionDown=0;
    end
      else
    begin
      setcolor(black);
      rectangle(900,450,950,500);
    end;
end;

var crty:integer=510;

procedure resety;
begin
  crty:=510;
end;

procedure show(s:string;color:integer);
begin
  moveto(200,crty);
  setcolor(color);
  writebuf(s);
  crty:=crty+15;
  if crty>580 then
               begin
                 bar(200,510,700,580);
                 crty:=510;
               end;
end;

procedure writeln();
begin
  moveto(200,crty+15);
  if crty>580 then
               begin
                 bar(200,510,700,850);
                 crty:=510;
               end;
end;

procedure read(var x:integer;n:integer);
var s:shortstring;
    err:integer;
begin
  moveto(200,crty);
  setcolor(getrgbcolor(255,255,255));
  readbuf(s,20);
  val(s,x,err);
  if err<>0 then x:=n;
  writeln();
end;

procedure resetcolor();
begin
  PutAnim(10,510,check0,transput);
  wcolors:=false;
end;
var no:byte;

procedure exportbmp();
var c:char;
    p:pointer;
    size:longint;
    f:file;
begin
  c:=#0;
  if keypressed then c:=readkey;
  if c=#31 then
             begin
               size:=imagesize(0,0,699,499);
               GetMem(p,size);
               getimage(0,0,699,499,p^);
               assign(f,'output.bmp');
               rewrite(f,1);
               blockwrite(f,p,size);
               close(f);
             end;
end;

//TREE1/////////////////////////////////////////////////////////////////////////
Procedure tree1(x,y:integer);
type coordinates1 = record x,y:integer; end;
  function setcoord(x,y:integer):coordinates1;
  begin
    result.x:=x;
    result.y:=y;
  end;

function angle(pos:coordinates1;l,u:integer):coordinates1;
var v1,v2: integer;
    coeff,c2:integer;
    terminal:boolean;
begin
  terminal:=false;
  if l<=5 then terminal:=true;
  v1:=trunc(l*cos(Pi*u/180));
  v2:=trunc(l*sin(Pi*u/180));
  result:=setcoord(pos.x-v1,
                   pos.y-v2);
  if wcolors then
             if terminal then
                           Begin
                            c2:=random(2);
                                      if select=1 then
                                      if c2=1 then
                                      setcolor(getrgbcolor(34,177,76))
                                      else
                                       setcolor(getrgbcolor(22,157,57));
                                      if select=2 then
                                      if c2=1 then
                                      setcolor(getrgbcolor(255,127,39))
                                      else
                                       setcolor(getrgbcolor(237,28,36));
                                      if select=3 then setcolor(getrgbcolor(23,157,9));
                                      if (select=1)or(select=2) then circle(pos.x,pos.y,15);
                                      if select=3 then circle(pos.x,pos.y,3);
                                      coeff:=1;
                                      if coeff=1 then
                                       begin
                                         if select=1 then
                                         if c2=1 then
                                         putanim(pos.x,pos.y,leaf1,transput)
                                         else putanim(pos.x-25,pos.y,leaf11,Transput);
                                         if select=2 then
                                         if c2=1 then
                                         putanim(pos.x,pos.y,leaf2,transput)
                                         else putanim(pos.x-25,pos.y,leaf21,Transput);
                                         if select=3 then
                                         if random(100)=1 then
                                         if c2=1 then
                                         putanim(pos.x,pos.y,leaf3,transput)
                                         else putanim(pos.x-25,pos.y,leaf31,Transput);
                                       end;
                           end
                         else setcolor(brown)
            else setcolor(white);
             if wcolors then
             begin
              if select=4 then
                            begin
                              setcolor(white);
                              setlinestyle(SolidLn,0,5);
                              line(pos.x,pos.y-5,result.x,result.y-5);
                            end;
              setcolor(brown);
              end;
              line(pos.x,pos.y,result.x,result.y);
end;

type  pbrench= ^brench;
      brench= record
             nod:coordinates1;
             b1,b2:pbrench;
           end;

procedure Draw(b:pbrench;u,l,width:integer);
var aux:pbrench;
    l1:integer;
begin
  UpdateGraph(UpdateOn);
  If CloseGraphRequest then halt;
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

var s:shortstring;
    err,l,u,width:integer;
begin
  if no<>1 then ResetColor();
  no:=1;
  setbkcolor(black);
  Bar(200,510,700,580); resety;
  show('Generating...',getrgbcolor(255,100,50));
  UpdateGraph(UpdateOff);
  width:=10;
   l:=150;
  u:=60;
  setbkcolor(Black);
  Bar(0,0,700,500);
    if not wcolors then bar(0,0,700,500)
                 else
                 if (select=1)or(select=0) then PutImage(0,0,LoadBMP('Images/background.bmp')^,NormalPut)
                 else
                 if select=2 then PutImage(0,0,LoadBMP('Images/background3.bmp')^,NormalPut)
                 else
                 if select=3 then PutImage(0,0,LoadBMP('Images/background2.bmp')^,NormalPut)
                 else
                 if select=4 then PutImage(0,0,LoadBMP('Images/background41.bmp')^,NormalPut);
  SetColor(White);
  SetLineStyle(SolidLn,0,width);
  b.nod:=angle(setcoord(x,y),l,90);
  Draw(@b,u,l, width);
  show('Tree generated succesfuly.',getrgbcolor(155,200,50));
  UpdateGraph(UpdateOn);
end;

Function GetTree1B:Boolean;
Begin
  GetTree1B:=False;
  UpdateGraph(UpdateOn);
  if (GetMouseX>=750) and(GetMouseX<=950) and
    (GetMouseY>=10)and(GetMouseY<=100) and
     ((GetMouseButtons and MouseLeftButton)<>0)  then
    begin
      setcolor(red);
      rectangle(750,10,950,100);
      Repeat Until GetMouseButtons and MouseActionDown=0;
      GetTree1B:=True;
    end
      else
    begin
      setcolor(black);
      rectangle(750,10,950,100);
    end;

  UpdateGraph(UpdateOff);
End;


//TREE2/////////////////////////////////////////////////////////////////////////

procedure tree2(x,y:integer);
type coordinates2 = record x,y,u:integer; end;
     function setcoord2(x,y:integer):coordinates2;
     begin
       result.x:=x;
       result.y:=y;
     end;

function angle2(pos:coordinates2;l,u:integer;show:boolean):coordinates2;
     var v1,v2: integer;
         x:byte;
         terminal:boolean;
         coeff,c2:integer;
     begin
       terminal:=false;
       if l=1 then terminal:=true;
       v1:=trunc(l*cos(Pi*u/180));
       v2:=trunc(l*sin(Pi*u/180));
       result:=setcoord2(pos.x-v1,pos.y-v2);
       result.u:=u;
       if wcolors then
                   if not terminal then setcolor(brown)
                                   else
                                    begin
                                       c2:=random(2);
                                      if select=1 then
                                      if c2=1 then
                                      setcolor(getrgbcolor(34,177,76))
                                      else
                                       setcolor(getrgbcolor(22,157,57));
                                      if select=2 then
                                      if c2=1 then
                                      setcolor(getrgbcolor(255,127,39))
                                      else
                                       setcolor(getrgbcolor(237,28,36));
                                      if select=3 then setcolor(getrgbcolor(23,157,9));
                                      if (select=1)or(select=2) then circle(pos.x,pos.y,15);
                                      if select=3 then circle(pos.x,pos.y,3);
                                      coeff:=1;
                                      if coeff=1 then
                                       begin
                                         if select=1 then
                                         if c2=1 then
                                         putanim(pos.x,pos.y,leaf1,transput)
                                         else putanim(pos.x-25,pos.y,leaf11,Transput);
                                         if select=2 then
                                         if c2=1 then
                                         putanim(pos.x,pos.y,leaf2,transput)
                                         else putanim(pos.x-25,pos.y,leaf21,Transput);
                                         if select=3 then
                                         if random(10)=1 then
                                         if c2=1 then
                                         putanim(pos.x,pos.y,leaf3,transput)
                                         else putanim(pos.x-25,pos.y,leaf31,Transput);
                                       end;
                                    end;
     if(show) then
             begin
             if wcolors then
             begin
              if select=4 then
                            begin
                              setcolor(white);
                              setlinestyle(SolidLn,0,3);
                              line(pos.x,pos.y-3,result.x,result.y-3);
                            end;
              setcolor(brown);
              end;
              line(pos.x,pos.y,result.x,result.y);
             end;
     end;

function f(x:integer):integer;
begin
  f:=3*x div 5;
end;

procedure build1(pos:coordinates2;l,u:integer;width:integer);
var p1,p2:coordinates2;
begin
  if width>1 then width:=3*width div 5;
  setlinestyle(solidln,0,width);
  l:=f(l);
  p1:=angle2(pos,f(l),-u+pos.u,true);
  p2:=angle2(pos,f(l), u+pos.u,true);
  if l>1 then
  begin
  build1(p1,l,u,width);
  build1(p2,l,u,width);
  end;
end;
var width,l,u:integer;
    p:coordinates2;
begin
  if no<>2 then ResetColor();
  no:=2;
  if not wcolors then bar(0,0,700,500)
                 else
                 if (select=1)or(select=0) then PutImage(0,0,LoadBMP('Images/background.bmp')^,NormalPut)
                 else
                 if select=2 then PutImage(0,0,LoadBMP('Images/background3.bmp')^,NormalPut)
                 else
                 if select=3 then PutImage(0,0,LoadBMP('Images/background2.bmp')^,NormalPut)
                 else
                 if select=4 then PutImage(0,0,LoadBMP('Images/background41.bmp')^,NormalPut);
  Bar(200,510,700,570);  resety;
  show('Generating...',getrgbcolor(255,100,50));
  UpdateGraph(UpdateOff);
  l:=200;
  u:=random(45);
  if u<10 then u:=10;
  width:=10;
  if not wcolors then setcolor(white)
                 else setcolor(brown);
  setlinestyle(solidln,0,width);
  line(x,y,x,y-l);
  p:=setcoord2(x,y-l);
  p.u:=90;
  build1(p,5*l div 3,u,width);
  show('Tree generated succesfuly.',getrgbcolor(155,200,50));
  UpdateGraph(UpdateOn);
end;

Function GetTree2B:Boolean;
Begin
  GetTree2B:=False;
  UpdateGraph(UpdateOn);
  if (GetMouseX>=750) and(GetMouseX<=950) and
    (GetMouseY>=110)and(GetMouseY<=200) and
     ((GetMouseButtons and MouseLeftButton)<>0)  then
    begin
      setcolor(red);
      rectangle(750,110,950,200);
      Repeat Until GetMouseButtons and MouseActionDown=0;
      GetTree2B:=True;
    end
      else
    begin
      setcolor(black);
      rectangle(750,110,950,200);
    end;
end;


//TREE3/////////////////////////////////////////////////////////////////////////

Procedure Tree3(x,y:integer);
type coordinates = record x,y,u:integer; end;
     function setcoord(x,y:integer):coordinates;
     begin
       result.x:=x;
       result.y:=y;
     end;

function angle(pos:coordinates;l,u:integer;show:boolean):coordinates;
     var v1,v2: integer;
         x:byte;
         terminal:boolean;
         coeff,c2:integer;
     begin
       terminal := false;
       if l=1 then terminal:=true;
       v1:=trunc(l*cos(Pi*u/180));
       v2:=trunc(l*sin(Pi*u/180));
       result:=setcoord(pos.x-v1,pos.y-v2);
       result.u:=u;
       if show then
        begin
        if wcolors then
                    if not terminal then setcolor(brown)
                                    else
                                     begin
                                       setlinestyle(solidln,0,1);
                                       c2:=random(3);
                                      if select=1 then
                                      if c2=1 then
                                      setcolor(getrgbcolor(34,177,76))
                                      else
                                       setcolor(getrgbcolor(22,157,57));
                                      if select=2 then
                                      begin
                                      if c2=1 then
                                      setcolor(getrgbcolor(255,127,39))
                                      else
                                      if c2=3 then setcolor(getrgbcolor(237,28,36))
                                      else setcolor(getrgbcolor(22,157,57));
                                      end;
                                      if select=3 then setcolor(getrgbcolor(23,157,9));
                                      if (select=1)or(select=2) then circle(pos.x,pos.y,10);
                                      if select=3 then circle(pos.x,pos.y,3);
                                      coeff:=1;
                                      if coeff=1 then
                                       begin
                                         if select=1 then
                                         if c2=1 then
                                         if random(100)=1 then
                                         putanim(pos.x,pos.y,leaf1,transput)
                                         else putanim(pos.x-25,pos.y,leaf11,Transput);
                                         if select=2 then
                                         if random(10)=1 then
                                         if c2=1 then
                                         putanim(pos.x,pos.y,leaf2,transput)
                                         else putanim(pos.x-25,pos.y,leaf21,Transput);
                                         if select=3 then
                                         if random(10)=1 then
                                         if c2=1 then
                                         putanim(pos.x,pos.y,leaf3,transput)
                                         else putanim(pos.x-25,pos.y,leaf31,Transput);
                                       end;
                                     end;
                                   end;
        if(show) then
             begin
             if wcolors then
             begin
              if select=4 then
                            begin
                              setcolor(white);
                              setlinestyle(SolidLn,0,5);
                              line(pos.x,pos.y-5,result.x,result.y-5);
                            end;
              setcolor(brown);
              end;
              line(pos.x,pos.y,result.x,result.y);
              setlinestyle(solidln,0,3);
             end;

        end;

function f(x:integer):integer;
begin
  f:=3*x div 5;
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

var c:coordinates;
    u,l:integer;

begin
  if no<>3 then resetcolor();
  no:=3;
  bar(200,510,700,580);   resety;
  show('u=(<35)                                                 ',white);
  read(u,30);
  show('l=(<200)                                                ',white);
  read(l,150);
  if l>200 then l:=200;
    if not wcolors then bar(0,0,700,500)
                 else
                 if (select=1)or(select=0) then PutImage(0,0,LoadBMP('Images/background.bmp')^,NormalPut)
                 else
                 if select=2 then PutImage(0,0,LoadBMP('Images/background3.bmp')^,NormalPut)
                 else
                 if select=3 then PutImage(0,0,LoadBMP('Images/background2.bmp')^,NormalPut)
                 else
                 if select=4 then PutImage(0,0,LoadBMP('Images/background41.bmp')^,NormalPut);
  bar(200,510,700,560);   resety;
  show('Generating...',getrgbcolor(255,100,50));
  UpdateGraph(UpdateOff);
  if not wcolors then setcolor(white) else setcolor(brown);
  setlinestyle(solidln,0,5);
  c:=angle(setcoord(x,y),100,90,true);
  setlinestyle(solidln,0,3);
  build2(c,l,u,10);
  show('Tree generated succesfuly.',getrgbcolor(155,200,50));
  UpdateGraph(UpdateOn);
end;

Function GetTree3B:Boolean;
Begin
  GetTree3B:=False;
  UpdateGraph(UpdateOn);
  if (GetMouseX>=750) and(GetMouseX<=950) and
    (GetMouseY>=210)and(GetMouseY<=300) and
     ((GetMouseButtons and MouseLeftButton)<>0)  then
    begin
      setcolor(red);
      rectangle(750,210,950,300);
      Repeat Until GetMouseButtons and MouseActionDown=0;
      GetTree3B:=True;
    end
      else
    begin
      setcolor(black);
      rectangle(750,210,950,300);
    end;
end;

//TREE4/////////////////////////////////////////////////////////////////////////

procedure tree4(x,y:integer);
type coordinates = record x,y,u:integer; end;
function setcoord(x,y:integer):coordinates;
begin
  setcoord.x:=x;
  setcoord.y:=y;
end;

function angle(pos:coordinates;l,u:integer;show:boolean):coordinates;
var terminal:boolean;
    coeff,c2:integer;
begin
  terminal:=false;
  if l=1 then terminal:=true;
  result:=setcoord(pos.x-trunc(l*cos(PI*u/180)),
                   pos.y-trunc(l*sin(PI*u/180)));
  if wcolors then
                   if not terminal then setcolor(brown)
                                   else
                                    begin
                                      c2:=random(3);
                                      if select=1 then
                                      if c2=1 then
                                      setcolor(getrgbcolor(34,177,76))
                                      else
                                       setcolor(getrgbcolor(22,157,57));
                                      if select=2 then
                                      begin
                                      if c2=1 then
                                      setcolor(getrgbcolor(255,127,39))
                                      else
                                      if c2=2 then
                                       setcolor(getrgbcolor(23,157,60))
                                      else setcolor(getrgbcolor(22,157,57));
                                      end;
                                      if select=3 then setcolor(getrgbcolor(23,157,9));
                                      if (select=1)or(select=2) then circle(pos.x,pos.y,15);
                                      if select=3 then circle(pos.x,pos.y,3);
                                      coeff:=1;
                                      if coeff=1 then
                                       begin
                                         if select=1 then
                                         if c2=1 then
                                         putanim(pos.x,pos.y,leaf1,transput)
                                         else putanim(pos.x-25,pos.y,leaf11,Transput);
                                         if select=2 then
                                         if c2=1 then
                                         putanim(pos.x,pos.y,leaf2,transput)
                                         else putanim(pos.x-25,pos.y,leaf21,Transput);
                                         if select=3 then
                                         if random(13)=1 then
                                         if c2=1 then
                                         putanim(pos.x,pos.y,leaf3,transput)
                                         else putanim(pos.x-25,pos.y,leaf31,Transput);
                                       end;
                                    end;
  result.u:=u;
  if(show) then
             begin
             if wcolors then
             begin
              if select=4 then
                            begin
                              setcolor(white);
                              setlinestyle(SolidLn,0,3);
                              line(pos.x,pos.y-3,result.x,result.y-3);
                            end;
              end;
             if wcolors then setcolor(brown);
             line(pos.x,pos.y,result.x,result.y);
             end;
end;

function f(x:integer):integer;
begin
  f:=3*x div 5;
end;

function r(x:integer):integer;
begin
  r:=random(x);
  if x<10 then r:=x;
end;

function press():boolean;
var c:char;
begin
  c:=#0;
  if keypressed then c:=readkey;
  if c='x' then press:=true
  else press:=false;
end;

procedure build4(pos:coordinates;l,u,n,width:integer);
var p1,p2,aux,aux1:coordinates;
    i,w:integer;
    c:boolean;
begin
  c:=true;
  if(l>1) then
  for i:=1 to n do
  begin
    c:=true;
    setlinestyle(solidln,0,width);
    aux:=angle(pos,l div (i mod 2+1),pos.u,true);
    aux1:=angle(pos,l div (i mod 5),90+3*pos.u div 5 ,true);
    if(3*i mod 5=0) then
                     begin
                       l:=f(l);
                       u:=-u;
                       c:=false;
                     end;
    if c then if width>3 then width:=3*width div 5;
    u:=(5*u div 3)mod 45;
    p1:=angle(aux,l,-u+aux.u,true);
    build4(p1,f(l),f(u),n,width);
    p2:=angle(aux1,l,u+aux.u,true);
    build4(p2,f(l),f(u),n,width);
  end;
end;

var t:coordinates;
    xwidth:integer;
    u,l:integer;
    s:integer;
    k:boolean;
begin
    k:=true;
  if no<>4 then resetcolor();
  bar(200,510,700,580);   resety;
  u:=8;
  show('l=(<85)                                            ',white);
  read(l,85);
  if l>85 then l:=85;
  no:=4;
  xwidth:=10;
  s:=1;
  repeat
  UpdateGraph(UpdateOff);
  bar(200,510,700,580);    resety;
    if not wcolors then bar(0,0,700,500)
                 else
                 if (select=1)or(select=0) then PutImage(0,0,LoadBMP('Images/background.bmp')^,NormalPut)
                 else
                 if select=2 then PutImage(0,0,LoadBMP('Images/background3.bmp')^,NormalPut)
                 else
                 if select=3 then PutImage(0,0,LoadBMP('Images/background2.bmp')^,NormalPut)
                 else
                 if select=4 then
                 if s=1 then PutImage(0,0,LoadBMP('Images/background41.bmp')^,NormalPut)
                 else if s=2 then  PutImage(0,0,LoadBMP('Images/background42.bmp')^,NormalPut)
                 else if s=3 then PutImage(0,0,LoadBMP('Images/background43.bmp')^,NormalPut)
                 else if s=4 then PutImage(0,0,LoadBMP('Images/background44.bmp')^,NormalPut)
                 else if s=5 then PutImage(0,0,LoadBMP('Images/background45.bmp')^,NormalPut);
  s:=s+1;
  if s=6 then s:=1;
  show('Generating...',getrgbcolor(255,100,50));
  if not wcolors then setcolor(white)
                 else setcolor(brown);
  if wcolors and (select=4) then setlinestyle(solidln,0,5)
  else setlinestyle(SolidLn,0,10);
  line(x,y,x,y-l);
  t:=angle(setcoord(x,y),l,90-10+u,true);
  build4(t,l,u,2,xwidth);
  if k then u:=u-1;
  if not k then u:=u+1;
  if u<8 then
            begin
              u:=8;
              k:=false;
            end;
  if u>10 then
            begin
             u:=10;
             k:=true;
            end;
  show('Tree generated succesfuly.',getrgbcolor(155,200,50));
  show('Press X to close the animation.',getrgbcolor(250,234,31));
  UpdateGraph(UpdateOn);
  delay(10);
  if closegraphrequest then delete();
  until closegraphrequest or press;
end;

Function GetTree4B:Boolean;
Begin
  GetTree4B:=False;
  UpdateGraph(UpdateOn);
  if (GetMouseX>=750) and(GetMouseX<=950) and
    (GetMouseY>=310)and(GetMouseY<=400) and
     ((GetMouseButtons and MouseLeftButton)<>0)  then
    begin
      setcolor(red);
      rectangle(750,310,950,400);
      Repeat Until GetMouseButtons and MouseActionDown=0;
      GetTree4B:=True;
    end
      else
    begin
      setcolor(black);
      rectangle(750,310,950,400);
    end;
end;

//MAIN//////////////////////////////////////////////////////////////////////////

{$R *.res}

begin
  createdir('Images');
  unpack;
  Init();
  Create();
  repeat
  getsel;
  GetColorB();
  if GetTree1B() then
    tree1(350,495)
  else
  if GetTree2B() then
   tree2(350,495)
  else
  if GetTree3B() then tree3(350,495)
  else
  if GetTree4B() then tree4(350,495);
  if closegraphrequest then delete;
  until CloseGraphRequest;
end.

