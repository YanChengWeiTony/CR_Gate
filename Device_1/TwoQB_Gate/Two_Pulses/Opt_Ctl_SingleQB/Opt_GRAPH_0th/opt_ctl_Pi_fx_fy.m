function [ output_args ] = opt_ctl_Pi_fx_fy( input_args )
%% Spec

%% Options
parpool('local')
options = optimoptions('fmincon','Display','iter-detailed','SpecifyObjectiveGradient',true,'Algorithm','sqp','OptimalityTolerance', 1e-10, 'UseParallel', true);


%% Calculate gate total time
tgPi = 20;
GateTime = 160;

t_len = (GateTime - 2 * tgPi) /2;

%% Parms
% fCR0 = 0.198;
phip = 3.060;
B = 0.0545;
phac = -0.047;

t_CR = -0;


%% init
%{p,s,q,r}
% resolution: 1E-3/2/pi GHz ~ 0.16 MHz
tot_basis_num = 8 + 8 + 8 + 8 + 1 + 1;
not_optimal_parms = 4;

x0 = [    0.1238
   -0.0030
   -0.0004
    0.0000
   -0.0000
   0
   0
   0
   
    0.0047
   -0.0002
   -0.0001
    0.0000
   -0.0000
   0
   0
   0
   
   0.000
   0.000
  -0.0000
   0
   0
   0
   0
   0
   
   0.009
  -0.005
   0.002
  -0.005
   0
   0
   0
   0
   
   0.0000
   
  -0.0002];



myx0 = [x0;phip;B;phac;t_CR];
p_g = zeros([tot_basis_num+not_optimal_parms,1]);

%% Run

lb=[-2 * ones([1 tot_basis_num]),phip, B, phac, t_CR];
ub=[3 * ones([1 tot_basis_num]),phip, B, phac, t_CR];

%aeq, beq
aeq = zeros(tot_basis_num+not_optimal_parms);
for a=1:not_optimal_parms
    aeq(tot_basis_num+a,tot_basis_num+a)=1;
end

beq = zeros([tot_basis_num+not_optimal_parms, 1]);
size(beq)
size(myx0)
myx0(tot_basis_num+1)
for a=1:not_optimal_parms
    beq(tot_basis_num+a)=myx0(tot_basis_num+a);
end

% optimal
x = fmincon(@par_XI_Import, myx0,[],[],aeq,beq,lb,ub,[],options);
x(1:tot_basis_num)
x(tot_basis_num+1:end)

delete(gcp('nocreate'))
end

function [c, ceq] = nonlcon(x)
c = -1;
ceq = 0;
end