function [ output_args ] = single_case( input_args )

%% Parms
phip = -0.140;
phac = 3.250;


input0 = [    
0.2519582458
     0.0062909909
     -0.0382409773
     0.0000000000
     0.0000000000
     
     0.0148021712
     -0.0021505745
     -0.0012494955
     0.000001000
     0.0000000000
     
     0.0010327086
     -0.0045158534
     0.0114156369
     0.0000000000
     0.0000000000
     
     0.0002232443
     0.0008837301
     -0.0009176164
     0.0000000000
     0.0000200000
     
     -0.3458678315
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

