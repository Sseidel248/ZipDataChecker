unit Main_ZDC;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Memo1: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    NewProtEdit: TEdit;
    OldProtEdit: TEdit;
    UpdatPackEdit: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    CheckNUpdateBtn: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckNUpdateBtnClick(Sender: TObject);
    procedure CheckNUpdatePackage( NewProtList, OldProtList, UpdatePackList : TStrings );
    procedure UpdatePackage( FileName, Archivename : String);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

uses
  Basti_FileSystem, ZipForge;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
Path : String;
Num : Integer;
begin
  NewProtEdit.Text := SelectPath('Ordner mit neuen Protokollen wählen');
  Path := NewProtEdit.Text;
  if not Path.Equals('') then
  begin
    OldProtEdit.Enabled := true;
    Button2.Enabled := true;
  end;

  Num := GetCountOfFiles;
  Label1.Caption := 'Neue Protokolle (' + IntToStr(Num) + '):';

  NewProtEdit.Hint := Path;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
Path : String;
Num : Integer;
begin
  OldProtEdit.Text := SelectPath('Ordner mit alten Protokollen wählen');
  Path := OldProtEdit.Text;
  if not Path.Equals('') then
  begin
    UpdatPackEdit.Enabled := true;
    Button3.Enabled := true;
  end;

  Num := GetCountOfFiles;
  Label2.Caption := 'Alte Protokolle (' + IntToStr(Num) + '):';

  OldProtEdit.Hint := Path;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
Path : String;
Num : Integer;
begin
  UpdatPackEdit.Text := SelectPath('Ordner mit Reports wählen');
  Path := UpdatPackEdit.Text;
  if not Path.Equals('') then
    CheckNUpdateBtn.Enabled := true;

  Num := GetCountOfFiles;
  Label3.Caption := 'Zu updatende Pakete (' + IntToStr(Num) + '):';

  UpdatPackEdit.Hint := Path;
end;

procedure TForm1.CheckNUpdateBtnClick(Sender: TObject);
var
NewProtList,
OldProtList,
UpdatePackList : TStrings;
begin
  NewProtList := TStringlist.Create;
  OldProtList := TStringlist.Create;
  UpdatePackList := TStringlist.Create;
  try
    Memo1.Clear;
    Memo1.Lines.Add('Starte Aktualisierung der Reports...');

    ListFileDir( NewProtEdit.Text, NewProtList );
    ListFileDir( OldProtEdit.Text, OldProtList );
    ListFileDir( UpdatPackEdit.Text, UpdatePackList );

    CheckNUpdatePackage( NewProtList,OldProtList,UpdatePackList );

    Memo1.Lines.Add('Aktualisierung der Reports Beendet!');
  finally
    NewProtList.Free;
    OldProtList.Free;
    UpdatePackList.Free;
  end;

end;

procedure TForm1.CheckNUpdatePackage( NewProtList, OldProtList, UpdatePackList : TStrings );
var
FileName,
ArchivName : String;
  I: Integer;
  N: Integer;
begin
  for I := 0 to UpdatePackList.Count-1 do
  begin
    ArchivName := DeleteEnding( UpdatePackList[I] );

    for N := 0 to NewProtList.Count-1 do
    begin
      Filename := DeleteEnding( NewProtList[N] );

      if ArchivName.Equals( FileName ) then
      begin
        UpdatePackage( NewProtList[N], UpdatePackList[I] );
        Break;
      end;
    end;
  end;
end;

procedure TForm1.UpdatePackage( FileName, Archivename : String);
var
Archiver: TZipForge;
FilePath, FileData : String;
begin
  Archiver := TZipForge.Create( nil );
  try
    Memo1.Lines.Add( Archivename + ' in Bearbeitung...');

    FilePath := ExtractFileDir( FileName );
    FileData := ExtractFileName( FileName );
    Archiver.FileName := Archivename;
    Archiver.OpenArchive( fmOpenReadWrite );
    // older files will be replaced with newer
    Archiver.Options.OverwriteMode := omIfNewer;
    Archiver.BaseDir := FilePath;
    Archiver.AddFiles( FileData );
    // close archive
    Archiver.CloseArchive();
  finally
    Archiver.Free;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  OldProtEdit.Enabled := false;
  UpdatPackEdit.Enabled := false;

  Button2.Enabled := false;
  Button3.Enabled := false;
  CheckNUpdateBtn.Enabled := false;

  Memo1.Lines.Add( 'Keine Dateien in Bearbeitung!' );
end;

end.
