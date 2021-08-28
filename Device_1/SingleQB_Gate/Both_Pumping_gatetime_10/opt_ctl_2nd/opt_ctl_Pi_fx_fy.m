function [ output_args ] = opt_ctl_Pi_fx_fy( input_args )
%% Spec

%% Options
parpool('local')
options = optimoptions('fmincon','Display','iter-detailed','SpecifyObjectiveGradient',true,'Algorithm','sqp','OptimalityTolerance', 1e-10, 'UseParallel', true);


%% Calculate gate total time
tgPi = 10;



%% init
tot_basis_num = 12 + 12 + 12 + 12 + 2;
not_optimal_parms = 0;

x0 = [        
   0.234336742338174
  -0.004284112787110
   0.033995367895655
   0.002294482994791
   0.011726503882330
  -0.000123977385499
  -0.000253844334880
  -0.000042893121186
  0
  0
  0
  0
  
   0.018918159394093
  -0.000745989627826
   0.020693243802697
   0.001321922324813
   0.012916913780513
   0.000118390490510
   0.000242185273711
   0.000039006491481
   0
   0
   0
   0
   
   0.002742134366729
   0.011538515417558
  -0.005131496610482
  -0.006643363560096
  -0.003575800156721
   0.000022123491584
   0.000207576036747
  -0.000013466828646
  0
  0
  0
  0
  
   0.004380189027305
   0.011058940731377
   0.001507637901675
  -0.009265387391256  
  -0.006884195948199
  -0.000023313446065
  -0.000206050755933
   0.000011057017041
   0
   0
   0
   0
   
   0.000075217377103
   0.000758230554261];


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