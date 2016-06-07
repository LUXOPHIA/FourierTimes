unit LUX.Sound;

interface //#################################################################### ■

uses LUX, LUX.D1, System.Generics.Collections;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TChunkRIFF

     TChunkRIFF = packed record
     private
     public
       Name :array [ 0..3 ] of AnsiChar;
       Size :Cardinal;
       Kind :array [ 0..3 ] of AnsiChar;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TChunkFormat

     TChunkFormat = packed record
     private
     public
       Name        :array [ 0..3 ] of AnsiChar;
       Size        :Cardinal;
       Compression :Word;
       ChannelsN   :Word;
       SampleRate  :Cardinal;
       BitRate     :Cardinal;
       SampleSize  :Word;
       SampleLevel :Word;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TChunkFormatExt

     TChunkFormatExt = packed record
     private
     public
       Size :Word;
       Data :array of Byte;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TChunk

     TChunk = packed record
     private
     public
       Name :array [ 0..3 ] of AnsiChar;
       Size :Cardinal;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TStereo8

     TStereo8 = packed record
     private
     public
       L :Byte;
       R :Byte;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TWave16c1

     TWave16c1 = record
     private
     public
       o :Smallint;
       ///// 型変換
       class operator Implicit( const X_:Single ) :TWave16c1;
       class operator Implicit( const X_:TWave16c1 ) :Single;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TStere16

     PStereo16 = ^TStereo16;

     TStereo16 = packed record
     private
     public
       L :Smallint;
       R :Smallint;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleWave2

     TSingleWave2 = record
     private
     public
       L :Single;
       R :Single;
       /////
       constructor Create( const L_,R_:Single );
       ///// 型変換
       class operator Implicit( const W_:TStereo8 ) :TSingleWave2;
       class operator Implicit( const W_:TSingleWave2 ) :TStereo8;
       class operator Implicit( const W_:TStereo16 ) :TSingleWave2;
       class operator Implicit( const W_:TSingleWave2 ) :TStereo16;
     end;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TFileWAV

     TFileWAV = class
     private
     protected
       _RIFF    :TChunkRIFF;
       _Format  :TChunkFormat;
       _Fact    :TChunk;
       _Data    :TChunk;
       _SampleN :Integer;
       _Wave    :TArray<TStereo16>;
       ///// アクセス
       function GetTime :Single;
       function GetTypePCM :String;
       function GetWave( const I_:Integer ) :TStereo16;
       procedure SetWave( const I_:Integer; const Wave_:TStereo16 );
     public
       constructor Create; overload;
       constructor Create( const FileName_:String ); overload;
       destructor Destroy; override;
       ///// プロパティ
       property RIFF                     :TChunkRIFF   read _RIFF                   ;
       property Format                   :TChunkFormat read _Format                 ;
       property Fact                     :TChunk       read _Fact                   ;
       property Data                     :TChunk       read _Data                   ;
       property SampleN                  :Integer      read _SampleN                ;
       property Time                     :Single       read GetTime                 ;
       property TypePCM                  :String       read GetTypePCM              ;
       property Wave[ const I_:Integer ] :TStereo16    read GetWave    write SetWave;
       ///// メソッド
       procedure LoadFromFile( const FileName_:String );
       procedure SaveToFile( const FileName_:String );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TFileWAVIter

     TFileWAVIter< TValue_ > = class( TIter1D< TValue_, TFileWAV > )
     private
     protected
       _CurrentP :PStereo16;
     public
       constructor Create( const Parent_:TFileWAV; const HeadI_:Integer = 0; const StepX_:Integer = 1 );
       ///// メソッド
       procedure GoHead; override;
       procedure GoPrev; overload; override;
       procedure GoNext; overload; override;
       procedure GoPrev( const N_:Integer ); overload; override;
       procedure GoNext( const N_:Integer ); overload; override;
       procedure GoJump( const I_:Integer ); override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TFileWAVIterL

     TFileWAVIterL = class( TFileWAVIter< Single > )
     private
     protected
       ///// アクセス
       function GetValue :Single; override;
       procedure SetValue( const Value_:Single ); override;
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TFileWAVIterR

     TFileWAVIterR = class( TFileWAVIter< Single > )
     private
     protected
       ///// アクセス
       function GetValue :Single; override;
       procedure SetValue( const Value_:Single ); override;
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleWave2IterL

     TSingleWave2IterL = class( TArrayIter< Single, TSingleWave2 > )
     private
     protected
       ///// アクセス
       function GetValue :Single; override;
       procedure SetValue( const Value_:Single ); override;
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleWave2IterR

     TSingleWave2IterR = class( TArrayIter< Single, TSingleWave2 > )
     private
     protected
       ///// アクセス
       function GetValue :Single; override;
       procedure SetValue( const Value_:Single ); override;
     public
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

    _ListPCM_ :TDictionary< Word, String >;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses System.Classes, System.SysUtils;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TChunkRIFF

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TChunkFormat

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TChunkFormatExt

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TChunk

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TStereo8

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TWave16c1

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

