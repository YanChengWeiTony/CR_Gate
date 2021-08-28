function [ output_args ] = single_case( input_args )

%% Parms
phip = -0.08;
phac = 3.13;

input0 = [    
   0.2321288913
     0.0330609070
     0.0908052801
     0.0269281765
     0.0125051910
     0.0021729138
     -0.0098304581
     0.0215067376
     0.0463898558
     0.0002321704
     0.0003947453
     -0.0000164602
     -1.2159375896
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

