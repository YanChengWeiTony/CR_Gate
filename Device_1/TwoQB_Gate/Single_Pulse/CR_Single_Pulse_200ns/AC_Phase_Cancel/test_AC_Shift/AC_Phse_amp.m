function [ output_args ] = AC_Phse_amp( input_args )
%% parms
%omega,  J
omega1 = 2*pi * 5.114;
omega2 = 2*pi * 4.914;

omegap = 30.8751; %second Qubit's dressed Freq

Detune_1p = omega1 - omegap;
Detune_1p/2/pi

tL = 200;

%% resutls
alpha_330 = 2*pi * 0.330;

factor_330 = 2*pi*0.330 / (2*pi*0.330 - Detune_1p);
fx_330 = [0, 0.025, 0.05, 0.075, 0.1, 0.12];
z_ph_330 = [0, -0.25, -1.0, -2.26, -3.96, -5.7];

%% resutls
alpha_990 = 2*pi * 0.330 * 3;

factor_990 = 2*pi*0.990 / (2*pi*0.990 - Detune_1p);
fx_990 = [0, 0.025, 0.05, 0.075, 0.1, 0.12];
z_ph_990 = [0, -0.125, -0.5, -1.15, -2, -2.84];


%% theory
fx_thy = linspace(0, 0.15, 1000);
z_ph_thy = -(((2 * fx_thy).^2 + Detune_1p^2).^.5 - Detune_1p)/2 * tL;



z_ph_thy_330_1 = -fx_thy.^2 * (1/Detune_1p + 1/(alpha_330 - Detune_1p))* tL;
buf_330_1 = (((2 * fx_thy).^2 + Detune_1p^2).^.5 - Detune_1p)/2;
buf_330_2 = (((2 * fx_thy).^2 + (alpha_330 - Detune_1p)^2).^.5 - (alpha_330 - Detune_1p))/2;
z_ph_thy_330_2 = -(buf_330_1 + buf_330_2) * tL;

z_ph_thy_990_1 = -fx_thy.^2 * (1/Detune_1p + 1/(alpha_990 - Detune_1p))* tL;
buf_990_1 = (((2 * fx_thy).^2 + Detune_1p^2).^.5 - Detune_1p)/2;
buf_990_2 = (((2 * fx_thy).^2 + (alpha_990 - Detune_1p)^2).^.5 - (alpha_990 - Detune_1p))/2;
z_ph_thy_990_2 = -(buf_990_1 + buf_990_2) * tL;

%% plot
figure(1)
plot(fx_thy, z_ph_thy, 'k-', 'linewidth', 2);hold on

plot(fx_330, z_ph_330, 'bo', 'markersize', 8);hold on
plot(fx_thy, z_ph_thy_330_1, 'b:', 'linewidth', 2);hold on
plot(fx_thy, z_ph_thy_330_2, 'b-', 'linewidth', 2);hold on

plot(fx_990, z_ph_990, 'ro', 'markersize', 8);hold on
plot(fx_thy, z_ph_thy_990_1, 'r:', 'linewidth', 2);hold on
plot(fx_thy, z_ph_thy_990_2, 'r-', 'linewidth', 2);hold on

xlabel('f_x')
ylabel('z phase')
set(gca, 'fontsize', 20)
legend('2-level', ...
    '\alpha = 2\pi 330 MHz, simulation', '\alpha = 2\pi 330 MHz, thy(approx1)', '\alpha = 2\pi 330 MHz, thy(approx2)', ...
    '\alpha = 2\pi 990 MHz simulation', '\alpha = 2\pi 990 MHz, thy(approx1)', '\alpha = 2\pi 990 MHz, thy(approx2)')
grid on
end

