function [ output_args ] = opt_ctl_Pi_fx_fy( input_args )
%% Spec

%% Options
parpool('local')
options = optimoptions('fmincon','Display','iter-detailed','SpecifyObjectiveGradient',true,'Algorithm','sqp','OptimalityTolerance', 1e-10, 'UseParallel', true);


%% Calculate gate total time
tgPi = 5;



%% init
tot_basis_num = 10 + 10 + 10 + 10 + 2;
not_optimal_parms = 0;

x0 = [        
   0.424293557428625
   0.001245192895873
   0.181759190534945
   0.003601624105913
   0.080422421771377
   0
   0
   0
   0
   0
   
   0.065777718955055
   0.002484934808394
   0.176357070554238
   0.005549555418004
   0.121368241611833
   0
   0
   0
   0
   0
   
   0.006112790298511
  -0.016344727599159
  -0.011683091323423
   0.002678331385944
  -0.003592929712511
  0
  0
  0
  0
  0
  
  -0.002898068408623
  -0.019145888103634
  -0.007907566627424
  -0.003861998450250
   0.000012382893126
   0
   0
   0
   0
   0
   
   0.001870178732205
   0.005700392538694];

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