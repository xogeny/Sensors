within Sensors.Tests.FourierAnalysis;
model TestSine

  SignalProcessing.FourierAnalysis analysis(F0=1, n=5)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Sine sine(
    freqHz=3,
    amplitude=1,
    offset=1)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  XogenyTest.AssertFinal check_b(expected=sine.amplitude, actual=analysis.b[3])
    annotation (Placement(transformation(extent={{40,30},{60,50}})));
  XogenyTest.AssertFinal offset_check(expected=2*sine.offset, actual=analysis.a0)
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  XogenyTest.AssertFinal check_a(expected=0, actual=analysis.a[1])
    annotation (Placement(transformation(extent={{40,-50},{60,-30}})));
equation
  connect(sine.y, analysis.u) annotation (Line(
      points={{-39,0},{-12,0}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(graphics),
    experiment(StopTime=5, Tolerance=1e-008),
    __Dymola_experimentSetupOutput);
end TestSine;
