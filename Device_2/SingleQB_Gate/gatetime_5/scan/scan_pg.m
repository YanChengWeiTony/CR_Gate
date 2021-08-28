function [ output_args ] = scan_pg( input_args )

%% init
%{p,s,q,r}
% resolution: 1E-3/2/pi GHz ~ 0.16 MHz
tot_basis_num = 5 + 5 + 1;
not_optimal_parms = 0;

x0 = [        
   0.477967839272965
  -0.010154228870746
   0.031335469526769
   0.004559060477659
   0.040952527607716
   
   0.080406939080113
   0.013144455947706
  -0.002686157498399
  -0.003159337070323
  -0.022982596021715
  
   0.000];



myx0 = [x0];
%% change parms
num = 5;
idx = 11;
change_parm = linspace(-0.05, 0.05, num);

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

