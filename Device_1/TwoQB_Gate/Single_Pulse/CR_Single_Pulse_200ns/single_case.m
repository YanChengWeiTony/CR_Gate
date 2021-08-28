function [ output_args ] = single_case( input_args )

%% Parms
phip = -0.08;
phac = 3.25;

input0 = [    0.108
 0.00
 0.0
-0.00
 0.003
 0.001
 0.00
 0.00
 1
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

