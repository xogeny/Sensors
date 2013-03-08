within Sensors.SignalProcessing;
model FourierAnalysis "Compute Fourier coefficients of an input signal"
  parameter Modelica.SIunits.Frequency F "Base frequency for analysis";
  parameter Integer n "Number of harmonics";
  Modelica.Blocks.Interfaces.RealInput u
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealOutput a0
    annotation (Placement(transformation(extent={{100,50},{120,70}})));
  Modelica.Blocks.Interfaces.RealOutput a[n]
    annotation (Placement(transformation(extent={{100,50},{120,70}})));
  Modelica.Blocks.Interfaces.RealOutput b[n]
    annotation (Placement(transformation(extent={{100,-70},{120,-50}})));
  import Modelica.Constants.pi;
protected
  parameter Modelica.SIunits.Time dt = 1.0/F;
  Real s[n] = {sin(2*pi*F*i*time) for i in 1:n};
  Real c[n] = {cos(2*pi*F*i*time) for i in 1:n};
  Real a0i;
  Real ai[n];
  Real bi[n];
  Real f "Reconstructed function";
initial equation
  a0i = 0;
  ai = zeros(n);
  bi = zeros(n);
equation
  der(a0i) = 2*u;
  der(ai) = 2*u*c;
  der(bi) = 2*u*s;
  f = a0/2+a*c+b*s;
  when sample(0,dt) then
    a0 = pre(a0i);
    a = pre(ai);
    b = pre(bi);
    reinit(a0i, 0);
    for i in 1:n loop
      reinit(ai[i], 0);
      reinit(bi[i], 0);
    end for;
  end when;
end FourierAnalysis;
