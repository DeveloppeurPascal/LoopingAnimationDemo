unit uDMMeteors;

interface

uses
  System.SysUtils, System.Classes, Vcl.BaseImageCollection, Vcl.ImageCollection;

type
  TdmMeteors = class(TDataModule)
    ImageCollection1: TImageCollection;
  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
  end;

var
  dmMeteors: TdmMeteors;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
