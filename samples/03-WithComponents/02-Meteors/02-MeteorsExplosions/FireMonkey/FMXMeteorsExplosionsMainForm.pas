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
  File last update : 2025-07-27T20:16:52.000+02:00
  Signature : 5ae3c98289e790f0d0f5e7d3f917fabc5afd4a28
  ***************************************************************************
*)

unit FMXMeteorsExplosionsMainForm;

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
  FMXMeteorsMovesMainForm,
  FMX.Objects,
  FMX.Controls.Presentation,
  System.ImageList,
  FMX.ImgList;

type
  TSpriteMeteorHelpers = class helper for TSpriteMeteor
  private
  protected
  public
    function HasCollision(const Rect: TRectF): boolean;
    procedure DoStartMeteorExplosion;
    procedure DoEndMeteorExplosion;
    procedure DoShowNextFrame;
  end;

  TfrmMeteorsExplosionsMainForm = class(TfrmMeteorsMovesMainForm)
  private
  protected
    procedure DoTimerLoop(const FPS: Int64; const DeltaTime: Int64); override;
  public
  end;

var
  frmMeteorsExplosionsMainForm: TfrmMeteorsExplosionsMainForm;

implementation

{$R *.fmx}

uses
  udmBlacksmoke,
  udmExplosion,
  udmFart,
  udmFlash,
  udmWhitepuff;

procedure TSpriteMeteorHelpers.DoEndMeteorExplosion;
begin
  IsDestroyed := true;
  fimg.Visible := false;
end;

procedure TSpriteMeteorHelpers.DoShowNextFrame;
var
  ImgLst: TImageList;
  BMP: TBitmap;
begin
  if IsDestroyed then
    exit;

  if assigned(fimg.TagObject) and (fimg.TagObject is TImageList) then
  begin // an explosion animation is assigned to the meteor image
    ImgLst := fimg.TagObject as TImageList;
    fimg.tag := fimg.tag + 1;
    if fimg.tag >= ImgLst.Count then
      DoEndMeteorExplosion
    else
    begin
      BMP := ImgLst.bitmap(TSize.Create(fimg.bitmap.Width, fimg.bitmap.height),
        fimg.tag);

      if not assigned(BMP) then
        raise Exception.Create('Undefined explosion frame ! (' +
          ImgLst.owner.classname + ' - ' + fimg.tag.tostring + ')');

      fimg.bitmap.assign(BMP);
    end;
  end;
end;

procedure TSpriteMeteorHelpers.DoStartMeteorExplosion;
begin
  case random(5) of
    0:
      fimg.TagObject := dmWhitepuff.ImageList;
    1:
      fimg.TagObject := dmFlash.ImageList;
    2:
      fimg.TagObject := dmFart.ImageList;
    3:
      fimg.TagObject := dmExplosion.ImageList;
    4:
      fimg.TagObject := dmBlacksmoke.ImageList;
  end;
  fimg.tag := -1;

  velocity := 0;
end;

function TSpriteMeteorHelpers.HasCollision(const Rect: TRectF): boolean;
begin
  if IsDestroyed then
    exit(false);

  result := IntersectRect(Rect, fimg.BoundsRect);
end;

procedure TfrmMeteorsExplosionsMainForm.DoTimerLoop(const FPS,
  DeltaTime: Int64);
var
  i: integer;
begin
  inherited;

  for i := FMeteorsList.Count - 1 downto 0 do
  begin
    if (not assigned(ExplosionType)) and FMeteorsList[i].HasCollision
      (imgShip.BoundsRect) then
    begin
      DoStartShipExplosion;
      FMeteorsList[i].DoStartMeteorExplosion;
    end;
    FMeteorsList[i].DoShowNextFrame;
  end;
end;

end.
