within Sensors.Tests.ToothCounter;
model TestToothCounter
  extends SensorTest(redeclare Modelica.Blocks.Sources.ExpSine velocity(
      amplitude=100,
      freqHz=5,
      offset=50,
      damping=1), redeclare replaceable Sensors.RotarySpeed.ToothCounter sensor(teeth=72,
        sample_rate=0.01));
  XogenyTest.AssertInitial iw(expected=0, actual=sensor.w_estimate);
end TestToothCounter;
