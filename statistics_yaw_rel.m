% remove empty arrays
idx = cellfun(@(x) numel(x) > 1, results_trial_case1.yaw_rel_error);
errors_2_1_filtered = results_trial_case1.yaw_rel_error(idx);

% number of simulations
N = 99;

L_yaw_rel_21 = cellfun(@(x) size(x,1), errors_2_1_filtered);
N_yaw_rel_21 = min(L_yaw_rel_21);

L_yaw_rel_23 = cellfun(@(x) size(x,1), results_trial_case3.yaw_rel_error);
N_yaw_rel_23 = min(L_yaw_rel_23);

yaw_rel_err_21 = zeros(N_yaw_rel_21, N);
yaw_rel_err_23 = zeros(N_yaw_rel_23, N);

for i = 1:N
    yaw_rel_err_21(:,i) = errors_2_1_filtered{i}(1:N_yaw_rel_21);
    yaw_rel_err_23(:,i) = results_trial_case3.yaw_rel_error{i}(1:N_yaw_rel_23);
end

% mean %
yaw_rel_21_mean = mean(yaw_rel_err_21, 2);
% invece di (media più robusta)
% yaw_rel_21_mean = median(yaw_rel_err_21, 2);
first_nonzero_idx_21 = find(yaw_rel_21_mean > 0, 1, 'first');
yaw_rel_21_mean_trimmed = yaw_rel_21_mean(first_nonzero_idx_21:end);
N_yaw_rel_21_trimmed = length(yaw_rel_21_mean_trimmed);
%%% CONSIDERA COME RISOLVERE GLI OUTLIERS %%%

yaw_rel_23_mean = mean(yaw_rel_err_23, 2);
first_nonzero_idx_23 = find(yaw_rel_23_mean > 0, 1, 'first');
yaw_rel_23_mean_trimmed = yaw_rel_23_mean(first_nonzero_idx_23:end);
N_yaw_rel_23_trimmed = length(yaw_rel_23_mean_trimmed);

% % variance %
% yaw_rel_21_var = var(yaw_rel_err_21, 0, 2);
% yaw_rel_21_var_trimmed = yaw_rel_21_var(first_nonzero_idx_21:end);
% 
% yaw_rel_23_var = var(yaw_rel_err_23, 0, 2);
% yaw_rel_23_var_trimmed = yaw_rel_23_var(first_nonzero_idx_23:end);


% standard deviation %
yaw_rel_21_std = std(yaw_rel_err_21, 0, 2);
yaw_rel_21_std_trimmed = yaw_rel_21_std(first_nonzero_idx_21:end);

yaw_rel_23_std = std(yaw_rel_err_23, 0, 2);
yaw_rel_23_std_trimmed = yaw_rel_23_std(first_nonzero_idx_23:end);


% % time axes
% time_21 = linspace(first_nonzero_idx_21, N_yaw_rel_21, N_yaw_rel_21_trimmed)';
% time_23 = linspace(first_nonzero_idx_23, N_yaw_rel_23, N_yaw_rel_23_trimmed)';
% 
% upper_val_21 = yaw_rel_21_mean_trimmed + yaw_rel_21_std_trimmed;
% lower_val_21 = yaw_rel_21_mean_trimmed - yaw_rel_21_std_trimmed;
% 
% upper_val_23 = yaw_rel_23_mean_trimmed + yaw_rel_23_std_trimmed;
% lower_val_23 = yaw_rel_23_mean_trimmed - yaw_rel_23_std_trimmed;

% figure;
% 
% h1 = area(time_21, upper_val_21);
% h1.LineStyle = 'none';
% h1.BaseLine.Visible = 'off';
% hold on;
% h2 = area(time_21, lower_val_21);
% h2.LineStyle = 'none';
% h2.BaseLine.Visible = 'off'; 
% 
% set(h1, 'FaceColor', 'b', 'FaceAlpha', 0.2, 'EdgeColor', 'none');
% set(h2, 'FaceColor', 'b', 'FaceAlpha', 0.2, 'EdgeColor', 'none');
% 
% plot(time_21, yaw_rel_21_mean_trimmed, 'b', 'LineWidth', 0.4);
% 
% xlim([time_21(1), time_21(end)]);
% xlabel('Samples [-]');
% ylabel('Relative Orientation \psi_r Error [rad]');
% title('Relative Orientation \psi_r Error with Standard Deviation - case 1');
% exportgraphics(gcf, 'plot_risultati/relative_psi_case1.png', 'Resolution', 300);
% 
% 
% 
% 
% 
% figure;
% 
% h3 = area(time_23, upper_val_23);
% h3.LineStyle = 'none';
% h3.BaseLine.Visible = 'off';
% hold on;
% h4 = area(time_23, lower_val_23);
% h4.LineStyle = 'none';
% h4.BaseLine.Visible = 'off'; 
% 
% set(h3, 'FaceColor', 'b', 'FaceAlpha', 0.2, 'EdgeColor', 'none');
% set(h4, 'FaceColor', 'b', 'FaceAlpha', 0.2, 'EdgeColor', 'none');
% 
% plot(time_23, yaw_rel_23_mean_trimmed, 'b', 'LineWidth', 0.4);
% 
% xlim([time_23(1), time_23(end)])
% xlabel('Samples [-]');
% ylabel('Relative Orientation \psi_r Error [rad]');
% title('Relative Orientation \psi_r Error with Standard Deviation - case 3');
% exportgraphics(gcf, 'plot_risultati/relative_psi_case3.png', 'Resolution', 300);

%%% OR: %%%
% time axes
time_21 = linspace(first_nonzero_idx_21*dt, N_yaw_rel_21*dt, N_yaw_rel_21_trimmed)';
time_23 = linspace(first_nonzero_idx_23*dt, N_yaw_rel_23*dt, N_yaw_rel_23_trimmed)';

fig = figure;
fig.Position = [100 100 700 525]; 

shadedErrorBar(time_21, yaw_rel_21_mean_trimmed, yaw_rel_21_std_trimmed, 'lineprops', '-b');
xlim([time_21(1), time_21(end)]);
% ylim([-0.003, 0.003])
xlabel('Time [s]');
ylabel('Relative Orientation \psi_r Error [rad]');
title('Relative Orientation \psi_r Error with Standard Deviation - case 1');

exportgraphics(fig, 'plot_risultati/relative_psi_case1_trial.png', 'Resolution', 300);



fig = figure;
fig.Position = [100 100 700 525]; 

shadedErrorBar(time_23, yaw_rel_23_mean_trimmed, yaw_rel_23_std_trimmed, 'lineprops', '-b');
xlim([time_23(1), time_23(end)])
xlabel('Time [s]');
ylabel('Relative Orientation \psi_r Error [rad]');
title('Relative Orientation \psi_r Error with Standard Deviation - case 3');
exportgraphics(gcf, 'plot_risultati/relative_psi_case3_trial.png', 'Resolution', 300);



