function [ output_args ] = scan_pg( input_args )

%% init
%{p,s,q,r}
% resolution: 1E-3/2/pi GHz ~ 0.16 MHz
tot_basis_num = 5 + 5 + 1;
not_optimal_parms = 0;

x0 = [        0.165163660724137
   0.000292003738603
  -0.000359365513371
  -0.000149344168943
  -0.000706371692614
   0.009489968075156
  -0.003856608438452
   0.001877106789142
   0.000391853133527
   0.001877616499316
  -0.001731993494416];


myx0 = [x0];
%% change parms
num = 5;
idx = 2;
change_parm = linspace(-0.02, 0.02, num);

%% run
not_optimal_parms = 0;
g = zeros([1 num]);
p_g = zeros([size(x0,1)+not_optimal_parms, num]);

for a=1:num
    a
    myx = myx0;
    myx(idx) = change_parm(a);
    [g(a), p_g(:,a)] = par_XI_Import(myx);
end

p_g_thy = gradient(g) / ((change_parm(end) - change_parm(1)) / num);

%% plot
figure(100)
subplot(2,1,1)
plot(change_parm, g, 'b.-', 'MarkerSize', 15);
title('g');
xlabel('change parm')
grid on

subplot(2,1,2)
plot(change_parm, p_g(idx,:), 'b.-', 'MarkerSize', 15); hold on
plot(change_parm, p_g_thy, 'g.-', 'MarkerSize', 15); hold on
title('p_g');
xlabel('change parm')
legend('by GOAT', 'ideal gradient')
grid on
end

