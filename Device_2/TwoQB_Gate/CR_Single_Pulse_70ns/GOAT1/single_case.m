function [ output_args ] = single_case( input_args )

%% Parms
phip = -1.275;
phac = 3.200;

input0 = [  0.1592985166
     -0.0217239337
     -0.0043974797
     0.0094457968
     -0.0199670448
     0.0075738844
     -0.0014286422
     0.0017310696
     0.0331915945
     0.0144693195
     0.1389989938
     -0.0136429814
     -0.0677363756
     -0.0032480424
     -0.0093119729
     0.0007656463
     0.0044231151
     -0.0033641292
     0.0139444552
     0.0133372344
     0.0123947281
     0.0029271577
     -0.0056880969
     0.0019171759
     0.0072717907
     -0.0148792362
     -0.0088911147
     -0.0032271185
     0.0322817992
     0.0004337960
     -0.0097842585
     -0.0005724477
     0.9644899923
 phip
 phac
 ];


p_g = zeros([size(input0, 1),1]);
%%

[g] =  CR_Sgle_Pulse_Import(input0)
% [g] =  CR_no_plot_Import(input0)
% [g, p_g] = Par_CR_Sgle_Pulse_Import( input0 )
% [g, p_g] = Par_no_plot_Import( input0 )
end
