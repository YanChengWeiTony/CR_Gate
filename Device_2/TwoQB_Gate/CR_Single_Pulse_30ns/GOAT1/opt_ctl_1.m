function [ output_args ] = opt_ctl_1( input_args )
%% Spec

%% init Parms
opt_parm_num = 8 + 8 + 8 + 8 + 1;
not_opt_num = 2;

phip = -2.550;
phac = 3.160;

input0 = [  0.3171718387
     0.2291630903
     0.0124947328
     -0.0557981324
     0.0184781215
     0
     0
     0
     
     -0.2826727892
     0.1207591918
     0.1610777642
     -0.0659108884
     0.0043199706
     0
     0
     0
     
     0.0716708859
     0.0924578418
     -0.0239359815
     -0.0028450827
     0.0202183406
     0
     0
     0
     
     -0.0060855763
     0.0105250499
     0.0003060791
     -0.0117062379
     0.0165241408
     0
     0
     0
     
     1.1028431206
 phip
 phac
 ];


%% boundary

lb=[-2 * ones([1 opt_parm_num ]),phip, phac];
ub=[3 * ones([1 opt_parm_num ]),phip, phac];

%aeq, beq
aeq = zeros(opt_parm_num + not_opt_num);
for a=1:not_opt_num 
    aeq(opt_parm_num +a,opt_parm_num +a)=1;
end

beq = zeros([opt_parm_num + not_opt_num, 1]);

for a=1:not_opt_num
    beq(opt_parm_num+a)=input0(opt_parm_num+a);
end

%% Options
parpool('local')
options = optimoptions('fmincon','Display','iter-detailed','SpecifyObjectiveGradient',true,'Algorithm','sqp','OptimalityTolerance', 1e-10, 'UseParallel', true);

%% Run
% optimal
x = fmincon(@Par_no_plot_Import, input0,[],[],aeq,beq,lb,ub,[],options);
x(1:opt_parm_num)
x(opt_parm_num+1:end)
sprintf('%.10f\n', x(1:opt_parm_num))
sprintf('%.10f\n', x(opt_parm_num+1:end))

delete(gcp('nocreate'))

end

function [c, ceq] = nonlcon(x)
c = -1;
ceq = 0;
end