function [ output_args ] = opt_ctl_Pi_fx_fy( input_args )
%% Spec

%% Options
parpool('local')
options = optimoptions('fmincon','Display','iter-detailed','SpecifyObjectiveGradient',true,'Algorithm','sqp','OptimalityTolerance', 1e-10, 'UseParallel', true);


%% Calculate gate total time
tgPi = 7.5;



%% init
tot_basis_num = 10 + 10 + 10 + 10 + 2;
not_optimal_parms = 0;



x0 = [        
   0.272422739034554
  -0.005077702036888
   0.138095389333432
   0.006414221968443
   0.067955698048560
   0
   0
   0
   0
   0
   
   0.025345673230313
  -0.002942616133615
   0.090249109511124
   0.006150417713614
   0.064110199249134
   0
   0
   0
   0
   0
   
  -0.002538073570029
  -0.002947673082863
   0.009300953996740
  -0.000128892268046
  -0.003166349726838
  0
  0
  0
  0
  0
  
  -0.014784460061093
  -0.007950280164445
   0.013237241152093
   0.002387335590829
  -0.003226387472605
  0
  0
  0
  0
  0
  
  -0.000273313631593
   0.001851351287212];
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