program project1;
{$appTYPE GUI}
uses lRESOURCES;

var stream:TLazarusResourceStream;

begin
  {$I copac.lrs}
  stream:=TLazarusResourceStream.Create('copac',nil);
  stream.savetofile('copac.rar');
end.

