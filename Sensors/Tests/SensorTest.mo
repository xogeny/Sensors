within Sensors.Tests;
partial model SensorTest "Base class for sensor testing"

  replaceable Modelica.Blocks.Interfaces.SO velocity
    annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));

  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=1)
    annotation (Placement(transformation(extent={{10,-10},{30,10}})));
  Modelica.Mechanics.Rotational.Sources.Speed actuator(exact=true)
    annotation (Placement(transformation(extent={{-28,-10},{-8,10}})));
  replaceable Sensors.Interfaces.RotarySpeedSensor
                                  sensor annotation (Placement(transformation(extent={{50,-10},
            {70,10}})));
  Modelica.Blocks.Math.Feedback error annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={0,-50})));
equation
  connect(velocity.y, actuator.w_ref) annotation (Line(
      points={{-49,0},{-30,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(actuator.flange, inertia.flange_a) annotation (Line(
      points={{-8,0},{10,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(sensor.flange, inertia.flange_b) annotation (Line(
      points={{50,0},{30,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(velocity.y, error.u2) annotation (Line(
      points={{-49,0},{-40,0},{-40,-30},{9.79717e-016,-30},{9.79717e-016,-42}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(sensor.w_estimate, error.u1) annotation (Line(
      points={{71,0},{80,0},{80,-50},{8,-50}},
      color={0,0,127},
      smooth=Smooth.None));
end SensorTest;
