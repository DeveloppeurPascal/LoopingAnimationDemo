unit uDMFart;

interface

uses
  System.SysUtils, System.Classes, Vcl.BaseImageCollection, Vcl.ImageCollection;

type
  TdmFart = class(TDataModule)
    ImageCollection1: TImageCollection;
  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
  end;

var
  dmFart: TdmFart;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
