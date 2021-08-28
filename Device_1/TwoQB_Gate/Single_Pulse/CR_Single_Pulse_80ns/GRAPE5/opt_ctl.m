function [ output_args ] = opt_ctl_Pi_fx_fy( input_args )
%% Spec

%% init- Parms


opt_parm_num = 20 + 20 + 20 + 20 + 1;
not_opt_num = 2;

phip = -0.0080;
phac = 3.250;

input0 = [    
         0.3378277291
     -0.0027228762
     0.0877501588
     -0.0004616112
     0.0282070661
     -0.0027143015
     0.0013221527
     -0.0041822191
     -0.0066468932
     -0.0019852861
     -0.0055294956
     0.0065093816
     -0.0059601619
     -0.0022757518
     -0.0124503695
     -0.0016369574
     0
     0
     0
     0
     
     -0.0038851538
     -0.0260714674
     0.0050439912
     -0.0114347122
     -0.0029925915
     0.0004855563
     -0.0018682174
     -0.0048379668
     0.0020007644
     0.0131401273
     -0.0056744673
     0.0019601693
     0.0038418431
     -0.0058077037
     0.0014767293
     -0.0065607522
     0
     0
     0
     0
     
     0.0072232559
     0.0044207866
     -0.0208551195
     0.0066991068
     0.0262506205
     0.0063705693
     0.0059842228
     -0.0014543473
     0.0025269968
     -0.0032605259
     0.0033209160
     -0.0001127069
     -0.0036312058
     0.0018398155
     -0.0040239389
     -0.0015817369
     0
     0
     0
     0
     
     -0.0008272003
     -0.0010241079
     0.0035896755
     -0.0009247664
     -0.0042569795
     -0.0002915958
     -0.0000385029
     0.0019041896
     0.0006777724
     -0.0001590397
     0.0003959157
     -0.0005152052
     -0.0000035453
     0.0039802803
     0.0020741384
     -0.0025903127
     0
     0
     0
     0
     
     -1.6032280874

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