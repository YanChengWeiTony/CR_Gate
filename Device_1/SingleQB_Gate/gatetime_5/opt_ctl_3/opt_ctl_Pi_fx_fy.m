function [ output_args ] = opt_ctl_Pi_fx_fy( input_args )
%% Spec

%% Options
parpool('local')
options = optimoptions('fmincon','Display','iter-detailed','SpecifyObjectiveGradient',true,'Algorithm','sqp','OptimalityTolerance', 1e-10, 'UseParallel', true);


%% Calculate gate total time
tgPi = 5;



%% init
tot_basis_num = 20 + 20 + 1;
not_optimal_parms = 0;

x0 = [
          0.478953109799293
  -0.008012245595477
   0.035695142549275
   0.002989574613742
   0.030133139002011
   0.001571811335648
   0.016784060372891
   0.002546311753315
   0.014231214260792
   0.000961385789097
   0.010356605961106
  -0.004873725397580
   0.005821918658847
  -0.005288533942334
   0.005374168283306
   0
   0
   0
   0
   0
   
   0.072916032550247
  -0.005912797018001
   0.024328943703922
   0.003044155159207
   0.005080540951310
   0.000564063634130
   0.001118394393027
  -0.000755656605745
  -0.000557489490258
   0.000458291347592
  -0.001686015038923
  -0.000578968765697
   0.001518168783398
   0.000386556823550
   0.001048473714178
   0
   0
   0
   0
   0
   
  -0.001726591850617];


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