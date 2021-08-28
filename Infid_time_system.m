function [ output_args ] = Infid_time_system( input_args )
%% parms
% CR - ibm device
CR_gate_time_ibm = [30, 80, 100, 120, 160, 200, 250];

CR_infid_ibm = [0.0711, 1.14E-4, 1.9E-4, 5.81E-5, 1.58E-4, 5.58E-5, 7E-5];

% CR_gate_time_ibm_2Plses = [160];

% CR_infid_ibm_2Plses = [5.4E-6];

% CR - PhysRevA.97.042348 (reproduce) := D2
CR_gate_time_rep = [30, 70];
CR_infid_rep = [4.31E-5, 1E-5];

% CR-experimental ibm device (arXiv:2008.08571v1) := D1
CR_gatetime_ibmexp = [200];
CR_infid_ibmexp = [4E-3];

% sgle QB - ibm device := D1
slge_gate_time_ibm = [5, 10, 15, 20, 50];
slge_infid_ibm = [5.8E-4, 5.65E-5, 3.65E-5, 4.6E-5, 2.34E-4];

% sgle QB (both pump) -ibm dvices := D1
slge_gate_both_pump_time_ibm = [5, 7.5, 10, 15];
slge_infid_both_pump_ibm = [3.07E-4, 3.49E-5, 3.8E-6,  4.7E-7];

% sgle QB - PhysRevA.97.042348 (reproduce):= D2
slge_gate_time_rep = [2.5, 5, 10, 20 ,50];
slge_infid_rep = [0.0666, 5.47E-3, 5.28E-3, 6.79E-3, 0.027];

% single qubit - experimental ibm device (arXiv:2008.08571v1):= D1
sgle_gatetime_ibmexp = [21];
sgle_infid_ibmexp = [3.8E-4];

%% decoherence time
T1 = 113 * 1E3;
T2 = 122 * 1E3;

%% plot
plot(CR_gate_time_ibm, 1-(1-CR_infid_ibm).^2, 'bo:', 'markersize', 10, 'linewidth',2);hold on
plot(CR_gate_time_rep, 1-(1-CR_infid_rep).^2, 'ro:', 'markersize', 10, 'linewidth',2);hold on
plot(CR_gatetime_ibmexp, CR_infid_ibmexp, 'ko', 'markersize', 10, 'markerfacecolor', 'k', 'linewidth',2);hold on

plot(slge_gate_time_ibm, 1-(1-slge_infid_ibm).^2, 'bs:', 'markersize', 10, 'linewidth',2); hold on
plot(slge_gate_time_rep, 1-(1-slge_infid_rep).^2, 'rs:', 'markersize', 10, 'linewidth',2); hold on
plot(slge_gate_both_pump_time_ibm, 1-(1-slge_infid_both_pump_ibm).^2, 'bd:', 'markersize', 10, 'linewidth',2); hold on
plot(sgle_gatetime_ibmexp, sgle_infid_ibmexp, 'ks', 'markersize', 10, 'markerfacecolor', 'k'...
    , 'linewidth',2);hold on


tg = 1:1000;
plot(tg, 1 - exp(-tg/T1), 'k-', 'linewidth',2)
plot(tg, 1 - exp(-tg/T2), 'k--', 'linewidth',2)

legend('Two-Qb (D1)', 'Two-Qb (D2)', 'Two-Qb (IBM(D1) exp)', ...
    'Single-Qb (D1)', 'Single-Qb (D2)', 'Single-Qb,both pumps (D1)', 'Sigle-Qb (IBM(D1) exp)',...
    'T_1 limits', 'T_2 limits')

% 
% legend('Two-Qb (IBM)', 'Two-Qb (PRA)', 'Two-Qb (IBM exp)', ...
%     'Single-Qb (IBM)', 'Single-Qb (PRA)', 'Sigle-Qb (IBM exp)',...
%     'T_1 limits', 'T_2 limits')


ylim([5E-7, 5E-1])
set(gca, 'yscale', 'log')
set(gca, 'xscale', 'log')
grid on
set(gca, 'fontsize', 16)
xlabel('time (ns)')
ylabel('1-F')
end

