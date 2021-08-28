function [ output_args ] = single_case( input_args )

%% Parms
phip = -0.03;
phac = 3.25;

input0 = [    
    0.1729
   -0.0272
    0.1422
    0.0142
   -0.0029
    0.0171
    0.0286
    0.0011
   -0.9081
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

