function [ output_args ] = single_case( input_args )

%% Parms
phip = -0.082;
phac = 3.25;

input0 = [ 0.11225
     0.0071570
     0.0578562
     -0.000000
     -0.000000
     
     -0.006838
     -0.00000
     -0.000000
     
     -0.000184
     0.0001596
     0.0112817
     -0.000001
     0.0000000
     
     -0.000024
     0.0000220
     -0.000005
     
     -0.0306
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

