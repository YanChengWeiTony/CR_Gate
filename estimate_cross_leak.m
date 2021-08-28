function [ output_args ] = estimate_cross_leak( input_args )
% refer to arXiv:1905.11480v1

%% Parms

%omega,  J
omega1 = 2*pi * 5.114;
omega2 = 2*pi * 4.914;
alpha1 = 2*pi * 0.330;
alpha2 = 2*pi * 0.330;

J = 2*pi*0.0038;

% dress
% detune12 = omega1 - omega2;
detune12 = 2*pi*linspace(0.1, 0.3, 40);
% omega1_dress = omega1 + J.^2 / detune12;
% omega2_dress = omega2 - J.^2 / detune12;
% 
% detuneDress12 = omega1_dress - omega2_dress;


%% u, ... (1 -> 2)

u = J./detune12 * (-alpha2) ./ (detune12 - alpha2);

H_01_02 = -2^.5 * J ./ (detune12 + alpha2);

H_01_20 = 2^.5 * J * alpha1 ./ detune12 ./ (detune12 - alpha1);

H_10_20 = -2^.5 * J ./ (-detune12 + alpha1);

H_10_02 = -2^.5 * J * alpha2 ./ detune12 ./ (-detune12 - alpha2);

H_11_12 = -2^.5 * J * (alpha1 + alpha2 + detune12) ./ (detune12 + alpha2) ./ (detune12 + alpha2 - alpha1);

leakage_max = max(abs(H_01_02), abs(H_01_20));
leakage_max = max(leakage_max, abs(H_10_20));
leakage_max = max(leakage_max, abs(H_10_02));
leakage_max = max(leakage_max, abs(H_11_12));
leakage_avg = (abs(H_01_02) + abs(H_01_20) + abs(H_10_20) + abs(H_10_02) + abs(H_11_12) )/5;
%% u, ... (2 -> 1)

u_rev = -J./detune12 * (-alpha1) ./ (-detune12 - alpha1);

H_10_20_rev = -2^.5 * J ./ (-detune12 + alpha1);

H_10_02_rev = -2^.5 * J * alpha2 ./ detune12 ./ (-detune12 - alpha2);

H_01_02_rev = -2^.5 * J ./ (detune12 + alpha2);

H_01_20_rev = 2^.5 * J * alpha1 ./ detune12 ./ (detune12 - alpha1);

H_11_21_rev = -2^.5 * J * (alpha1 + alpha2 - detune12) ./ (-detune12 + alpha1) ./ (-detune12 + alpha1 - alpha2);

leakage_max_rev = max(abs(H_10_20_rev), abs(H_10_02_rev));
leakage_max_rev = max(leakage_max_rev, abs(H_01_02_rev));
leakage_max_rev = max(leakage_max_rev, abs(H_01_20_rev));
leakage_max_rev = max(leakage_max_rev, abs(H_11_21_rev));
leakage_avg_rev = (abs(H_01_02_rev) + abs(H_01_20_rev) + abs(H_10_20_rev) + abs(H_10_02_rev) + abs(H_11_21_rev))/5;
%% plot
figure(1)
plot(detune12/2/pi, u, 'LineWidth', 4, 'color', [1 0 0]);hold on
plot(detune12/2/pi, u_rev, 'LineWidth', 4, 'color', [0 0 1], 'linestyle', '-');hold on

plot(detune12/2/pi, H_01_02, 'o', 'markersize', 10, 'color', [1 0 0]);hold on
plot(detune12/2/pi, H_01_20, 's', 'markersize', 10, 'color', [1 0 0]);hold on
plot(detune12/2/pi, H_10_20, 'd', 'markersize', 10, 'color', [1 0 0]);hold on
plot(detune12/2/pi, H_10_02, '*', 'markersize', 10, 'color', [1 0 0]); hold on
plot(detune12/2/pi, H_11_12, 'v', 'markersize', 10, 'color', [1 0 0]); hold on


plot(detune12/2/pi, H_01_02_rev, 'o', 'markersize', 5, 'color', [0 0 1]);hold on
plot(detune12/2/pi, H_01_20_rev, 's', 'markersize', 5, 'color', [0 0 1]);hold on
plot(detune12/2/pi, H_10_20_rev, 'd', 'markersize', 5, 'color', [0 0 1]);hold on
plot(detune12/2/pi, H_10_02_rev, '*', 'markersize', 5, 'color', [0 0 1]); hold on
plot(detune12/2/pi, H_11_21_rev, 'v', 'markersize', 5, 'color', [0 0 1]); hold on


legend('u', 'u_{rev}',...
    'H_{01}_{02}', 'H_{01}_{20}',  'H_{10}_{20}', 'H_{10}_{02}', 'H_{11}_{12}',...
    'H_{01}_{02, rev}', 'H_{01}_{20, rev}',  'H_{10}_{20, rev}', 'H_{10}_{02, rev}', 'H_{11}_{21, rev}')

xlabel('\Delta_{12} / (2\pi) (GHz)')
ylabel('interaction strength')

set(gca, 'fontsize', 16)

grid on

figure(2)
plot(detune12/2/pi, abs(u) ./ leakage_max,'LineWidth', 4, 'color', [1 0 0]); hold on
plot(detune12/2/pi, abs(u_rev) ./ leakage_max_rev, 'LineWidth', 4, 'color', [0 0 1])

legend('|u|/max-leak', '|u_{rev}|/max-leak_{rev}')

xlabel('\Delta_{12} / (2\pi) (GHz)')
ylabel('interaction strength')

set(gca, 'fontsize', 16)

grid on

figure(3)
plot(detune12/2/pi, abs(u) ./ leakage_avg,'LineWidth', 4, 'color', [1 0 0]); hold on
plot(detune12/2/pi, abs(u_rev) ./ leakage_avg_rev, 'LineWidth', 4, 'color', [0 0 1])

legend('|u|/avg-leak', '|u_{rev}|/avg-leak_{rev}')

xlabel('\Delta_{12} / (2\pi) (GHz)')
ylabel('interaction strength')

set(gca, 'fontsize', 16)

grid on

end

