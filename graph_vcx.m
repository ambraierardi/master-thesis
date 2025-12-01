% CASE 1 % 

figure;

Nvcx = 1;
shadedErrorBar(time_21_vcx(Nvcx:end), vcx_err_21_mean(Nvcx:end), vcx_err_21_std(Nvcx:end), 'lineprops', '-b');

xlim([time_21_vcx(Nvcx), time_21_vcx(end)]);
ylim([-0.01, 0.01]);
xlabel('Time [s]');
ylabel('Current Velocity v_{cx} Estimation Error [m/s]');
title('Current Velocity v_{cx} Estimation Error with Standard Deviation - case 1');
exportgraphics(gcf, 'plot_risultati_new/vcx_position_case1.png', 'Resolution', 300);

% CASE 2 % 

figure;

Nvcx=1;
shadedErrorBar(time_22_vcx(Nvcx:end), vcx_err_22_mean(Nvcx:end), vcx_err_22_std(Nvcx:end), 'lineprops', '-b');

xlim([time_22_vcx(Nvcx), time_22_vcx(end)]);
ylim([-0.01, 0.01]);
xlabel('Time [s]');
ylabel('Current Velocity v_{cx} Estimation Error [m/s]');
title('Current Velocity v_{cx} Estimation Error with Standard Deviation - case 2');
exportgraphics(gcf, 'plot_risultati_new/vcx_position_case2.png', 'Resolution', 300);

% CASE 3 % 

fig = figure;
% fig.Position = [100 100 840 630]; 

Nvcx=120;
shadedErrorBar(time_23_vcx(Nvcx:end), vcx_err_23_mean(Nvcx:end), vcx_err_23_std(Nvcx:end), 'lineprops', '-b');

xlim([time_23_vcx(Nvcx), time_23_vcx(end)]);
ylim([-0.01, 0.01]);
xlabel('Time [s]');
ylabel('Current Velocity v_{cx} Estimation Error [m/s]');
title('Current Velocity v_{cx} Estimation Error with Standard Deviation - case 3');
exportgraphics(gcf, 'plot_risultati_new/vcx_position_case3.png', 'Resolution', 300);

% CASE 4 %

figure;
Nvcx=1;
shadedErrorBar(time_3_vcx(Nvcx:end), vcx_err_3_mean(Nvcx:end), vcx_err_3_std(Nvcx:end), 'lineprops', '-b');
xlim([time_3_vcx(Nvcx), time_3_vcx(end)]);
ylim([-0.01, 0.01]);
xlabel('Time [s]');
ylabel('Current Velocity v_{cx} Estimation Error [m/s]');
title('Current Velocity v_{cx} Estimation Error with Standard Deviation - case 4');
exportgraphics(gcf, 'plot_risultati_new/vcx_position_case4.png', 'Resolution', 300);