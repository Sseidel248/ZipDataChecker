object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Zip Data Checker'
  ClientHeight = 367
  ClientWidth = 601
  Color = clBtnFace
  Constraints.MinHeight = 406
  Constraints.MinWidth = 617
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 601
    Height = 161
    Align = alTop
    Color = clGradientActiveCaption
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      601
      161)
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 162
      Height = 16
      Caption = 'Neue Protokolle:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 56
      Width = 162
      Height = 16
      Caption = 'Alt Protokolle:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 96
      Width = 162
      Height = 16
      Caption = 'Zu updatende Pakete:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object NewProtEdit: TEdit
      Left = 176
      Top = 15
      Width = 393
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 0
    end
    object OldProtEdit: TEdit
      Left = 176
      Top = 55
      Width = 393
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 1
    end
    object UpdatPackEdit: TEdit
      Left = 176
      Top = 95
      Width = 393
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 2
    end
    object Button1: TButton
      Left = 568
      Top = 13
      Width = 25
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '...'
      TabOrder = 3
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 568
      Top = 53
      Width = 25
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '...'
      TabOrder = 4
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 568
      Top = 93
      Width = 25
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '...'
      TabOrder = 5
      OnClick = Button3Click
    end
    object CheckNUpdateBtn: TButton
      Left = 8
      Top = 130
      Width = 585
      Height = 31
      Anchors = [akLeft, akTop, akRight]
      Caption = #220'berpr'#252'fe und Update'
      TabOrder = 6
      OnClick = CheckNUpdateBtnClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 161
    Width = 601
    Height = 206
    Align = alClient
    TabOrder = 1
    object Memo1: TMemo
      Left = 1
      Top = 1
      Width = 599
      Height = 204
      Align = alClient
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
end
