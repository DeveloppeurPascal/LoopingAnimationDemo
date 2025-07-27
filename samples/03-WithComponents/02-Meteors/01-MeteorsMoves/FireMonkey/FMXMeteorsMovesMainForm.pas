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
  File last update : 2025-07-27T19:30:42.000+02:00
  Signature : 66f7c0d7f389b042c50b6c187259dcf01e619eaf
  ***************************************************************************
*)

unit FMXMeteorsMovesMainForm;

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
  FMXShipExplosionsMainForm,
  FMX.Objects,
  FMX.Controls.Presentation,
  System.Generics.Collections;

const
  CMaxMeteorNumber = 10;

type
  TSpriteMeteor = class
  private
    FVelocity: Single;
    FVX: integer;
    FVY: integer;
    FX: integer;
    FY: integer;
    FArrayWidth, FArrayHeight: integer;
    FDestroyed: boolean;
    procedure SetVelocity(const Value: Single);
    procedure SetVX(const Value: integer);
    procedure SetVY(const Value: integer);
    procedure SetX(const Value: integer);
    procedure SetY(const Value: integer);
  protected
    FImg: TImage;
  public
    property X: integer read FX write SetX;
    property Y: integer read FY write SetY;
    property VX: integer read FVX write SetVX;
    property VY: integer read FVY write SetVY;
    property Velocity: Single read FVelocity write SetVelocity;
    property IsDestroyed: boolean read FDestroyed;
    constructor Create(const AW, AH: integer; const AParent: TFmxObject;
      const BitmapScale: Single); virtual;
    destructor Destroy; override;
    procedure DoMove(const ViewPortXTopLeft, ViewPortYTopLeft: Single);
  end;

  TMeteorsList = class(TObjectList<TSpriteMeteor>)
  private
  protected
  public
  end;

  TfrmMeteorsMovesMainForm = class(TfrmShipExplosionsMainForm)
  private
  protected
    FMeteorsList: TMeteorsList;
    FTimeBeforeNextMeteor: integer;
    procedure DoTimerLoop(const FPS: Int64; const DeltaTime: Int64); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmMeteorsMovesMainForm: TfrmMeteorsMovesMainForm;

implementation

{$R *.fmx}

uses
  udmMeteors,
  FMXShipMovesMainForm;

{ TSpriteMeteor }

constructor TSpriteMeteor.Create(const AW, AH: integer;
  const AParent: TFmxObject; const BitmapScale: Single);
var
  MeteorSize: integer;
  wh: integer;
  BMP: TBitmap;
  Id: integer;
begin
  inherited Create;

  FDestroyed := false;

  FArrayWidth := AW * 2;
  FArrayHeight := AH * 2;

  Id := random(dmMeteors.ImageList.Count);

  case random(8) of
    0: // top left
      begin
        FX := -FArrayWidth;
        FY := -FArrayHeight;
        FVX := 1 + random(5);
        FVY := 1 + random(5);
      end;
    1: // top right
      begin
        FX := FArrayWidth;
        FY := -FArrayHeight;
        FVX := -1 - random(5);
        FVY := 1 + random(5);
      end;
    2: // bottom right
      begin
        FX := FArrayWidth;
        FY := FArrayHeight;
        FVX := -1 - random(5);
        FVY := -1 - random(5);
      end;
    4: // bottom left
      begin
        FX := -FArrayWidth;
        FY := FArrayHeight;
        FVX := 1 + random(5);
        FVY := -1 - random(5);
      end;
    5: // middle top
      begin
        FX := 0;
        FY := -FArrayHeight;
        FVX := random(11) - 5;
        FVY := 1 + random(5);
      end;
    6: // middle bottom
      begin
        FX := 0;
        FY := FArrayHeight;
        FVX := random(11) - 5;
        FVY := -1 - random(5);
      end;
    7: // middle left
      begin
        FX := -FArrayWidth;
        FY := 0;
        FVX := 1 + random(5);
        FVY := random(11) - 5;
      end;
    8: // middle right
      begin
        FX := FArrayWidth;
        FY := 0;
        FVX := -1 - random(5);
        FVY := random(11) - 5;
      end;
  end;

  FVelocity := random(10) + 2;

  MeteorSize := round(CShipSize * (random(150) + 50) / 100);

  wh := round(MeteorSize * BitmapScale);
  BMP := dmMeteors.ImageList.bitmap(TSize.Create(wh, wh), Id);

  FImg := TImage.Create(nil);
  FImg.parent := AParent;
  FImg.visible := true;

  if not assigned(BMP) then
    raise Exception.Create('Can''t choose a meteor ! (' + Id.tostring + ')');

  FImg.Width := BMP.Width / BitmapScale;
  FImg.Height := BMP.Height / BitmapScale;
  FImg.bitmap.assign(BMP);
