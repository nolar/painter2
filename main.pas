UNIT Main;

INTERFACE

uses
  VCLUtils, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DrawThread, ComCtrls, Menus, ExtDlgs, ClipBrd;


type
  TMainWin = class(TForm)
    Splitter: TSplitter;
    Tree: TTreeView;
    PopupMenu: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    Paint: TPaintBox;
    SaveDialog: TSavePictureDialog;
    N3: TMenuItem;
    N4: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TreeChange(Sender: TObject; Node: TTreeNode);
    procedure N1Click(Sender: TObject);
    procedure PaintPaint(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
  private
    { Private declarations }
    DrawThread:TDrawThread;
  public
    { Public declarations }
    Bmp:TBitmap;
  end;

var
  MainWin: TMainWin;

IMPLEMENTATION

uses About;

{$R *.DFM}
var DLLs:Variant;
    pch:array[1..255]of char;


procedure TMainWin.FormCreate(Sender: TObject);
var Path:String;
    s:ShortString;
    idx,i,r:Integer;
    e1,e2,e3:Extended;
    sr:TSearchRec;
    lib:THandle;
    prc:function(var Name:ShortString):Variant;
    vrt:Variant;
    obj:TProc;
    tr:TTreeNode;
begin
  DrawThread:=nil;
  Path:=ExtractFilePath(ParamStr(0));
  idx:=1; DLLs:=VarArrayCreate([idx,idx],varInteger);
  r:=FindFirst(Path+'*.dll',faAnyFile,sr);
  while(r=0)do
    begin
      lib:=LoadLibrary(PChar(Path+sr.Name));
      if(lib<>0)then
        begin
          DLLs[idx]:=lib; idx:=idx+1; VarArrayRedim(DLLs,idx);
          @prc:=GetProcAddress(lib,'Painter'); s:=sr.name; vrt:=prc(s);
          tr:=Tree.Items.Add(nil,s);
          for i:=VarArrayLowBound(vrt,1) to VarArrayHighBound(vrt,1) do
            begin
              obj:=TProc.Create;
              strpcopy(@pch,String(vrt[i]));
              @obj.Addr:=GetProcAddress(lib,@pch);
              if(@obj.Addr<>nil)then
                begin
                  e1:=0; e2:=0; e3:=0; s:=obj.Addr(0,0,0,-1,e1,e2,e3);
                  obj.Sym:=Trunc(e1); obj.Cut:=Trunc(e2);
                  Tree.Items.AddChildObject(tr,s,obj);
                end else
                obj.Free;  
            end;
        end;
      r:=FindNext(sr);
    end;
  VarArrayRedim(DLLs,idx-1);
  Tree.Selected:=nil;
  Bmp:=TBitmap.Create; Bmp.PixelFormat:=pf24bit;
  Bmp.Width:=Paint.Width; Bmp.Height:=Paint.Height;
end;

procedure TMainWin.FormDestroy(Sender: TObject);
var idx:Integer;
begin
  if(DrawThread<>nil)then DrawThread.Free;
  for idx:=1 to VarArrayHighBound(DLLs,1) do
    FreeLibrary(DLLs[idx]);
  Bmp.Free;
end;

procedure TMainWin.TreeChange(Sender: TObject; Node: TTreeNode);
var tr:TTreeNode;
begin
  tr:=Tree.Selected;
  if((tr<>nil)and(tr.Data<>nil))then
    begin
      Caption:=Application.Title+' - '+tr.Text;
      if(DrawThread<>nil)then DrawThread.Free;
      DrawThread:=TDrawThread.Create(true);
      DrawThread.Obj:=TProc(Tree.Selected.Data);
      DrawThread.Resume;
    end;
end;

procedure TMainWin.PaintPaint(Sender: TObject);
var r:TRect;
begin
  r.Top:=0; r.Left:=0; r.Bottom:=bmp.Height; r.Right:=bmp.Width;
  Paint.Canvas.CopyRect(r,Bmp.Canvas,r);
end;

procedure TMainWin.FormResize(Sender: TObject);
begin
  Bmp.Width:=Paint.Width; Bmp.Height:=Paint.Height;
  TreeChange(Sender,nil);
end;

procedure TMainWin.N1Click(Sender: TObject);
begin
  if(SaveDialog.Execute)then
    Bmp.SaveToFile(SaveDialog.Filename);
end;

procedure TMainWin.N2Click(Sender: TObject);
var Clp:TClipBoard;
begin
  Clp:=TClipBoard.Create;
  Clp.Assign(Bmp);
  Clp.Free;
end;

procedure TMainWin.N4Click(Sender: TObject);
begin
  with(TAboutWin.Create(nil))do
    try ShowModal;
    finally Free;
    end;
end;

END.
