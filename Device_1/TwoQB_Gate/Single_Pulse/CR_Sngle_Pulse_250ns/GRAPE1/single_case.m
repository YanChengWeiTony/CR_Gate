function [ output_args ] = single_case( input_args )

%% Parms

phip = -0.0880;
 phac = 3.2635;
 
input0 = [         0.09650
   -0.00080
    0.02275
    0.00020
   -0.0027
   
   -0.0014
    0.0001
   -0.0010
   
   0.0001
    0.0018
    0.0035
    0.00075
    0.0083
   
    0.0001
   -0.0005
   -0.00065
    
   0.7040
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

