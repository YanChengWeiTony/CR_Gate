function [ output_args ] = opt_ctl_Pi_fx_fy( input_args )
%% Spec

%% Options
parpool('local')
options = optimoptions('fmincon','Display','iter-detailed','SpecifyObjectiveGradient',true,'Algorithm','sqp','OptimalityTolerance', 1e-10, 'UseParallel', true);


%% Calculate gate total time
tgPi = 2.5;



%% init
tot_basis_num = 10 + 10 + 1;
not_optimal_parms = 0;


x0 = [        
   0.935943619498896
   0.024986942077964
   0.072397553760274
   0.013783124148627
   0.074825371670833
   0
   0
   0
   0
   0
   
   0.459713438899086
  -0.041674326547576
   0.016699577634002
  -0.006790221960190
  -0.021992513068945
  0
  0
  0
  0
  0
  
  -0.070237239866440];

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