unit uDMWhitePuff;

interface

uses
  System.SysUtils, System.Classes, Vcl.BaseImageCollection, Vcl.ImageCollection;

type
  TdmWhitePuff = class(TDataModule)
    ImageCollection1: TImageCollection;
  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
  end;

var
  dmWhitePuff: TdmWhitePuff;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
