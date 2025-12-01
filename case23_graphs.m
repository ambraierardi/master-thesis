% case 2.3 %

time_23_x = linspace(0, N_x_est_23*dt, N_x_est_23);
time_23_vcx = linspace(0, N_vcx_est_23*dt, N_vcx_est_23);
time_23_psi_est = linspace(0, N_psi_est_23*dt, N_psi_est_23);
time_23_u = linspace(0, N_u_ctrl_23*dt, N_u_ctrl_23);
time_23_v = linspace(0, N_v_ctrl_23*dt, N_v_ctrl_23);
time_23_psi_ctrl = linspace(0, N_psi_ctrl_23*dt, N_psi_ctrl_23);

% x %

figure;

shadedErrorBar(time_23_x, x_err_23_mean, x_err_23_std, 'lineprops', '-b');

xlim([time_23_x(1), time_23_x(end)]);
ylim([-0.1, 0.15]);
xlabel('Time [s]');
ylabel('X Position Estimate Error [m]');
title('Mean X Estimate Error with Standard Deviation - case 3');
exportgraphics(gcf, 'plot_risultati_new/x_position_case3_new.png', 'Resolution', 300);

% vcx % 

% fig = figure;
% fig.Position = [100 100 840 630]; 
% 
% Nvcx=120;
% shadedErrorBar(time_23_vcx(Nvcx:end), vcx_err_23_mean(Nvcx:end), vcx_err_23_std(Nvcx:end), 'lineprops', '-b');
% 
% xlim([time_23_vcx(Nvcx), time_23_vcx(end)]);
% % ylim([-0.015, 0.02]);
% xlabel('Time [s]');
% ylabel('Current Velocity v_{cx} Estimation Error [m/s]');
% title('Current Velocity v_{cx} Estimation Error with Standard Deviation - case 3');
% exportgraphics(gcf, 'plot_risultati_new/vcx_position_case3_new_ppt.png', 'Resolution', 300);

% psi_est % 

figure;

shadedErrorBar(time_23_psi_est, psi_err_23_mean, psi_err_23_std, 'lineprops', '-b');


xlim([time_23_psi_est(1), time_23_psi_est(end)]);
ylim([-0.8, 0.8]);
xlabel('Time [s]');
ylabel('Orientation  \psi Estimation Error [rad]');
title('Orientation \psi Estimation Error with Standard Deviation - case 3');
exportgraphics(gcf, 'plot_risultati_new/psi_estimate_case3_new.png', 'Resolution', 300);


% u % 

figure;

shadedErrorBar(time_23_u, u_ctrl_23_mean, u_ctrl_23_std, 'lineprops', '-b');

xlim([time_23_u(1), time_23_u(end)]);
ylim([-0.1, 0.25]);
xlabel('Time [s]');
ylabel('Tracking Error on u [m/s]');
title('Tracking Error on u with Standard Deviation - case 3');
exportgraphics(gcf, 'plot_risultati_new/u_case3_new.png', 'Resolution', 300);

% v % 

figure;

shadedErrorBar(time_23_v, v_ctrl_23_mean, v_ctrl_23_std, 'lineprops', '-b');

xlim([time_23_v(1), time_23_v(end)]);
ylim([-0.4, 0.5]);
xlabel('Time [s]');
ylabel('Tracking Error on v [m/s]');
title('Tracking Error on v with Standard Deviation - case 3');
exportgraphics(gcf, 'plot_risultati_new/v_case3_new.png', 'Resolution', 300);

% psi_ctrl % 

figure;

shadedErrorBar(time_23_psi_ctrl, psi_ctrl_23_mean, psi_ctrl_23_std, 'lineprops', '-b');

xlim([time_23_psi_ctrl(1), time_23_psi_ctrl(end)]);
ylim([-2, 3]);
xlabel('Time [s]');
ylabel('Tracking Error on \psi [rad]');
title('Tracking Error on \psi with Standard Deviation - case 3');
exportgraphics(gcf, 'plot_risultati_new/psi_control_case3_new.png', 'Resolution', 300);