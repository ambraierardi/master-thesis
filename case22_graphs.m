% case 2.2 %

time_22_x = linspace(0, N_x_est_22*dt, N_x_est_22);
time_22_vcx = linspace(0, N_vcx_est_22*dt, N_vcx_est_22);
time_22_psi_est = linspace(0, N_psi_est_22*dt, N_psi_est_22);
time_22_u = linspace(0, N_u_ctrl_22*dt, N_u_ctrl_22);
time_22_v = linspace(0, N_v_ctrl_22*dt, N_v_ctrl_22);
time_22_psi_ctrl = linspace(0, N_psi_ctrl_22*dt, N_psi_ctrl_22);

% x %

figure;

shadedErrorBar(time_22_x, x_err_22_mean, x_err_22_std, 'lineprops', '-b');

xlim([time_22_x(1), time_22_x(end)]);
ylim([-0.1, 0.15]);
xlabel('Time [s]');
ylabel('X Position Estimate Error [m]');
title('Mean X Estimate Error with Standard Deviation - case 2');
% exportgraphics(gcf, 'plot_risultati_new/x_position_case2_new.png', 'Resolution', 300);

% vcx % 

% figure;
% 
% Nvcx=120;
% shadedErrorBar(time_22_vcx(Nvcx:end), vcx_err_22_mean(Nvcx:end), vcx_err_22_std(Nvcx:end), 'lineprops', '-b');
% 
% xlim([time_22_vcx(Nvcx), time_22_vcx(end)]);
% ylim([-0.015, 0.02]);
% xlabel('Time [s]');
% ylabel('Current Velocity v_{cx} Estimation Error [m/s]');
% title('Current Velocity v_{cx} Estimation Error with Standard Deviation - case 2');
% exportgraphics(gcf, 'plot_risultati_new/vcx_position_case2_new.png', 'Resolution', 300);

% psi_est % 

figure;

shadedErrorBar(time_22_psi_est, psi_err_22_mean, psi_err_22_std, 'lineprops', '-b');

xlim([time_22_psi_est(1), time_22_psi_est(end)]);
ylim([-0.8, 0.8]);
xlabel('Time [s]');
ylabel('Orientation  \psi Estimation Error [rad]');
title('Orientation \psi Estimation Error with Standard Deviation - case 2');
% exportgraphics(gcf, 'plot_risultati_new/psi_estimate_case2_new.png', 'Resolution', 300);

% u % 

figure;

shadedErrorBar(time_22_u, u_ctrl_22_mean, u_ctrl_22_std, 'lineprops', '-b');

xlim([time_22_u(1), time_22_u(end)]);
ylim([-0.1, 0.25]);
xlabel('Time [s]');
ylabel('Tracking Error on u [m/s]');
title('Tracking Error on u with Standard Deviation - case 2');
exportgraphics(gcf, 'plot_risultati_new/u_case2_new.png', 'Resolution', 300);

% v % 

figure;

shadedErrorBar(time_22_v, v_ctrl_22_mean, v_ctrl_22_std, 'lineprops', '-b');

xlim([time_22_v(1), time_22_v(end)]);
ylim([-0.4, 0.5]);
xlabel('Time [s]');
ylabel('Tracking Error on v [m/s]');
title('Tracking Error on v with Standard Deviation - case 2');
% exportgraphics(gcf, 'plot_risultati_new/v_case2_new.png', 'Resolution', 300);


% psi_ctrl % 

figure;

shadedErrorBar(time_22_psi_ctrl(170000:225500), psi_ctrl_22_mean(170000:225500), psi_ctrl_22_std(170000:225500), 'lineprops', '-b');

xlim([time_22_psi_ctrl(170000), time_22_psi_ctrl(225500)]);
ylim([-1.5, 2.7]);
xlabel('Time [s]');
ylabel('Tracking Error on \psi [rad]');
title('Tracking Error on \psi with Standard Deviation - case 2');
exportgraphics(gcf, 'plot_risultati_new/psi_control_case2_new_ppt_zoom.png', 'Resolution', 300);