function [ output_args ] = single_case( input_args )

%% Parms
phip = -2.550;
phac = 3.160;

input0 = [  0.3171718387
     0.2291630903
     0.0124947328
     -0.0557981324
     0.0184781215
     -0.2826727892
     0.1207591918
     0.1610777642
     -0.0659108884
     0.0043199706
     0.0716708859
     0.0924578418
     -0.0239359815
     -0.0028450827
     0.0202183406
     -0.0060855763
     0.0105250499
     0.0003060791
     -0.0117062379
     0.0165241408
     1.1028431206
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

