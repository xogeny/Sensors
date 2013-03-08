within Sensors.Tests.FourierAnalysis;
model TestLinearCombination
  parameter Integer n = 10;
  parameter Modelica.SIunits.Frequency F0 = 1.0;
  SignalProcessing.FourierAnalysis analysis(F=F0, n=n)
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  Modelica.Blocks.Sources.Sine sines[n](
    amplitude=linspace(
        1.0,
        n,
        n),
    freqHz=linspace(
        F0,
        n*F0,
        n),
    each phase=0,
    each offset=1.0,
    each startTime=0.0)
    annotation (Placement(transformation(extent={{-80,30},{-60,50}})));
  Modelica.Blocks.Sources.Sine cosines[n](
    freqHz=linspace(
        F0,
        n*F0,
        n),
    each offset=1.0,
    each startTime=0.0,
    amplitude=linspace(
        2.0,
        2.0*n,
        n),
    each phase=1.5707963267949)
    annotation (Placement(transformation(extent={{-80,-50},{-60,-30}})));
  Modelica.Blocks.Math.Sum sine_sum(nin=n)
    annotation (Placement(transformation(extent={{-40,30},{-20,50}})));
  Modelica.Blocks.Math.Sum cosine_sum(nin=n)
    annotation (Placement(transformation(extent={{-40,-50},{-20,-30}})));
  Modelica.Blocks.Math.Add add(k1=1, k2=1)
    annotation (Placement(transformation(extent={{0,-10},{20,10}})));
  XogenyTest.AssertFinal check_b[n](expected=sines.amplitude, actual=analysis.b)
    annotation (Placement(transformation(extent={{60,30},{80,50}})));
  XogenyTest.AssertFinal check_a[n](expected=cosines.amplitude, actual=analysis.a)
    annotation (Placement(transformation(extent={{60,-50},{80,-30}})));
equation
  connect(sines.y, sine_sum.u) annotation (Line(
      points={{-59,40},{-42,40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cosines.y, cosine_sum.u) annotation (Line(
      points={{-59,-40},{-42,-40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add.y, analysis.u) annotation (Line(
      points={{21,0},{38,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sine_sum.y, add.u1) annotation (Line(
      points={{-19,40},{-10,40},{-10,6},{-2,6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cosine_sum.y, add.u2) annotation (Line(
      points={{-19,-40},{-10,-40},{-10,-6},{-2,-6}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(graphics));
end TestLinearCombination;
