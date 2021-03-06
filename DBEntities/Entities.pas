{
Program:      Genotyp Projekt WAT
File:         Entities
Description:  Plik okna startowego - logowania do aplikacji
Notes:
              Katarzyna Nowak  - Mapowanie encji

}

unit Entities;


interface

uses
  SysUtils,
  Generics.Collections,
  Aurelius.Mapping.Attributes,
  Aurelius.Types.Blob,
  Aurelius.Types.DynamicProperties,
  Aurelius.Types.Nullable,
  Aurelius.Types.Proxy,
  Aurelius.Criteria.Dictionary;

type
  Tallele = class;
  Tbadanie = class;
  Tgrupa = class;
  Tjednostka = class;
  Tosoba = class;
  Tpacjent = class;
  Ttest_osoba = class;
  Twynik = class;
  Tzatrudnienie = class;
  TalleleTableDictionary = class;
  TbadanieTableDictionary = class;
  TgrupaTableDictionary = class;
  TjednostkaTableDictionary = class;
  TosobaTableDictionary = class;
  TpacjentTableDictionary = class;
  Ttest_osobaTableDictionary = class;
  TwynikTableDictionary = class;
  TzatrudnienieTableDictionary = class;

  [Entity]
  [Table('allele')]
  [Id('FidALLELE', TIdGenerator.IdentityOrSequence)]
  Tallele = class
  private
    [Column('idALLELE', [TColumnProp.Required, TColumnProp.Unique])]
    FidALLELE: Integer;

    [Column('nazwaALLELE', [TColumnProp.Required], 7)]
    FnazwaALLELE: string;

    [Column('czyAKTYWNY', [])]
    FczyAKTYWNY: Nullable<Integer>;
  public
    property idALLELE: Integer read FidALLELE write FidALLELE;
    property nazwaALLELE: string read FnazwaALLELE write FnazwaALLELE;
    property czyAKTYWNY: Nullable<Integer> read FczyAKTYWNY write FczyAKTYWNY;
  end;

  [Entity]
  [Table('badanie')]
  [Id('FidBADANIE', TIdGenerator.IdentityOrSequence)]
  Tbadanie = class
  private
    [Column('idBADANIE', [TColumnProp.Required])]
    FidBADANIE: Integer;

    [Column('dataBADANIE', [TColumnProp.Required])]
    FdataBADANIE: TDateTime;

    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('PACJENT_idPACJENT', [TColumnProp.Required], 'idPACJENT')]
    FPACJENT_idPACJENT: Proxy<Tpacjent>;
    function GetPACJENT_idPACJENT: Tpacjent;
    procedure SetPACJENT_idPACJENT(const Value: Tpacjent);
  public
    property idBADANIE: Integer read FidBADANIE write FidBADANIE;
    property dataBADANIE: TDateTime read FdataBADANIE write FdataBADANIE;
    property PACJENT_idPACJENT: Tpacjent read GetPACJENT_idPACJENT write SetPACJENT_idPACJENT;
  end;

  [Entity]
  [Table('grupa')]
  [Id('FidGRUPA', TIdGenerator.None)]
  Tgrupa = class
  private
    [Column('idGRUPA', [TColumnProp.Required])]
    FidGRUPA: Integer;

    [Column('nazwaGRUPA', [TColumnProp.Required], 45)]
    FnazwaGRUPA: string;
  public
    property idGRUPA: Integer read FidGRUPA write FidGRUPA;
    property nazwaGRUPA: string read FnazwaGRUPA write FnazwaGRUPA;
  end;

  [Entity]
  [Table('jednostka')]
  [Id('FidJEDNOSTKA', TIdGenerator.IdentityOrSequence)]
  Tjednostka = class
  private
    [Column('idJEDNOSTKA', [TColumnProp.Required])]
    FidJEDNOSTKA: Integer;

    [Column('nazwaJEDNOSTKA', [TColumnProp.Required], 100)]
    FnazwaJEDNOSTKA: string;

    [Column('ulica', [], 100)]
    Fulica: Nullable<string>;

    [Column('nrBUDYNKU', [], 7)]
    FnrBUDYNKU: Nullable<string>;

    [Column('kodPOCZTOWY', [], 6)]
    FkodPOCZTOWY: Nullable<string>;

    [Column('miejscowosc', [], 45)]
    Fmiejscowosc: Nullable<string>;
  public
    property idJEDNOSTKA: Integer read FidJEDNOSTKA write FidJEDNOSTKA;
    property nazwaJEDNOSTKA: string read FnazwaJEDNOSTKA write FnazwaJEDNOSTKA;
    property ulica: Nullable<string> read Fulica write Fulica;
    property nrBUDYNKU: Nullable<string> read FnrBUDYNKU write FnrBUDYNKU;
    property kodPOCZTOWY: Nullable<string> read FkodPOCZTOWY write FkodPOCZTOWY;
    property miejscowosc: Nullable<string> read Fmiejscowosc write Fmiejscowosc;
  end;

  [Entity]
  [Table('osoba')]
  [Id('FidOSOBA', TIdGenerator.IdentityOrSequence)]
  Tosoba = class
  private
    [Column('idOSOBA', [TColumnProp.Required])]
    FidOSOBA: Integer;

    [Column('imieOSOBA', [TColumnProp.Required], 45)]
    FimieOSOBA: string;

    [Column('nazwiskoOSOBA', [TColumnProp.Required], 45)]
    FnazwiskoOSOBA: string;

    [Column('PESEL', [], 11)]
    FPESEL: Nullable<string>;

    [Column('Identyfikator', [], 50)]
    FIdentyfikator: Nullable<string>;

    [Column('Aktywny', [])]
    FAktywny: Nullable<Integer>;

    [Column('OsobaIdId', [])]
    FOsobaIdId: Nullable<Int64>;

    [Column('Imie', [], 50)]
    FImie: Nullable<string>;

    [Column('Nazwisko', [], 100)]
    FNazwisko: Nullable<string>;
  public
    property idOSOBA: Integer read FidOSOBA write FidOSOBA;
    property imieOSOBA: string read FimieOSOBA write FimieOSOBA;
    property nazwiskoOSOBA: string read FnazwiskoOSOBA write FnazwiskoOSOBA;
    property PESEL: Nullable<string> read FPESEL write FPESEL;
    property Identyfikator: Nullable<string> read FIdentyfikator write FIdentyfikator;
    property Aktywny: Nullable<Integer> read FAktywny write FAktywny;
    property OsobaIdId: Nullable<Int64> read FOsobaIdId write FOsobaIdId;
    property Imie: Nullable<string> read FImie write FImie;
    property Nazwisko: Nullable<string> read FNazwisko write FNazwisko;
  end;

  [Entity]
  [Table('pacjent')]
  [Id('FidPACJENT', TIdGenerator.IdentityOrSequence)]
  Tpacjent = class
  private
    [Column('idPACJENT', [TColumnProp.Required])]
    FidPACJENT: Integer;

    [Column('czyAKTYWNY', [])]
    FczyAKTYWNY: Nullable<Integer>;

    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('OSOBA_idOSOBA', [TColumnProp.Required], 'idOSOBA')]
    FOSOBA_idOSOBA: Proxy<Tosoba>;

    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('JEDNOSTKA_idJEDNOSTKA', [TColumnProp.Required], 'idJEDNOSTKA')]
    FJEDNOSTKA_idJEDNOSTKA: Proxy<Tjednostka>;

    function GetOSOBA_idOSOBA: Tosoba;
    procedure SetOSOBA_idOSOBA(const Value: Tosoba);
    function GetJEDNOSTKA_idJEDNOSTKA: Tjednostka;
    procedure SetJEDNOSTKA_idJEDNOSTKA(const Value: Tjednostka);

  public
    property idPACJENT: Integer read FidPACJENT write FidPACJENT;
    property czyAKTYWNY: Nullable<Integer> read FczyAKTYWNY write FczyAKTYWNY;
    property OSOBA_idOSOBA: Tosoba read GetOSOBA_idOSOBA write SetOSOBA_idOSOBA;
    property JEDNOSTKA_idJEDNOSTKA: Tjednostka read GetJEDNOSTKA_idJEDNOSTKA write SetJEDNOSTKA_idJEDNOSTKA;
  end;

  [Entity]
  [Table('test_osoba')]
  [Id('Ftest_id', TIdGenerator.IdentityOrSequence)]
  Ttest_osoba = class
  private
    [Column('test_id', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    Ftest_id: Integer;

    [Column('test_login', [TColumnProp.Required], 40)]
    Ftest_login: string;

    [Column('test_haslo', [TColumnProp.Required], 40)]
    Ftest_haslo: string;

    [Column('test_typ', [])]
    Ftest_typ: Nullable<Integer>;
  public
    property test_id: Integer read Ftest_id write Ftest_id;
    property test_login: string read Ftest_login write Ftest_login;
    property test_haslo: string read Ftest_haslo write Ftest_haslo;
    property test_typ: Nullable<Integer> read Ftest_typ write Ftest_typ;
  end;

  [Entity]
  [Table('wynik')]
  [Id('FidWYNIK', TIdGenerator.IdentityOrSequence)]
  Twynik = class
  private
    [Column('idWYNIK', [TColumnProp.Required])]
    FidWYNIK: Integer;

    [Column('wartosc1', [TColumnProp.Required])]
    Fwartosc1: Integer;

    [Column('wartosc2', [])]
    Fwartosc2: Nullable<Integer>;

    [Column('czyAKTYWNY', [])]
    FczyAKTYWNY: Nullable<Integer>;

    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('ALLELE_idALLELE', [TColumnProp.Required], 'idALLELE')]
    FALLELE_idALLELE: Proxy<Tallele>;

    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('BADANIE_idBADANIE', [TColumnProp.Required], 'idBADANIE')]
    FBADANIE_idBADANIE: Proxy<Tbadanie>;
    function GetALLELE_idALLELE: Tallele;
    procedure SetALLELE_idALLELE(const Value: Tallele);
    function GetBADANIE_idBADANIE: Tbadanie;
    procedure SetBADANIE_idBADANIE(const Value: Tbadanie);
  public
    property idWYNIK: Integer read FidWYNIK write FidWYNIK;
    property wartosc1: Integer read Fwartosc1 write Fwartosc1;
    property wartosc2: Nullable<Integer> read Fwartosc2 write Fwartosc2;
    property czyAKTYWNY: Nullable<Integer> read FczyAKTYWNY write FczyAKTYWNY;
    property ALLELE_idALLELE: Tallele read GetALLELE_idALLELE write SetALLELE_idALLELE;
    property BADANIE_idBADANIE: Tbadanie read GetBADANIE_idBADANIE write SetBADANIE_idBADANIE;
  end;

  [Entity]
  [Table('zatrudnienie')]
  [Id('FidZATRUDNIENIE', TIdGenerator.IdentityOrSequence)]
  Tzatrudnienie = class
  private
    [Column('idZATRUDNIENIE', [TColumnProp.Required])]
    FidZATRUDNIENIE: Integer;

    [Column('haslo', [], 45)]
    Fhaslo: Nullable<string>;

    [Column('login', [], 45)]
    Flogin: Nullable<string>;

    [Column('czyAKTYWNY', [])]
    FczyAKTYWNY: Nullable<Integer>;

    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('GRUPA_idGRUPA', [TColumnProp.Required], 'idGRUPA')]
    FGRUPA_idGRUPA: Proxy<Tgrupa>;

    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('JEDNOSTKA_idJEDNOSTKA', [TColumnProp.Required], 'idJEDNOSTKA')]
    FJEDNOSTKA_idJEDNOSTKA: Proxy<Tjednostka>;

    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('OSOBA_idOSOBA', [TColumnProp.Required], 'idOSOBA')]
    FOSOBA_idOSOBA: Proxy<Tosoba>;
    function GetGRUPA_idGRUPA: Tgrupa;
    procedure SetGRUPA_idGRUPA(const Value: Tgrupa);
    function GetJEDNOSTKA_idJEDNOSTKA: Tjednostka;
    procedure SetJEDNOSTKA_idJEDNOSTKA(const Value: Tjednostka);
    function GetOSOBA_idOSOBA: Tosoba;
    procedure SetOSOBA_idOSOBA(const Value: Tosoba);
  public
    property idZATRUDNIENIE: Integer read FidZATRUDNIENIE write FidZATRUDNIENIE;
    property haslo: Nullable<string> read Fhaslo write Fhaslo;
    property login: Nullable<string> read Flogin write Flogin;
    property czyAKTYWNY: Nullable<Integer> read FczyAKTYWNY write FczyAKTYWNY;
    property GRUPA_idGRUPA: Tgrupa read GetGRUPA_idGRUPA write SetGRUPA_idGRUPA;
    property JEDNOSTKA_idJEDNOSTKA: Tjednostka read GetJEDNOSTKA_idJEDNOSTKA write SetJEDNOSTKA_idJEDNOSTKA;
    property OSOBA_idOSOBA: Tosoba read GetOSOBA_idOSOBA write SetOSOBA_idOSOBA;
  end;

  TDicDictionary = class
  private
    Fallele: TalleleTableDictionary;
    Fbadanie: TbadanieTableDictionary;
    Fgrupa: TgrupaTableDictionary;
    Fjednostka: TjednostkaTableDictionary;
    Fosoba: TosobaTableDictionary;
    Fpacjent: TpacjentTableDictionary;
    Ftest_osoba: Ttest_osobaTableDictionary;
    Fwynik: TwynikTableDictionary;
    Fzatrudnienie: TzatrudnienieTableDictionary;
    function Getallele: TalleleTableDictionary;
    function Getbadanie: TbadanieTableDictionary;
    function Getgrupa: TgrupaTableDictionary;
    function Getjednostka: TjednostkaTableDictionary;
    function Getosoba: TosobaTableDictionary;
    function Getpacjent: TpacjentTableDictionary;
    function Gettest_osoba: Ttest_osobaTableDictionary;
    function Getwynik: TwynikTableDictionary;
    function Getzatrudnienie: TzatrudnienieTableDictionary;
  public
    destructor Destroy; override;
    property allele: TalleleTableDictionary read Getallele;
    property badanie: TbadanieTableDictionary read Getbadanie;
    property grupa: TgrupaTableDictionary read Getgrupa;
    property jednostka: TjednostkaTableDictionary read Getjednostka;
    property osoba: TosobaTableDictionary read Getosoba;
    property pacjent: TpacjentTableDictionary read Getpacjent;
    property test_osoba: Ttest_osobaTableDictionary read Gettest_osoba;
    property wynik: TwynikTableDictionary read Getwynik;
    property zatrudnienie: TzatrudnienieTableDictionary read Getzatrudnienie;
  end;

  TalleleTableDictionary = class
  private
    FidALLELE: TDictionaryAttribute;
    FnazwaALLELE: TDictionaryAttribute;
    FczyAKTYWNY: TDictionaryAttribute;
  public
    constructor Create;
    property idALLELE: TDictionaryAttribute read FidALLELE;
    property nazwaALLELE: TDictionaryAttribute read FnazwaALLELE;
    property czyAKTYWNY: TDictionaryAttribute read FczyAKTYWNY;
  end;

  TbadanieTableDictionary = class
  private
    FidBADANIE: TDictionaryAttribute;
    FdataBADANIE: TDictionaryAttribute;
    FPACJENT_idPACJENT: TDictionaryAssociation;
  public
    constructor Create;
    property idBADANIE: TDictionaryAttribute read FidBADANIE;
    property dataBADANIE: TDictionaryAttribute read FdataBADANIE;
    property PACJENT_idPACJENT: TDictionaryAssociation read FPACJENT_idPACJENT;
  end;

  TgrupaTableDictionary = class
  private
    FidGRUPA: TDictionaryAttribute;
    FnazwaGRUPA: TDictionaryAttribute;
  public
    constructor Create;
    property idGRUPA: TDictionaryAttribute read FidGRUPA;
    property nazwaGRUPA: TDictionaryAttribute read FnazwaGRUPA;
  end;

  TjednostkaTableDictionary = class
  private
    FidJEDNOSTKA: TDictionaryAttribute;
    FnazwaJEDNOSTKA: TDictionaryAttribute;
    Fulica: TDictionaryAttribute;
    FnrBUDYNKU: TDictionaryAttribute;
    FkodPOCZTOWY: TDictionaryAttribute;
    Fmiejscowosc: TDictionaryAttribute;
  public
    constructor Create;
    property idJEDNOSTKA: TDictionaryAttribute read FidJEDNOSTKA;
    property nazwaJEDNOSTKA: TDictionaryAttribute read FnazwaJEDNOSTKA;
    property ulica: TDictionaryAttribute read Fulica;
    property nrBUDYNKU: TDictionaryAttribute read FnrBUDYNKU;
    property kodPOCZTOWY: TDictionaryAttribute read FkodPOCZTOWY;
    property miejscowosc: TDictionaryAttribute read Fmiejscowosc;
  end;

  TosobaTableDictionary = class
  private
    FidOSOBA: TDictionaryAttribute;
    FimieOSOBA: TDictionaryAttribute;
    FnazwiskoOSOBA: TDictionaryAttribute;
    FPESEL: TDictionaryAttribute;
    FIdentyfikator: TDictionaryAttribute;
    FAktywny: TDictionaryAttribute;
    FOsobaIdId: TDictionaryAttribute;
    FImie: TDictionaryAttribute;
    FNazwisko: TDictionaryAttribute;
  public
    constructor Create;
    property idOSOBA: TDictionaryAttribute read FidOSOBA;
    property imieOSOBA: TDictionaryAttribute read FimieOSOBA;
    property nazwiskoOSOBA: TDictionaryAttribute read FnazwiskoOSOBA;
    property PESEL: TDictionaryAttribute read FPESEL;
    property Identyfikator: TDictionaryAttribute read FIdentyfikator;
    property Aktywny: TDictionaryAttribute read FAktywny;
    property OsobaIdId: TDictionaryAttribute read FOsobaIdId;
    property Imie: TDictionaryAttribute read FImie;
    property Nazwisko: TDictionaryAttribute read FNazwisko;
  end;

  TpacjentTableDictionary = class
  private
    FidPACJENT: TDictionaryAttribute;
    FczyAKTYWNY: TDictionaryAttribute;
    FOSOBA_idOSOBA: TDictionaryAssociation;
    FJEDNOSTKA_idJEDNOSTKA: TDictionaryAssociation;
  public
    constructor Create;
    property idPACJENT: TDictionaryAttribute read FidPACJENT;
    property czyAKTYWNY: TDictionaryAttribute read FczyAKTYWNY;
    property OSOBA_idOSOBA: TDictionaryAssociation read FOSOBA_idOSOBA;
    property JEDNOSTKA_idJEDNOSTKA: TDictionaryAssociation read FJEDNOSTKA_idJEDNOSTKA;
  end;

  Ttest_osobaTableDictionary = class
  private
    Ftest_id: TDictionaryAttribute;
    Ftest_login: TDictionaryAttribute;
    Ftest_haslo: TDictionaryAttribute;
    Ftest_typ: TDictionaryAttribute;
  public
    constructor Create;
    property test_id: TDictionaryAttribute read Ftest_id;
    property test_login: TDictionaryAttribute read Ftest_login;
    property test_haslo: TDictionaryAttribute read Ftest_haslo;
    property test_typ: TDictionaryAttribute read Ftest_typ;
  end;

  TwynikTableDictionary = class
  private
    FidWYNIK: TDictionaryAttribute;
    Fwartosc1: TDictionaryAttribute;
    Fwartosc2: TDictionaryAttribute;
    FczyAKTYWNY: TDictionaryAttribute;
    FALLELE_idALLELE: TDictionaryAssociation;
    FBADANIE_idBADANIE: TDictionaryAssociation;
  public
    constructor Create;
    property idWYNIK: TDictionaryAttribute read FidWYNIK;
    property wartosc1: TDictionaryAttribute read Fwartosc1;
    property wartosc2: TDictionaryAttribute read Fwartosc2;
    property czyAKTYWNY: TDictionaryAttribute read FczyAKTYWNY;
    property ALLELE_idALLELE: TDictionaryAssociation read FALLELE_idALLELE;
    property BADANIE_idBADANIE: TDictionaryAssociation read FBADANIE_idBADANIE;
  end;

  TzatrudnienieTableDictionary = class
  private
    FidZATRUDNIENIE: TDictionaryAttribute;
    Fhaslo: TDictionaryAttribute;
    Flogin: TDictionaryAttribute;
    FczyAKTYWNY: TDictionaryAttribute;
    FGRUPA_idGRUPA: TDictionaryAssociation;
    FJEDNOSTKA_idJEDNOSTKA: TDictionaryAssociation;
    FOSOBA_idOSOBA: TDictionaryAssociation;
  public
    constructor Create;
    property idZATRUDNIENIE: TDictionaryAttribute read FidZATRUDNIENIE;
    property haslo: TDictionaryAttribute read Fhaslo;
    property login: TDictionaryAttribute read Flogin;
    property czyAKTYWNY: TDictionaryAttribute read FczyAKTYWNY;
    property GRUPA_idGRUPA: TDictionaryAssociation read FGRUPA_idGRUPA;
    property JEDNOSTKA_idJEDNOSTKA: TDictionaryAssociation read FJEDNOSTKA_idJEDNOSTKA;
    property OSOBA_idOSOBA: TDictionaryAssociation read FOSOBA_idOSOBA;
  end;