class operator TWave16c1.Implicit( const X_:Single ) :TWave16c1;
begin
     Result.o := Round( 128 + 127 * X_ );
end;

class operator TWave16c1.Implicit( const X_:TWave16c1 ) :Single;
begin
     Result := ( X_.o - 128 ) / 127;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TStereo16

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleWave2

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TSingleWave2.Create( const L_,R_:Single );
begin
     L := L_;
     R := R_;
end;

//XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX 型変換

class operator TSingleWave2.Implicit( const W_:TStereo8 ) :TSingleWave2;
begin
     with Result do
     begin
          L := ( W_.L - 128 ) / 127;
          R := ( W_.R - 128 ) / 127;
     end
end;

class operator TSingleWave2.Implicit( const W_:TSingleWave2 ) :TStereo8;
begin
     with Result do
     begin
          L := Round( 128 + 127 * W_.L );
          R := Round( 128 + 127 * W_.R );
     end
end;

class operator TSingleWave2.Implicit( const W_:TStereo16 ) :TSingleWave2;
begin
     with Result do
     begin
          L := W_.L / 32767;
          R := W_.R / 32767;
     end
end;

class operator TSingleWave2.Implicit( const W_:TSingleWave2 ) :TStereo16;
begin
     with Result do
     begin
          L := Round( W_.L * 32767 );
          R := Round( W_.R * 32767 );
     end
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TFileWAV

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX アクセス

function TFileWAV.GetTime :Single;
begin
     Result := _Data.Size / _Format.BitRate
end;

function TFileWAV.GetTypePCM :String;
begin
     Result := _ListPCM_.Items[ _Format.Compression ]
end;

function TFileWAV.GetWave( const I_:Integer ) :TStereo16;
begin
     Result := _Wave[ I_ ]
end;

procedure TFileWAV.SetWave( const I_:Integer; const Wave_:TStereo16 );
begin
     _Wave[ I_ ] := Wave_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TFileWAV.Create;
begin
     inherited;

end;

constructor TFileWAV.Create( const FileName_:String );
begin
     Create;

     LoadFromFile( FileName_ )
end;

destructor TFileWAV.Destroy;
begin

     inherited;
end;

//XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX メソッド

procedure TFileWAV.LoadFromFile( const FileName_:String );
var
   C :TChunk;
begin
     with TFileStream.Create( FileName_, fmOpenRead ) do
     begin
          Read( _RIFF  , SizeOf( _RIFF   ) );

          with _RIFF do
          begin
               if Name <> 'RIFF' then RunError;
               if Kind <> 'WAVE' then RunError;
          end;

          Read( _Format, SizeOf( _Format ) );

          with _Format do
          begin
               Seek( Size - 16, TSeekOrigin.soCurrent );
          end;

          Read( C, SizeOf( C ) );

          with C do
          begin
               if Name = 'fact' then
               begin
                    _Fact := C;

                    Read( _Data, SizeOf( _Data ) );
               end
               else
               if Name = 'data' then
               begin
                    with _Fact do
                    begin
                         Name := '';
                         Size := 0;
                    end;

                    _Data := C;
               end
               else RunError
          end;

          _SampleN := _Data.Size div _Format.SampleSize;

          SetLength( _Wave, _SampleN );

          Read( _Wave[ 0 ], _Data.Size );

          Free
     end
end;

procedure TFileWAV.SaveToFile( const FileName_:String );
begin
     with TFileStream.Create( FileName_, fmCreate ) do
     begin
          Write( _RIFF     , SizeOf( _RIFF   ) );
          Write( _Format   , SizeOf( _Format ) );
          Write( _Data     , SizeOf( _Data   ) );
          Write( _Wave[ 0 ], _Data.Size        );

          Free
     end
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TFileWAVIter

constructor TFileWAVIter< TValue_ >.Create( const Parent_:TFileWAV; const HeadI_:Integer = 0; const StepX_:Integer = 1 );
begin
     inherited;

     TailI := High( _Parent._Wave );
