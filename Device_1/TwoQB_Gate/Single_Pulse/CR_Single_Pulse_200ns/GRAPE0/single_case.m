function [ output_args ] = single_case( input_args )

%% Parms
phip = -0.08;
phac = 3.25;

input0 = [    0.1122413705
     0.0071575174
     0.0578585685
     -0.0068377108
     -0.0001851987
     0.0001619366
     0.0112828832
     -0.0000215959
     -0.0301702668
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