function Dic: TDicDictionary;

implementation

var
  __Dic: TDicDictionary;

function Dic: TDicDictionary;
begin
  if __Dic = nil then __Dic := TDicDictionary.Create;
  result := __Dic
end;

{ Tbadanie }

function Tbadanie.GetPACJENT_idPACJENT: Tpacjent;
begin
  result := FPACJENT_idPACJENT.Value;
end;

procedure Tbadanie.SetPACJENT_idPACJENT(const Value: Tpacjent);
begin
  FPACJENT_idPACJENT.Value := Value;
end;

{ Tpacjent }

function Tpacjent.GetOSOBA_idOSOBA: Tosoba;
begin
  result := FOSOBA_idOSOBA.Value;
end;

procedure Tpacjent.SetOSOBA_idOSOBA(const Value: Tosoba);
begin
  FOSOBA_idOSOBA.Value := Value;
end;

function Tpacjent.GetJEDNOSTKA_idJEDNOSTKA: Tjednostka;
begin
  result := FJEDNOSTKA_idJEDNOSTKA.Value;
end;

procedure Tpacjent.SetJEDNOSTKA_idJEDNOSTKA(const Value: Tjednostka);
begin
  FJEDNOSTKA_idJEDNOSTKA.Value := Value;
end;

{ Twynik }

