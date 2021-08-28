function [ output_args ] = single_case( input_args )

%% Parms
phip = -1.28;
phac = 3.20;

input0 = [    0.1556170158
-0.0228326477
-0.0010892410
0.0059608669
-0.0172586793
0.0347282361
0.0125499378
0.1459753508
-0.0147236914
-0.0657879927
0.0055331710
-0.0030026141
0.0128014190
0.0108706558
0.0084993805
0.0052469942
-0.0117703042
-0.0081398467
-0.0050387791
0.0376558436
0.9649181454
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

