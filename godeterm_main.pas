unit godeterm_main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    a11: TLabeledEdit;
    a12: TLabeledEdit;
    a13: TLabeledEdit;
    a21: TLabeledEdit;
    a22: TLabeledEdit;
    a23: TLabeledEdit;
    a31: TLabeledEdit;
    a32: TLabeledEdit;
    a33: TLabeledEdit;
    b1: TLabeledEdit;
    b2: TLabeledEdit;
    b3: TLabeledEdit;
    btt_her: TButton;
    D0: TLabeledEdit;
    D1: TLabeledEdit;
    D2: TLabeledEdit;
    D3: TLabeledEdit;
    X1: TLabeledEdit;
    X2: TLabeledEdit;
    X3: TLabeledEdit;
    procedure btt_herClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}



procedure TForm1.btt_herClick(Sender: TObject);
var
a: array[1..3] of array[1..3] of Real;
b: array[1..3] of Real;
d: array[0..3] of Real;
x: array[1..3] of Real;
temp1, temp2: Real;
begin
if
  (a11.Text = '') or (a12.Text = '') or (a13.Text = '') or
  (a21.Text = '') or (a22.Text = '') or (a23.Text = '') or
  (a31.Text = '') or (a32.Text = '') or (a33.Text = '')
then
  Application.MessageBox('Wert vergessen einzutragen', 'Fehler', MB_OK or MB_Iconerror)
else
  begin
    a[1,1] := StrtoFloat(a11.Text);
    a[1,2] := StrtoFloat(a12.Text);
    a[1,3] := StrtoFloat(a13.Text);
    a[2,1] := StrtoFloat(a21.Text);
    a[2,2] := StrtoFloat(a22.Text);
    a[2,3] := StrtoFloat(a23.Text);
    a[3,1] := StrtoFloat(a31.Text);
    a[3,2] := StrtoFloat(a32.Text);
    a[3,3] := StrtoFloat(a33.Text);
    temp1 := (a[1,1] * a[2,2] * a[3,3] + a[1,2] * a[2,3] * a[3,1] + a[1,3] * a[2,1] * a[3,2]);
    temp2 := (a[3,1] * a[2,2] * a[1,3] + a[3,2] * a[2,3] * a[1,1] + a[3,3] * a[2,1] * a[1,2]);
    d[0] := temp1 - temp2;
    D0.Text := format('%.2f', [d[0]]);
    if
      (D[0] <> 0) and (b1.Text <> '') and (b2.Text <> '') and (b3.Text <> '')
    then
      begin
        temp1 := (b[1] * a[2,2] * a[3,3] + a[1,2] * a[2,3] * b[3] + a[1,3] * b[2] * a[3,2]);
        temp2 := (b[3] * a[2,2] * a[1,3] + a[3,2] * a[2,3] * b[1] + a[3,3] * b[2] * a[1,2]);
        d[1] := temp1 - temp2;
        D1.Text := format('%.2f', [d[1]]);
        temp1 := (a[1,1] * b[2] * a[3,3] + b[1] * a[2,3] * a[3,1] + a[1,3] * a[2,1] * b[3]);
        temp2 := (a[3,1] * b[2] * a[1,3] + b[3] * a[2,3] * a[1,1] + a[3,3] * a[2,1] * b[1]);
        d[2] := temp1 - temp2;
        D2.Text := format('%.2f', [d[2]]);
        temp1 := (a[1,1] * a[2,2] * b[3] + a[1,2] * b[2] * a[3,1] + b[1] * a[2,1] * a[3,2]);
        temp2 := (a[3,1] * a[2,2] * b[1] + a[3,2] * b[2] * a[1,1] + b[3] * a[2,1] * a[1,2]);
        d[3] := temp1 - temp2;
        D3.Text := format('%.2f', [d[3]]);
        x[1] := d[1]/d[0];
        x[2] := d[2]/d[0];
        x[3] := d[3]/d[0];
        X1.Text := format('%.2f', [x[1]]);
        X2.Text := format('%.2f', [x[2]]);
        X3.Text := format('%.2f', [x[3]]);
      end
    else
      begin
        D1.Text := '-';
        D2.Text := '-';
        D3.Text := '-';
        X1.Text := '-';
        X2.Text := '-';
        X3.Text := '-';
      end;
  end;
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
if Key = Chr(vk_Return) then
   btt_her.Click
end;

end.