function Twynik.GetALLELE_idALLELE: Tallele;
begin
  result := FALLELE_idALLELE.Value;
end;

procedure Twynik.SetALLELE_idALLELE(const Value: Tallele);
begin
  FALLELE_idALLELE.Value := Value;
end;

function Twynik.GetBADANIE_idBADANIE: Tbadanie;
begin
  result := FBADANIE_idBADANIE.Value;
end;

procedure Twynik.SetBADANIE_idBADANIE(const Value: Tbadanie);
begin
  FBADANIE_idBADANIE.Value := Value;
end;

{ Tzatrudnienie }

function Tzatrudnienie.GetGRUPA_idGRUPA: Tgrupa;
begin
  result := FGRUPA_idGRUPA.Value;
end;

procedure Tzatrudnienie.SetGRUPA_idGRUPA(const Value: Tgrupa);
begin
  FGRUPA_idGRUPA.Value := Value;
end;

function Tzatrudnienie.GetJEDNOSTKA_idJEDNOSTKA: Tjednostka;
begin
  result := FJEDNOSTKA_idJEDNOSTKA.Value;
end;

procedure Tzatrudnienie.SetJEDNOSTKA_idJEDNOSTKA(const Value: Tjednostka);
begin
  FJEDNOSTKA_idJEDNOSTKA.Value := Value;
