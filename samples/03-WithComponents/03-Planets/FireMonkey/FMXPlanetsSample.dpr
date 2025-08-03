program FMXPlanetsSample;

uses
  System.StartUpCopy,
  FMX.Forms,
  FMXShowFPSMainForm in '..\..\..\01-ShowFPS\FMX\FMXShowFPSMainForm.pas' {frmShowFPSMainForm},
  FMXStarFieldBackgroundMainForm in '..\..\..\02-StarFieldBackground\FMX\FMXStarFieldBackgroundMainForm.pas' {frmStarFieldBackgroundMainForm},
  FMXShipMovesMainForm in '..\..\01-Ship\01-ShipMoves\FireMonkey\FMXShipMovesMainForm.pas' {frmShipMovesMainForm},
  FMXShipExplosionsMainForm in '..\..\01-Ship\02-ShipExplosions\FireMonkey\FMXShipExplosionsMainForm.pas' {frmShipExplosionsMainForm},
  FMXMeteorsMovesMainForm in '..\..\02-Meteors\01-MeteorsMoves\FireMonkey\FMXMeteorsMovesMainForm.pas' {frmMeteorsMovesMainForm},
  FMXMeteorsExplosionsMainForm in '..\..\02-Meteors\02-MeteorsExplosions\FireMonkey\FMXMeteorsExplosionsMainForm.pas' {frmMeteorsExplosionsMainForm},
  FMXPlanetsMainForm in 'FMXPlanetsMainForm.pas' {frmPlanetsMainForm},
  udmBlacksmoke in '..\..\..\..\assets\kenney.nl\FMX\udmBlacksmoke.pas' {dmBlacksmoke: TDataModule},
  udmExplosion in '..\..\..\..\assets\kenney.nl\FMX\udmExplosion.pas' {dmExplosion: TDataModule},
  udmFart in '..\..\..\..\assets\kenney.nl\FMX\udmFart.pas' {dmFart: TDataModule},
  udmFlash in '..\..\..\..\assets\kenney.nl\FMX\udmFlash.pas' {dmFlash: TDataModule},
  udmMeteors in '..\..\..\..\assets\kenney.nl\FMX\udmMeteors.pas' {dmMeteors: TDataModule},
  udmPlanets in '..\..\..\..\assets\kenney.nl\FMX\udmPlanets.pas' {dmPlanets: TDataModule},
  udmShips in '..\..\..\..\assets\kenney.nl\FMX\udmShips.pas' {dmShips: TDataModule},
  udmWhitepuff in '..\..\..\..\assets\kenney.nl\FMX\udmWhitepuff.pas' {dmWhitepuff: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmBlacksmoke, dmBlacksmoke);
  Application.CreateForm(TdmExplosion, dmExplosion);
  Application.CreateForm(TdmFart, dmFart);
  Application.CreateForm(TdmFlash, dmFlash);
  Application.CreateForm(TdmMeteors, dmMeteors);
  Application.CreateForm(TdmPlanets, dmPlanets);
  Application.CreateForm(TdmShips, dmShips);
  Application.CreateForm(TdmWhitepuff, dmWhitepuff);
  Application.CreateForm(TfrmPlanetsMainForm, frmPlanetsMainForm);
  Application.Run;
end.
