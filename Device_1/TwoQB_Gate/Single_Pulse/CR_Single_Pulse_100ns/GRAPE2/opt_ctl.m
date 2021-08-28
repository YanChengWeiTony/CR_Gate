function [ output_args ] = opt_ctl_Pi_fx_fy( input_args )
%% Spec

%% init- Parms


opt_parm_num = 5 + 5 + 5 + 5 + 1;
not_opt_num = 2;

phip = -0.15;
phac = 3.13;

input0 = [    
   0.2321288913
     0.0330609070
     0.0908052801
     0
     0
     
     0.0269281765
     0.0125051910
     0.0021729138
     0
     0
     
     -0.0098304581
     0.0215067376
     0.0463898558
     0
     0
     
     0.0002321704
     0.0003947453
     -0.0000164602
     0
     0
     
     -1.2159375896
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