end;

function Tzatrudnienie.GetOSOBA_idOSOBA: Tosoba;
begin
  result := FOSOBA_idOSOBA.Value;
end;

procedure Tzatrudnienie.SetOSOBA_idOSOBA(const Value: Tosoba);
begin
  FOSOBA_idOSOBA.Value := Value;
end;

{ TDicDictionary }

destructor TDicDictionary.Destroy;
begin
  if Fzatrudnienie <> nil then Fzatrudnienie.Free;
  if Fwynik <> nil then Fwynik.Free;
  if Ftest_osoba <> nil then Ftest_osoba.Free;
  if Fpacjent <> nil then Fpacjent.Free;
  if Fosoba <> nil then Fosoba.Free;
  if Fjednostka <> nil then Fjednostka.Free;
  if Fgrupa <> nil then Fgrupa.Free;
  if Fbadanie <> nil then Fbadanie.Free;
  if Fallele <> nil then Fallele.Free;
  inherited;
end;

function TDicDictionary.Getallele: TalleleTableDictionary;
begin
  if Fallele = nil then Fallele := TalleleTableDictionary.Create;
  result := Fallele;
end;

function TDicDictionary.Getbadanie: TbadanieTableDictionary;
begin
  if Fbadanie = nil then Fbadanie := TbadanieTableDictionary.Create;
  result := Fbadanie;
