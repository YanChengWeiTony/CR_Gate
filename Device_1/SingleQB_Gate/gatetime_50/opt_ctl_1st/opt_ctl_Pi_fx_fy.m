function [ output_args ] = opt_ctl_Pi_fx_fy( input_args )
%% Spec

%% Options
parpool('local')
options = optimoptions('fmincon','Display','iter-detailed','SpecifyObjectiveGradient',true,'Algorithm','sqp','OptimalityTolerance', 1e-10, 'UseParallel', true);


%% Calculate gate total time
tgPi = 50;



%% init
tot_basis_num = 10 + 10 + 1;
not_optimal_parms = 0;

x0 = [          0.050808895416092
  -0.011393519232973
  -0.002798045204349
  -0.003519834118426
  -0.001534558050144
  0
  0
  0
  0
  0
  
   0.001062448895586
   0.000047885905885
   0.000807412648166
  -0.000020514690528
   0.000715212698174
   0
   0
   0
   0
   0
   
  -0.000058052979115];


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