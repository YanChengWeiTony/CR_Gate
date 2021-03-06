function [ output_args ] = single_case( input_args )

%% Parms
phip = -0.0090;
phac = 3.250;

input0 = [    
         0.3299874306
     0.0006329981
     0.0703625951
     -0.0005297941
     0.0079728863
     0.0005088020
     -0.0346699015
     -0.0001166173
     -0.0078200873
     -0.0058749153
     0.0021906974
     -0.0060651781
     0.0019769393
     0.0020861388
     0.0046471270
     0.0044797356
     0.0050682058
     0.0028925404
     -0.0229574195
     0.0056137605
     0.0359417445
     0.0088595923
     0.0103463884
     -0.0026170544
     -0.0005553906
     -0.0001616413
     0.0041040764
     0.0004050032
     -0.0040250669
     -0.0044472470
     -0.0032121081
     0.0047595820
     -1.5365391728
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

