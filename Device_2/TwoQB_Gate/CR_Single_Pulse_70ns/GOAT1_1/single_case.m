function [ output_args ] = single_case( input_args )

%% Parms
phip = -1.275;
phac = 3.200;

input0 = [    0.1121376359
     -0.0037267860
     0.0114318291
     -0.0130403348
     0.0114835595
     0.0485266574
     -0.0013170136
     0.0024277601
     0.0005155379
     -0.0070422398
     -0.0003123844
     0.0074094738
     0.0222437202
     0.0090895841
     0.0253606076
     0.0040671950
     -0.0104522734
     -0.0037973259
     -0.0159036944
     0.0146877593
     0.9804102202
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

