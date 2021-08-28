function [ output_args ] = opt_ctl_Pi_fx_fy( input_args )
%% Spec

%% init- Parms


opt_parm_num = 7 + 7 + 7 + 7 + 1;
not_opt_num = 2;

phip = -0.090;
phac = 3.13;

input0 = [    
0.2627882676
     0.0005075397
     0.0635590270
     0.0036570575
     0.0034383438
     0.0002723460
     -0.0303593837
     
     0.0240042195
     0.0021978360
     0.0074360992
     -0.0140902987
     -0.0099785260
     0
     0
     
     -0.0069238858
     0.0342873670
     0.0478807858
     0.0026482917
     -0.0151458247
     0.0078196815
     -0.0021791438
     
     -0.0000253015
     0.0001274030
     0.0007417006
     -0.0006642248
     -0.0042322084
     0
     0
     
     -1.3721474505
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