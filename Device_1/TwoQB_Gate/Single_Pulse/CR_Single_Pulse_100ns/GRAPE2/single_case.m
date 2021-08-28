function [ output_args ] = single_case( input_args )

%% Parms
phip = -0.090;
phac = 3.13;

input0 = [    
   0.2624761965
     -0.0047094214
     0.0403017521
     0.0092030547
     0.0009983266
     0.0170954210
     0.0120578362
     0.0228959057
     -0.0033510824
     -0.0153492585
     -0.0124202177
     0.0341171450
     0.0506862635
     -0.0072800040
     0.0066513991
     0.0017980346
     -0.0005378460
     -0.0006315383
     0.0001499301
     -0.0040137248
     -1.3264003795
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

