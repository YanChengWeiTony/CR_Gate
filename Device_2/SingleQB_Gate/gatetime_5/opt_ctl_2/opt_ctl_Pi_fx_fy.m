function [ output_args ] = opt_ctl_Pi_fx_fy( input_args )
%% Spec

%% Options
parpool('local')
options = optimoptions('fmincon','Display','iter-detailed','SpecifyObjectiveGradient',true,'Algorithm','sqp','OptimalityTolerance', 1e-10, 'UseParallel', true);


%% Calculate gate total time
tgPi = 5;



%% init
tot_basis_num = 12 + 12 + 1;
not_optimal_parms = 0;

x0 = [        
   0.448642340769706
  -0.041801105757566
   0.095111569663819
  -0.000537241900847
   0.061876933495147
   0.008880069078134
   0.045998819610013
   0.005238603308661
   0
   0
   0
   0
   
   0.085436939058711
  -0.037695734672558
   0.075654256846498
  -0.001039655767173
   0.043830875967381
  -0.010267730170169
   0.020498557779434
  -0.005362088877805
  0
  0
  0
  0
  
  -0.016793758378067];

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