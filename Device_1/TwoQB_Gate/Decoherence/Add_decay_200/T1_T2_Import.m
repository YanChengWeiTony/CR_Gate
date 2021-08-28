function [ ans_rho_col, g_rho ] = T1_T2_Import( input, state_in, T)
% undriven basis

% pn: fCR-x
% qn: fCR-y
% rn: fAC-x
% sn: fAC-y
% Z_phase_AC_ratio

%% pulse
not_optimal_parms = 2;

phip = input(end-1);
phac = input(end);


% basis num
pk_basis_num = 5;
qk_basis_num = 5;
rk_basis_num = 5;
sk_basis_num = 5;

% basis
pn = input(1:pk_basis_num);
qn = input(pk_basis_num+1:pk_basis_num+qk_basis_num);
rn = input(pk_basis_num+qk_basis_num+1:pk_basis_num+qk_basis_num+rk_basis_num);
sn = input(pk_basis_num+qk_basis_num+rk_basis_num+1:pk_basis_num+qk_basis_num+rk_basis_num+sk_basis_num);
Z_phase_AC_ratio = input(end-2);


%% Parms

% T1 (ns)
% T1_1 = 100 * 1E3;
% T1_2 = 100 * 1E3;

% T2 (ns)
% T2_1 = 100 * 1E3;
% T2_2 = 100 * 1E3;


T1_1 = T(1);
T1_2 = T(2);
T2_1 = T(3);
T2_2 = T(4);


%omega,  J
omega1 = 2*pi * 5.114;
omega2 = 2*pi * 4.914;
alpha1 = 2*pi * 0.330;
alpha2 = 2*pi * 0.330;

J = 2*pi*0.0038;


% dress
detune12 = omega1 - omega2;
omega1_dress = omega1 + J^2 / detune12;
omega2_dress = omega2 - J^2 / detune12;

detuneDress12 = omega1_dress - omega2_dress;

omegap = 30.8751; %second Qubit's dressed Freq


% timeMeasure
t_measure =0;


%% Settings
t_I = -250;
t_F = 20;
t_num = 10000;
lev = 4;

t = linspace(t_I, t_F, t_num);
dt = (t_F - t_I) / (t_num - 1);


%% get fCR, CRPhase from {pn, qn}

global fx0_ary fy0_ary fACx_ary fACy_ary

ts = -200;
tf = -0;
% transfer to ary
fx0_ary = myf0(pn, ts, tf, t_num, t);
fy0_ary = myf0(qn, ts, tf, t_num, t);

fACx_ary = myf0(rn, ts, tf, t_num, t);
fACy_ary = myf0(sn, ts, tf, t_num, t);

%% Useful Matrix

% 4 x 4 matrix
global x y z zx zy x1 x2 y1 y2 zz z1 a a1 xz yz
x = [0, 1;1 0];
y = [0, -1j; 1j, 0];
z = [1, 0; 0, -1];
a = (x + 1i * y) / 2;
zx = kron(z,x);
zy = kron(z,y);
x1 = kron(x,eye(2));
x2 = kron(eye(2),x);
y1 = kron(y, eye(2));
y2 = kron(eye(2),y);
zz = kron(z,z);
xz = kron(x,z);
yz = kron(y,z);
z1 = kron(z,eye(2));
a1 = kron(a, eye(2));

% one qubit
a_oneq = zeros([lev, lev]);

for idx = 1:lev-1
    a_oneq(idx, idx + 1) = (idx)^.5;
end

