% case 3 %

time_3_x = linspace(0, N_x_est_3*dt, N_x_est_3);
time_3_vcx = linspace(0, N_vcx_est_3*dt, N_vcx_est_3);
time_3_psi_est = linspace(0, N_psi_est_3*dt, N_psi_est_3);
time_3_u = linspace(0, N_u_ctrl_3*dt, N_u_ctrl_3);
time_3_v = linspace(0, N_v_ctrl_3*dt, N_v_ctrl_3);
time_3_psi_ctrl = linspace(0, N_psi_ctrl_3*dt, N_psi_ctrl_3);

% x %
figure;
shadedErrorBar(time_3_x, x_err_3_mean, x_err_3_std, 'lineprops', '-b');
xlim([time_3_x(1), time_3_x(end)]);
ylim([-0.1, 0.15]);
xlabel('Time [s]');
ylabel('X Position Estimate Error [m]');
title('Mean X Estimate Error with Standard Deviation - case 4');
exportgraphics(gcf, 'plot_risultati_new/x_position_case4_new.png', 'Resolution', 300);

% vcx %
% figure;
% Nvcx=120;
% shadedErrorBar(time_3_vcx(Nvcx:end), vcx_err_3_mean(Nvcx:end), vcx_err_3_std(Nvcx:end), 'lineprops', '-b');
% xlim([time_3_vcx(Nvcx), time_3_vcx(end)]);
% ylim([-0.015, 0.02]);
% xlabel('Time [s]');
% ylabel('Current Velocity v_{cx} Estimation Error [m/s]');
% title('Current Velocity v_{cx} Estimation Error with Standard Deviation - case 4');
% exportgraphics(gcf, 'plot_risultati_new/vcx_position_case4_new.png', 'Resolution', 300);

% psi_est %
figure;
shadedErrorBar(time_3_psi_est, psi_err_3_mean, psi_err_3_std, 'lineprops', '-b');
xlim([time_3_psi_est(1), time_3_psi_est(end)]);
ylim([-0.8, 0.8]);
xlabel('Time [s]');
ylabel('Orientation  \psi Estimation Error [rad]');
title('Orientation \psi Estimation Error with Standard Deviation - case 4');
exportgraphics(gcf, 'plot_risultati_new/psi_estimate_case4_new.png', 'Resolution', 300);

% u %
figure;
shadedErrorBar(time_3_u(140:end), u_ctrl_3_mean(140:end), u_ctrl_3_std(140:end), 'lineprops', '-b');
xlim([time_3_u(140), time_3_u(end)]);
ylim([-0.1, 0.25]);
xlabel('Time [s]');
ylabel('Tracking Error on u [m/s]');
title('Tracking Error on u with Standard Deviation - case 4');
exportgraphics(gcf, 'plot_risultati_new/u_case4_new.png', 'Resolution', 300);

% v %
figure;
N = 25;
shadedErrorBar(time_3_v(N:end), v_ctrl_3_mean(N:end), v_ctrl_3_std(N:end), 'lineprops', '-b');
xlim([time_3_v(N), time_3_v(end)]);
ylim([-0.4, 0.5]);
xlabel('Time [s]');
ylabel('Tracking Error on v [m/s]');
title('Tracking Error on v with Standard Deviation - case 4');
exportgraphics(gcf, 'plot_risultati_new/v_case4_new.png', 'Resolution', 300);

% psi_ctrl %
figure;
shadedErrorBar(time_3_psi_ctrl, psi_ctrl_3_mean, psi_ctrl_3_std, 'lineprops', '-b');
xlim([time_3_psi_ctrl(1), time_3_psi_ctrl(end)]);
ylim([-1.5, 2.7]);
xlabel('Time [s]');
ylabel('Tracking Error on \psi [rad]');
title('Tracking Error on \psi with Standard Deviation - case 4');
exportgraphics(gcf, 'plot_risultati_new/psi_control_case4_new_ppt.png', 'Resolution', 300);
