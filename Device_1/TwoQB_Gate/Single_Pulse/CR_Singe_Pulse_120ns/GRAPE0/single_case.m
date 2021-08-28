function [ output_args ] = single_case( input_args )

%% Parms
phip = -0.14;
phac = 3.25;


input0 = [    
    0.2496626289
     0.0301943289
     -0.0315089205
     0.0104565097
     -0.0002681097
     -0.0001613305
     0.0155500082
     0.0000700600
     -0.3252997382

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

