function [ output_args ] = single_case( input_args )

%% Parms

phip = -0.085;
 phac = 3.250;
 
input0 = [ 
    0.0965610021
     -0.0007228172
     0.0224055451
     0.0001462357
     -0.0026762560
     -0.0020132351
     0.0000230662
     -0.0011915325
     -0.0000290717
     -0.0000484381
     0.0001962645
     0.0014824645
     0.0033722341
     0.0007860691
     0.0080055673
     0.0001614626
     -0.0003993807
     -0.0006161951
     -0.0000297480
     -0.0002045512
     0.7037662177
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

