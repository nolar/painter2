program Painter;

uses
  Forms,
  DrawThread in 'DrawThread.pas',
  Main in 'Main.pas' {MainWin},
  About in 'About.pas' {AboutWin};

{$R *.RES}

begin
  Randomize;
  Application.Initialize;
  Application.Title := 'Художник';
  Application.CreateForm(TMainWin, MainWin);
  Application.CreateForm(TAboutWin, AboutWin);
  Application.Run;
end.
