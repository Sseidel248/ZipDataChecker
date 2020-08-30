program ZipDataChecker;

uses
  Vcl.Forms,
  Main_ZDC in 'Main_ZDC.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
