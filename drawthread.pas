UNIT DrawThread;

INTERFACE

uses
  Windows, Graphics, Classes;

const
  symZero=0; symHorz=1; symVert=2; symNone=3;
  cutFrac=0; cutNear=1;
type
  TProc    = class(TObject)
  public
    Addr:function(x,y,a,d:Extended; var r,g,b:Extended):ShortString;
    Sym,Cut:Integer;
  end;
  

  TDrawThread = class(TThread)
  private
    { Private declarations }
  protected
    cx,cy,sx,sy,px,py,w,h:Integer;
    xc,yc,ac,dc,rc,gc,bc:extended;
    tc:TColor;
    procedure Execute; override;
    procedure Prep;
    procedure Point;
    procedure Inval;
  public
    obj:TProc;
  end;

IMPLEMENTATION

uses Main;

const M=1e-4;
function minabs(a,b:extended):extended;
  begin if(abs(a)<abs(b))then result:=a else result:=b end;
function maxabs(a,b:extended):extended;
  begin if(abs(a)>abs(b))then result:=a else result:=b end;
function sign(x:extended):extended;
  begin if(x<>0)then result:=x/abs(x) else result:=0 end;
function pow(x,p:extended):extended;
  begin result:=exp(p*ln(x)) end;

procedure TDrawThread.Prep;
begin
  w:=MainWin.Bmp.width;
  h:=MainWin.Bmp.height;
  cx:=w div 2;
  cy:=h div 2;
  sx:=0; sy:=0;
  case(obj.sym)of
    symHorz:sy:=cy;
    symVert:sx:=cx;
    symZero:begin
              sx:=cx;
              sy:=cy;
            end;
  end;
end;

procedure TDrawThread.Point;
begin
  MainWin.Bmp.Canvas.Pixels[px,py]:=tc;
  case(obj.sym)of
    symHorz:MainWin.Bmp.Canvas.Pixels[     px,2*cy-py]:=tc;
    symVert:MainWin.Bmp.Canvas.Pixels[2*cx-px,     py]:=tc;
    symZero:begin
              MainWin.Bmp.Canvas.Pixels[     px,2*cy-py]:=tc;
              MainWin.Bmp.Canvas.Pixels[2*cx-px,     py]:=tc;
              MainWin.Bmp.canvas.Pixels[2*cx-px,2*cy-py]:=tc;
            end;
  end;
end;

procedure TDrawThread.Inval;
begin
  MainWin.Paint.Invalidate;
end;


procedure TDrawThread.Execute;
var x,y:Integer;
begin
  if(obj=nil)then exit;
  Synchronize(Prep);
  for x:=sx to w-1 do
    begin
      for y:=sy to h-1 do
        begin
          if(Terminated)then exit;
          px:=x; py:=y;
          xc:=(x-cx)/cx; yc:=(y-cy)/cy; if(xc=0)then xc:=M; if(yc=0)then yc:=M;
          ac:=arctan(yc/xc);            if(ac=0)then ac:=M;
          dc:=sqrt((sqr(xc)+sqr(yc))/2);
          rc:=0; gc:=0; bc:=0;
          obj.Addr(xc,yc,ac,dc , rc,gc,bc);
          case(obj.Cut)of
            cutFrac:begin
                      rc:=abs(frac(rc));
                      gc:=abs(frac(gc));
                      bc:=abs(frac(bc));
                    end;
            cutNear:begin
                      if(rc>1)then rc:=1; if(rc<0)then rc:=0;
                      if(gc>1)then gc:=1; if(gc<0)then gc:=0;
                      if(bc>1)then bc:=1; if(bc<0)then bc:=0;
                    end;
          end;
          tc:=rgb(trunc(rc*$ff),trunc(gc*$ff),trunc(bc*$ff));
          Synchronize(Point);
        end;
      if(((x-sx)div 10)=((x-sx)/10))then Synchronize(Inval);
    end;  
  Synchronize(Inval);
end;

END.
