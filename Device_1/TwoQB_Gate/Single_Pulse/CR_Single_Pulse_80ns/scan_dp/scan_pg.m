function [ output_args ] = scan_pg( input_args )

%% init
%{p,s,q,r}
% resolution: 1E-3/2/pi GHz ~ 0.16 MHz
tot_basis_num = 3 + 3 + 3 + 3 + 3;
not_optimal_parms = 2;

phip = -0.0080;
phac = 3.250;

x0 = [    
   0.344
  -0.06
   0.08
   
  -0.01
   0.02
   0.005049488792459
   
   0.013
   0.004
  -0.021
  
   0.000
  -0.0005
   0.002
   
   -0.000
   -0.000
    -1.61
  phip
 phac
 ];


myx0 = [x0];
%% change parms
num = 5;
idx = 15;
change_parm = linspace(-0.005, 0.005, num) -1.61;

%% run
not_optimal_parms = 0;
g = zeros([1 num]);
p_g = zeros([size(x0,1)+not_optimal_parms, num]);

for a=1:num
    a
    myx = myx0;
    myx(idx) = change_parm(a);
    [g(a), p_g(:,a)] = Par_no_plot_Import(myx);
%         [g(a), p_g(:,a)] = Par_no_plot_Import_old(myx);
end

p_g_thy = gradient(g) / ((change_parm(end) - change_parm(1)) / (num - 1));

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