end;

function TDicDictionary.Getgrupa: TgrupaTableDictionary;
begin
  if Fgrupa = nil then Fgrupa := TgrupaTableDictionary.Create;
  result := Fgrupa;
end;

function TDicDictionary.Getjednostka: TjednostkaTableDictionary;
begin
  if Fjednostka = nil then Fjednostka := TjednostkaTableDictionary.Create;
  result := Fjednostka;
end;

function TDicDictionary.Getosoba: TosobaTableDictionary;
begin
  if Fosoba = nil then Fosoba := TosobaTableDictionary.Create;
  result := Fosoba;
end;

function TDicDictionary.Getpacjent: TpacjentTableDictionary;
begin
  if Fpacjent = nil then Fpacjent := TpacjentTableDictionary.Create;
  result := Fpacjent;
end;

function TDicDictionary.Gettest_osoba: Ttest_osobaTableDictionary;
begin
  if Ftest_osoba = nil then Ftest_osoba := Ttest_osobaTableDictionary.Create;
  result := Ftest_osoba;
end;

function TDicDictionary.Getwynik: TwynikTableDictionary;
begin
  if Fwynik = nil then Fwynik := TwynikTableDictionary.Create;
  result := Fwynik;
end;

function TDicDictionary.Getzatrudnienie: TzatrudnienieTableDictionary;
begin
  if Fzatrudnienie = nil then Fzatrudnienie := TzatrudnienieTableDictionary.Create;
  result := Fzatrudnienie;
