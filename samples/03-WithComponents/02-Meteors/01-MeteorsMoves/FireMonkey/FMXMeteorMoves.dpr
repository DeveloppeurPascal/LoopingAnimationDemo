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
  File last update : 2025-07-27T18:09:02.000+02:00
  Signature : 942105a90b78e06d5f4caa23547ddfe4cf23378c
  ***************************************************************************
*)

program FMXMeteorMoves;

uses
  System.StartUpCopy,
  FMX.Forms,
  udmBlacksmoke in '..\..\..\..\..\assets\kenney.nl\FMX\udmBlacksmoke.pas' {dmBlacksmoke: TDataModule},
  udmExplosion in '..\..\..\..\..\assets\kenney.nl\FMX\udmExplosion.pas' {dmExplosion: TDataModule},
  udmFart in '..\..\..\..\..\assets\kenney.nl\FMX\udmFart.pas' {dmFart: TDataModule},
  udmFlash in '..\..\..\..\..\assets\kenney.nl\FMX\udmFlash.pas' {dmFlash: TDataModule},
  udmMeteors in '..\..\..\..\..\assets\kenney.nl\FMX\udmMeteors.pas' {dmMeteors: TDataModule},
  udmShips in '..\..\..\..\..\assets\kenney.nl\FMX\udmShips.pas' {dmShips: TDataModule},
  udmWhitepuff in '..\..\..\..\..\assets\kenney.nl\FMX\udmWhitepuff.pas' {dmWhitepuff: TDataModule},
  FMXShowFPSMainForm in '..\..\..\..\01-ShowFPS\FMX\FMXShowFPSMainForm.pas' {frmShowFPSMainForm},
  FMXStarFieldBackgroundMainForm in '..\..\..\..\02-StarFieldBackground\FMX\FMXStarFieldBackgroundMainForm.pas' {frmStarFieldBackgroundMainForm},
  FMXShipMovesMainForm in '..\..\..\01-Ship\01-ShipMoves\FireMonkey\FMXShipMovesMainForm.pas' {frmShipMovesMainForm},
  FMXShipExplosionsMainForm in '..\..\..\01-Ship\02-ShipExplosions\FireMonkey\FMXShipExplosionsMainForm.pas' {frmShipExplosionsMainForm},
  FMXMeteorsMovesMainForm in 'FMXMeteorsMovesMainForm.pas' {frmMeteorsMovesMainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmBlacksmoke, dmBlacksmoke);
  Application.CreateForm(TdmExplosion, dmExplosion);
  Application.CreateForm(TdmFart, dmFart);
  Application.CreateForm(TdmFlash, dmFlash);
  Application.CreateForm(TdmMeteors, dmMeteors);
  Application.CreateForm(TdmShips, dmShips);
  Application.CreateForm(TdmWhitepuff, dmWhitepuff);
  Application.CreateForm(TfrmMeteorsMovesMainForm, frmMeteorsMovesMainForm);
  Application.Run;
end.
