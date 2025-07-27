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
  File last update : 2025-07-27T17:58:52.000+02:00
  Signature : 2de7e92a5c13ad4ab6bbfa15a1a5e85463916884
  ***************************************************************************
*)

unit FMXShipExplosionsMainForm;

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
  FMXShipMovesMainForm,
  FMX.Objects,
  FMX.Controls.Presentation,
  System.ImageList,
  FMX.ImgList;

type
  TfrmShipExplosionsMainForm = class(TfrmShipMovesMainForm)
    imgShipExplosion: TImage;
    procedure Panel1Click(Sender: TObject);
  private
    FExplosionFrame: integer;
    FExplosionType: TImageList;
    procedure SetExplosionFrame(const Value: integer);
    procedure SetExplosionType(const Value: TImageList);
  protected
    procedure DoTimerLoop(const FPS: Int64; const DeltaTime: Int64); override;
    procedure DoStartShipExplosion; virtual;
    procedure DoEndShipExplosion; virtual;
  public
    property ExplosionType: TImageList read FExplosionType
      write SetExplosionType;
    property ExplosionFrame: integer read FExplosionFrame
      write SetExplosionFrame;
    constructor Create(AOwner: TComponent); override;
  end;

var
  frmShipExplosionsMainForm: TfrmShipExplosionsMainForm;

implementation

{$R *.fmx}

uses
  udmBlacksmoke,
  udmExplosion,
  udmFart,
  udmFlash,
  udmWhitepuff;

constructor TfrmShipExplosionsMainForm.Create(AOwner: TComponent);
begin
  inherited;

  FExplosionFrame := -1;
  FExplosionType := nil;
  imgShipExplosion.Visible := false;
end;

procedure TfrmShipExplosionsMainForm.DoEndShipExplosion;
begin
  ExplosionType := nil;
  imgShipExplosion.Visible := false;
  ChooseAShip;
  DoResetSpeedAndPosition;
end;

procedure TfrmShipExplosionsMainForm.DoStartShipExplosion;
begin
  case random(5) of
    0:
      FExplosionType := dmWhitepuff.ImageList;
    1:
      FExplosionType := dmFlash.ImageList;
    2:
      FExplosionType := dmFart.ImageList;
    3:
      FExplosionType := dmExplosion.ImageList;
    4:
      FExplosionType := dmBlacksmoke.ImageList;
  end;
  FExplosionFrame := -1;

  velocity := 0;

  imgShipExplosion.Visible := true;
  imgShipExplosion.BringToFront;
end;

procedure TfrmShipExplosionsMainForm.DoTimerLoop(const FPS, DeltaTime: Int64);
var
  BMP: TBitmap;
  wh: integer;
  BitmapScale: single;
begin
  inherited;

  if assigned(ExplosionType) then
  begin
    velocity := 0;

    inc(FExplosionFrame);
    if (FExplosionFrame >= ExplosionType.Count) then
      DoEndShipExplosion
    else
    begin
      BitmapScale := imgShip.bitmap.BitmapScale;
      wh := round(CShipSize * BitmapScale * 1.5);
      BMP := ExplosionType.bitmap(TSize.Create(wh, wh), FExplosionFrame);

      if not assigned(BMP) then
        raise Exception.Create('Undefined explosion frame ! (' +
          ExplosionType.owner.classname + ' - ' +
          FExplosionFrame.tostring + ')');

      imgShipExplosion.Width := BMP.Width / BitmapScale;
      imgShipExplosion.Height := BMP.Height / BitmapScale;
      imgShipExplosion.bitmap.assign(BMP);
    end;
  end;
end;

procedure TfrmShipExplosionsMainForm.Panel1Click(Sender: TObject);
begin
  DoStartShipExplosion;
end;

procedure TfrmShipExplosionsMainForm.SetExplosionFrame(const Value: integer);
begin
  FExplosionFrame := Value;
end;

procedure TfrmShipExplosionsMainForm.SetExplosionType(const Value: TImageList);
begin
  FExplosionType := Value;
end;

end.
