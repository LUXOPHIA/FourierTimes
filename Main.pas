unit Main;

interface //#################################################################### ■

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.StdCtrls, FMX.Objects, FMX.Controls.Presentation,
  LUX, LUX.Sound,
  Core;

type
  TForm1 = class(TForm)
    ScrollBar1: TScrollBar;
    Panel1: TPanel;
      Panel2: TPanel;
          Button1: TButton;
    Image2: TImage;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure Image1Paint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
  private
    { private 宣言 }
    _Grad :TBitmapData;
  public
    { public 宣言 }
    _FileWAV       :TFileWAV;
    _IterL         :TFileWAVIterL;
    _IterR         :TFileWAVIterR;
    _TimeN         :Integer;
    _FreqN         :Integer;
    _FourierTimesL :TFourierTimes;
    _FourierTimesR :TFourierTimes;
    _ViewW         :Integer;
    ///// メソッド
    function ValueColor( const Value_:Single ) :TAlphaColor;
  end;

var
  Form1: TForm1;

implementation //############################################################### ■

{$R *.fmx}

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

function TForm1.ValueColor( const Value_:Single ) :TAlphaColor;
//------------------------------------------------------------
     function ToneMap( const V_:Single ) :Single;
     begin
          Result := V_ / ( 1 + V_ )
     end;
//------------------------------------------------------------
begin
     Result := _Grad.Color[ Round( ( _Grad.Width - 1 ) * ToneMap( 1000 * Value_ ) ), 0 ];
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

procedure TForm1.FormCreate(Sender: TObject);
begin
     _FileWAV := TFileWAV.Create( '../../_DATA\Sound.wav' );

     _IterL := TFileWAVIterL.Create( _FileWAV );
     _IterR := TFileWAVIterR.Create( _FileWAV );

     _TimeN := _FileWAV.SampleN div 100;
     _FreqN :=  256;

     _FourierTimesL := TFourierTimes.Create( _TimeN, _FreqN, _IterL );
     _FourierTimesR := TFourierTimes.Create( _TimeN, _FreqN, _IterR );

     _ViewW := 780;

     Image1.Bitmap.SetSize( _ViewW, _FreqN * 2 );

     ScrollBar1.Max := _TimeN - _ViewW;

     Image2.Bitmap.Map( TMapAccess.Read, _Grad );
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
     Image2.Bitmap.Unmap( _Grad );

     _FourierTimesL.Free;
     _FourierTimesR.Free;

     _IterL        .Free;
     _IterR        .Free;

     _FileWAV      .Free;
end;

////////////////////////////////////////////////////////////////////////////////

procedure TForm1.Image1Paint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
var
   I, X, Y :Integer;
   B :TBitmapData;
begin
     Image1.Bitmap.Map( TMapAccess.Write, B );

     I := Round( ScrollBar1.Value );

     for X := 0 to _ViewW-1 do
     begin
          for Y := 0 to _FreqN-1 do
          begin
               B.Color[ X, _FreqN - Y ] := ValueColor( ( _FourierTimesL.MapTF[ I + X, Y ] - _FourierTimesR.MapTF[ I + X, Y ] ).Size );
               B.Color[ X, _FreqN + Y ] := ValueColor( _FourierTimesR.MapTF[ I + X, Y ].Size );
          end;
     end;

     Image1.Bitmap.Unmap( B );
end;

procedure TForm1.ScrollBar1Change(Sender: TObject);
begin
     Image1.Repaint;
end;

////////////////////////////////////////////////////////////////////////////////

procedure TForm1.Button1Click(Sender: TObject);
begin
     _FourierTimesL.Analyze;
     _FourierTimesR.Analyze;

     Image1.Repaint;
end;

end. //######################################################################### ■
