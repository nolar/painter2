LIBRARY Pictures;
uses Math;
{$R *.RES}

const
  symZero=0; symHorz=1; symVert=2; symNone=3;
  cutFrac=0; cutNear=1;
  M=1e-4;

function Painter(var Name:ShortString):Variant;
begin
  Name:='Васильев Сергей (2:5090/55.26)';
  Result:=VarArrayOf(['f1','f2','f3','f4','f5','f6','f7','f8','f9','f10','f11','f12','f13','f14','f15','f16','f17']);
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

function f3(x,y,a,d:Extended;var r,g,b:Extended):ShortString;
begin
  result:='Блики в центре и красно-синие окресности. Похоже на рождающуюся Вселенную';
  r:=symZero; g:=cutNear;
  if(d<0)then exit;
  r:=pow(x/3,d);
  g:=1-d*2;
  b:=pow(y/3,d);
end;

function f4(x,y,a,d:Extended;var r,g,b:Extended):ShortString;
begin
  result:='Синусоидоподобные линии. Ерунда многоцветная';
  r:=symZero; g:=cutNear;
  if(d<0)then exit;
  g:=1-abs(x - sin(y*pi)/2);
  b:=1-abs(y - sin(x*pi)/2);
  r:=((1-b)+(1-g))/2;
end;

function f5(x,y,a,d:Extended;var r,g,b:Extended):ShortString;
const K=0.005;                    {Размер звезды пропорционален K}
begin
  result:='Синяя четырехугольная звезда на красно-зеленых сочетаниях';
  r:=symZero; g:=cutNear;
  if(d<0)then exit;
  r:=x*d;
  g:=y*d;
  b:=K/r/g;
end;

function f6(x,y,a,d:Extended;var r,g,b:Extended):ShortString;
begin
  result:='Четырехлепестковый синий цветок';
  r:=symZero; g:=cutNear;
  if(d<0)then exit;
  r:=x*d/y;
  g:=y*d/x;
  b:=((1-r)+(1-g))/2;
end;

function f7(x,y,a,d:Extended;var r,g,b:Extended):ShortString;
begin
  result:='Так себе';
  r:=symZero; g:=cutNear;
  if(d<0)then exit;
  r:=pow(x*2*d,y/d);
  g:=1-pow(y*2*d,x/d);
  b:=((1-r)+(1-g))/2;
end;

function f8(x,y,a,d:Extended;var r,g,b:Extended):ShortString;
begin
  result:='Windows 99. Ромбовидное окно';
  r:=symZero; g:=cutNear;
  if(d<0)then exit;
  r:=sin(x*y*pi*2)/d;
  g:=cos(x*y*pi*2)/d;
  b:=ln(abs(1-r-g)+M)/d;
end;

function f9(x,y,a,d:Extended;var r,g,b:Extended):ShortString;
begin
  result:='Желтые блики';
  r:=symZero; g:=cutNear;
  if(d<0)then exit;
  r:=pow(d/x*y,x*y);
  g:=pow(d/y*x,x*y);
  b:=sin(d*pi*4);
end;

function f10(x,y,a,d:Extended;var r,g,b:Extended):ShortString;
begin
  result:='Волшебный цветочек. Может аленький';
  r:=symZero; g:=cutNear;
  if(d<0)then exit;
  r:=pow(d/x*y,ln(x*y)/exp(x)/exp(y));
  g:=pow(d/y*x,ln(x*y)/exp(x)/exp(y));
  b:=sin(d*pi*4)/cos(d*pi*4);
end;

function f11(x,y,a,d:Extended;var r,g,b:Extended):ShortString;
begin
  result:='Цветовые кресты';
  r:=symZero; g:=cutNear;
  if(d<0)then exit;
  g:=y*x/d;
  b:=sqr(1-d);
  r:=1-g-b;
end;

function f12(x,y,a,d:Extended;var r,g,b:Extended):ShortString;
begin
  result:='Многоцветик';
  r:=symZero; g:=cutNear;
  if(d<0)then exit;
  g:=sqr(1-d)/y*x;
  b:=sqr(1-d)/x*y;
  r:=1-(g+b)/2;
end;

function f13(x,y,a,d:Extended;var r,g,b:Extended):ShortString;
begin
  result:='Синий глаз';
  r:=symZero; g:=cutNear;
  if(d<0)then exit;
  if(abs(y - 0.5/(x*2))<D)then
    r:=d else
    r:=1-d;
  g:=ln(x)*sin(r*pi);
  b:=ln(y)*cos(r*pi);
end;

function f14(x,y,a,d:Extended;var r,g,b:Extended):ShortString;
begin
  result:='Точковатость';
  r:=symZero; g:=cutNear;
  if(d<0)then exit;
  r:=d*abs(y - 0.5/(x/2));
  g:=y/exp(x)*sin(r*pi)/(ln(y)+M);
  b:=x/exp(y)*cos(r*pi)/(ln(x)+M);
end;

function f15(x,y,a,d:Extended;var r,g,b:Extended):ShortString;
begin
  result:='Мишень';
  r:=symZero; g:=cutNear;
  if(d<0)then exit;
  r:=cos(pi*sin(pi*x*y));
  g:=cos(pi*sin(pi/x/y));
  b:=tan(pi/2*cotan(pi/2*d));
end;

function f16(x,y,a,d:Extended;var r,g,b:Extended):ShortString;
begin
  result:='Распятие';
  r:=symZero; g:=cutNear;
  if(d<0)then exit;
  r:=x*y/d;
  g:=x*y/d;
  b:=(r*g)/d;
end;

function f17(x,y,a,d:Extended;var r,g,b:Extended):ShortString;
var i:Integer;
begin
  result:='Лохматые X-Wings';
  r:=symZero; g:=cutFrac;
  if(d<0)then exit;
  r:=1;
  for i:=1 to trunc(d*100) do
    r:=r*a/x/y;
end;

EXPORTS
  Painter,
  f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17;
END.
