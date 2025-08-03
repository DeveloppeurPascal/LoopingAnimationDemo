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
