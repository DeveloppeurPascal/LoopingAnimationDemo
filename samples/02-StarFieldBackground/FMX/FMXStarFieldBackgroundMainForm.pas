(* C2PP
  ***************************************************************************

  Looping Animation Demo

  Copyright 2025 Patrick PREMARTIN under AGPL 3.0 license.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
  THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
  DEALINGS IN THE SOFTWARE.

  ***************************************************************************

  Author(s) :
  Patrick PREMARTIN

  Site :
  https://developpeur-pascal.fr

  Project site :
  https://github.com/DeveloppeurPascal/LoopingAnimationDemo

  ***************************************************************************
  File last update : 2025-07-20T19:43:46.000+02:00
  Signature : e7056975bd142bd4268a0ce29c3c685bc9fe96e8
  ***************************************************************************
*)

unit FMXStarFieldBackgroundMainForm;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Graphics,
  FMX.Controls,
  FMX.Forms,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMXShowFPSMainForm,
  FMX.Controls.Presentation,
  FMX.Objects;

const
  CNBStars = 2000;

type
  TStar = record
    X, Y: integer;
    ZIndex: byte;
  end;

  TStarField = array [1 .. CNBStars] of TStar;

  TfrmStarFieldBackgroundMainForm = class(TfrmShowFPSMainForm)
    imgStarField: TImage;
    procedure imgStarFieldResized(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FVX: single;
    FVY: single;
    FCenterX: single;
    FCenterY: single;
    FStarField: TStarField;
    Fvelocity: single;
    procedure SetVX(const Value: single);
    procedure SetVY(const Value: single);
    procedure SetCenterX(const Value: single);
    procedure SetCenterY(const Value: single);
    procedure SetStarField(const Value: TStarField);
    procedure Setvelocity(const Value: single);
  protected
    procedure DoTimerLoop(const FPS: Int64; const DeltaTime: Int64); override;
  public
    property StarField: TStarField read FStarField write SetStarField;
    property CenterX: single read FCenterX write SetCenterX;
    property CenterY: single read FCenterY write SetCenterY;
    property VX: single read FVX write SetVX;
    property VY: single read FVY write SetVY;
    property velocity: single read Fvelocity write Setvelocity;
    procedure InitStarField;
  end;

var
  frmStarFieldBackgroundMainForm: TfrmStarFieldBackgroundMainForm;

implementation

{$R *.fmx}

procedure TfrmStarFieldBackgroundMainForm.DoTimerLoop(const FPS,
  DeltaTime: Int64);
var
  i: integer;
  ViewPortXTopLeft, ViewPortYTopLeft, ViewPortXBottomRight,
    ViewPortYBottomRight: single;
  w, h: single;
begin
  inherited;

  w := imgStarField.Bitmap.Width;
  h := imgStarField.Bitmap.height;

  CenterX := CenterX + VX * velocity;
  CenterY := CenterY + VY * velocity;
  velocity := velocity * 1.1;

  if CenterX <= -w then
  begin
    velocity := 1;
    VX := 1 + random(5);
  end;
  if CenterY <= -h then
  begin
    velocity := 1;
    VY := 1 + random(5);
  end;
  if CenterX >= w then
  begin
    velocity := 1;
    VX := -1 - random(5);
  end;
  if CenterY >= h then
  begin
    velocity := 1;
    VY := -1 - random(5);
  end;

  ViewPortXTopLeft := CenterX - round(w / 2);
  ViewPortYTopLeft := CenterY - round(h / 2);
  ViewPortXBottomRight := CenterX + round(w / 2);
  ViewPortYBottomRight := CenterY + round(h / 2);

  imgStarField.Bitmap.Clear(TAlphaColors.Black);
  imgStarField.Bitmap.Canvas.BeginScene;
  try
    for i := 1 to CNBStars do
      if (StarField[i].X >= ViewPortXTopLeft) and
        (StarField[i].X <= ViewPortXBottomRight) and
        (StarField[i].Y >= ViewPortYTopLeft) and
        (StarField[i].Y <= ViewPortYBottomRight) then
      begin
        imgStarField.Bitmap.Canvas.FillEllipse
          (TRectF.Create(StarField[i].X - ViewPortXTopLeft,
          StarField[i].Y - ViewPortYTopLeft, StarField[i].X - ViewPortXTopLeft +
          StarField[i].ZIndex * 2, StarField[i].Y - ViewPortYTopLeft +
          StarField[i].ZIndex * 2), 1 - StarField[i].ZIndex * 0.2);
      end;
  finally
    imgStarField.Bitmap.Canvas.EndScene;
  end;
end;

procedure TfrmStarFieldBackgroundMainForm.FormCreate(Sender: TObject);
begin
  inherited;
  FCenterX := 0;
  FCenterY := 0;
  VX := 1 + random(5);
  VY := 1 + random(5);
  velocity := 1;
end;

procedure TfrmStarFieldBackgroundMainForm.imgStarFieldResized(Sender: TObject);
var
  bms: single;
begin
  bms := imgStarField.Bitmap.BitmapScale;
  imgStarField.Bitmap.setsize(round(imgStarField.Width * bms),
    round(imgStarField.height * bms));
  InitStarField;
end;

procedure TfrmStarFieldBackgroundMainForm.InitStarField;
var
  i: integer;
  w, h: integer;
begin
  w := imgStarField.Bitmap.Width;
  h := imgStarField.Bitmap.height;

  for i := 1 to CNBStars do
  begin
    FStarField[i].X := random(w * 3) - round(w * 1.5);
    FStarField[i].Y := random(h * 3) - round(h * 1.5);
    FStarField[i].ZIndex := random(5); // 0 to 4
  end;
end;

procedure TfrmStarFieldBackgroundMainForm.SetCenterX(const Value: single);
begin
  FCenterX := Value;
end;

procedure TfrmStarFieldBackgroundMainForm.SetCenterY(const Value: single);
begin
  FCenterY := Value;
end;

procedure TfrmStarFieldBackgroundMainForm.SetStarField(const Value: TStarField);
begin
  FStarField := Value;
end;

procedure TfrmStarFieldBackgroundMainForm.Setvelocity(const Value: single);
begin
  Fvelocity := Value;
end;

procedure TfrmStarFieldBackgroundMainForm.SetVX(const Value: single);
begin
  FVX := Value;
end;

procedure TfrmStarFieldBackgroundMainForm.SetVY(const Value: single);
begin
  FVY := Value;
end;

initialization

randomize;

{$IF Defined(ANDROID)}
GlobalUseVulkan := true;
{$ELSE IF Defined(IOS) or Defined(OSX)}
GlobalUseMetal := true;
{$ENDIF}

end.
