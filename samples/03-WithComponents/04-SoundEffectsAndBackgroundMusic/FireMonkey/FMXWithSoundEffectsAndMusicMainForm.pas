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
  File last update : 2025-08-03T17:03:38.000+02:00
  Signature : 342b86ce622f79f78d8caa7da759e2b7fcaedd16
  ***************************************************************************
*)

unit FMXWithSoundEffectsAndMusicMainForm;

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
  FMXPlanetsMainForm,
  FMX.Objects,
  FMX.Controls.Presentation;

type
  TfrmWithSoundEffectsAndMusicMainForm = class(TfrmPlanetsMainForm)
    procedure FormCreate(Sender: TObject);
  private
  protected
    SoundExplosionID: integer;
    procedure DoStartShipExplosion; override;
    procedure DoLoadExplosion;
    procedure DoLoadBackgroundMusic;
    function GetPathFromDeployWizard: string;
  public
  end;

var
  frmWithSoundEffectsAndMusicMainForm: TfrmWithSoundEffectsAndMusicMainForm;

implementation

{$R *.fmx}

uses
  Gamolf.FMX.MusicLoop,
  System.IOUtils;

procedure TfrmWithSoundEffectsAndMusicMainForm.DoLoadBackgroundMusic;
var
  Filename: string;
begin
  Filename := TPath.Combine(GetPathFromDeployWizard, 'Notathing2.mp3');
  if tfile.Exists(Filename) then
    MusicLoop.Current.Play(Filename);
  MusicLoop.Current.Volume := 60;
end;

procedure TfrmWithSoundEffectsAndMusicMainForm.DoLoadExplosion;
var
  Filename: string;
begin
  Filename := TPath.Combine(GetPathFromDeployWizard, 'ChunkyExplosion.mp3');
  if tfile.Exists(Filename) then
    SoundExplosionID := SoundList.Current.Add(Filename)
  else
    SoundExplosionID := -1;
  SoundList.Current.Volume := 100;
end;

procedure TfrmWithSoundEffectsAndMusicMainForm.DoStartShipExplosion;
begin
  inherited;
  SoundList.Current.Play(SoundExplosionID);
end;

procedure TfrmWithSoundEffectsAndMusicMainForm.FormCreate(Sender: TObject);
begin
  inherited;

  DoLoadExplosion;
  DoLoadBackgroundMusic;
end;

function TfrmWithSoundEffectsAndMusicMainForm.GetPathFromDeployWizard: string;
begin
{$IF defined(ANDROID)}
  // deploy in .\assets\internal\
  result := TPath.GetDocumentsPath;
{$ELSEIF defined(MSWINDOWS)}
  // deploy in .\
{$IFDEF DEBUG}
  result := 'C:\Dev\LoopingAnimationDemo\assets\opengameart.org\ActionSynthTrack';
  // TODO : change it to debug on your computer
{$ELSE}
  result := extractfilepath(paramstr(0));
{$ENDIF}
{$ELSEIF defined(IOS)}
  // deploy in .\
  result := extractfilepath(paramstr(0));
{$ELSEIF defined(MACOS)}
  // deploy in Contents\MacOS
  result := extractfilepath(paramstr(0));
{$ELSEIF Defined(LINUX)}
  // deploy in .\
  result := extractfilepath(paramstr(0));
{$ELSE}
{$MESSAGE FATAL 'OS non supporté'}
{$ENDIF}
end;

end.
