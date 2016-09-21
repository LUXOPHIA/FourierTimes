program FourierTimes;

uses
  System.StartUpCopy,
  FMX.Forms,
  Main in 'Main.pas' {Form1},
  LUX in '_LIBRARY\LUXOPHIA\LUX\LUX.pas',
  LUX.D1 in '_LIBRARY\LUXOPHIA\LUX\LUX.D1.pas',
  LUX.FMX in '_LIBRARY\LUXOPHIA\LUX.FMX\LUX.FMX.pas',
  LUX.D3 in '_LIBRARY\LUXOPHIA\LUX\LUX.D3.pas',
  LUX.DiscreteTrans.Fourier.D1 in '_LIBRARY\LUXOPHIA\LUX.Signal\LUX.DiscreteTrans.Fourier.D1.pas',
  LUX.DiscreteTrans.D1 in '_LIBRARY\LUXOPHIA\LUX.Signal\LUX.DiscreteTrans.D1.pas',
  LUX.Complex in '_LIBRARY\LUXOPHIA\LUX.Complex\LUX.Complex.pas',
  LUX.Complex.D1 in '_LIBRARY\LUXOPHIA\LUX.Complex\LUX.Complex.D1.pas',
  LUX.Audio.WAV in '_LIBRARY\LUXOPHIA\LUX.Audio\LUX.Audio.WAV.pas',
  LUX.Audio in '_LIBRARY\LUXOPHIA\LUX.Audio\LUX.Audio.pas',
  LUX.Color.Map.D1 in '_LIBRARY\LUXOPHIA\LUX.Color\LUX.Color.Map.D1.pas',
  LUX.Color in '_LIBRARY\LUXOPHIA\LUX.Color\LUX.Color.pas',
  LUX.Map.D1 in '_LIBRARY\LUXOPHIA\LUX.Map\LUX.Map.D1.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
