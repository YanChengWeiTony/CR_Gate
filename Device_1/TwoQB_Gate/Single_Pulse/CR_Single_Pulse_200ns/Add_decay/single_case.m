function [ output_args ] = single_case( input_args )
%% Parms
phip = -0.082;
phac = 3.25;

input0 = [0.1291753398
     -0.0006223755
     0.0165879801
     -0.0002675895
     -0.0156162216
     -0.0099566093
     -0.0000975656
     -0.0003605620
     0.0010878742
     0.0016639256
     -0.0015931041
     -0.0048169384
     0.0066814525
     -0.0013640499
     0.0146301707
     0.0005770567
     0.0013410316
     -0.0011572207
     -0.0002633522
     -0.0008701013
     -0.2089918841
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


