function [ output_args ] = optimal_control_fx_fy_10( input_args )
%% Spec
% fx_CR = sum_k a_k sin(w_k (t + tL))
% w_k = pi / tL
% phiCR = c0 + sum_k b_k sin(w'_k (t + tL)) + sum_k c_k cos(w'_k (t + tL))
% w'_k = pi / tL

%% Calculate gate total time
tgPi = 20;
GateTime = 160;

t_len = (GateTime - 2 * tgPi) /2;

%% Parms
fCR0 = 0.198;
phip = 3.105;
B = 0.0445;
phac = 0.047;

t_CR = 0;

%% Options
parpool('local')
options = optimoptions('fmincon','Display','iter-detailed','SpecifyObjectiveGradient',true,'Algorithm','sqp','OptimalityTolerance', 1e-10, 'UseParallel', true);

%% init
%{p,s,q,r}
% resolution: 1E-3/2/pi GHz ~ 0.16 MHz
tot_basis_num = 16 + 6;
not_optimal_parms = 4;

x0 = zeros(tot_basis_num,1);
qk_rk_basis_num = 3;
pk_basis_num = tot_basis_num - 2 * qk_rk_basis_num;

x0 = [ 0.2371
   -0.0447
    0.0136
    0.0006
   -0.0245
    0.0005
   -0.0025
    0.0017
   -0.0030
    0.0011
   -0.0001
    0.0005
    0
    0
    0
    0
    0.0020
   -0.0131
    0.0013
   -0.0058
    0.0096
    0.0003];

myx0 = [x0;phip;B;phac;t_CR];
p_g = zeros([tot_basis_num+not_optimal_parms,1]);
%% Run

lb=[-2 * ones([1 tot_basis_num]),-2, B, phac, t_CR];
ub=[3 * ones([1 tot_basis_num]),6, B, phac, t_CR];

%aeq, beq
aeq = zeros(tot_basis_num+not_optimal_parms);
for a=1:not_optimal_parms
    aeq(tot_basis_num+a,tot_basis_num+a)=1;
end

beq = zeros([tot_basis_num+not_optimal_parms 1]);
for a=1:not_optimal_parms
    beq(tot_basis_num+a)=myx0(tot_basis_num+a);
end

% optimal
x = fmincon(@fully_Numerical_ActiveCancellation_Import,myx0,[],[],aeq,beq,lb,ub,[],options);
x(1:tot_basis_num)
x(tot_basis_num+1)
x(tot_basis_num+2:end)

delete(gcp('nocreate'))
end

function [c, ceq] = nonlcon(x)
c = -1;
ceq = 0;
end