end;

{ TalleleTableDictionary }

constructor TalleleTableDictionary.Create;
begin
  inherited;
  FidALLELE := TDictionaryAttribute.Create('idALLELE');
  FnazwaALLELE := TDictionaryAttribute.Create('nazwaALLELE');
  FczyAKTYWNY := TDictionaryAttribute.Create('czyAKTYWNY');
end;

{ TbadanieTableDictionary }

constructor TbadanieTableDictionary.Create;
begin
  inherited;
  FidBADANIE := TDictionaryAttribute.Create('idBADANIE');
  FdataBADANIE := TDictionaryAttribute.Create('dataBADANIE');
  FPACJENT_idPACJENT := TDictionaryAssociation.Create('PACJENT_idPACJENT');
end;

{ TgrupaTableDictionary }

constructor TgrupaTableDictionary.Create;
begin
  inherited;
  FidGRUPA := TDictionaryAttribute.Create('idGRUPA');
  FnazwaGRUPA := TDictionaryAttribute.Create('nazwaGRUPA');
end;

{ TjednostkaTableDictionary }

constructor TjednostkaTableDictionary.Create;
begin
  inherited;
  FidJEDNOSTKA := TDictionaryAttribute.Create('idJEDNOSTKA');
  FnazwaJEDNOSTKA := TDictionaryAttribute.Create('nazwaJEDNOSTKA');
  Fulica := TDictionaryAttribute.Create('ulica');
  FnrBUDYNKU := TDictionaryAttribute.Create('nrBUDYNKU');
  FkodPOCZTOWY := TDictionaryAttribute.Create('kodPOCZTOWY');
  Fmiejscowosc := TDictionaryAttribute.Create('miejscowosc');