end;

//XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX メソッド

procedure TFileWAVIter< TValue_ >.GoHead;
begin
     _CurrentP := @_Parent._Wave[ _HeadI ];
end;

procedure TFileWAVIter< TValue_ >.GoPrev;
begin
     Dec( _CurrentP, _StepX )
end;

procedure TFileWAVIter< TValue_ >.GoNext;
begin
     Inc( _CurrentP, _StepX )
end;

procedure TFileWAVIter< TValue_ >.GoPrev( const N_:Integer );
begin
     Dec( _CurrentP, _StepX * N_ )
end;

procedure TFileWAVIter< TValue_ >.GoNext( const N_:Integer );
begin
     Inc( _CurrentP, _StepX * N_ )
end;

procedure TFileWAVIter< TValue_ >.GoJump( const I_:Integer );
begin
     _CurrentP := @_Parent._Wave[ _HeadI + StepX * I_ ];
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TFileWAVIterL

function TFileWAVIterL.GetValue :Single;
begin
     Result := TSingleWave2( _CurrentP^ ).L;
end;

procedure TFileWAVIterL.SetValue( const Value_:Single );
begin
     _CurrentP^ := TSingleWave2.Create( Value_, _CurrentP^.R );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TFileWAVIterR

function TFileWAVIterR.GetValue :Single;
begin
     Result := TSingleWave2( _CurrentP^ ).R;
end;

procedure TFileWAVIterR.SetValue( const Value_:Single );
begin
     _CurrentP^ := TSingleWave2.Create( _CurrentP^.L, Value_ );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleWave2IterL

function TSingleWave2IterL.GetValue :Single;
begin
     Result := _CurrentP.L;
end;

procedure TSingleWave2IterL.SetValue( const Value_:Single );
begin
     _CurrentP.L := Value_;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleWave2IterR

function TSingleWave2IterR.GetValue :Single;
begin
     Result := _CurrentP.R;
end;

procedure TSingleWave2IterR.SetValue( const Value_:Single );
begin
     _CurrentP.R := Value_;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

procedure MakeListPCM;
begin
     _ListPCM_ := TDictionary< Word, String >.Create;

     with _ListPCM_ do
     begin
          Add( $0000, 'unknown' );
          Add( $0001, 'PCM Windows' );
          Add( $0002, 'MS ADPCM Windows' );
          Add( $0005, 'IBM CSVD' );
          Add( $0006, 'A-Law Windows' );
          Add( $0007, 'μ-Law Windows' );
          Add( $0010, 'OKI ADPCM' );
          Add( $0011, 'IMA/DVI ADPCM Windows' );
          Add( $0012, 'MediaSpace ADPCM' );
          Add( $0013, 'Sierra ADPCM' );
          Add( $0014, 'ADPCM (G.723)' );
          Add( $0015, 'DIGISTD' );
          Add( $0016, 'DIGIFIX' );
          Add( $0020, 'YAMAHA ADPCM' );
          Add( $0021, 'SONARC' );
          Add( $0022, 'TrueSpeech Windows' );
          Add( $0023, 'Echo Speech1' );
          Add( $0024, 'AF36 (Audiofile)' );
          Add( $0025, 'Apix' );
          Add( $0026, 'AF10 (Audiofile)' );
          Add( $0030, 'AC2 (Dolby)' );
          Add( $0031, 'GSM 6.10 Windows' );
          Add( $0033, 'ANTEX ADPCM' );
          Add( $0034, 'VQLPC (Control Resources)' );
          Add( $0035, 'DIGIREAL' );
          Add( $0036, 'DIGIADPCM' );
          Add( $0037, 'CR10 (Control Resources)' );
          Add( $0040, 'ADPCM (G.721)' );
          Add( $0101, 'IBM μ-LAW' );
          Add( $0102, 'IBM A-LAW' );
          Add( $0103, 'IBM ADPCM' );
          Add( $0200, 'Creative Labs ADPCM' );
          Add( $0300, 'FM TOWNS' );
          Add( $1000, 'Olivetti GSM' );
          Add( $1001, 'Olivetti ADPCM' );
          Add( $1002, 'Olivetti CELP' );
          Add( $1003, 'Olivetti SBC' );
          Add( $1004, 'Olivetti OPR' );
     end;
end;

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

     MakeListPCM;

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

     _ListPCM_.Free;

end. //######################################################################### ■
