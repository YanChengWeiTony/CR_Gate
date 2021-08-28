function [ output_args ] = opt_ctl_Pi_fx_fy( input_args )
%% Spec

%% Options
parpool('local')
options = optimoptions('fmincon','Display','iter-detailed','SpecifyObjectiveGradient',true,'Algorithm','sqp','OptimalityTolerance', 1e-10, 'UseParallel', true);


%% Calculate gate total time
tgPi = 50;



%% init
tot_basis_num = 15 + 15 + 1;
not_optimal_parms = 0;


x0 = [         
        0.048576290956512
  -0.047054513263236
   0.003220486710600
  -0.047491193505104
   0.001133453583609
   0.001299381822031
   0.005378760365193
   0.001945588003271
   0.003064519035172
   0.001224095125745
   0
   0
   0
   0
   0
   
   0.029904244738989
   0.004420298199329
  -0.017603336758620
   0.008619495017244
  -0.009332308435341
  -0.000705249761862
  -0.004238351705696
  -0.002411476355766
  -0.000051354246362
  -0.000605478668867
  0
  0
  0
  0
  0
  
   0.032756965015985];
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