unit uPrincipal;

interface

uses
   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
   System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
   Vcl.StdCtrls, System.NetEncoding;

type
   TfrmPrincipal = class(TForm)
      btnFileToBytesToBase64: TButton;
      btnBase64ToBytesToFile: TButton;
      procedure btnFileToBytesToBase64Click(Sender: TObject);
      procedure btnBase64ToBytesToFileClick(Sender: TObject);
   private
    { Private declarations }
   public
    { Public declarations }
   end;

var
   frmPrincipal: TfrmPrincipal;
   Base64String: string;

implementation

{$R *.dfm}

function FileToBytes(const FilePath: string): TBytes;
var
   FileStream: TFileStream;
   BytesStream: TBytesStream;
begin
   FileStream := TFileStream.Create(FilePath, fmOpenRead or fmShareDenyNone);
   try
      BytesStream := TBytesStream.Create;
      try
         BytesStream.CopyFrom(FileStream, 0);
         Result := BytesStream.Bytes;
      finally
         BytesStream.Free;
      end;
   finally
      FileStream.Free;
   end;
end;

function BytesToFile(const Bytes: TBytes; const FilePath: string): Boolean;
var
   FileStream: TFileStream;
begin
   Result := False;

   if Length(Bytes) = 0 then
      Exit;

   FileStream := TFileStream.Create(FilePath, fmCreate);
   try
      FileStream.WriteBuffer(Bytes[0], Length(Bytes));
      Result := True;
   finally
      FileStream.Free;
   end;
end;

procedure TfrmPrincipal.btnFileToBytesToBase64Click(Sender: TObject);
var
   ImagePath: string;
   bytt: TBytes;
begin
   ImagePath := '...\download.jpg';
   bytt := FileToBytes(ImagePath);
   Base64String := TNetEncoding.Base64.EncodeBytesToString(bytt);
end;

procedure TfrmPrincipal.btnBase64ToBytesToFileClick(Sender: TObject);
var
   SavePath: string;
   bytt: TBytes;
begin
   if Base64String = '' then
   begin
      ShowMessage('Primeiro clique no botão para transformar o arquivo em bytes.');
      Exit;
   end;

   bytt := TNetEncoding.Base64.DecodeStringToBytes(Base64String);

   SavePath := '...\newdownload.jpg';

   if BytesToFile(bytt, SavePath) then
      ShowMessage('Arquivo salvo com sucesso!')
   else
      ShowMessage('Falha ao salvar o arquivo.');
end;

end.

