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
  File last update : 2025-07-27T17:34:32.000+02:00
  Signature : f554c6c61a58ef06db33d0b3c56d154c8dfb969a
  ***************************************************************************
*)

program FMXShipExplosions;

uses
  System.StartUpCopy,
  FMX.Forms,
  udmShips in '..\..\..\..\..\assets\kenney.nl\FMX\udmShips.pas' {dmShips: TDataModule},
  FMXShowFPSMainForm in '..\..\..\..\01-ShowFPS\FMX\FMXShowFPSMainForm.pas' {frmShowFPSMainForm},
  FMXStarFieldBackgroundMainForm in '..\..\..\..\02-StarFieldBackground\FMX\FMXStarFieldBackgroundMainForm.pas' {frmStarFieldBackgroundMainForm},
  FMXShipMovesMainForm in '..\..\01-ShipMoves\FireMonkey\FMXShipMovesMainForm.pas' {frmShipMovesMainForm},
  FMXShipExplosionsMainForm in 'FMXShipExplosionsMainForm.pas' {frmShipExplosionsMainForm},
  udmBlacksmoke in '..\..\..\..\..\assets\kenney.nl\FMX\udmBlacksmoke.pas' {dmBlacksmoke: TDataModule},
  udmExplosion in '..\..\..\..\..\assets\kenney.nl\FMX\udmExplosion.pas' {dmExplosion: TDataModule},
  udmFart in '..\..\..\..\..\assets\kenney.nl\FMX\udmFart.pas' {dmFart: TDataModule},
  udmFlash in '..\..\..\..\..\assets\kenney.nl\FMX\udmFlash.pas' {dmFlash: TDataModule},
  udmWhitepuff in '..\..\..\..\..\assets\kenney.nl\FMX\udmWhitepuff.pas' {dmWhitepuff: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmShips, dmShips);
  Application.CreateForm(TfrmShipExplosionsMainForm, frmShipExplosionsMainForm);
  Application.CreateForm(TdmBlacksmoke, dmBlacksmoke);
  Application.CreateForm(TdmExplosion, dmExplosion);
  Application.CreateForm(TdmFart, dmFart);
  Application.CreateForm(TdmFlash, dmFlash);
  Application.CreateForm(TdmWhitepuff, dmWhitepuff);
  Application.Run;
end.
