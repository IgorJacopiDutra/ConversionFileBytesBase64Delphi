object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Principal'
  ClientHeight = 72
  ClientWidth = 196
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnFileToBytesToBase64: TButton
    Left = 8
    Top = 8
    Width = 185
    Height = 25
    Caption = 'File To Bytes To Base64'
    TabOrder = 0
    OnClick = btnFileToBytesToBase64Click
  end
  object btnBase64ToBytesToFile: TButton
    Left = 8
    Top = 39
    Width = 185
    Height = 25
    Caption = 'Base64 To Bytes To File'
    TabOrder = 1
    OnClick = btnBase64ToBytesToFileClick
  end
end