N_oneq = a_oneq' * a_oneq;
X_oneq = a_oneq' + a_oneq;
Y_oneq = 1j * (a_oneq' - a_oneq);
Z_oneq = eye(lev) - 2 * N_oneq;

I = eye(lev);

% omega_ary
ary = 1:lev;
omega_diag1 = diag((ary - 1) * (omega1 - omegap) - (ary - 1) .* (ary - 2)/2 * alpha1);
omega_diag2 = diag((ary - 1) * (omega2 - omegap) - (ary - 1) .* (ary - 2)/2 * alpha2);

% two qubits
global II XI YI IX IY XI_dr YI_dr IX_dr IY_dr D_dr Perf_dr_XI Perf_dr_aI Perf_dr_IX Perf_dr_IY Num1_dr Num2_dr aI_dr Ia_dr
global Perf_dr_ZI
Nq1 = kron(N_oneq, I);
Nq2 = kron(I, N_oneq);
aq1 = kron(a_oneq, I);
aq2 = kron(I, a_oneq);
Diagq1 = kron(omega_diag1, I);
Diagq2 = kron(I, omega_diag2);
XI = kron(X_oneq, I);
YI = kron(Y_oneq, I);
IX = kron(I, X_oneq);
IY = kron(I, Y_oneq);
II = eye(lev^2);

% Perfect single qubit gate in dressed basis
Perf_dr_XI = zeros(lev^2);
Perf_dr_XI(1:4,1:4) = x1;

Perf_dr_IX = zeros(lev^2);
Perf_dr_IX(1:4,1:4) = x2;

Perf_dr_IY = zeros(lev^2);
Perf_dr_IY(1:4,1:4) = y2;

Perf_dr_aI = zeros(lev^2);
Perf_dr_aI(1:4, 1:4) = a1;

Perf_dr_ZI = zeros(lev^2);
Perf_dr_ZI(1:4, 1:4) = z1;

%% Lindblad Form
global A_T1_1 A_T1_2 A_T2_1 A_T2_2 gamma_11 gamma_12 gamma_21 gamma_22

b1 = aq1;
b2 = aq2;

% relaxation (T1)
A_T1_1 = b1;
A_T1_2 = b2;
gamma_11 = 1/T1_1;
gamma_12 = 1/T1_2;

% dephasing (T2)
A_T2_1 = ((b1)' * b1)^.5;
A_T2_2 = ((b2)' * b2)^.5;
gamma_21 = 1/T2_1;
gamma_22 = 1/T2_2;

%% Hamiltonian

% Lab Interacting frame
H_lab_ud = Diagq1 + Diagq2 + J * (aq1'*aq2 + aq1*aq2');

% transfer all to dressed basis
[S_dr, D_dr] = dress(H_lab_ud, lev);

XI_dr = S_dr' * XI * S_dr;
YI_dr = S_dr' * YI * S_dr;
aI_dr = S_dr' * aq1 * S_dr;
Ia_dr = S_dr' * aq2 * S_dr;

IX_dr = S_dr' * IX * S_dr;
IY_dr = S_dr' * IY * S_dr;
Num1_dr = S_dr' * Nq1 * S_dr;
Num2_dr = S_dr' * Nq2 * S_dr;







% % u, v, xi
% u = J / detuneDress12 * -alpha2 / (detuneDress12 - alpha2);
% v = J / detuneDress12 * detuneDress12 / (detuneDress12 - alpha2);
% u_2 = -J / detuneDress12 * -alpha1 / (-detuneDress12 - alpha1);
% v_2 = J / detuneDress12 * detuneDress12 / (-detuneDress12 - alpha1);
% xi = -J^2 * (alpha1 + alpha2) / 2 / (detuneDress12 - alpha1) / (detuneDress12 + alpha2);
% 
% XI_dr_ideal = x1 - v * x2 - u * zx;
% YI_dr_ideal = y1 - v * y2 - u * zy;
% IX_dr_ideal = x2 - v_2 * x1 - u_2 * xz;
% IY_dr_ideal = y2 - v_2 * y1 - u_2 * yz;
% 
% 
% XI_dr(1:4, 1:4)
% XI_dr_ideal
% 
% IX_dr(1:4, 1:4)
% IX_dr_ideal
% return


%% Solve-setting

p.ts = ts;
p.tf = tf;
t_len = tf - ts;

p.omegap = omegap;
p.alpha = -1 * ((D_dr(6,6) + D_dr(1,1) - 2*D_dr(3,3))/2 + (D_dr(8,8) +  D_dr(2,2) - 2* D_dr(4,4))/2);
p.t_len = t_len;
p.t_measure = t_measure;
p.phip = phip;
p.phac = phac;
p.t_I = t_I;
p.t_F = t_F;
p.t_num = t_num;
p.pk_basis_num = pk_basis_num;
p.qk_basis_num = qk_basis_num;

p.tot_basis_num = pk_basis_num + qk_basis_num;

%% init
probe_state = zeros([lev^2, 1]);
probe_state(1:4) = state_in;

% reduced state
probe_reduced_state = zeros([2^2, 1]);
for xx =1:2
    for yy=1:2
        probe_reduced_state((xx-1)*2 + yy) = probe_state((xx-1)*2 + yy);
    end
end


% Init_State = expm(-1i * D_dr * (t_I - t_measure)) * probe_state;
Init_State = probe_state;
Init_rho = Init_State * Init_State';

%% Solve-Run
[t, sol] = ode45(@(t, u) odefun(t, u, p, lev), t, Init_rho);

%% Retrieve data
% Ideal
Ideal_state = (eye(4) + 1j * zx) / 2^.5 * probe_reduced_state;
Ideal = Ideal_state * (Ideal_state)';

% retrieve
fid_rho = zeros([1, t_num]);
myg = zeros([1, t_num]);

% AC Phase Shift
AC_shift = (((2 * fx0_ary).^2 + (2 * fy0_ary).^2 + detuneDress12^2).^.5 - detuneDress12)/2;
AC_phse = cumsum(AC_shift) * dt;


% for a=1:t_num
%     Z_gate = ZGate(-Z_phase_AC_ratio * AC_phse(a));
%     tmp_0 = Z_gate * reshape(sol(a,:), [(1)*lev^2,lev^2]) * (Z_gate)';
%     tmp_rho = tmp_0(1:4, 1:4);
%     fid_rho(a) = abs(trace(Ideal' * tmp_rho) ) / abs(trace(tmp_rho' * tmp_rho) )^.5;
% %     fid(a) = trace( sqrtm(Ideal) * tmp_rho * sqrtm(Ideal) )^2;
%     myg(a) = trace(Ideal' * tmp_rho);  
% end
% 
% % find g
% g_rho = 1 - fid_rho(end)

Z_gate = ZGate(-Z_phase_AC_ratio * AC_phse(end));
tmp_0 = Z_gate * reshape(sol(end,:), [(1)*lev^2,lev^2]) * (Z_gate)';
ans_rho_buf = tmp_0 / trace(abs(tmp_0));
% ans_rho = ans_rho_buf / trace(ans_rho_buf);
ans_rho = ans_rho_buf(1:4,1:4)
% fid_rho(end) = abs(trace(Ideal' * ans_rho) )  / abs(trace(ans_rho' * ans_rho) )^.5  / abs(trace(Ideal' * Ideal) )^.5;
fid_rho(end) = abs(trace(Ideal' * ans_rho) )/ abs(trace(Ideal' * Ideal) );
% fid_rho(end) = abs(trace(Ideal' * ans_rho) );
myg(end) = trace(Ideal' * ans_rho);  

ans_rho_col = reshape(transpose(ans_rho), [16,1]);

% find g
g_rho = 1 - fid_rho(end);

return
%% Coefs
coefIX = zeros([1, t_num]);
coefZX = zeros([1, t_num]);
coefIY = zeros([1, t_num]);
coefZY = zeros([1, t_num]);

for a=1:t_num
    tmp = Hm(t(a),p);
    Buf = tmp(1:4,1:4);
    coefIX(a) = real(trace(Buf * x2)) / 4;
    coefZX(a) = real(trace(Buf * zx)) / 4;
    coefIY(a) = real(trace(Buf * y2)) / 4;
    coefZY(a) = real(trace(Buf * zy)) / 4;
end

%% Plot

% Plot pumping, phase
figure(10)
plot(t, fx0_ary/(2*pi), 'green-', 'linewidth', 1); hold on
plot(t, fy0_ary/(2*pi), 'green-.', 'linewidth', 1); hold on
plot(t, fACx_ary/(2*pi), 'Color', [0.3 0.1 0.1], 'linewidth', 1, 'linestyle', '-'); hold on
plot(t, fACy_ary/(2*pi), 'Color', [0.3 0.1 0.1], 'linewidth', 1, 'linestyle', '-.'); hold on
legend('fCR_x', 'fCR_y', 'fAC_x', 'fAC_y')
grid on

% Plot fidelity
figure(11)
plot(t, fid_rho, 'linewidth', 1);
xlabel('time(ns)')
ylabel('fidelity')
grid on

% Plot AC phase
figure(12)
plot(t, AC_phse, 'linewidth', 1);
xlabel('time(ns)')
ylabel('Phase_{AC}')
grid on

% Plot coefs
figure(5)
plot(t, coefIX/(2*pi), '--', 'Color', [0 0 0], 'linewidth',1); hold on
plot(t, coefZX/(2*pi), '-', 'Color', [0 0 0], 'linewidth',1); hold on
plot(t, coefIY/(2*pi), '--', 'Color', [1 0 0], 'linewidth',1); hold on
plot(t, coefZY/(2*pi), '-', 'Color', [1 0 0], 'linewidth',1); hold on
xlabel('time(ns)')
ylabel('coef/(2\pi)(GHz)')
legend('IX', 'ZX', 'IY', 'ZY')
grid on
end









%% U_ud
function out = My_U_ud(t, p)
global D_dr
out = expm(-1i * D_dr * (t - p.t_measure));
end

%% post Z Gate
function out = ZGate(phase_AC)
global Perf_dr_ZI
out = expm(-1i * phase_AC * Perf_dr_ZI);
end

%% CR pumping: fx0, fy0
function out = myf0(pn, ts, tf, t_num, t)
t_len = tf - ts;

basis_num = size(pn,1);

Buf_p = heaviside(t - ts) -  heaviside(t - tf);

out = zeros([1, t_num]);

for idx=1:basis_num
    out = out + pn(idx) * (sin(idx * pi / t_len * (t - ts)) .* Buf_p);
end
end



%% ode

function dudt = odefun(t,u,p, lev)
global A_T1_1 A_T1_2 A_T2_1 A_T2_2 gamma_11 gamma_12 gamma_21 gamma_22

%reshape
rho = reshape(u, [(1) * lev^2,lev^2]);

% H
H = Hm(t,p); %lev^2 * lev^2

% Lindblad
L_T1_1 = gamma_11 * (A_T1_1 * rho * A_T1_1' - .5 * (A_T1_1)' * A_T1_1 * rho - rho * (A_T1_1)' * A_T1_1);
L_T1_2 = gamma_12 * (A_T1_2 * rho * A_T1_2' - .5 * (A_T1_2)' * A_T1_2 * rho - rho * (A_T1_2)' * A_T1_2);
L_T2_1 = gamma_21 * (A_T2_1 * rho * A_T2_1' - .5 * (A_T2_1)' * A_T2_1 * rho - rho * (A_T2_1)' * A_T2_1);
L_T2_2 = gamma_22 * (A_T2_2 * rho * A_T2_2' - .5 * (A_T2_2)' * A_T2_2 * rho - rho * (A_T2_2)' * A_T2_2);

L = L_T1_1 + L_T1_2 + L_T2_1 + L_T2_2;

% Evolve
dU_dt = -1i * (H * rho - rho * H) +  L;


%reshape
dudt = reshape(dU_dt, [(1) * lev^4, 1]);

end

%% Hm, p_Hm

function out = Hm(t,p)
% global D_dr XI_dr YI_dr phip_ary
global D_dr XI_dr YI_dr fx0_ary fy0_ary

idx = 1 + round((p.t_num - 1) * (t - p.t_I) / (p.t_F - p.t_I));
U_ud = expm(-1i * D_dr * (t - p.t_measure));

Hm = U_ud' * ((fx0_ary(idx) * cos(p.phip) - fy0_ary(idx) * sin(p.phip)) * XI_dr - (fx0_ary(idx) * sin(p.phip) + fy0_ary(idx) * cos(p.phip)) * YI_dr + ...
    Activeterm(t, p) ) * U_ud;

out = Hm;
end

%% Active Cancellation Pumping
function out = Activeterm(t, p)
global fACx_ary fACy_ary
global IX_dr IY_dr

%idx
idx = 1 + round((p.t_num - 1) * (t - p.t_I) / (p.t_F - p.t_I));

% term

out = (fACx_ary(idx) * cos(p.phac) - fACy_ary(idx) * sin(p.phac)) * IX_dr - (fACx_ary(idx) * sin(p.phac) + fACy_ary(idx) * cos(p.phac)) * IY_dr;

end



%% diag to dressed state
function [S, D] = dress(H_lab_ud, lev)
% define 
gg = zeros([lev^2,1]);gg(1) = 1;

ge = zeros([lev^2,1]);ge(2) = 1;

eg = zeros([lev^2,1]);eg(lev+1) = 1;

ee = zeros([lev^2,1]);ee(lev+2) = 1;

gh = zeros([lev^2,1]);gh(3) = 1;

hg = zeros([lev^2,1]);hg(2*lev+1) = 1;

eh = zeros([lev^2,1]);eh(lev+3) = 1;

he = zeros([lev^2,1]);he(2*lev+2) = 1;

hh = zeros([lev^2,1]);hh(2*lev+3) = 1;

% D, S
D = zeros([lev^2, lev^2]);
S = zeros([lev^2, lev^2]);

% diagonalize
[V, F] = eig(H_lab_ud);

% re-arrange (4-states)
[M1, I1] = max(abs(gg' * V));
sgn1 = sign(V(1,I1));
S(1:lev^2, 1) = V(1:lev^2, I1)*sgn1;
D(1,1) = F(I1, I1);
V(:, I1) = [];
F(:,I1) = [];
F(I1, :) = [];

[M2, I2] = max(abs(ge' * V));
sgn2 = sign(V(2,I2));
S(1:lev^2, 2) = V(1:lev^2, I2)*sgn2;
D(2,2) = F(I2, I2);
V(:, I2) = [];
F(:,I2) = [];
F(I2, :) = [];

[M3, I3] = max(abs(eg' * V));
sgn3 = sign(V(lev+1,I3));
S(1:lev^2, 3) = V(1:lev^2, I3)*sgn3;
D(3,3) = F(I3, I3);
V(:, I3) = [];
F(:,I3) = [];
F(I3, :) = [];

[M4, I4] = max(abs(ee' * V));
sgn4 = sign(V(lev+2,I4));
S(1:lev^2, 4) = V(1:lev^2, I4)*sgn4;
D(4,4) = F(I4, I4);
V(:, I4) = [];
F(:,I4) = [];
F(I4, :) = [];

if(lev==2)
    return
end

[M5, I5] = max(abs(gh' * V));
sgn5 = sign(V(3,I5));
S(1:lev^2, 5) = V(1:lev^2, I5)*sgn5;
D(5,5) = F(I5, I5);
V(:, I5) = [];
F(:,I5) = [];
F(I5, :) = [];

[M6, I6] = max(abs(hg' * V));
sgn6 = sign(V(2*lev+1,I6));
S(1:lev^2, 6) = V(1:lev^2, I6)*sgn6;
D(6,6) = F(I6, I6);
V(:, I6) = [];
F(:,I6) = [];
F(I6, :) = [];

[M7, I7] = max(abs(eh' * V));
sgn7 = sign(V(lev+3,I7));
S(1:lev^2, 7) = V(1:lev^2, I7)*sgn7;
D(7,7) = F(I7, I7);
V(:, I7) = [];
F(:,I7) = [];
F(I7, :) = [];

[M8, I8] = max(abs(he' * V));
sgn8 = sign(V(2*lev+2,I8));
S(1:lev^2, 8) = V(1:lev^2, I8)*sgn8;
D(8,8) = F(I8, I8);
V(:, I8) = [];
F(:,I8) = [];
F(I8, :) = [];

[M9, I9] = max(abs(hh' * V));
sgn9 = sign(V(2*lev+3,I9));
S(1:lev^2, 9) = V(1:lev^2, I9)*sgn9;
D(9,9) = F(I9, I9);
V(:, I9) = [];
F(:,I9) = [];
F(I9, :) = [];

% re-arrange (remaining-states)
buf = 10;
for idx=1:lev^2-9
    S(1:lev^2, buf) = V(1:lev^2, idx);
    D(buf, buf) = F(idx, idx);
    buf = buf + 1;
end

end
