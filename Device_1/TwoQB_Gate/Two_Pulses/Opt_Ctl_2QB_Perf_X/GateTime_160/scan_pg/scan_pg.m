function [ output_args ] = scan_pg( input_args )
%% Parms
phip = 3.095;
B = 0.0325;
phac = 0.0828;

t_CR = 0;

%% x0
x0 = [   0.235;
    -0.045;
    0.0136;
    0.0005;
   -0.0247;
   -0.0015;
   -0.012;
   -0.001;
   -0.005;
   0.005;
   0.000];

myx0 = [x0;phip;B;phac;t_CR];
%% change parms
num = 40;
idx = 1;
change_parm = linspace(0.22, 0.26, num);

%% run
not_optimal_parms = 4;
g = zeros([1 num]);
p_g = zeros([size(x0,1)+not_optimal_parms, num]);

for a=1:num
    myx = myx0;
    myx(idx) = change_parm(a);
    [g(a), p_g(:,a)] = fully_Numerical_ActiveCancellation_Import(myx);
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
grid on
end

