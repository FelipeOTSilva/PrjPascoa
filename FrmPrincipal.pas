unit FrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.DateUtils;

type
  TForm1 = class(TForm)
    edtAno: TLabeledEdit;
    BtnVerificar: TButton;
    procedure BtnVerificarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TAno = class
    ano, x, y: Integer;
    procedure VerificarIntervaloDeData(VerificarAno: Integer);
    procedure CalcullarPascoa(Ano: Integer);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


{ Ano }



{ TAno }

procedure TAno.CalcullarPascoa(Ano: Integer);
var
    a, b, c, d, e, dia: Integer;
  mes: string;
begin
  a := Ano mod 19;
  b := Ano mod 4;
  c := Ano mod 7;
  d := ((19 * a) + x) mod 30;
  e := ((2 * b) + (4 * c) + (6 * d) + y) mod 7;

  if (d + e) < 10 then
  begin
    dia := (d + e + 22);
    mes := 'Mar�o';
  end

  else
  begin
    dia := (d + e - 9);
    mes := 'Abril';
  end;

  ShowMessage('A Pascoa cai no dia: '+IntToStr(dia)+ ' de '+ mes );

end;

procedure TAno.VerificarIntervaloDeData(VerificarAno: Integer);
begin
  if ((VerificarAno >= 1900) or (VerificarAno <= 2099)) then
  begin
    x := 24;
    y := 5;
  end

  else if ((VerificarAno >= 2100) or (VerificarAno <= 2199)) then
  begin
    x := 24;
    y := 6;
  end

  else if ((VerificarAno >= 2200) or (VerificarAno <= 2299)) then
  begin
    x := 25;
    y := 7;
  end;

end;

procedure TForm1.BtnVerificarClick(Sender: TObject);
var
  AnoClasse: TAno;
  Ano: Integer;
begin
  AnoClasse := TAno.Create;
  try
    Ano := StrToInt(edtAno.Text);
    AnoClasse.VerificarIntervaloDeData(Ano);
    AnoClasse.CalcullarPascoa(Ano);
  finally
    FreeAndNil(AnoClasse);
  end;

end;

end.

