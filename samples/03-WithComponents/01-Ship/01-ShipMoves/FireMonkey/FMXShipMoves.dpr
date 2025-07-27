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
  File last update : 2025-07-27T15:46:16.000+02:00
  Signature : dbdd07c849d01ba3e6a4d33e83b3cb3fd9d70bc8
  ***************************************************************************
*)

program FMXShipMoves;

uses
  System.StartUpCopy,
  FMX.Forms,
  FMXShowFPSMainForm in '..\..\..\..\01-ShowFPS\FMX\FMXShowFPSMainForm.pas' {frmShowFPSMainForm},
  FMXStarFieldBackgroundMainForm in '..\..\..\..\02-StarFieldBackground\FMX\FMXStarFieldBackgroundMainForm.pas' {frmStarFieldBackgroundMainForm},
  FMXShipMovesMainForm in 'FMXShipMovesMainForm.pas' {frmShipMovesMainForm},
  udmShips in '..\..\..\..\..\assets\kenney.nl\FMX\udmShips.pas' {dmShips: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmShips, dmShips);
  Application.CreateForm(TfrmShipMovesMainForm, frmShipMovesMainForm);
  Application.Run;
end.
