within Sensors.RotarySpeed;
model IntervalTime "Estimate speed by measuring interval between 'pip' signals"
  extends Sensors.Interfaces.RotarySpeedSensor;
  parameter Integer teeth "Number of teeth";
protected
  parameter Modelica.SIunits.Angle tooth_angle = Modelica.Constants.pi*2/teeth;
  Modelica.SIunits.Angle next_angle;
  Modelica.SIunits.Time last_time;
algorithm
  when initial() then
    next_angle := angle+tooth_angle-mod(angle,tooth_angle);
    w_estimate := 0;
    last_time := time;
  end when;
  when {angle>next_angle,
        angle<next_angle-tooth_angle,
        angle<next_angle-2*tooth_angle} then
    if time>pre(last_time) then
      next_angle := angle+tooth_angle;
      last_time := time;
      w_estimate :=tooth_angle/(time - pre(last_time));
    end if;
  end when;
end IntervalTime;
