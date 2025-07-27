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
  File last update : 2025-07-27T17:19:04.000+02:00
  Signature : a920dfb18297efbdf69f092a332db751cacbd6b0
  ***************************************************************************
*)

unit FMXShipMovesMainForm;

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
  FMXStarFieldBackgroundMainForm,
  FMX.Objects,
  FMX.Controls.Presentation,
  FMX.ImgList;

const
  CShipSize = 128;

type
  TfrmShipMovesMainForm = class(TfrmStarFieldBackgroundMainForm)
    imgShip: TImage;
  private
    FShipID: integer;
    procedure SetShipID(const Value: integer);
  protected
    procedure DoTimerLoop(const FPS: Int64; const DeltaTime: Int64); override;
    procedure ChooseAShip;
  public
    property ShipID: integer read FShipID write SetShipID;
    constructor Create(AOwner: TComponent); override;
  end;

var
  frmShipMovesMainForm: TfrmShipMovesMainForm;

implementation

{$R *.fmx}

uses
  System.Math,
  udmShips;

procedure TfrmShipMovesMainForm.ChooseAShip;
var
  BMP: TBitmap;
  wh: integer;
begin
  ShipID := random(dmShips.ImageList.Count);
  wh := round(CShipSize * imgShip.bitmap.BitmapScale);
  BMP := dmShips.ImageList.bitmap(TSize.Create(wh, wh), ShipID);

  if not assigned(BMP) then
    raise Exception.Create('Can''t choose a ship ! (' + ShipID.tostring + ')');

  imgShip.Width := BMP.Width / imgShip.bitmap.BitmapScale;
  imgShip.Height := BMP.Height / imgShip.bitmap.BitmapScale;
  imgShip.bitmap.assign(BMP);
end;

constructor TfrmShipMovesMainForm.Create(AOwner: TComponent);
begin
  inherited;
  FShipID := -1;
end;

procedure TfrmShipMovesMainForm.DoTimerLoop(const FPS, DeltaTime: Int64);
var
  angle: extended;
begin
  inherited;

  if (FShipID < 0) then
    ChooseAShip
  else
  begin
    // https://2dengine.com/doc/vectors.html#Vector_angle
    angle := round(radtodeg(ArcTan2(vy, vx)) - 90);
    if (imgShip.RotationAngle < angle) then
    begin
      imgShip.RotationAngle := imgShip.RotationAngle + 360 * 1 / FPS;
      if imgShip.RotationAngle >= angle then
      begin
        velocity := 1;
        imgShip.RotationAngle := angle;
      end
      else
        velocity := 0;
    end
    else if (imgShip.RotationAngle > angle) then
    begin
      imgShip.RotationAngle := imgShip.RotationAngle - 360 * 1 / FPS;
      if imgShip.RotationAngle <= angle then
      begin
        velocity := 1;
        imgShip.RotationAngle := angle;
      end
      else
        velocity := 0;
    end
    else
      imgShip.RotationAngle := angle;
{$IFDEF DEBUG}
    lblShowFPS.Text := lblShowFPS.Text + ' VX:' + vx.tostring + ' VY:' +
      vy.tostring + ' Angle:' + angle.tostring;
{$ENDIF}
  end;
end;

procedure TfrmShipMovesMainForm.SetShipID(const Value: integer);
begin
  FShipID := Value;
end;

initialization

{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := true;
{$ENDIF}

end.
