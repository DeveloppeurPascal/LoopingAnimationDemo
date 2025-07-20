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
  File last update : 2025-07-20T16:13:18.000+02:00
  Signature : 9b774a1f1520e4ae94c73bd88bd465e89f3b0f37
  ***************************************************************************
*)

unit uDMWhitePuff;

interface

uses
  System.SysUtils, System.Classes, Vcl.BaseImageCollection, Vcl.ImageCollection;

type
  TdmWhitePuff = class(TDataModule)
    ImageCollection1: TImageCollection;
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  dmWhitePuff: TdmWhitePuff;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
