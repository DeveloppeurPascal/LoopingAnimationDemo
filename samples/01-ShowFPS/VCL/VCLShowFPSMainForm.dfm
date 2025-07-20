object frmShowFPSMainForm: TfrmShowFPSMainForm
  Left = 0
  Top = 0
  Caption = 'frmShowFPSMainForm'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnHide = FormHide
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 400
    Width = 624
    Height = 41
    Align = alBottom
    TabOrder = 0
    object lblShowFPS: TLabel
      Left = 1
      Top = 1
      Width = 61
      Height = 39
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alLeft
      Caption = 'lblShowFPS'
      Layout = tlCenter
      ExplicitHeight = 15
    end
  end
  object TimerLoop: TTimer
    Enabled = False
    Interval = 16
    OnTimer = TimerLoopTimer
    Left = 304
    Top = 224
  end
end
