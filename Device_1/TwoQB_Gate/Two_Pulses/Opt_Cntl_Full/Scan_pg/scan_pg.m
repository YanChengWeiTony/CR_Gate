function [ output_args ] = scan_pg( input_args )
%% Parms
% fCR0 = 0.198;
phip = 3.072;
B = 0.0505;
phac = -0.225;

t_CR = -0;


%% x0
x0 = [ 
    0.2381
   -0.0445
    0.0135
    0.0000
   -0.0245

    0.006
   -0.002
    
   -0.006
    0.002
];



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
    a
    myx = myx0;
    myx(idx) = change_parm(a);
    [g(a), p_g(:,a)] = pg_g_AC_Import(myx);
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

