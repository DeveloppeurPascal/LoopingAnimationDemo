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
  File last update : 2025-07-18T21:04:44.611+02:00
  Signature : a355677eb3c80f49e4dbcd44eb7ea8d7e1b95b64
  ***************************************************************************
*)

unit udmWhitepuff;

// ****************************************
// * Images from folder :
// * /Users/patrickpremartin/Downloads/LoopingAnimationDemo-assets/_/White puff
// ****************************************
//
// This file contains a TDataModule with a 
// TImageList to use in a FireMonkey project.
//
// ****************************************
// File generator : Folder to FMX Image List v1.2
// Website : https://folder2fmximagelist.olfsoftware.fr/
// Generation date : 2025-07-18T21:04:44.610Z
//
// Don't do any change on this file.
// They will be erased by next generation !
// ****************************************

interface

uses
  System.SysUtils, 
  System.Classes, 
  System.ImageList,
  FMX.ImgList;

type
  TdmWhitepuff = class(TDataModule)
    ImageList: TImageList;
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  dmWhitepuff: TdmWhitepuff;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