end;

{ TosobaTableDictionary }

constructor TosobaTableDictionary.Create;
begin
  inherited;
  FidOSOBA := TDictionaryAttribute.Create('idOSOBA');
  FimieOSOBA := TDictionaryAttribute.Create('imieOSOBA');
  FnazwiskoOSOBA := TDictionaryAttribute.Create('nazwiskoOSOBA');
  FPESEL := TDictionaryAttribute.Create('PESEL');
  FIdentyfikator := TDictionaryAttribute.Create('Identyfikator');
  FAktywny := TDictionaryAttribute.Create('Aktywny');
  FOsobaIdId := TDictionaryAttribute.Create('OsobaIdId');
  FImie := TDictionaryAttribute.Create('Imie');
  FNazwisko := TDictionaryAttribute.Create('Nazwisko');
end;

{ TpacjentTableDictionary }

constructor TpacjentTableDictionary.Create;
begin
  inherited;
  FidPACJENT := TDictionaryAttribute.Create('idPACJENT');
  FczyAKTYWNY := TDictionaryAttribute.Create('czyAKTYWNY');
  FOSOBA_idOSOBA := TDictionaryAssociation.Create('OSOBA_idOSOBA');
  FJEDNOSTKA_idJEDNOSTKA := TDictionaryAssociation.Create('JEDNOSTKA_idJEDNOSTKA');
