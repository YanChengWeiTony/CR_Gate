function [ output_args ] = single_case( input_args )
%% parms

phip = -0.14;
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
%% state
probe_state = zeros([4, 1]);
probe_state(4) = 1;

%% run
% T
T = 1E3 * 3000000 *[1, 1, 1, 1];

[ans_rho_col, g_rho] =  T1_T2_Import(input0, probe_state, T);
g_rho
% [g] =  T1_T2_CR_Sgle_Pulse_Import(input0)
% [g] =  CR_no_plot_Import(input0)
% [g, p_g] = Par_CR_Sgle_Pulse_Import( input0 )
% [g, p_g] = Par_no_plot_Import( input0 )


end


