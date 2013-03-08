within Sensors.Interfaces;
partial model RotarySpeedSensor "Base class for all rotary speed sensor models"
  extends Modelica.Mechanics.Rotational.Interfaces.PartialAbsoluteSensor;
  Modelica.Blocks.Interfaces.RealOutput w_estimate
                                          annotation (Placement(transformation(
          extent={{100,-10},{120,10}}),iconTransformation(extent={{100,-10},{120,
            10}})));
protected
  Modelica.SIunits.Angle angle = flange.phi;
end RotarySpeedSensor;
