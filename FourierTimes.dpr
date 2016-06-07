program FourierTimes;

uses
  System.StartUpCopy,
  FMX.Forms,
  Main in 'Main.pas' {Form1},
  Core in 'Core.pas',
  LUX.DiscreteTrans.Fourier.D1 in '_LIBRARY\LUXOPHIA\LUX.DiscreteTrans.Fourier.D1.pas',
  LUX.Sound in '_LIBRARY\LUXOPHIA\LUX.Sound.pas',
  LUX.Complex in '_LIBRARY\LUXOPHIA\LUX.Complex.pas',
  LUX.D1.Complex in '_LIBRARY\LUXOPHIA\LUX.D1.Complex.pas',
  LUX.DiscreteTrans.D1 in '_LIBRARY\LUXOPHIA\LUX.DiscreteTrans.D1.pas',
  LUX in '_LIBRARY\LUXOPHIA\LUX\LUX.pas',
  LUX.D1 in '_LIBRARY\LUXOPHIA\LUX\LUX.D1.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
