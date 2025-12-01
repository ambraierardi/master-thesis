% CASE 1 % 

figure;

shadedErrorBar(time_21_psi_ctrl, psi_ctrl_21_mean, psi_ctrl_21_std, 'lineprops', '-b');

xlim([time_21_psi_ctrl(1), time_21_psi_ctrl(end)]);
ylim([-1.8, 2.7]);
xlabel('Time [s]');
ylabel('Tracking Error on \psi [rad]');
title('Tracking Error on \psi with Standard Deviation - case 1');
exportgraphics(gcf, 'plot_risultati_new/psi_control_case1.png', 'Resolution', 300);

% CASE 2 % 

figure;

N=1;

shadedErrorBar(time_22_psi_ctrl(N:end), psi_ctrl_22_mean(N:end), psi_ctrl_22_std(N:end), 'lineprops', '-b');

xlim([time_22_psi_ctrl(N), time_22_psi_ctrl(end)]);
ylim([-1.8, 2.7]);
xlabel('Time [s]');
ylabel('Tracking Error on \psi [rad]');
title('Tracking Error on \psi with Standard Deviation - case 2');
exportgraphics(gcf, 'plot_risultati_new/psi_control_case2.png', 'Resolution', 300);

% CASE 3 % 

figure;

shadedErrorBar(time_23_psi_ctrl, psi_ctrl_23_mean, psi_ctrl_23_std, 'lineprops', '-b');

xlim([time_23_psi_ctrl(1), time_23_psi_ctrl(end)]);
ylim([-1.8, 2.7]);
xlabel('Time [s]');
ylabel('Tracking Error on \psi [rad]');
title('Tracking Error on \psi with Standard Deviation - case 3');
exportgraphics(gcf, 'plot_risultati_new/psi_control_case3.png', 'Resolution', 300);

% CASE 4 %

figure;
shadedErrorBar(time_3_psi_ctrl, psi_ctrl_3_mean, psi_ctrl_3_std, 'lineprops', '-b');
xlim([time_3_psi_ctrl(1), time_3_psi_ctrl(end)]);
ylim([-1.8, 2.7]);
xlabel('Time [s]');
ylabel('Tracking Error on \psi [rad]');
title('Tracking Error on \psi with Standard Deviation - case 4');
exportgraphics(gcf, 'plot_risultati_new/psi_control_case4.png', 'Resolution', 300);