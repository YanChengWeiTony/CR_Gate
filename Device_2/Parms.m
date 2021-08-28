function [ output_args ] = Parms( input_args )
%% parms
g1 = 2 * pi * 0.1;
g2 = 2 * pi * 0.2;
Delta = 2 * pi * 0.4;
alpha_1 = 2 * pi * (-0.32);
alpha_2 = 2 * pi * (-0.32);

delta_1 = 0;
delta_2 = -0.67;

%% J
J = -g1 * g2 * (delta_1 - Delta + delta_2 - Delta) / 2 / (delta_1 - Delta) / (delta_2 - Delta);
J/2/pi
end