end;

destructor TSpriteMeteor.Destroy;
begin
  FImg.Free;
  inherited;
end;

procedure TSpriteMeteor.DoMove(const ViewPortXTopLeft, ViewPortYTopLeft
  : Single);
begin
  if FDestroyed then
    exit;

  FX := round(FX + FVX * FVelocity);
  FY := round(FY + FVY * FVelocity);

  if (FX > FArrayWidth) or (FX < -FArrayWidth) or (FY > FArrayHeight) or
    (FY < -FArrayHeight) then
    FDestroyed := true
  else
  begin
    FImg.Position.X := FX - ViewPortXTopLeft;
    FImg.Position.Y := FY - ViewPortYTopLeft;
  end;
end;

procedure TSpriteMeteor.SetVelocity(const Value: Single);
begin
  FVelocity := Value;
end;

procedure TSpriteMeteor.SetVX(const Value: integer);
begin
  FVX := Value;
end;

procedure TSpriteMeteor.SetVY(const Value: integer);
begin
  FVY := Value;
end;

procedure TSpriteMeteor.SetX(const Value: integer);
begin
  FX := Value;
end;

procedure TSpriteMeteor.SetY(const Value: integer);
begin
  FY := Value;
end;

{ TfrmMeteorsMovesMainForm }

constructor TfrmMeteorsMovesMainForm.Create(AOwner: TComponent);
begin
  inherited;
  FMeteorsList := TMeteorsList.Create;
  FTimeBeforeNextMeteor := random(5) * 1000; // 5 Seconds max
end;

destructor TfrmMeteorsMovesMainForm.Destroy;
begin
  FMeteorsList.Free;
  inherited;
end;

procedure TfrmMeteorsMovesMainForm.DoTimerLoop(const FPS, DeltaTime: Int64);
var
  i: integer;
  ViewPortXTopLeft, ViewPortYTopLeft: Single;
  w, h: Single;
begin
  inherited;

  if (FTimeBeforeNextMeteor > 0) then
    FTimeBeforeNextMeteor := FTimeBeforeNextMeteor - DeltaTime
  else
  begin
    if (CMaxMeteorNumber > FMeteorsList.Count) then
      FMeteorsList.Add(TSpriteMeteor.Create(imgStarField.bitmap.Width,
        imgStarField.bitmap.Height, self, imgShip.bitmap.BitmapScale));
    FTimeBeforeNextMeteor := random(5) * 1000; // 5 Seconds max
  end;

  w := imgStarField.bitmap.Width;
  h := imgStarField.bitmap.Height;
  ViewPortXTopLeft := CenterX - round(w / 2);
  ViewPortYTopLeft := CenterY - round(h / 2);

  for i := FMeteorsList.Count - 1 downto 0 do
    if FMeteorsList[i].IsDestroyed then
      FMeteorsList.Delete(i)
    else
      FMeteorsList[i].DoMove(ViewPortXTopLeft, ViewPortYTopLeft);

{$IFDEF DEBUG}
  lblShowFPS.Text := lblShowFPS.Text + ' NbMeteors:' +
    FMeteorsList.Count.tostring;
{$ENDIF}
end;

end.
