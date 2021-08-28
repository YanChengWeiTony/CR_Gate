function [ output_args ] = opt_ctl_Pi_fx_fy( input_args )
%% Spec

%% Options
parpool('local')
options = optimoptions('fmincon','Display','iter-detailed','SpecifyObjectiveGradient',true,'Algorithm','sqp','OptimalityTolerance', 1e-10, 'UseParallel', true);


%% Calculate gate total time
tgPi = 10;



%% init
tot_basis_num = 12 + 12 + 1;
not_optimal_parms = 0;

x0 = [         
   0.259464780559657
  -0.185480149059360
  -0.018117662681833
  -0.037295327033618
  -0.016782028916110
  -0.000963544597038
   0.000486223368799
   0.000121065511730
   0
   0
   0
   0
   
   0.012097773672297
  -0.049188286503367
  -0.019073722702074
  -0.030078606735698
  -0.007152720969654
   0.000878887676859
  -0.000288116126893
  -0.000241025741577
  0
  0
  0
  0
  
   0.010511478936885];

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