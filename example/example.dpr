LIBRARY Example;
uses Math;
{$R *.RES}

const
  symZero=0; symHorz=1; symVert=2; symNone=3;
  cutFrac=0; cutNear=1;
  M=1e-4;

function Painter(var Name:ShortString):Variant;
begin
  Name:='Пример модуля';
  Result:=VarArrayOf(['f1','f2']);
end;
function pow(x,p:extended):extended;
  begin result:=exp(p*ln(x)) end;


function f1(x,y,a,d:Extended;var r,g,b:Extended):ShortString;
begin
  result:='Красно-синие обхватывающие друг друга полосы с элементами эротики';
  r:=symZero; g:=cutNear;
  if(d<0)then exit;
  if(abs(x- sqr(ln(abs(cos(d*pi*1.1))+M)) )<D)then
    r:=1 else
    r:=0;
  if(abs(y- sqr(ln(abs(sin(d*pi*1.5))+M)) )<D)then
    b:=1 else
    b:=0;
  g:=(r+b)/2;
end;

function f2(x,y,a,d:Extended;var r,g,b:Extended):ShortString;
begin
  result:='Муть. Просто, к тому же бесплатно :-)';
  r:=symZero; g:=cutNear;
  if(d<0)then exit;
  r:=random*abs(sin(d*4*pi+0*pi/3));
  g:=random*abs(sin(d*4*pi+1*pi/3));
  b:=random*abs(sin(d*4*pi+2*pi/3));
end;


EXPORTS
  Painter,
  f1,f2;
END.