end;

{ Ttest_osobaTableDictionary }

constructor Ttest_osobaTableDictionary.Create;
begin
  inherited;
  Ftest_id := TDictionaryAttribute.Create('test_id');
  Ftest_login := TDictionaryAttribute.Create('test_login');
  Ftest_haslo := TDictionaryAttribute.Create('test_haslo');
  Ftest_typ := TDictionaryAttribute.Create('test_typ');
end;

{ TwynikTableDictionary }

constructor TwynikTableDictionary.Create;
begin
  inherited;
  FidWYNIK := TDictionaryAttribute.Create('idWYNIK');
  Fwartosc1 := TDictionaryAttribute.Create('wartosc1');
  Fwartosc2 := TDictionaryAttribute.Create('wartosc2');
  FczyAKTYWNY := TDictionaryAttribute.Create('czyAKTYWNY');
  FALLELE_idALLELE := TDictionaryAssociation.Create('ALLELE_idALLELE');
  FBADANIE_idBADANIE := TDictionaryAssociation.Create('BADANIE_idBADANIE');
end;

{ TzatrudnienieTableDictionary }

constructor TzatrudnienieTableDictionary.Create;
begin
  inherited;
  FidZATRUDNIENIE := TDictionaryAttribute.Create('idZATRUDNIENIE');
  Fhaslo := TDictionaryAttribute.Create('haslo');
  Flogin := TDictionaryAttribute.Create('login');
  FczyAKTYWNY := TDictionaryAttribute.Create('czyAKTYWNY');
  FGRUPA_idGRUPA := TDictionaryAssociation.Create('GRUPA_idGRUPA');
  FJEDNOSTKA_idJEDNOSTKA := TDictionaryAssociation.Create('JEDNOSTKA_idJEDNOSTKA');
  FOSOBA_idOSOBA := TDictionaryAssociation.Create('OSOBA_idOSOBA');
end;

initialization
  RegisterEntity(Tallele);
  RegisterEntity(Tbadanie);
  RegisterEntity(Tgrupa);
  RegisterEntity(Tjednostka);
  RegisterEntity(Tosoba);
  RegisterEntity(Tpacjent);
  RegisterEntity(Ttest_osoba);
  RegisterEntity(Twynik);
  RegisterEntity(Tzatrudnienie);

finalization
  if __Dic <> nil then __Dic.Free

end.


