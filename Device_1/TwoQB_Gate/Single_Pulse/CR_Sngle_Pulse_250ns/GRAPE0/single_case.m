function [ output_args ] = single_case( input_args )

%% Parms

phip = -0.08;
 phac = 3.250;
 
input0 = [     0.0937
 -0.0033
  0.0310
 -0.0053
  0.0006
  0.0005
  0.0070
 -0.0000
  0.7160
phip
phac
 ];


p_g = zeros([size(input0, 1),1]);
%%

% [g] =  CR_Sgle_Pulse_Import(input0)
[g] =  CR_no_plot_Import(input0)
% [g, p_g] = Par_CR_Sgle_Pulse_Import( input0 )
% [g, p_g] = Par_no_plot_Import( input0 )
end

