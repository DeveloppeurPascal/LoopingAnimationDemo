unit uDMPlanets;

interface

uses
  System.SysUtils, System.Classes, Vcl.BaseImageCollection, Vcl.ImageCollection;

type
  TdmPlanets = class(TDataModule)
    ImageCollection1: TImageCollection;
  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
  end;

var
  dmPlanets: TdmPlanets;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
