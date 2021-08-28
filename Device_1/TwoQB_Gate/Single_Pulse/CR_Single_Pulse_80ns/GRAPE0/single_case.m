function [ output_args ] = single_case( input_args )

%% Parms
phip = -0.043;
phac = 3.25;

input0 = [    
       0.301200964493891
  -0.003673133914819
   0.043895369902765
  -0.025204210062272
   0.047412635138857
   0.067466396753176
   0.012018779189277
   0.000199937810133
  -0.016599889167245
  -0.000884894301456
   0.000324576755660
   0.004201970517230
  -1.424812764946536
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

