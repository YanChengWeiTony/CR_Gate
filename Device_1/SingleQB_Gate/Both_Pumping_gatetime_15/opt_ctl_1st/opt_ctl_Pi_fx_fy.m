function [ output_args ] = opt_ctl_Pi_fx_fy( input_args )
%% Spec

%% Options
parpool('local')
options = optimoptions('fmincon','Display','iter-detailed','SpecifyObjectiveGradient',true,'Algorithm','sqp','OptimalityTolerance', 1e-10, 'UseParallel', true);


%% Calculate gate total time
tgPi = 15;



%% init
tot_basis_num = 10 + 10 + 10 + 10 + 1;
not_optimal_parms = 0;

x0 = [        
   0.166213166528276
  -0.023876105559822
  -0.001897922782440
  -0.007352634221017
  -0.002278587819688
  0
  0
  0
  0
  0
  
   0.009149863009739
   0.000351334054652
   0.006330338678628
  -0.006273592827288
  -0.001560320487498
  0
  0
  0
  0
  0
  
  -0.000201173418575
   0.011304042575717
   0.004332868437324
   0.025917572480242
  -0.005831212426446
  0
  0
  0
  0
  0
  
   0.005043373898860
  -0.014655616425260
   0.002735074276162
   0.022485695067468
  -0.007781553823354
  0
  0
  0
  0
  0
  
   0.001146868139358
  -0.000126389559877];

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