function [ output_args ] = optimal_control_fx_fy_0( input_args )
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
% fCR0 = 0.198;
phip = 3.072;
B = 0.0505;
phac = -0.225;

t_CR = -0;


%% Options
parpool('local')
options = optimoptions('fmincon','Display','iter-detailed','SpecifyObjectiveGradient',true,'Algorithm','sqp','OptimalityTolerance', 1e-10, 'UseParallel', true);


%% init
%{p,s,q,r}
% resolution: 1E-3/2/pi GHz ~ 0.16 MHz
tot_basis_num = 8 + 3*2;
not_optimal_parms = 4;

x0 = zeros(tot_basis_num,1);

x0 = [ 
    0.2381
   -0.0445
    0.0135
    0.0000
   -0.0245
   0
   0
   0

    0.006
   -0.002
   0
    
   -0.006
    0.002
    0
];

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
x = fmincon(@pg_g_AC_Import,myx0,[],[],aeq,beq,lb,ub,[],options);
x(1:tot_basis_num)
x(tot_basis_num+1)
x(tot_basis_num+2:end)

delete(gcp('nocreate'))
end

function [c, ceq] = nonlcon(x)
c = -1;
ceq = 0;
end