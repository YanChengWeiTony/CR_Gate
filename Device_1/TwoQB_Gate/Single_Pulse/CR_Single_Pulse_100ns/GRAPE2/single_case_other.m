function [ output_args ] = single_case_other( input_args )

%% Parms
phip = -0.15;
phac = 3.25;

input0 = [    
0.2591131521
     0.0025397954
     0.0452920686
     0.0063548267
     -0.0034944722
     0.0338065538
     0.0082315521
     0.0135018340
     -0.0227959066
     0.0027248586
     -0.0069882050
     0.0153757696
     0.0365015274
     0.0046193799
     0.0028551501
     0.0011244139
     -0.0015282401
     -0.0037626632
     -0.0001777842
     -0.0014650966
     -1.3202409078
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

