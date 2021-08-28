function [ output_args ] = opt_ctl_Pi_fx_fy( input_args )
%% Spec

%% Options
parpool('local')
options = optimoptions('fmincon','Display','iter-detailed','SpecifyObjectiveGradient',true,'Algorithm','sqp','OptimalityTolerance', 1e-10, 'UseParallel', true);


%% Calculate gate total time
tgPi = 5;



%% init
tot_basis_num = 15 + 15 + 1;
not_optimal_parms = 0;


x0 = [
       0.488037407487497
  -0.026036243829591
   0.020233927090045
   0.008566308179749
   0.029693656468749
   0.017887338442208
   0.006478988586107
   0.012203729874473
   0.007861036373015
   0.014901108361499
   0
   0
   0
   0
   0
   
   0.077529170379364
  -0.032994426851706
   0.006908668883916
   0.008954539243116
  -0.013743040616188
  -0.007708576840997
  -0.002330070258488
  -0.003311437965372
  -0.004738080562420
  -0.007365358581751
  0
  0
  0
  0
  0
  
  -0.012824758671384];


%% process
myx0 = [x0];
p_g = zeros([tot_basis_num+not_optimal_parms,1]);


%% Run

lb=[-2 * ones([1 tot_basis_num])];
ub=[3 * ones([1 tot_basis_num])];

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
x = fmincon(@par_XI_Import, myx0,[],[],aeq,beq,lb,ub,[],options);
x(1:tot_basis_num)
x(tot_basis_num+1:end)

delete(gcp('nocreate'))
end

function [c, ceq] = nonlcon(x)
c = -1;
ceq = 0;
end