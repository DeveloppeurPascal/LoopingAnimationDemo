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
  File last update : 2025-07-20T16:09:30.000+02:00
  Signature : 690da90666239a274b1ae3cfd8a5b0c533e00898
  ***************************************************************************
*)

unit uDMFart;

interface

uses
  System.SysUtils, System.Classes, Vcl.BaseImageCollection, Vcl.ImageCollection;

type
  TdmFart = class(TDataModule)
    ImageCollection1: TImageCollection;
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  dmFart: TdmFart;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
