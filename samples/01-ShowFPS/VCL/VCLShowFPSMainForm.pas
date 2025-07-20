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
  File last update : 2025-07-20T18:11:34.000+02:00
  Signature : 20767b651f256384d894ed80cbc11465d6448a4f
  ***************************************************************************
*)

unit VCLShowFPSMainForm;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.StdCtrls;

const
  /// <summary>
  /// Number of frame per second we want.
  /// </summary>
  CTargetFPS = 60;

type
  TfrmShowFPSMainForm = class(TForm)
    TimerLoop: TTimer;
    lblShowFPS: TLabel;
    Panel1: TPanel;
    procedure TimerLoopTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FFramePerSecond: int64;
    procedure SetFramePerSecond(const Value: int64);
    function GetFramePerSecond: int64;
  protected
    property FramePerSecond: int64 read GetFramePerSecond
      write SetFramePerSecond;
    procedure DoTimerLoop(const FPS, DeltaTime: int64); virtual;
  public
  end;

var
  frmShowFPSMainForm: TfrmShowFPSMainForm;

implementation

{$R *.dfm}

uses
  System.Diagnostics;

var
  /// <summary>
  /// Watch to calculate the time between two loops
  /// </summary>
  GStopWatch: TStopwatch;
  /// <summary>
  /// Milliseconds when last loop started
  /// </summary>
  GStopWatchPreviousMS: int64;
  /// <summary>
  /// Milliseconds between previous and current loop
  /// </summary>
  GDeltaTime: int64;

procedure InitStopWatch;
begin
  GStopWatch.StartNew;
  GStopWatchPreviousMS := 0;
  GDeltaTime := 0;
end;

procedure TfrmShowFPSMainForm.DoTimerLoop(const FPS, DeltaTime: int64);
begin
  lblShowFPS.Caption := 'FPS : ' + FPS.ToString;
end;

procedure TfrmShowFPSMainForm.FormCreate(Sender: TObject);
begin
  TimerLoop.enabled := false;
  FramePerSecond := CTargetFPS;
end;

procedure TfrmShowFPSMainForm.FormHide(Sender: TObject);
begin
  TimerLoop.enabled := false;
end;

procedure TfrmShowFPSMainForm.FormShow(Sender: TObject);
begin
  InitStopWatch;
  TimerLoop.enabled := true;
end;

function TfrmShowFPSMainForm.GetFramePerSecond: int64;
var
  CurrentMS: int64;
begin
  GStopWatch.stop;
  CurrentMS := GStopWatch.ElapsedMilliseconds;
  GStopWatch.start;
  if CurrentMS > GStopWatchPreviousMS then
  begin
    GDeltaTime := CurrentMS - GStopWatchPreviousMS;
    result := 1000 div GDeltaTime;
  end
  else
    result := 0;
  GStopWatchPreviousMS := CurrentMS;
end;

procedure TfrmShowFPSMainForm.SetFramePerSecond(const Value: int64);
begin
  FFramePerSecond := Value;
  TimerLoop.Interval := 1000 div FFramePerSecond;
end;

procedure TfrmShowFPSMainForm.TimerLoopTimer(Sender: TObject);
var
  FPS: int64;
begin
  FPS := FramePerSecond;
  if FPS > FFramePerSecond then
    exit;
  DoTimerLoop(FPS, GDeltaTime);
end;

initialization

InitStopWatch;

end.
