% CASE 1 % 

figure;

shadedErrorBar(time_21_psi_est, psi_err_21_mean, psi_err_21_std, 'lineprops', '-b');


xlim([time_21_psi_est(1), time_21_psi_est(end)]);
ylim([-0.042, 0.02]);
xlabel('Time [s]');
ylabel('Orientation  \psi Estimation Error [rad]');
title('Orientation \psi Estimation Error with Standard Deviation - case 1');
exportgraphics(gcf, 'plot_risultati_new/psi_estimate_case1.png', 'Resolution', 300);

% CASE 2 % 

figure;

shadedErrorBar(time_22_psi_est, psi_err_22_mean, psi_err_22_std, 'lineprops', '-b');

xlim([time_22_psi_est(1), time_22_psi_est(end)]);
ylim([-0.042, 0.02]);
xlabel('Time [s]');
ylabel('Orientation  \psi Estimation Error [rad]');
title('Orientation \psi Estimation Error with Standard Deviation - case 2');
exportgraphics(gcf, 'plot_risultati_new/psi_estimate_case2.png', 'Resolution', 300);

% CASE 3 % 

figure;

shadedErrorBar(time_23_psi_est, psi_err_23_mean, psi_err_23_std, 'lineprops', '-b');


xlim([time_23_psi_est(1), time_23_psi_est(end)]);
ylim([-0.042, 0.02]);
xlabel('Time [s]');
ylabel('Orientation  \psi Estimation Error [rad]');
title('Orientation \psi Estimation Error with Standard Deviation - case 3');
exportgraphics(gcf, 'plot_risultati_new/psi_estimate_case3.png', 'Resolution', 300);

% CASE 4 %

figure;
shadedErrorBar(time_3_psi_est, psi_err_3_mean, psi_err_3_std, 'lineprops', '-b');
xlim([time_3_psi_est(1), time_3_psi_est(end)]);
ylim([-0.042, 0.02]);
xlabel('Time [s]');
ylabel('Orientation  \psi Estimation Error [rad]');
title('Orientation \psi Estimation Error with Standard Deviation - case 4');
exportgraphics(gcf, 'plot_risultati_new/psi_estimate_case4.png', 'Resolution', 300);
