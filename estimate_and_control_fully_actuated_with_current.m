%%% DATA %%%

speed_0 = [0.1, 0.1, 0, 0]'; % for fully actuated ONLY
% INITIAL POSITION: EXACTLY WHERE THE SHIP IS --> everything is 0 
position_t_0 = [0; 0; 0; 0]; % in the ship reference frame
desired_speed = speed_0;
Tsim = 200;
dt = 1/Tsim;
NED_psi_ds = -pi/2;  % for case 2.2 and 2.4 we don't know the data, it's just for the physical data simulation
delta_FOV = pi/7; % in total the DS opening is of 2*alfa
% and we want to keep a safe distance from where the opening begins in
% order not to let the AUV crush on the side
L_x = 0.5;
L_y_r = 0.5;
L_y_l = 0.5;
right_reference = L_x*[cos(NED_psi_ds); sin(NED_psi_ds); 0] + L_y_r*[sin(NED_psi_ds); -cos(NED_psi_ds); 0];
left_reference = L_x*[cos(NED_psi_ds); sin(NED_psi_ds); 0] + L_y_l*[-sin(NED_psi_ds); cos(NED_psi_ds); 0];
max_dist_from_ship = 60;
min_dist_from_ds = 45;
% if you want zero current, just put the value in const_current to 0
const_current = [0.05; 0.02; 0; 0];
r = 0.03 + 0.03 * rand;
s = 0.03 + 0.03 * rand;
const_current = [-r; -s; 0; 0]; %for a random current
p_b1 = [-90; 90; 5]; % in the ship reference frame
theta = linspace(0,2*pi, 360)';
% circumference in the DS reference frame
% the center is in (0,0,0) in the DS frame
% but it's p_b1 in ship's coordinates
circumference_x = min_dist_from_ds*cos(theta);
circumference_y = min_dist_from_ds*sin(theta);
psi_P = linspace(0,2*pi,360)'; % + o - 2pi??
var_vm_x = 0.001;
var_vm_y = 0.001;
var_vm_z = 0.001;

% saturation cont5rollers:
tau_surge_sat = 10;
tau_sway_sat = 30; % casi da 2.2, 2.3, 3
tau_sway_sat = 30;
tau_heave_sat = 30;
tau_yaw_sat = 0.1;


%%%%%%%%%%%%%%%%%%% PHASE 1: %%%%%%%%%%%%%%%%%%%
% iUSBL MEASUREMENTS (X, Y, psi) TO ESTIMATE (X,Y), (PSI, r) AND (V_c_x, V_c_y) %

A1 = [1, 0, 0, 0, dt, 0; 
      0, 1, 0, 0, 0, dt;
      0, 0, 1, dt, 0, 0;
      0, 0, 0, 1, 0, 0;
      0, 0, 0, 0, 1, 0;
      0, 0, 0, 0, 0, 1];

B1 = [dt, 0; 
      0, dt;
      0, 0;
      0, 0;
      0, 0,;
      0, 0];

C1 = [1, 0, 0, 0, 0, 0;
      0, 1, 0, 0, 0, 0;
      0, 0, 1, 0, 0, 0];

G1 = dt*eye(6);

alpha_xy_1 = 1; % initial noise -> initial estimate of the state and its covariance, which is unknown

% simulation's parameters
csi_x_1 = 0.003;
csi_y_1 = 0.003;
csi_psi_1 = 0.0003;
csi_r_1 = 0.0003;
csi_vcx_1 = 0.0003;
csi_vcy_1 = 0.0003;

% KF's parameters
csi_x_1_kf = 0.001;
csi_y_1_kf = 0.001;
csi_psi_1_kf = 0.0001;
csi_r_1_kf = 0.0001;
csi_vcx_1_kf = 0.0001;
csi_vcy_1_kf = 0.0001;

Q1 = [csi_x_1_kf^2, 0, 0, 0, 0, 0;
      0, csi_y_1_kf^2, 0, 0, 0, 0;
      0, 0, csi_psi_1_kf^2, 0, 0, 0;
      0, 0, 0, csi_r_1_kf^2, 0, 0;
      0, 0, 0, 0, csi_vcx_1_kf^2, 0;
      0, 0, 0, 0, 0, csi_vcy_1_kf^2];

% simulation's parameters
eta_x_1 = 0.03;
eta_y_1 = 0.03;
eta_psi_1 = 0.003;

% model's parameters
eta_x_1_kf = 0.001;
eta_y_1_kf = 0.001;
eta_psi_1_kf = 0.001;

R1 = [eta_x_1_kf^2, 0, 0;
      0, eta_y_1_kf^2, 0;
      0, 0, eta_psi_1_kf^2];


%%%% DEPTH CELL MEASUREMENTS (Z) TO ESTIMATE (Z) AND (V_c_z), for PHASE 1 %%%%

Az1 = [1, dt;
       0, 1];

Bz1 = [dt;
       0];

Gz1 = dt*eye(2);

Cz1 = [1, 0];

alpha_z_1 = 5;

% simulation's parameters
csi_z_1 = 0.005;
csi_vcz_1 = 0.005;

% model's parameters
csi_z_1_kf = 0.001;
csi_vcz_1_kf = 0.001;

Qz1 = [csi_z_1_kf^2, 0;
      0, csi_vcz_1_kf^2];

% simulation's parameters
eta_z_1 = 0.005;

% model's parameters
eta_z_1_kf = 0.001;

Rz1 = eta_z_1_kf^2;


%%% CASE 2.1 %%%
% iUSBL MEASUREMENTS (X, Y, psi) TO ESTIMATE (X,Y), (PSI, r) AND (V_c_x, V_c_y) %

%%%% DS's position KNOWN, orientation UNKNOWN %%%%
% DS's orientation rethrieved with the vector measurement

d = 1; % the distance between the two transponders was chosen to be of 1 m
A = [1, dt; 0, 1];
B = [dt; 0];
G = dt*eye(2);
% observations are not linear -> compute the jacobian
mu = -5;
alpha = 10; % initial noise

% simulation's parameter
csi1 = deg2rad(0.2);

% model's parameter
csi1_kf = deg2rad(0.1);

% psi state uncertainty quite high (amplitude equal to 1) (0.3)
% if i choose it lower, the estimate of the state gets wrong: it estimates a
% lower value wrt the real one
% if i choose it higher, it estimates correctly the value

%simulation's parameter
csi2 = 0.02;

% model's parameter
csi2_kf = 0.01;

% mu state uncertainty low (amplitude is equal to -10)
% if i decrease it, it becomes a bit less oscillating (closer to 10)
% if i increase it, the oscillating amplitude becomes higher
% also, there is no measurement on the bias, so it can't do anything else
% to estimate it, so the noise on the bias plays a crutial role

% simulation's parameter
eta1 = deg2rad(0.5); % measurement uncertainty in radiants
eta2 = deg2rad(0.5);

% model's parameter
eta1_kf = deg2rad(0.1);
eta2_kf = deg2rad(0.1);
% in this way we say the measurement of psi is accurate
% if i increase it, the estimated value becomes smaller in terms of
% absolute value, makes sense, since it might be noisy
% if i decrease it, the measurement is considered more and more accurate ->
% correct value of psi estimated


R = [eta1_kf^2, 0;
    0, eta2_kf^2];
Q = [csi1_kf^2, 0;
     0, csi2_kf^2];

% no perturbation in the model's noises
% R = [eta1^2, 0;
%     0, eta2^2];
% Q = [csi1^2, 0;
%      0, csi2^2];
% % aggiungi anche yaw rel nelle STATISTICHE!!!
% % 
% % 
% 
% 
% %%% CASE 2.2 %%%
% % (X,Y,Z), (V_Cx, V_Cy, V_Cz), (PSI, r) ESTIMATION FROM RANGE, AHRS (PSI),
% % CURRENT MEASUREMENTS and DEPTH
% 
% %%%% DS's position UNKNOWN, orientation KNOWN %%%%
% G2 = dt*eye(8);
% A2 = eye(8);
% A2(1,4) = dt;
% A2(2,5) = dt;
% A2(3,6) = dt;
% A2(7,8) = dt;
% B2 = zeros(8,3);
% B2(1:3, 1:3) = dt*eye(3);
% alpha2 = 100;
% P0_2 = alpha2*eye(8);
% % se diminuisco di un ordine la csi della posizione diventa perfetta
% 
% % simulation's parameters
% csi1_2 = 0.0002;
% csi2_2 = 0.002;
% csi3_2 = 0.002;
% csi4_2 = 0.00002;
% csi5_2 = 0.00002;
% csi6_2 = 0.00002;
% csi7_2 = 0.002;
% csi8_2 = 0.02;
% 
% csi1_2_kf = 0.0001;
% csi2_2_kf = 0.001;
% csi3_2_kf = 0.001;
% csi4_2_kf = 0.00001;
% csi5_2_kf = 0.00001;
% csi6_2_kf = 0.00001;
% csi7_2_kf = 0.001;
% csi8_2_kf = 0.01;
% Q2 = [csi1_2_kf^2, 0, 0, 0, 0, 0, 0, 0;
%       0, csi2_2_kf^2, 0, 0, 0, 0, 0, 0;
%       0, 0, csi3_2_kf^2, 0, 0, 0, 0, 0;
%       0, 0, 0, csi4_2_kf^2, 0, 0, 0, 0;
%       0, 0, 0, 0, csi5_2_kf^2, 0, 0, 0;
%       0, 0, 0, 0, 0, csi6_2_kf^2, 0, 0;
%       0, 0, 0, 0, 0, 0, csi7_2_kf^2, 0;
%       0, 0, 0, 0, 0, 0, 0, csi8_2_kf^2];
% 
% eta1_2 = 0.002;
% eta2_2 = 0.0002;
% eta3_2 = 0.0002;
% eta4_2 = 0.0002;
% eta5_2 = 0.002;
% eta6_2 = 0.002;
% 
% eta1_2_kf = 0.001;
% eta2_2_kf = 0.0001;
% eta3_2_kf = 0.0001;
% eta4_2_kf = 0.0001;
% eta5_2_kf = 0.001;
% eta6_2_kf = 0.001;
% R2 = [eta1_2_kf^2, 0, 0, 0, 0, 0;
%       0, eta2_2_kf^2, 0, 0, 0, 0;
%       0, 0, eta3_2_kf^2, 0, 0, 0;
%       0, 0, 0, eta4_2_kf^2, 0, 0;
%       0, 0, 0, 0, eta5_2_kf^2, 0
%       0, 0, 0, 0, 0, eta6_2_kf^2];


% %%% CASE 2.3 %%%
% % (X,Y,Z), (V_Cx, V_Cy, V_Cz), (PSI, r) ESTIMATION FROM RANGE, AHRS (PSI),
% % CURRENT MEASUREMENTS and DEPTH
% 
% %%%% both DS's position and orientation UNKNOWN %%%%
% % DS's orientation rethrieved with the vector measurement
% 
% G2 = dt*eye(8);
% A2 = eye(8);
% A2(1,4) = dt;
% A2(2,5) = dt;
% A2(3,6) = dt;
% A2(7,8) = dt;
% B2 = zeros(8,3);
% B2(1:3, 1:3) = dt*eye(3);
% alpha2 = 100;
% P0_2 = alpha2*eye(8);
% 
% % se diminuisco di un ordine la csi della posizione diventa perfetta
% 
% csi1_2 = 0.0002;
% csi2_2 = 0.002;
% csi3_2 = 0.002;
% csi4_2 = 0.00002;
% csi5_2 = 0.00002;
% csi6_2 = 0.00002;
% csi7_2 = 0.002;
% csi8_2 = 0.02;
% 
% csi1_2_kf = 0.0001;
% csi2_2_kf = 0.001;
% csi3_2_kf = 0.001;
% csi4_2_kf = 0.00001;
% csi5_2_kf = 0.00001;
% csi6_2_kf = 0.00001;
% csi7_2_kf = 0.001;
% csi8_2_kf = 0.01;
% Q2 = [csi1_2_kf^2, 0, 0, 0, 0, 0, 0, 0;
%       0, csi2_2_kf^2, 0, 0, 0, 0, 0, 0;
%       0, 0, csi3_2_kf^2, 0, 0, 0, 0, 0;
%       0, 0, 0, csi4_2_kf^2, 0, 0, 0, 0;
%       0, 0, 0, 0, csi5_2_kf^2, 0, 0, 0;
%       0, 0, 0, 0, 0, csi6_2_kf^2, 0, 0;
%       0, 0, 0, 0, 0, 0, csi7_2_kf^2, 0;
%       0, 0, 0, 0, 0, 0, 0, csi8_2_kf^2];
% % Q2 = [csi1_2^2, 0, 0, 0, 0, 0, 0, 0;
% %       0, csi2_2^2, 0, 0, 0, 0, 0, 0;
% %       0, 0, csi3_2^2, 0, 0, 0, 0, 0;
% %       0, 0, 0, csi4_2^2, 0, 0, 0, 0;
% %       0, 0, 0, 0, csi5_2^2, 0, 0, 0;
% %       0, 0, 0, 0, 0, csi6_2^2, 0, 0;
% %       0, 0, 0, 0, 0, 0, csi7_2^2, 0;
% %       0, 0, 0, 0, 0, 0, 0, csi8_2^2];
% 
% eta1_2 = 0.002;
% eta2_2 = 0.0002;
% eta3_2 = 0.0002;
% eta4_2 = 0.0002;
% eta5_2 = 0.002;
% eta6_2 = 0.002;
% 
% eta1_2_kf = 0.001;
% eta2_2_kf = 0.0001;
% eta3_2_kf = 0.0001;
% eta4_2_kf = 0.0001;
% eta5_2_kf = 0.001;
% eta6_2_kf = 0.001;
% R2 = [eta1_2_kf^2, 0, 0, 0, 0, 0;
%       0, eta2_2_kf^2, 0, 0, 0, 0;
%       0, 0, eta3_2_kf^2, 0, 0, 0;
%       0, 0, 0, eta4_2_kf^2, 0, 0;
%       0, 0, 0, 0, eta5_2_kf^2, 0
%       0, 0, 0, 0, 0, eta6_2_kf^2];
% % R2 = [eta1_2^2, 0, 0, 0, 0, 0;
% %       0, eta2_2^2, 0, 0, 0, 0;
% %       0, 0, eta3_2^2, 0, 0, 0;
% %       0, 0, 0, eta4_2^2, 0, 0;
% %       0, 0, 0, 0, eta5_2^2, 0
% %       0, 0, 0, 0, 0, eta6_2^2];
% 
% % DS's orientation rethrieved with the vector measurement
% 
% d = 1; % the distance between the two transponders was chosen to be of 1 m
% A = [1, dt; 0, 1];
% B = [dt; 0];
% G = dt*eye(2);
% % observations are not linear -> compute the jacobian
% mu = -5;
% alpha = 10; % initial noise
% 
% % simulation's parameter
% csi1 = deg2rad(0.2);
% 
% % model's parameter
% csi1_kf = deg2rad(0.1);
% 
% % psi state uncertainty quite high (amplitude equal to 1) (0.3)
% % if i choose it lower, the estimate of the state gets wrong: it estimates a
% % lower value wrt the real one
% % if i choose it higher, it estimates correctly the value
% 
% %simulation's parameter
% csi2 = 0.05; % 0.02 come caso 1?
% 
% % model's parameter
% csi2_kf = 0.01;
% 
% % mu state uncertainty low (amplitude is equal to -10)
% % if i decrease it, it becomes a bit less oscillating (closer to 10)
% % if i increase it, the oscillating amplitude becomes higher
% % also, there is no measurement on the bias, so it can't do anything else
% % to estimate it, so the noise on the bias plays a crutial role
% 
% % simulation's parameter
% eta1 = deg2rad(0.5); % measurement uncertainty in radiants
% eta2 = deg2rad(0.5);
% 
% % model's parameter
% eta1_kf = deg2rad(0.1);
% eta2_kf = deg2rad(0.1);
% % in this way we say the measurement of psi is accurate
% % if i increase it, the estimated value becomes smaller in terms of
% % absolute value, makes sense, since it might be noisy
% % if i decrease it, the measurement is considered more and more accurate ->
% % correct value of psi estimated
% 
% 
% R = [eta1_kf^2, 0;
%     0, eta2_kf^2];
% Q = [csi1_kf^2, 0;
%      0, csi2_kf^2];
% % % no added noise
% % R = [eta1^2, 0;
% %     0, eta2^2];
% % Q = [csi1^2, 0;
% %      0, csi2^2];


% %%% CASE 3 %%%
% % (X,Y,Z), (V_Cx, V_Cy, V_Cz), (PSI, r) ESTIMATION FROM RANGE, AHRS (PSI),
% % CURRENT MEASUREMENTS and DEPTH
% 
% %%%% DS's position UNKNOWN, orientation KNOWN %%%%
% % VARIABLE VELOCITIES, YAW FIXED according to the DS's orientation
% G2 = dt*eye(8);
% A2 = eye(8);
% A2(1,4) = dt;
% A2(2,5) = dt;
% A2(3,6) = dt;
% A2(7,8) = dt;
% B2 = zeros(8,3);
% B2(1:3, 1:3) = dt*eye(3);
% alpha2 = 100;
% P0_2 = alpha2*eye(8);
% % se diminuisco di un ordine la csi della posizione diventa perfetta
% csi1_2 = 0.0002;
% csi2_2 = 0.002;
% csi3_2 = 0.002;
% csi4_2 = 0.00002;
% csi5_2 = 0.00002;
% csi6_2 = 0.00002;
% csi7_2 = 0.002;
% csi8_2 = 0.02;
% 
% csi1_2_kf = 0.0001;
% csi2_2_kf = 0.001;
% csi3_2_kf = 0.001;
% csi4_2_kf = 0.00001;
% csi5_2_kf = 0.00001;
% csi6_2_kf = 0.00001;
% csi7_2_kf = 0.001;
% csi8_2_kf = 0.01;
% % Q2 = [csi1_2^2, 0, 0, 0, 0, 0, 0, 0;
% %       0, csi2_2^2, 0, 0, 0, 0, 0, 0;
% %       0, 0, csi3_2^2, 0, 0, 0, 0, 0;
% %       0, 0, 0, csi4_2^2, 0, 0, 0, 0;
% %       0, 0, 0, 0, csi5_2^2, 0, 0, 0;
% %       0, 0, 0, 0, 0, csi6_2^2, 0, 0;
% %       0, 0, 0, 0, 0, 0, csi7_2^2, 0;
% %       0, 0, 0, 0, 0, 0, 0, csi8_2^2];
% Q2 = [csi1_2_kf^2, 0, 0, 0, 0, 0, 0, 0;
%       0, csi2_2_kf^2, 0, 0, 0, 0, 0, 0;
%       0, 0, csi3_2_kf^2, 0, 0, 0, 0, 0;
%       0, 0, 0, csi4_2_kf^2, 0, 0, 0, 0;
%       0, 0, 0, 0, csi5_2_kf^2, 0, 0, 0;
%       0, 0, 0, 0, 0, csi6_2_kf^2, 0, 0;
%       0, 0, 0, 0, 0, 0, csi7_2_kf^2, 0;
%       0, 0, 0, 0, 0, 0, 0, csi8_2_kf^2];
% 
% eta1_2 = 0.002;
% eta2_2 = 0.0002;
% eta3_2 = 0.0002;
% eta4_2 = 0.0002;
% eta5_2 = 0.002;
% eta6_2 = 0.002;
% 
% eta1_2_kf = 0.001;
% eta2_2_kf = 0.0001;
% eta3_2_kf = 0.0001;
% eta4_2_kf = 0.0001;
% eta5_2_kf = 0.001;
% eta6_2_kf = 0.001;
% % R2 = [eta1_2^2, 0, 0, 0, 0, 0;
% %       0, eta2_2^2, 0, 0, 0, 0;
% %       0, 0, eta3_2^2, 0, 0, 0;
% %       0, 0, 0, eta4_2^2, 0, 0;
% %       0, 0, 0, 0, eta5_2^2, 0
% %       0, 0, 0, 0, 0, eta6_2^2];
% R2 = [eta1_2_kf^2, 0, 0, 0, 0, 0;
%       0, eta2_2_kf^2, 0, 0, 0, 0;
%       0, 0, eta3_2_kf^2, 0, 0, 0;
%       0, 0, 0, eta4_2_kf^2, 0, 0;
%       0, 0, 0, 0, eta5_2_kf^2, 0
%       0, 0, 0, 0, 0, eta6_2_kf^2];
% 
