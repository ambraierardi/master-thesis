% CASE 1 % 

figure;

shadedErrorBar(time_21_v, v_ctrl_21_mean, v_ctrl_21_std, 'lineprops', '-b');

xlim([time_21_v(1), time_21_v(end)]);
ylim([-0.2, 0.5]);
xlabel('Time [s]');
ylabel('Tracking Error on v [m/s]');
title('Tracking Error on v with Standard Deviation - case 1');
exportgraphics(gcf, 'plot_risultati_new/v_case1.png', 'Resolution', 300);

% CASE 2 % 

figure;

shadedErrorBar(time_22_v, v_ctrl_22_mean, v_ctrl_22_std, 'lineprops', '-b');

xlim([time_22_v(1), time_22_v(end)]);
ylim([-0.2, 0.5]);
xlabel('Time [s]');
ylabel('Tracking Error on v [m/s]');
title('Tracking Error on v with Standard Deviation - case 2');
exportgraphics(gcf, 'plot_risultati_new/v_case2.png', 'Resolution', 300);

% CASE 3 % 

figure;

shadedErrorBar(time_23_v, v_ctrl_23_mean, v_ctrl_23_std, 'lineprops', '-b');

xlim([time_23_v(1), time_23_v(end)]);
ylim([-0.2, 0.5]);
xlabel('Time [s]');
ylabel('Tracking Error on v [m/s]');
title('Tracking Error on v with Standard Deviation - case 3');
exportgraphics(gcf, 'plot_risultati_new/v_case3.png', 'Resolution', 300);

% CASE 4 %

figure;
N = 1;
shadedErrorBar(time_3_v(N:end), v_ctrl_3_mean(N:end), v_ctrl_3_std(N:end), 'lineprops', '-b');
xlim([time_3_v(N), time_3_v(end)]);
ylim([-0.2, 0.5]);
xlabel('Time [s]');
ylabel('Tracking Error on v [m/s]');
title('Tracking Error on v with Standard Deviation - case 4');
exportgraphics(gcf, 'plot_risultati_new/v_case4.png', 'Resolution', 300);
