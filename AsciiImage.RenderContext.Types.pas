unit AsciiImage.RenderContext.Types;

interface

uses
  Graphics,
  {$if CompilerVersion > 22}
  System.Types,
  System.UITypes;
  {$Else}
  Types;
  {$IfEnd}

{$If declared(TGraphic)}
  const Framework = 'VCL';
{$Else}
  const Framework = 'FM';
  const clNone = TAlphaColorRec.Null;
  const clBlack = TAlphaColorRec.Black;
{$IfEnd}

type
  {$If Framework = 'VCL'}
  TColorValue = TColor;
  {$Else}
  TColorValue = TAlphaColor;
  {$IfEnd}


{$if (CompilerVersion > 22) and declared(System.Types.TPointF)}
  TPointF = System.Types.TPointF;
{$Else}
  TPointF = record
    X: Single;
    Y: Single;
  end;
{$IfEnd}

{$if (CompilerVersion > 22) and declared(System.Types.TRectF)}
  TRectF = System.Types.TRectF;
{$Else}
  TRectF = record
    Left, Top, Right, Bottom: Single;
  end;
{$IfEnd}

{$if CompilerVersion > 22}
  TRect = System.Types.TRect;
{$Else}
  TRect = Types.TRect;
{$IfEnd}


function PointF(AX, AY: Single): TPointF; inline;
function RectF(ALeft, ATop, ARight, ABottom: Single): TRectF; inline;

implementation

function PointF(AX, AY: Single): TPointF;
begin
  Result.X := AX;
  Result.Y := AY;
end;

function RectF(ALeft, ATop, ARight, ABottom: Single): TRectF;
begin
  Result.Left := ALeft;
  Result.Top := ATop;
  Result.Right := ARight;
  Result.Bottom := ABottom;
end;

end.
