LIBRARY Sergius;
uses Math;
{$R *.RES}

const
  symZero=0; symHorz=1; symVert=2; symNone=3;
  cutFrac=0; cutNear=1;
  M=1e-4;

function Painter(var Name:ShortString):Variant;
begin
  Name:='Sergius Pupykin (2:5090/55.23)';
  Result:=VarArrayOf(['f1','f2','f3','f4','f5','f6','f7','f8','f9','f10']);
end;
function pow(x,p:Extended):Extended;
  begin result:=exp(p*ln(x)) end;


function f1(x,y,a,d:Extended;var r,g,b:Extended):ShortString;
begin
  result:='By Sergius';
  r:=symZero; g:=cutFrac;
  if(d<0)then exit;
  r:=sin(exp(sin(x*y)*cos(x)))/d;
  g:=exp(sin(exp(sin(exp(cos(x*y)/(sin(x+y)))))))/d;
  b:=cos(exp(sin(r*g)))/d;
end;

function f2(x,y,a,d:Extended;var r,g,b:Extended):ShortString;
begin
  result:='By Sergius';
  r:=symZero; g:=cutFrac;
  if(d<0)then exit;
  r:=exp(sin(x*y)*cos(x))/d;
  g:=sin(exp(sin(exp(cos(x*y)/(sin(x+y))))))/d;
  b:=cos(exp(sin(r*g)))/d;
end;

function f3(x,y,a,d:Extended;var r,g,b:Extended):ShortString;
begin
  result:='By Sergius бабочка-1';
  r:=symZero; g:=cutFrac;
  if(d<0)then exit;
  r:=arctan(x*pi*exp(x)/ln(pi*x*y))*cos(y*ln(x)*10/cos(x/sin(y)));
  g:=sin(x*y/y)*exp(sin(x*sin(y)))*sqr(arctan(x/y));
  b:=-sqrt(sin(sqr(sin(x))));
end;

function f4(x,y,a,d:Extended;var r,g,b:Extended):ShortString;
begin
  result:='By Sergius бабочка-2';
  r:=symZero; g:=cutFrac;
  if(d<0)then exit;
  r:=arctan(x*pi*exp(x)/ln(pi*x*y))*cos(y*ln(x/10*y/arctan(x*y))*10/cos(x/sin(y)));
  g:=sin(x*y/y)*exp(sin(x*sin(y)))*sqr(arctan(x/y));
  b:=-sqrt(sin(sqr(sin(x))));
end;

function f5(x,y,a,d:Extended;var r,g,b:Extended):ShortString;
begin
  result:='By Sergius';
  r:=symZero; g:=cutFrac;
  if(d<0)then exit;
  r:=-arctan(x*pi*exp(x)/ln(pi*x*y))*cos(y*ln(x/10*y/arctan(x*y))*10/cos(x/sin(y)));
  g:=cos(x*y/y)*exp(sin(x*sin(y/ln(x*18/(sin(x*y)*20*exp(x))))))*sqr(arctan(x/y));
  b:=-sin(x*y/ln(10*x/exp(y)))+sqrt(sin(sqr(sin(x)*cos(y/(sin(10/x*pi)*sin(x*pi/23))))));
end;

function f6(x,y,a,d:Extended;var r,g,b:Extended):ShortString;
begin
  result:='By Sergius';
  r:=symZero; g:=cutFrac;
  if(d<0)then exit;
  r:=sin(x/y)*sin(y/x);
  g:=cos(exp(sin(x*pi+y*d)))*sin(d*x*y);
  b:=sqr(sin(x*pi))+tan(sqr(sin(y*pi))+sin(12*d*y*x));
end;

function f7(x,y,a,d:Extended;var r,g,b:Extended):ShortString;
begin
  result:='By Sergius';
  r:=symZero; g:=cutFrac;
  if(d<0)then exit;
  g:=sin(ln(d+x)*pi*(tan(d*cos(1/x*arctan(d*y)+(tan(-cos(x/y/d)-sin(y/x/d)*y/sin(x)*exp(d*cos(d)*x)*d))*sin(x)/cos(d)/d*x))));
end;

function f8(x,y,a,d:Extended;var r,g,b:Extended):ShortString;
begin
  result:='By Sergius';
  r:=symZero; g:=cutFrac;
  if(d<0)then exit;
  r:=sin(ln(d+x)*pi*(tan(d*cos(1/x*arctan(d*y)+(tan(-cos(x/y/d)-sin(y/x/d)*y/sin(x)*exp(d*cos(d)*x)*d))*sin(x)/cos(d)/d*x))));
  g:=sin(-sqr(x*12)*sqr(y*12));
  b:=r/sin(d*x);
end;

function f9(x,y,a,d:Extended;var r,g,b:Extended):ShortString;
begin
  result:='By Sergius';
  r:=symZero; g:=cutFrac;
  if(d<0)then exit;
 r:=cos(y*exp(x/d))/cos(x*exp(y/d));
 g:=arctan(sin(cos(sqr(x*7))+sqr(y*12)));
 b:=x*exp(d)*sqr(y*4)-y*exp(d)*sqr(x*4);
end;

function f10(x,y,a,d:Extended;var r,g,b:Extended):ShortString;
begin
  result:='By Sergius';
  r:=symZero; g:=cutFrac;
  if(d<0)then exit;
  r:=sin(cos(y*exp(x/d))/cos(d*exp(d)/cos(d)));
  g:=exp(sin(x*pi+y*d))*sin(d*x*y);
  b:=d*x/sin(pow(y,y)/d)*sin(exp(sin(x/sin(x*y))));
end;

EXPORTS
  Painter,
  f1,f2,f3,f4,f5,f6,f7,f8,f9,f10;
END.
