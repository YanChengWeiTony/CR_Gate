function [ output_args ] = opt_ctl_Pi_fx_fy( input_args )
%% Spec

%% init- Parms


opt_parm_num = 12 + 12 + 12 + 12 + 1;
not_opt_num = 2;

phip = -0.0080;
phac = 3.250;

input0 = [    
         0.3299874306
     0.0006329981
     0.0703625951
     -0.0005297941
     0.0079728863
     0.0005088020
     -0.0346699015
     -0.0001166173
     0
     0
     0
     0
     
     -0.0078200873
     -0.0058749153
     0.0021906974
     -0.0060651781
     0.0019769393
     0.0020861388
     0.0046471270
     0.0044797356
     0
     0
     0
     0
     
     0.0050682058
     0.0028925404
     -0.0229574195
     0.0056137605
     0.0359417445
     0.0088595923
     0.0103463884
     -0.0026170544
     0
     0
     0
     0
     
     -0.0005553906
     -0.0001616413
     0.0041040764
     0.0004050032
     -0.0040250669
     -0.0044472470
     -0.0032121081
     0.0047595820
     0
     0
     0
     0
     -1.5365391728
 phip
 phac
 ];




p_g = zeros([size(input0, 1),1]);


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