within Sensors.Tests.IntervalTime;
model TestIntervalTime
  extends Sensors.Tests.ToothCounter.TestToothCounter(redeclare
      Sensors.RotarySpeed.IntervalTime
      sensor(teeth=72));
  XogenyTest.AssertInitial w0(expected=0, actual=sensor.w_estimate);
equation
  assert(sensor.w_estimate>=0, "Speed should never be less than zero");
end TestIntervalTime;
