function [ output_args ] = single_case_test( input_args )

%% Parms
phip12 = -0.0;
phac12 = 3.25;

input0 = [0.075
    0
    0
    0
    0
     
     0
     0
     0
     0
     0
     
     0
     0
     0
     0
     0
     
     0
     0
     0
     0
     0

    -2.26
     
phip12
phac12
 ];


p_g = zeros([size(input0, 1),1]);
%%

[g] =  CR_Sgle_Pulse_Import_test(input0)
end

