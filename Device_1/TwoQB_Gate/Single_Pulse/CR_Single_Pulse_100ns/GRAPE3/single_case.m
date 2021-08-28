function [ output_args ] = single_case( input_args )

%% Parms
phip = -0.090;
phac = 3.13;

input0 = [    
0.2627882676
     0.0005075397
     0.0635590270
     0.0036570575
     0.0034383438
     0.0002723460
     -0.0303593837
     0.0240042195
     0.0021978360
     0.0074360992
     -0.0140902987
     -0.0099785260
     -0.0069238858
     0.0342873670
     0.0478807858
     0.0026482917
     -0.0151458247
     0.0078196815
     -0.0021791438
     -0.0000253015
     0.0001274030
     0.0007417006
     -0.0006642248
     -0.0042322084
     -1.3721474505
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

