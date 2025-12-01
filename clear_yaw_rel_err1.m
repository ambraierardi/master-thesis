
for i =1:100
    yaw_rel_i = results_trial_case1.yaw_rel_error{i};
    for j=1:length(yaw_rel_i)
        if abs(yaw_rel_i(j)-2*pi)<=0.01
            yaw_rel_i(j)=yaw_rel_i(j)-2*pi;
        elseif abs(yaw_rel_i(j)+2*pi)<=0.01
            yaw_rel_i(j)=yaw_rel_i(j)+2*pi;
        end
    end
    results_trial_case1.yaw_rel_error{i} = yaw_rel_i;
end