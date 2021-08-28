function [ output_args ] = opt_ctl_Pi_fx_fy( input_args )
%% Spec

%% Options
parpool('local')
options = optimoptions('fmincon','Display','iter-detailed','SpecifyObjectiveGradient',true,'Algorithm','sqp','OptimalityTolerance', 1e-10, 'UseParallel', true);


%% Calculate gate total time
tgPi = 5;



%% init
tot_basis_num = 15 + 15 + 15 + 15 + 2;
not_optimal_parms = 0;


x0 = [        
   0.395871936216832
   0.013394078002133
   0.318933885835675
  -0.008380630647832
   0.098735570289965
  -0.061717645849806
  -0.042681625280610
  -0.016832366122909
  -0.060126986712767
  -0.013420730999954
  0
  0
  0
  0
  0
  
   0.036318843671876
   0.027425068482224
   0.312968427697814
  -0.014013375726533
   0.142472675996302
   0.011160733893960
   0.001437805055800
  -0.035316476168740
  -0.048023716222715
  -0.033151183869382
  0
  0
  0
  0
  0
  
   0.002268028431893
  -0.011799626818178
  -0.007300682881768
   0.004592988980650
   0.001129239430397
  -0.008479869347013
   0.001532751813274
  -0.002926071861575
   0.010457874591215
  -0.004358915349034
  0
  0
  0
  0
  0
  
   0.009614471086801
  -0.024920102253776
  -0.009564021661765
  -0.008769514756996
  -0.001109010460589
  -0.003226341571186
  -0.003562696263581
  -0.005457356353011
  -0.010713637517900
  -0.001388058485396
  0
  0
  0
  0
  0
  
   0.011649984593967
   0.022498158332122];

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
% x = fmincon(@par_XI_Import, myx0,[],[],aeq,beq,lb,ub,[]);
x(1:tot_basis_num)
x(tot_basis_num+1:end)

delete(gcp('nocreate'))
end

function [c, ceq] = nonlcon(x)
c = -1;
ceq = 0;
end