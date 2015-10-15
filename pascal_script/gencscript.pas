{*******************************************************************************
  Copyright (C) Christian Ulrich info@cu-tec.de

  This source is free software; you can redistribute it and/or modify it under
  the terms of the GNU General Public License as published by the Free
  Software Foundation; either version 2 of the License, or commercial alternative
  contact us for more information

  This code is distributed in the hope that it will be useful, but WITHOUT ANY
  WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
  FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
  details.

  A copy of the GNU General Public License is available on the World Wide Web
  at <http://www.gnu.org/copyleft/gpl.html>. You can also obtain it by writing
  to the Free Software Foundation, Inc., 59 Temple Place - Suite 330, Boston,
  MA 02111-1307, USA.
Created 10.10.2015
*******************************************************************************}
unit gencscript;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, genpascalscript, uCCompiler, process, uPSRuntime;

type

  { TCScript }

  TCScript = class(TPascalScript)
  protected
    function GetTyp: string; override;
  public
    procedure Init; override;
  end;

implementation

function TCScript.GetTyp: string;
begin
  Result:='C';
end;

procedure TCScript.Init;
begin
  Process := TProcess.Create(nil);
  Process.ShowWindow:=swoNone;
  Compiler:= TPSOCCompiler.Create;
  Runtime:= TPSExec.Create;
  ClassImporter:= TPSRuntimeClassImporter.CreateAndRegister(Runtime, false);
end;

end.

