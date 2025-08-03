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
  File last update : 2025-08-03T16:41:20.000+02:00
  Signature : 9e29b3b1123b4b4161f0e0cd4907bceee78886ef
  ***************************************************************************
*)

unit FMXPlanetsMainForm;

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
  FMXMeteorsExplosionsMainForm,
  FMX.Objects,
  FMX.Controls.Presentation,
  udmPlanets;

type
  TPlanet = record
    X, Y: integer;
    PlanetID: integer;
    Size: integer;
  end;

  TPlanetsList = array of TPlanet;

  TfrmPlanetsMainForm = class(TfrmMeteorsExplosionsMainForm)
    procedure imgStarFieldResized(Sender: TObject);
  private
    FPlanetsList: TPlanetsList;
  protected
    procedure DoTimerLoop(const FPS: Int64; const DeltaTime: Int64); override;
  public
    procedure InitPlanets;
  end;

var
  frmPlanetsMainForm: TfrmPlanetsMainForm;

implementation

{$R *.fmx}

procedure TfrmPlanetsMainForm.DoTimerLoop(const FPS, DeltaTime: Int64);
var
  i: integer;
  ViewPortXTopLeft, ViewPortYTopLeft, ViewPortXBottomRight,
    ViewPortYBottomRight: single;
  w, h: single;
begin
  inherited;

  w := imgStarField.Bitmap.Width;
  h := imgStarField.Bitmap.height;

  ViewPortXTopLeft := CenterX - round(w / 2);
  ViewPortYTopLeft := CenterY - round(h / 2);
  ViewPortXBottomRight := CenterX + round(w / 2);
  ViewPortYBottomRight := CenterY + round(h / 2);

  imgStarField.Bitmap.Canvas.BeginScene;
  try
    for i := 1 to length(FPlanetsList) - 1 do
      if ((FPlanetsList[i].X + FPlanetsList[i].Size >= ViewPortXTopLeft) or
        (FPlanetsList[i].X <= ViewPortXBottomRight)) and
        ((FPlanetsList[i].Y + FPlanetsList[i].Size >= ViewPortYTopLeft) or
        (FPlanetsList[i].Y <= ViewPortYBottomRight)) then
      begin
{$IFDEF DEBUG}
        imgStarField.Bitmap.Canvas.FillEllipse
          (TRectF.Create(FPlanetsList[i].X - ViewPortXTopLeft,
          FPlanetsList[i].Y - ViewPortYTopLeft,
          FPlanetsList[i].X - ViewPortXTopLeft + FPlanetsList[i].Size,
          FPlanetsList[i].Y - ViewPortYTopLeft + FPlanetsList[i].Size), 0.2);
{$ENDIF}
        imgStarField.Bitmap.Canvas.DrawBitmap
          (dmPlanets.ImageList.Bitmap(tsizef.Create(FPlanetsList[i].Size,
          FPlanetsList[i].Size), FPlanetsList[i].PlanetID),
          TRectF.Create(0, 0, FPlanetsList[i].Size, FPlanetsList[i].Size),
          TRectF.Create(FPlanetsList[i].X - ViewPortXTopLeft,
          FPlanetsList[i].Y - ViewPortYTopLeft,
          FPlanetsList[i].X - ViewPortXTopLeft + FPlanetsList[i].Size,
          FPlanetsList[i].Y - ViewPortYTopLeft + FPlanetsList[i].Size),
          1, true);
      end;
  finally
    imgStarField.Bitmap.Canvas.EndScene;
  end;
end;

procedure TfrmPlanetsMainForm.imgStarFieldResized(Sender: TObject);
begin
  inherited;
  InitPlanets;
end;

procedure TfrmPlanetsMainForm.InitPlanets;
var
  i: integer;
  w, h: integer;
begin
  w := imgStarField.Bitmap.Width;
  h := imgStarField.Bitmap.height;

  setlength(FPlanetsList, random(20) + 3);

  for i := 1 to length(FPlanetsList) - 1 do
  begin
    FPlanetsList[i].X := random(w * 3) - round(w * 1.5);
    FPlanetsList[i].Y := random(h * 3) - round(h * 1.5);
    FPlanetsList[i].PlanetID := random(dmPlanets.ImageList.Count);
    FPlanetsList[i].Size := random(192) + 64;
  end;
end;

end.
