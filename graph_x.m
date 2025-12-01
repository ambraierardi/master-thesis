% CASE 1 %

fig = figure;
% fig.Position = [100 100 700 525]; 
Nx=1;
shadedErrorBar(time_21_x(Nx:end), x_err_21_mean(Nx:end), x_err_21_std(Nx:end), 'lineprops', '-b');

xlim([time_21_x(Nx), time_21_x(end)]);
ylim([-0.01, 0.01]);
xlabel('Time [s]');
ylabel('X Position Estimate Error [m]');
title('Mean X Estimate Error with Standard Deviation - case 1');
exportgraphics(gcf, 'plot_risultati_new/x_position_case1_zoom.png', 'Resolution', 300);

% CASE 2 %

figure;

shadedErrorBar(time_22_x, x_err_22_mean, x_err_22_std, 'lineprops', '-b');

xlim([time_22_x(1), time_22_x(end)]);
ylim([-0.01, 0.01]);
xlabel('Time [s]');
ylabel('X Position Estimate Error [m]');
title('Mean X Estimate Error with Standard Deviation - case 2');
exportgraphics(gcf, 'plot_risultati_new/x_position_case2.png', 'Resolution', 300);

% CASE 3 %

figure;

shadedErrorBar(time_23_x, x_err_23_mean, x_err_23_std, 'lineprops', '-b');

xlim([time_23_x(1), time_23_x(end)]);
ylim([-0.01, 0.01]);
xlabel('Time [s]');
ylabel('X Position Estimate Error [m]');
title('Mean X Estimate Error with Standard Deviation - case 3');
exportgraphics(gcf, 'plot_risultati_new/x_position_case3.png', 'Resolution', 300);

% CASE 4 %
figure;
shadedErrorBar(time_3_x, x_err_3_mean, x_err_3_std, 'lineprops', '-b');
xlim([time_3_x(1), time_3_x(end)]);
ylim([-0.01, 0.01]);
xlabel('Time [s]');
ylabel('X Position Estimate Error [m]');
title('Mean X Estimate Error with Standard Deviation - case 4');
exportgraphics(gcf, 'plot_risultati_new/x_position_case4.png', 'Resolution', 300);