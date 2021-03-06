unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls,
  shellapi;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    sb1: TStatusBar;
    Timer1: TTimer;
    Button2: TButton;
    Image1: TImage;
    Image2: TImage;
    image0: TImage;
    Button3: TButton;
    Timer2: TTimer;
    Label1: TLabel;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure image0Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  gtimecount: integer;
  gapppath: string;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  gtimecount := strtoint(Edit1.text);
  Timer1.Enabled := true;
  Button1.Hide;
  Button2.Show;
  Button2.SetFocus;
  Edit1.Enabled := false;

  Timer2.Enabled := false;
  Timer2.Enabled := true;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  i: integer;
  filename: string;
begin
  i := strtoint(Edit1.text);
  i := i - 1;
  filename := gapppath + 'batch.bat';

  if not fileexists(filename) then sb1.SimpleText := '文件丢失 ' + 'batch.bat';

  Edit1.text := inttostr(i);
  if i < 0 then begin
    Edit1.text := inttostr(gtimecount);

    Button4.Click;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Button2.Hide;
  Button1.Show;
  Button1.SetFocus;
  Timer1.Enabled := false;
  Edit1.Enabled := true;

  Timer2.Enabled := false;
  Timer2.Enabled := true;
  edit1.Text :=inttostr(gtimecount);
end;

procedure TForm1.image0Click(Sender: TObject);
begin
  Button3.Click;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if Button1.Enabled then begin
    Button1.Enabled := false;
    Button2.Enabled := false;
    image0.Picture := Image2.Picture;

  end
  else begin
    Button1.Enabled := true;
    Button2.Enabled := true;
    image0.Picture := Image1.Picture;
  end;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
  sb1.SimpleText := '按锁标记，解锁。';
  Button3.Click;
  Timer2.Enabled := false;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  gapppath := extractfilepath(application.ExeName);
  self.DoubleBuffered := true;
  
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  filename: string;
begin
  filename := gapppath + 'batch.bat';
  if fileexists(filename) then  begin
    ShellExecute(Handle, 'open', Pchar(filename), nil, nil, SW_SHOWNORMAL)
    //winexec(PChar(filename),0);
    end
  else
    sb1.SimpleText := '文件丢失 ' + filename;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
 button1.Click ;
end;

end.

