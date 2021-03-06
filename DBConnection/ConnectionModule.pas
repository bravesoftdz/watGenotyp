{
Program:      Genotyp Projekt WAT.
File:         ConnectionModule
Description:  Podłaczenie do bazy danych MySQL Projekt
Notes:
2018-03-10    Piotr Murawski  Rozpoczęcie projektu
}

unit ConnectionModule;

interface

uses
  Aurelius.Drivers.Interfaces,
  Aurelius.SQL.MySql,
  Aurelius.Schema.MySql,
  Aurelius.Drivers.FireDac,
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.ConsoleUI.Wait, Data.DB, FireDAC.Comp.Client;

type
  TFireDacMySQLConnection = class(TDataModule)
    Connection: TFDConnection;
  private
  public
    class function CreateConnection: IDBConnection;
    class function CreateFactory: IDBConnectionFactory;
  end;

implementation
{%CLASSGROUP 'System.Classes.TPersistent'}

uses
  Aurelius.Drivers.Base;

{$R *.dfm}

{ TMyConnectionModule }

class function TFireDacMySQLConnection.CreateConnection: IDBConnection;
var
  DataModule: TFireDacMySQLConnection;
begin
  DataModule := TFireDacMySQLConnection.Create(nil);
  Result := TFireDacConnectionAdapter.Create(DataModule.Connection, 'MySQL', DataModule);
end;

class function TFireDacMySQLConnection.CreateFactory: IDBConnectionFactory;
begin
  Result := TDBConnectionFactory.Create(
    function: IDBConnection
    begin
      Result := CreateConnection;
    end
  );
end;



end.