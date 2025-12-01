% CASE 1 % 

figure;

shadedErrorBar(time_21_u, u_ctrl_21_mean, u_ctrl_21_std, 'lineprops', '-b');

xlim([time_21_u(1), time_21_u(end)]);
ylim([-0.1, 0.15]);
xlabel('Time [s]');
ylabel('Tracking Error on u [m/s]');
title('Tracking Error on u with Standard Deviation - case 1');
exportgraphics(gcf, 'plot_risultati_new/u_case1.png', 'Resolution', 300);

% CASE 2 % 

figure;

shadedErrorBar(time_22_u, u_ctrl_22_mean, u_ctrl_22_std, 'lineprops', '-b');

xlim([time_22_u(1), time_22_u(end)]);
ylim([-0.1, 0.15]);
xlabel('Time [s]');
ylabel('Tracking Error on u [m/s]');
title('Tracking Error on u with Standard Deviation - case 2');
exportgraphics(gcf, 'plot_risultati_new/u_case2.png', 'Resolution', 300);

% CASE 3 % 

figure;

shadedErrorBar(time_23_u, u_ctrl_23_mean, u_ctrl_23_std, 'lineprops', '-b');

xlim([time_23_u(1), time_23_u(end)]);
ylim([-0.1, 0.15]);
xlabel('Time [s]');
ylabel('Tracking Error on u [m/s]');
title('Tracking Error on u with Standard Deviation - case 3');
exportgraphics(gcf, 'plot_risultati_new/u_case3.png', 'Resolution', 300);

% CASE 4 %

figure;
shadedErrorBar(time_3_u(1:end-50), u_ctrl_3_mean(1:end-50), u_ctrl_3_std(1:end-50), 'lineprops', '-b');
xlim([time_3_u(1), time_3_u(end-50)]);
ylim([-0.1, 0.15]);
xlabel('Time [s]');
ylabel('Tracking Error on u [m/s]');
title('Tracking Error on u with Standard Deviation - case 4');
exportgraphics(gcf, 'plot_risultati_new/u_case4.png', 'Resolution', 300);
