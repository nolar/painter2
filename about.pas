unit About;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls;

type
  TAboutWin = class(TForm)
    Panel1: TPanel;
    ProductName: TLabel;
    Version: TLabel;
    Copyright: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    BtnClose: TSpeedButton;
    Label3: TLabel;
    procedure BtnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutWin: TAboutWin;

implementation

{$R *.DFM}

procedure TAboutWin.BtnCloseClick(Sender: TObject);
begin
  Close;
end;

end.
 
