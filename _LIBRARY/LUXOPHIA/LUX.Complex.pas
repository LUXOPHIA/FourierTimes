unit LUX.Complex;

interface //#################################################################### ��

uses LUX, LUX.D1;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$�y�^�z

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$�y���R�[�h�z

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleC

     TSingleC = record
     private
       ///// �A�N�Z�T
       function GetSiz2 :Single;
       function GetSize :Single;
       procedure SetSize( const Size_:Single );
       function GetUnitor :TSingleC;
       procedure SetUnitor( const Unitor_:TSingleC );
       function GetConj :TSingleC;
       procedure SetConj( const Conj_:TSingleC );
       function GetAngle :Single;
     public
       R :Single;
       I :Single;
       /////
       constructor Create( const R_,I_:Single );
       ///// �v���p�e�B
       property Siz2   :Single   read GetSiz2                  ;
       property Size   :Single   read GetSize   write SetSize  ;
       property Unitor :TSingleC read GetUnitor write SetUnitor;
       property Conj   :TSingleC read GetConj   write SetConj  ;
       property Angle  :Single   read GetAngle                 ;
       ///// ���Z�q
       class operator Negative( const V_:TSingleC ) :TSingleC;
       class operator Positive( const V_:TSingleC ) :TSingleC;
       class operator Add( const A_,B_:TSingleC ) :TSingleC;
       class operator Subtract( const A_,B_:TSingleC ) :TSingleC;
       class operator Multiply( const A_,B_:TSingleC ) :TSingleC;
       class operator Multiply( const A_:TSingleC; const B_:Single ) :TSingleC;
       class operator Multiply( const A_:Single; const B_:TSingleC ) :TSingleC;
       class operator Divide( const A_,B_:TSingleC ) :TSingleC;
       class operator Divide( const A_:TSingleC; const B_:Single ) :TSingleC;
       ///// �^�ϊ�
       class operator Implicit( const V_:Single ) :TSingleC;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleC

     TDoubleC = record
     private
       ///// �A�N�Z�T
       function GetSiz2 :Double;
       function GetSize :Double;
       procedure SetSize( const Size_:Double );
       function GetUnitor :TDoubleC;
       procedure SetUnitor( const Unitor_:TDoubleC );
       function GetConj :TDoubleC;
       procedure SetConj( const Conj_:TDoubleC );
       function GetAngle :Double;
     public
       R :Double;
       I :Double;
       /////
       constructor Create( const R_,I_:Double );
       ///// �v���p�e�B
       property Siz2   :Double   read GetSiz2                  ;
       property Size   :Double   read GetSize   write SetSize  ;
       property Unitor :TDoubleC read GetUnitor write SetUnitor;
       property Conj   :TDoubleC read GetConj   write SetConj  ;
       property Angle  :Double   read GetAngle                 ;
       ///// ���Z�q
       class operator Negative( const V_:TDoubleC ) :TDoubleC;
       class operator Positive( const V_:TDoubleC ) :TDoubleC;
       class operator Add( const A_,B_:TDoubleC ) :TDoubleC;
       class operator Subtract( const A_,B_:TDoubleC ) :TDoubleC;
       class operator Multiply( const A_,B_:TDoubleC ) :TDoubleC;
       class operator Multiply( const A_:TDoubleC; const B_:Double ) :TDoubleC;
       class operator Multiply( const A_:Double; const B_:TDoubleC ) :TDoubleC;
       class operator Divide( const A_,B_:TDoubleC ) :TDoubleC;
       class operator Divide( const A_:TDoubleC; const B_:Double ) :TDoubleC;
       ///// �^�ϊ�
       class operator Implicit( const V_:Double ) :TDoubleC;
       class operator Implicit( const V_:TSingleC ) :TDoubleC;
       class operator Implicit( const V_:TDoubleC ) :TSingleC;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleAreaC

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleAreaC

     TDoubleAreaC = record
     private
       _Min :TDoubleC;
       _Max :TDoubleC;
       ///// �A�N�Z�T
       function GetCenter :TDoubleC;
       procedure SetCenter( const Center_:TDoubleC );
       function GetCenterR :Double;
       procedure SetCenterR( const CenterR_:Double );
       function GetCenterI :Double;
       procedure SetCenterI( const CenterI_:Double );
       function GetSizeR :Double;
       procedure SetSizeR( const SizeR_:Double );
       function GetSizeI :Double;
       procedure SetSizeI( const SizeI_:Double );
     public
       /////
       constructor Create( const Min_,Max_:TDoubleC ); overload;
       constructor Create( const MinR_,MinI_,MaxR_,MaxI_:Double ); overload;
       ///// �v���p�e�B
       property Min     :TDoubleC read   _Min     write   _Min    ;
       property Max     :TDoubleC read   _Max     write   _Max    ;
       property Center  :TDoubleC read GetCenter  write SetCenter ;
       property CenterR :Double   read GetCenterR write SetCenterR;
       property CenterI :Double   read GetCenterI write SetCenterI;
       property SizeR   :Double   read GetSizeR   write SetSizeR  ;
       property SizeI   :Double   read GetSizeI   write SetSizeI  ;
       ///// ���Z�q
       class operator Negative( const V_:TDoubleAreaC ) :TDoubleAreaC;
       class operator Positive( const V_:TDoubleAreaC ) :TDoubleAreaC;
       class operator Add( const A_,B_:TDoubleAreaC ) :TDoubleAreaC;
       class operator Subtract( const A_,B_:TDoubleAreaC ) :TDoubleAreaC;
       class operator Multiply( const A_:TDoubleAreaC; const B_:Double ) :TDoubleAreaC;
       class operator Multiply( const A_:Double; const B_:TDoubleAreaC ) :TDoubleAreaC;
       class operator Divide( const A_:TDoubleAreaC; const B_:Double ) :TDoubleAreaC;
       ///// �^�ϊ�
     end;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$�y�N���X�z

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$�y�萔�z

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$�y�ϐ��z

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$�y���[�`���z

function Cos( const A_:TSingleC ) :TSingleC; overload;
function Cos( const A_:TDoubleC ) :TDoubleC; overload;

function Sin( const A_:TSingleC ) :TSingleC; overload;
function Sin( const A_:TDoubleC ) :TDoubleC; overload;

function Tan( const A_:TSingleC ) :TSingleC; overload;
function Tan( const A_:TDoubleC ) :TDoubleC; overload;

function Exp( const A_:TSingleC ) :TSingleC; overload;
function Exp( const A_:TDoubleC ) :TDoubleC; overload;

function Ln( const A_:TSingleC ) :TSingleC; overload;
function Ln( const A_:TDoubleC ) :TDoubleC; overload;

implementation //############################################################### ��

uses Math;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$�y���R�[�h�z

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleC

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

function TSingleC.GetSiz2 :Single;
begin
     Result := Pow2( R ) + Pow2( I )
end;

function TSingleC.GetSize :Single;
begin
     Result := Roo2( GetSiz2 )
end;

procedure TSingleC.SetSize( const Size_:Single );
begin
     Self := Size_ * Unitor
end;

function TSingleC.GetUnitor :TSingleC;
begin
     Result := Self / Size
end;

procedure TSingleC.SetUnitor( const Unitor_:TSingleC );
begin
     Self := Size * Unitor_
end;

function TSingleC.GetConj :TSingleC;
begin
     Result.R := +R;
     Result.I := -I;
end;

procedure TSingleC.SetConj( const Conj_:TSingleC );
begin
     R := +Conj_.R;
     I := -Conj_.I;
end;

function TSingleC.GetAngle :Single;
begin
     Result := ArcTan2( I, R )
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TSingleC.Create( const R_,I_:Single );
begin
     R := R_;
     I := I_;
end;

//XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX ���Z�q

class operator TSingleC.Negative( const V_:TSingleC ) :TSingleC;
begin
     with Result do
     begin
          R := -V_.R;
          I := -V_.I;
     end
end;

class operator TSingleC.Positive( const V_:TSingleC ) :TSingleC;
begin
     with Result do
     begin
          R := +V_.R;
          I := +V_.I;
     end
end;

class operator TSingleC.Add( const A_,B_:TSingleC ) :TSingleC;
begin
     with Result do
     begin
          R := A_.R + B_.R;
          I := A_.I + B_.I;
     end
end;

class operator TSingleC.Subtract( const A_,B_:TSingleC ) :TSingleC;
begin
     with Result do
     begin
          R := A_.R - B_.R;
          I := A_.I - B_.I;
     end
end;

class operator TSingleC.Multiply( const A_,B_:TSingleC ) :TSingleC;
begin
     with Result do
     begin
          R := A_.R * B_.R - A_.I * B_.I;
          I := A_.R * B_.I + A_.I * B_.R;
     end
end;

class operator TSingleC.Multiply( const A_:TSingleC; const B_:Single ) :TSingleC;
begin
     with Result do
     begin
          R := A_.R * B_;
          I := A_.I * B_;
     end
end;

class operator TSingleC.Multiply( const A_:Single; const B_:TSingleC ) :TSingleC;
begin
     with Result do
     begin
          R := A_ * B_.R;
          I := A_ * B_.I;
     end
end;

class operator TSingleC.Divide( const A_,B_:TSingleC ) :TSingleC;
var
   C :Single;
begin
     C := B_.Siz2;

     with Result do
     begin
          R := ( A_.R * B_.R + A_.I * B_.I ) / C;
          I := ( A_.I * B_.R - A_.R * B_.I ) / C;
     end
end;

class operator TSingleC.Divide( const A_:TSingleC; const B_:Single ) :TSingleC;
begin
     with Result do
     begin
          R := A_.R / B_;
          I := A_.I / B_;
     end
end;

//XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX �^�ϊ�

class operator TSingleC.Implicit( const V_:Single ) :TSingleC;
begin
     with Result do
     begin
          R := V_;
          I := 0;
     end
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleC

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

function TDoubleC.GetSiz2 :Double;
begin
     Result := Pow2( R ) + Pow2( I )
end;

function TDoubleC.GetSize :Double;
begin
     Result := Roo2( GetSiz2 )
end;

procedure TDoubleC.SetSize( const Size_:Double );
begin
     Self := Size_ * Unitor
end;

function TDoubleC.GetUnitor :TDoubleC;
begin
     Result := Self / Size
end;

procedure TDoubleC.SetUnitor( const Unitor_:TDoubleC );
begin
     Self := Size * Unitor_
end;

function TDoubleC.GetConj :TDoubleC;
begin
     Result.R := +R;
     Result.I := -I;
end;

procedure TDoubleC.SetConj( const Conj_:TDoubleC );
begin
     R := +Conj_.R;
     I := -Conj_.I;
end;

function TDoubleC.GetAngle :Double;
begin
     Result := ArcTan2( I, R )
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TDoubleC.Create( const R_,I_:Double );
begin
     R := R_;
     I := I_;
end;

//XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX ���Z�q

class operator TDoubleC.Negative( const V_:TDoubleC ) :TDoubleC;
begin
     with Result do
     begin
          R := -V_.R;
          I := -V_.I;
     end
end;

class operator TDoubleC.Positive( const V_:TDoubleC ) :TDoubleC;
begin
     with Result do
     begin
          R := +V_.R;
          I := +V_.I;
     end
end;

class operator TDoubleC.Add( const A_,B_:TDoubleC ) :TDoubleC;
begin
     with Result do
     begin
          R := A_.R + B_.R;
          I := A_.I + B_.I;
     end
end;

class operator TDoubleC.Subtract( const A_,B_:TDoubleC ) :TDoubleC;
begin
     with Result do
     begin
          R := A_.R - B_.R;
          I := A_.I - B_.I;
     end
end;

class operator TDoubleC.Multiply( const A_,B_:TDoubleC ) :TDoubleC;
begin
     with Result do
     begin
          R := A_.R * B_.R - A_.I * B_.I;
          I := A_.R * B_.I + A_.I * B_.R;
     end
end;

class operator TDoubleC.Multiply( const A_:TDoubleC; const B_:Double ) :TDoubleC;
begin
     with Result do
     begin
          R := A_.R * B_;
          I := A_.I * B_;
     end
end;

class operator TDoubleC.Multiply( const A_:Double; const B_:TDoubleC ) :TDoubleC;
begin
     with Result do
     begin
          R := A_ * B_.R;
          I := A_ * B_.I;
     end
end;

class operator TDoubleC.Divide( const A_,B_:TDoubleC ) :TDoubleC;
var
   C :Double;
begin
     C := B_.Siz2;

     with Result do
     begin
          R := ( A_.R * B_.R + A_.I * B_.I ) / C;
          I := ( A_.I * B_.R - A_.R * B_.I ) / C;
     end
end;

class operator TDoubleC.Divide( const A_:TDoubleC; const B_:Double ) :TDoubleC;
begin
     with Result do
     begin
          R := A_.R / B_;
          I := A_.I / B_;
     end
end;

//XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX �^�ϊ�

class operator TDoubleC.Implicit( const V_:Double ) :TDoubleC;
begin
     with Result do
     begin
          R := V_;
          I := 0;
     end
end;

class operator TDoubleC.Implicit( const V_:TSingleC ) :TDoubleC;
begin
     with Result do
     begin
          R := V_.R;
          I := V_.I;
     end
end;

class operator TDoubleC.Implicit( const V_:TDoubleC ) :TSingleC;
begin
     with Result do
     begin
          R := V_.R;
          I := V_.I;
     end
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleAreaC

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

function TDoubleAreaC.GetCenter :TDoubleC;
begin
     Result := ( _Max + _Min ) / 2
end;

procedure TDoubleAreaC.SetCenter( const Center_:TDoubleC );
begin
     with Center_ do
     begin
          CenterR := R;
          CenterI := I;
     end
end;

function TDoubleAreaC.GetCenterR :Double;
begin
     Result := ( _Max.R + _Min.R ) / 2
end;

procedure TDoubleAreaC.SetCenterR( const CenterR_:Double );
var
   S :Double;
begin
     S := SizeR / 2;

     _Min.R := CenterR_ - S;
     _Max.R := CenterR_ + S;
end;

function TDoubleAreaC.GetCenterI :Double;
begin
     Result := ( _Max.I + _Min.I ) / 2
end;

procedure TDoubleAreaC.SetCenterI( const CenterI_:Double );
var
   S :Double;
begin
     S := SizeI / 2;

     _Min.I := CenterI_ - S;
     _Max.I := CenterI_ + S;
end;

function TDoubleAreaC.GetSizeR :Double;
begin
     Result := _Max.R - _Min.R
end;

procedure TDoubleAreaC.SetSizeR( const SizeR_:Double );
var
   C, S :Double;
begin
     C := CenterR;
     S := SizeR_ / 2;

     _Min.R := C - S;
     _Max.R := C + S;
end;

function TDoubleAreaC.GetSizeI :Double;
begin
     Result := _Max.I - _Min.I
end;

procedure TDoubleAreaC.SetSizeI( const SizeI_:Double );
var
   C, S :Double;
begin
     C := CenterI;
     S := SizeI_ / 2;

     _Min.I := C - S;
     _Max.I := C + S;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TDoubleAreaC.Create( const Min_,Max_:TDoubleC );
begin
     _Min := Min_;
     _Max := Max_;
end;

constructor TDoubleAreaC.Create( const MinR_,MinI_,MaxR_,MaxI_:Double );
begin
     with _Min do
     begin
          R := MinR_;
          I := MinI_;
     end;
     with _Max do
     begin
          R := MaxR_;
          I := MaxI_;
     end;
end;

//XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX ���Z�q

class operator TDoubleAreaC.Negative( const V_:TDoubleAreaC ) :TDoubleAreaC;
begin
     with Result do
     begin
          _Min := -V_._Min;
          _Max := -V_._Max;
     end
end;

class operator TDoubleAreaC.Positive( const V_:TDoubleAreaC ) :TDoubleAreaC;
begin
     with Result do
     begin
          _Min := +V_._Min;
          _Max := +V_._Max;
     end
end;

class operator TDoubleAreaC.Add( const A_,B_:TDoubleAreaC ) :TDoubleAreaC;
begin
     with Result do
     begin
          _Min := A_._Min + B_._Min;
          _Max := A_._Max + B_._Max;
     end
end;

class operator TDoubleAreaC.Subtract( const A_,B_:TDoubleAreaC ) :TDoubleAreaC;
begin
     with Result do
     begin
          _Min := A_._Min - B_._Min;
          _Max := A_._Max - B_._Max;
     end
end;

class operator TDoubleAreaC.Multiply( const A_:TDoubleAreaC; const B_:Double ) :TDoubleAreaC;
begin
     with Result do
     begin
          _Min := A_._Min * B_;
          _Max := A_._Max * B_;
     end
end;

class operator TDoubleAreaC.Multiply( const A_:Double; const B_:TDoubleAreaC ) :TDoubleAreaC;
begin
     with Result do
     begin
          _Min := A_ * B_._Min;
          _Max := A_ * B_._Max;
     end
end;

class operator TDoubleAreaC.Divide( const A_:TDoubleAreaC; const B_:Double ) :TDoubleAreaC;
begin
     with Result do
     begin
          _Min := A_._Min / B_;
          _Max := A_._Max / B_;
     end
end;

//XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX �^�ϊ�

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$�y�N���X�z

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$�y���[�`���z

function Cos( const A_:TSingleC ) :TSingleC;
begin
     with A_ do
     begin
          Result.R := +Cos( R ) * Cosh( I );
          Result.I := -Sin( R ) * Sinh( I );
     end
end;

function Cos( const A_:TDoubleC ) :TDoubleC;
begin
     with A_ do
     begin
          Result.R := +Cos( R ) * Cosh( I );
          Result.I := -Sin( R ) * Sinh( I );
     end
end;

////////////////////////////////////////////////////////////////////////////////

function Sin( const A_:TSingleC ) :TSingleC;
begin
     with A_ do
     begin
          Result.R := +Sin( R ) * Cosh( I );
          Result.I := +Cos( R ) * Sinh( I );
     end
end;

function Sin( const A_:TDoubleC ) :TDoubleC;
begin
     with A_ do
     begin
          Result.R := +Sin( R ) * Cosh( I );
          Result.I := +Cos( R ) * Sinh( I );
     end
end;

////////////////////////////////////////////////////////////////////////////////

function Tan( const A_:TSingleC ) :TSingleC;
begin
     Result := Sin( A_ ) / Cos( A_ )
end;

function Tan( const A_:TDoubleC ) :TDoubleC;
begin
     Result := Sin( A_ ) / Cos( A_ )
end;

////////////////////////////////////////////////////////////////////////////////

function Exp( const A_:TSingleC ) :TSingleC;
var
   E :Single;
begin
     with A_ do
     begin
          E := Exp( R );

          Result.R := E * Cos( I );
          Result.I := E * Sin( I );
     end
end;

function Exp( const A_:TDoubleC ) :TDoubleC;
var
   E :Double;
begin
     with A_ do
     begin
          E := Exp( R );

          Result.R := E * Cos( I );
          Result.I := E * Sin( I );
     end
end;

////////////////////////////////////////////////////////////////////////////////

function Ln( const A_:TSingleC ) :TSingleC;
begin
     with A_ do
     begin
          Result.R := Ln( Size );
          Result.I := Angle;
     end
end;

function Ln( const A_:TDoubleC ) :TDoubleC;
begin
     with A_ do
     begin
          Result.R := Ln( Size );
          Result.I := Angle;
     end
end;

//############################################################################## ��

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ ������

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ �ŏI��

end. //######################################################################### ��
