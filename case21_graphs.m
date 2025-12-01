% case 2.1 %

time_21_x = linspace(0, N_x_est_21*dt, N_x_est_21);
time_21_vcx = linspace(0, N_vcx_est_21*dt, N_vcx_est_21);
time_21_psi_est = linspace(0, N_psi_est_21*dt, N_psi_est_21);
time_21_u = linspace(0, N_u_ctrl_21*dt, N_u_ctrl_21);
time_21_v = linspace(0, N_v_ctrl_21*dt, N_v_ctrl_21);
time_21_psi_ctrl = linspace(0, N_psi_ctrl_21*dt, N_psi_ctrl_21);

% x %

fig = figure;
fig.Position = [100 100 700 525]; 
Nx=20;
shadedErrorBar(time_21_x(Nx:end), x_err_21_mean(Nx:end), x_err_21_std(Nx:end), 'lineprops', '-b');

xlim([time_21_x(Nx), time_21_x(end)]);
% ylim([-0.1, 0.15]);
xlabel('Time [s]');
ylabel('X Position Estimate Error [m]');
title('Mean X Estimate Error with Standard Deviation - case 1');
% exportgraphics(gcf, 'plot_risultati_new/x_position_case1_new_zoom.png', 'Resolution', 300);

% figure;
% 
% shadedErrorBar(time_21_x, x_err_21_mean, x_err_21_std, 'lineprops', '-b');
% 
% xlim([time_21_x(1), time_21_x(end)]);
% xlabel('Samples [-]');
% ylabel('X Position Estimate Error [m]');
% title('Mean X Estimate Error with Standard Deviation - case 1');
% exportgraphics(gcf, 'plot_risultati_new/x_position_case1_no_zoom.png', 'Resolution', 300);

% vcx % 

% figure;
% 
% Nvcx = 200;
% shadedErrorBar(time_21_vcx(Nvcx:end), vcx_err_21_mean(Nvcx:end), vcx_err_21_std(Nvcx:end), 'lineprops', '-b');
% 
% xlim([time_21_vcx(Nvcx), time_21_vcx(end)]);
% % ylim([-0.015, 0.02]);
% xlabel('Time [s]');
% ylabel('Current Velocity v_{cx} Estimation Error [m/s]');
% title('Current Velocity v_{cx} Estimation Error with Standard Deviation - case 1');
% exportgraphics(gcf, 'plot_risultati_new/vcx_position_case1_new.png', 'Resolution', 300);

% psi_est % 

figure;

shadedErrorBar(time_21_psi_est, psi_err_21_mean, psi_err_21_std, 'lineprops', '-b');


xlim([time_21_psi_est(1), time_21_psi_est(end)]);
% ylim([-0.8, 0.8]);
xlabel('Time [s]');
ylabel('Orientation  \psi Estimation Error [rad]');
title('Orientation \psi Estimation Error with Standard Deviation - case 1');
% exportgraphics(gcf, 'plot_risultati_new/psi_estimate_case1_new.png', 'Resolution', 300);

% u % 

figure;

shadedErrorBar(time_21_u, u_ctrl_21_mean, u_ctrl_21_std, 'lineprops', '-b');

xlim([time_21_u(1), time_21_u(end)]);
% ylim([-0.1, 0.25]);
xlabel('Time [s]');
ylabel('Tracking Error on u [m/s]');
title('Tracking Error on u with Standard Deviation - case 1');
% exportgraphics(gcf, 'plot_risultati_new/u_case1_new.png', 'Resolution', 300);

% v % 

figure;

shadedErrorBar(time_21_v, v_ctrl_21_mean, v_ctrl_21_std, 'lineprops', '-b');

xlim([time_21_v(1), time_21_v(end)]);
% ylim([-0.4, 0.5]);
xlabel('Time [s]');
ylabel('Tracking Error on v [m/s]');
title('Tracking Error on v with Standard Deviation - case 1');
% exportgraphics(gcf, 'plot_risultati_new/v_case1_new.png', 'Resolution', 300);

% psi_ctrl % 

figure;

shadedErrorBar(time_21_psi_ctrl, psi_ctrl_21_mean, psi_ctrl_21_std, 'lineprops', '-b');

xlim([time_21_psi_ctrl(1), time_21_psi_ctrl(end)]);
ylim([-2, 3]);
xlabel('Time [s]');
ylabel('Tracking Error on \psi [rad]');
title('Tracking Error on \psi with Standard Deviation - case 1');
% exportgraphics(gcf, 'plot_risultati_new/psi_control_case1_new.png', 'Resolution', 300);
