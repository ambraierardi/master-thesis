 This thesis offers an integrated and comprehensive guidance and control framework for
 the autonomous underwater docking of a Medusa-class AUV that operates in four degrees of
 freedom (surge, sway, heave, and yaw), in the presence of constant but unknown ocean cur
rents. Depending on whether the position and orientation of the docking station are known
 or unknown, two approach strategies are investigated: variable vehicle orientation with fixed
 planar speeds, and fixed AUV’s orientation with variable surge and sway speeds. A reduced
 4-DOF Newton-Euler formulation is used to model the vehicle’s kinematic and dynamic be
havior together with decoupled guidance laws for the vertical and horizontal planes, since the
 vehicle is considered to constantly maintain an horizontal plane orientation. For each of the
 four path-following phases (ship-based approach, beacon-based homing, circumnavigation, and
 terminal docking), an outer-loop guidance system calculates reference velocities and yaw com
mands for the AUV. To reduce current-induced drift, a smooth blending of circular and straight
 trajectories is incorporated. In order to achieve specific damping and natural frequency char
acteristics, the inner control loop uses cascaded PI and PID controllers with anti-windup to
 track desired surge, sway, depth and heading. These controllers are designed via linearization
 of the simplified dynamic model about selected working points. State estimation makes use of
 Kalman and Extended Kalman filters: a planar and vertical KF used during the ship-frame
 approach as well as the iUSBL-relying beacon-based homing phase; a unified EKF with range
 measurements and current velocity observations exploited during the bottom docking phase,
 eventually coupled with a specialized EKF to recover, when needed, docking-station orientation
 from dual-transponder acoustic data. The suggested methodology is validated by simulation
 results, which show satisfactory performance and good rate of convergence to the dock under
 all examined uncertainty scenarios, despite the simplified model used for the plant in the design
 of the controller, the noise applied on the physical parameters of the same, and the significant
 underestimation of the process and measurement noises in the estimation filter.

To simulate the code, open the estimate_and_control_fully_actuated_with_current.m file, uncomment the desired case and run the code. Then open the simulation_environment_thesis.slx file and uncomment the corresponding case, then run the simulation.
