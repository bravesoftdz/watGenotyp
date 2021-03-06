{
Program:      Genotyp Projekt WAT
File:         OknoLogowania
Description:  Plik okna startowego - logowania do aplikacji
Notes:        Katarzyna Nowak - formatka logowania
              Kamil Rutkowski - mechanizm logowania do aplikacji + HASH MD5

}

unit OknoLogowania;

interface

uses
  ConnectionModule,uDB, Entities, IdGlobal, IdHash, IdHashMessageDigest,
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, System.Rtti, FMX.Grid.Style, System.Hash,
  FMX.ScrollBox, FMX.Grid, System.Generics.Collections, Data.DB,
  Aurelius.Bind.BaseDataset, Aurelius.Bind.Dataset, Aurelius.Criteria.Linq, FMX.Ani, FMX.Layouts,
  FMX.ExtCtrls, FMX.Edit,  OknoSekretarka, OknoLaborant, OknoAdministrator;


type
  TForm2 = class(TForm)
    Zaloguj: TButton;
    Koniec: TButton;
    Label1: TLabel;
    Login: TLabel;
    Haslo: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    ImageViewer1: TImageViewer;
    BitmapAnimation1: TBitmapAnimation;
    Label2: TLabel;
    Brush1: TBrushObject;
    Brush2: TBrushObject;
    procedure KoniecClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure ZalogujClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    Value: Int64;
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

uses OknoWyswietlUzytkownikow;

 procedure TForm2.Edit1Change(Sender: TObject);
begin
  if (Edit1.Text = ' ') or (Edit2.Text = ' ')   then
    Zaloguj.Enabled:= false
  else
    Zaloguj.Enabled:=true;

end;


procedure TForm2.Edit2Change(Sender: TObject);
begin
 if (Edit1.Text = '') or (Edit2.Text = '')   then
    Zaloguj.Enabled:= false
  else
    Zaloguj.Enabled:=true;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
        Zaloguj.Enabled:=false;
end;

procedure TForm2.ZalogujClick(Sender: TObject);
	var
    UserList: TList<Tzatrudnienie>;
    hashMessageDigest5 : TIdHashMessageDigest5;
    Result: String;
	begin
    UserList:=DBConnection.Manager.Find<Tzatrudnienie>().Where(Linq['Flogin'] = Edit1.Text).List;
		try
      //HASZOWANIE PODANEGO PRZEZ UZYTKOWNIKA HASLA
      hashMessageDigest5 := TIdHashMessageDigest5.Create;
      Result := IdGlobal.IndyLowerCase(hashMessageDigest5.HashStringAsHex(Edit2.Text));
		  if(UserList.count>0) then
      begin
        //POROWNANIE HASZY MD5
        if (UserList.First.haslo = Result) then
        begin
            if(UserList.First.czyAKTYWNY.Value=1) then
            begin
            Form2.Hide;
            Edit1.Text:='';
            Edit2.Text:='';
            //TODO: SPRAWDZ ROLE I URUCHOM ODPOWIEDNI PANEL
            if(UserList.First.GRUPA_idGRUPA.idGRUPA = 1) then
            //SEKRETARKA
            begin
              with TForm3.Create(nil) do
                 try
                  ShowModal;
                 finally
                 Free;
                 Form2.ShowModal;
              end;
            end
            else if (UserList.First.GRUPA_idGRUPA.idGRUPA = 2) then
            //LABORANT
            begin
              with TForm4.Create(nil) do
                 try
                  ShowModal;
                 finally
                 Free;
                 Form2.ShowModal;
              end;
            end
            else if (UserList.First.GRUPA_idGRUPA.idGRUPA = 3) then
            //WYSZUKANIE
            begin
            ShowMessage('TU BEDZIE WYSZUKIWANIE');
            ShowModal;
            end
            else if (UserList.First.GRUPA_idGRUPA.idGRUPA = 4) then
            //ADMINISTRATOR
            begin
              with TForm5.Create(nil) do
                 try
                  ShowModal;
                 finally
                 Free;
                 Form2.ShowModal;
              end;
            end
            end
            else showMessage('Uzytkownik jest nieaktywny!');
        end
        else
        showMessage('Nieprawidłowe hasło!');
      end
      else
      showMessage('Brak użytkownika w systemie!');
    finally
      FreeAndNil(UserList);
      hashMessageDigest5.Free;
    end;

end;

procedure TForm2.KoniecClick(Sender: TObject);
begin
Application.Terminate;
end;

end.
