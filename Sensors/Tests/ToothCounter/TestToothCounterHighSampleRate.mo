within Sensors.Tests.ToothCounter;
model TestToothCounterHighSampleRate
  extends Sensors.Tests.ToothCounter.TestToothCounter(sensor(sample_rate=0.001));
end TestToothCounterHighSampleRate;
