{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit NewPackage;

interface

uses
  LazarusPackageIntf;

implementation

procedure Register;
begin
end;

initialization
  RegisterPackage('NewPackage', @Register);
end.
