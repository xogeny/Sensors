within Sensors.RotarySpeed;
model ToothCounter "Estimate speed by counting 'pip' signals"
  extends Sensors.Interfaces.RotarySpeedSensor;
  parameter Integer teeth "Number of teeth";
  parameter Modelica.SIunits.Time sample_rate;
protected
  parameter Modelica.SIunits.Angle tooth_angle = Modelica.Constants.pi*2/teeth;
  Modelica.SIunits.Angle next_angle;
  Integer count(start=0);
algorithm
  when initial() then
    next_angle := angle+tooth_angle-mod(angle,tooth_angle);
    w_estimate := 0;
  end when;
  when {angle>next_angle, angle<next_angle-tooth_angle, angle<next_angle-2*tooth_angle} then
    count := pre(count)+1;
    next_angle := angle+tooth_angle;
  end when;
  when sample(sample_rate,sample_rate) then
    w_estimate := (count-0.5)*tooth_angle/sample_rate;
    count := 0;
  end when;
end ToothCounter;
