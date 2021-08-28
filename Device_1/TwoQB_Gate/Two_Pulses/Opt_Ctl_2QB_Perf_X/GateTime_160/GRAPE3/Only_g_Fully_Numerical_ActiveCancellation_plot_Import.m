function  [g] = Only_g_Fully_Numerical_ActiveCancellation_plot_Import(myx)
%% Spec

% input is an {fx0, fy0}

% Assume pi pulse and active cancellation pulse are ideal. 

% Big U = {U; parital U}

% Big H = {H 0; par_H H}

%% Fixed input

t_len = 60;
qk_rk_basis_num = 5;

%% Handle input {pk, qk, rk}

phip = myx(end-3);
B = myx(end-2);
phac = myx(end-1);
t_CR = myx(end);
input = myx(1:end-4);

% basis number
total_num_basis = size(input,1);
pk_basis_num = total_num_basis - 2 * qk_rk_basis_num;
qk_basis_num = qk_rk_basis_num;
rk_basis_num = qk_rk_basis_num;

% fCR {ak}
pn = input(1:pk_basis_num);
qn = input(pk_basis_num+1:pk_basis_num+qk_basis_num);
rn = input(pk_basis_num+qk_basis_num+1:end);

%% Parms

%omega,  J
omega1 = 2*pi * 5.114;
omega2 = 2*pi * 4.914;
alpha1 = 2*pi * 0.330;
alpha2 = 2*pi * 0.330;

J = 2*pi*0.0038;


% pumping parms
tgPi = 20;


% dress
detune12 = omega1 - omega2;
omega1_dress = omega1 + J^2 / detune12;
omega2_dress = omega2 - J^2 / detune12;

detuneDress12 = omega1_dress - omega2_dress;
xi  = 4.3377e-04;

% omegap = 30.8760;
omegap = 30.8751; %second Qubit's dressed Freq

% timeMeasure
t_measure =0;


%% Settings
t_I = t_CR-2 * t_len - 2 * tgPi - 20;
t_F = t_CR + 20;
t_num = 20000;
lev = 5;

t = linspace(t_I, t_F, t_num);

%% Required fCR0,phip, B, phac

% u,v, uEff
u = 0.0481;
v = -0.0291;
uEff = A(t_CR, xi, t_measure, v, u);



%% get fCR, CRPhase from {pn, qn}

global fx0_ary fy0_ary


% transfer to ary
fx0_ary = myfx0(pn, t_len, tgPi, t_CR, t_num, t);
fy0_ary = myfy0(qn, rn, t_len, tgPi, t_CR, t_num, t);



%% Useful Matrix

% 4 x 4 matrix
global x y z zx zy x1 x2 y2 zz z1
x = [0, 1;1 0];
y = [0, -1j; 1j, 0];
z = [1, 0; 0, -1];
zx = kron(z,x);
zy = kron(z,y);
x1 = kron(x,eye(2));
x2 = kron(eye(2),x);
y2 = kron(eye(2),y);
zz = kron(z,z);
z1 = kron(z,eye(2));

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
global II XI YI IX IY XI_dr YI_dr IX_dr IY_dr D_dr Perf_dr_XI Perf_dr_IX Perf_dr_IY
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

%% Hamiltonian

% Lab Interacting frame
H_lab_ud = Diagq1 + Diagq2 + J * (aq1'*aq2 + aq1*aq2');

% transfer all to dressed basis
[S_dr, D_dr] = dress(H_lab_ud, lev);

XI_dr = S_dr' * XI * S_dr;
YI_dr = S_dr' * YI * S_dr;

IX_dr = S_dr' * IX * S_dr;
IY_dr = S_dr' * IY * S_dr;

D_dr = D_dr - (detuneDress12/2 - xi) * eye(lev^2);

%% Solve
ts1 = t_CR - 2 * tgPi - 2 * t_len;
tf1 = t_CR - 2 * tgPi - 1 * t_len;
ts2 = t_CR-1 * tgPi - 1 * t_len;
tf2 = t_CR-1 * tgPi - 0 * t_len;


p.ts1 = ts1;
p.ts2 = ts2;
p.tf1 = tf1;
p.tf2 = tf2;

p.alpha = alpha1;
p.t_CR = t_CR;
p.t_len = t_len;
p.t_measure = t_measure;
p.phip = phip;
p.tgPi = tgPi;
p.B = B;
p.phac = phac;
p.t_I = t_I;
p.t_F = t_F;
p.t_num = t_num;
p.pk_basis_num = pk_basis_num;
p.qk_basis_num = qk_basis_num;
p.rk_basis_num = rk_basis_num;
p.tot_basis_num = pk_basis_num + qk_basis_num + rk_basis_num;

[t, sol] = ode45(@(t, u) odefun(t, u, p, lev), t, eye(lev^2));

%% Retrieve data
% Ideal
Ideal = (eye(4) - 1j * zx) / 2^.5;

% retrieve
fid = zeros([1, t_num]);
myg = zeros([1, t_num]);
fid_p = zeros([p.tot_basis_num, t_num]);

for a=1:t_num
    tmp_0 = reshape(sol(a,:), [(1)*lev^2,lev^2]);
    tmp_U = tmp_0(1:4, 1:4);
    Buf_U = tmp_U(1:4, 1:4) / (1/(2^2) * trace(tmp_U' * tmp_U))^.5;
    fid(a) = abs(trace(Ideal' * Buf_U))/4;
    myg(a) = trace(Ideal' * Buf_U);    
end

% find g
g = 1 - fid(end);
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
figure(1)
plot(t, fx0_ary/(2*pi), 'green-', 'linewidth', 1); hold on
plot(t, fy0_ary/(2*pi), 'green-.', 'linewidth', 1); hold on
plot(t, fx_DRAG(t, p) /(2*pi), 'blue-', 'linewidth', 1); hold on
plot(t, fAc_x(t, p)/(2*pi), 'Color', [0.3 0.1 0.1], 'linewidth', 1, 'linestyle', '-');
plot(t, fAc_y(t, p)/(2*pi), 'Color', [0.3 0.1 0.1], 'linewidth', 1, 'linestyle', '-.');
xlabel('time(ns)')
ylabel('Amp/(2\pi)(GHz)')
grid on


% Plot fidelity
figure(2)
plot(t, fid, 'linewidth', 1);
xlabel('time(ns)')
ylabel('fidelity')
grid on


% Plot coefs
figure(5)
plot(t, coefIX/(2*pi), '--', 'Color', [0 0 0], 'linewidth',1); hold on
plot(t, coefZX/(2*pi), '-', 'Color', [0 0 0], 'linewidth',1); hold on
plot(t, coefIY/(2*pi), '--', 'Color', [1 0 0], 'linewidth',1); hold on
plot(t, coefZY/(2*pi), '-', 'Color', [1 0 0], 'linewidth',1); hold on
xlabel('time(ns)')
ylabel('coef/(2\pi)(GHz)')
end



%% CR pumping: fx0, fy0
function out = myfx0(pn, t_len, tgPi, t_CR, t_num, t)

basis_num = size(pn,1);

ts1 = t_CR -2 *tgPi - 2 * t_len;
tf1 =  t_CR-2 *tgPi - 1 * t_len;
ts2 = t_CR-1 *tgPi - 1 * t_len;
tf2 = t_CR-1 *tgPi - 0 * t_len;


Buf_p1 = heaviside(t - ts1) -  heaviside(t - tf1);
Buf_p2 =  -(heaviside(t - ts2) - heaviside(t - tf2));

out = zeros([1, t_num]);

for idx=1:basis_num
    out = out + pn(idx) * (sin(idx * pi / t_len * (t - ts1)) .* Buf_p1 + sin(idx * pi / t_len * (t - ts2)) .* Buf_p2);
end
end

function out = myfy0(qn, rn, t_len, tgPi, t_CR, t_num, t)

q_basis_num = size(qn,1);
r_basis_num = size(rn,1);

ts1 = t_CR -2 *tgPi - 2 * t_len;
tf1 =  t_CR-2 *tgPi - 1 * t_len;
ts2 = t_CR-1 *tgPi - 1 * t_len;
tf2 = t_CR-1 *tgPi - 0 * t_len;

Buf_q = heaviside(t - ts1) -  heaviside(t - tf1);
Buf_r =  - (heaviside(t - ts2) - heaviside(t - tf2));

out_q = zeros([1, t_num]);
for idx=1:q_basis_num
    out_q = out_q + qn(idx) * sin(idx * pi / t_len * (t - ts1)) .* Buf_q;
end

out_r = zeros([1, t_num]);
for idx=1:r_basis_num
    out_r = out_r + rn(idx) * sin(idx * pi / t_len * (t - ts2)) .* Buf_r;
end

out = out_q + out_r;
end

%% ode

function dudt = odefun(t,u,p, lev)

%reshape
U = reshape(u, [(1) * lev^2,lev^2]);

% H

H = Hm(t,p); %lev^2 * lev^2

% Evolve
dU_dt = -1i * (H * U);


%reshape
dudt = reshape(dU_dt, [(1) * lev^4, 1]);
end

%% Hm, p_Hm

function out = Hm(t,p)
% global D_dr XI_dr YI_dr phip_ary
global D_dr XI_dr YI_dr fx0_ary fy0_ary

idx = 1 + round((p.t_num - 1) * (t - p.t_I) / (p.t_F - p.t_I));

U_ud = expm(-1j * D_dr * (t - p.t_measure));
Hm = U_ud' * ((fx0_ary(idx) * cos(p.phip) - fy0_ary(idx) * sin(p.phip)) * XI_dr - (fx0_ary(idx) * sin(p.phip) + fy0_ary(idx) * cos(p.phip)) * YI_dr + ...
    Activeterm(t, p)) * U_ud...
    + xtermpi(t, p);

out = Hm;
end


function out = par_Hm(t,p)
% global D_dr XI_dr YI_dr phip_ary
global D_dr XI_dr YI_dr

U_ud = expm(-1j * D_dr * (t - p.t_measure));

% Heaviside

Buf_1 = heaviside(t - p.ts1) -  heaviside(t - p.tf1);
Buf_2 =  -(heaviside(t - p.ts2) - heaviside(t - p.tf2));

% dHm/df (fx)
dHm_dfx =  U_ud' * ( cos(p.phip) * XI_dr - sin(p.phip) * YI_dr) * U_ud;

% df/dpk (fx)

k = (1:p.pk_basis_num)';
dfx_dpk = sin(pi * k /p.t_len * (t -  p.ts1)) * Buf_1 + sin(pi * k /p.t_len * (t -  p.ts2)) * Buf_2;

out_fx = kron(dfx_dpk, dHm_dfx);

% dHm/df (fy)
dHm_dfy =  U_ud' * ( -sin(p.phip) * XI_dr -  cos(p.phip) * YI_dr) * U_ud;

% df/dqk (fy)
k = (1:p.qk_basis_num)';
dfy_dqk = sin(pi * k /p.t_len * (t - p.ts1)) * Buf_1;

% df/drk (fy)
dfy_drk = sin(pi * k /p.t_len * (t - p.ts2)) * Buf_2;


out_fy = kron([dfy_dqk;dfy_drk], dHm_dfy);

% out
out = [out_fx;out_fy];

end




%% Pi Pulse Pumping
function out = xtermpi(t, p)
global Perf_dr_XI
out = fx_DRAG(t, p) * Perf_dr_XI;
end

function out = fx(t, p)
% Pi pulse settings
tgPi = p.tgPi;
t_len = p.t_len;
tsigmaPi = tgPi / 6;
f0Pi = pi^.5/2^.5 / tsigmaPi / 2;

tcPi1 = p.t_CR - 0.5 * tgPi;
tcPi2 = p.t_CR - 1.5 * tgPi - 1 * t_len;

% function of pi pulse
fxPi = f0Pi * (exp(-(t - tcPi1).^2 / (2 * tsigmaPi^2)) + exp(-(t - tcPi2).^2 / (2 * tsigmaPi^2)));
out = fxPi;
end

function fx = fx_DRAG(t, p)
t_len = p.t_len;
tgPi = p.tgPi;

% DRAG Info
tc = tgPi/2;
tsigma = tgPi/2;
lam = 2^.5;
A = pi/((pi/2)^.5 * erf(1/2^.5) - exp(-1/2))/tgPi;
B = A * exp(-tc^2 / tsigma^2 / 2);
% c1 = (lam^2 - 4)/8/p.alpha^2;
% c2 = -(13 * lam^4 - 76 * lam^2 + 112)/128/p.alpha^4;
% c3 = -33 * (lam^2 - 2)/24/p.alpha^3;
% c4 = -(lam^2 - 4)/4/p.alpha;
% c5 = (lam^4 - 7 * lam^2 + 12)/16/p.alpha^3;

% Center time
tcPi1 = p.t_CR - 0.5 * tgPi;
tcPi2 = p.t_CR - 1.5 * tgPi - 1 * t_len;

% pulse
Buf1 = heaviside(t - (tcPi1 - tgPi/2)) - heaviside(t - (tcPi1 + tgPi/2));
Buf2 = heaviside(t - (tcPi2 - tgPi/2)) - heaviside(t - (tcPi2 + tgPi/2));
e = (A * exp(-(t - tcPi1).^2 ./ tsigma^2 / 2) - B) .* Buf1 + (A * exp(-(t - tcPi2).^2 ./ tsigma^2 / 2) - B) .* Buf2;
% der_e = A * exp(-(t - tcPi1).^2 ./ tsigma^2 / 2) .* (-(t - tcPi1) / tsigma^2) .* Buf1 ...
%     + A * exp(-(t - tcPi2).^2 ./ tsigma^2 / 2) .* (-(t - tcPi2) / tsigma^2) .* Buf2;
% % out
% fx = (e + c1 * e.^3 + c2 * e.^5)/2;
% fy = (der_e/p.alpha + c3 * e.^2 .* der_e)/2;
% detune = c4 * e.^2 + c5 * e.^4;

fx = e/2;
end



%% Active Cancellation Pumping
function out = Activeterm(t, p)
global fx0_ary fy0_ary
global IX_dr IY_dr

%idx
idx = 1 + round((p.t_num - 1) * (t - p.t_I) / (p.t_F - p.t_I));

% term

out = p.B * ((fx0_ary(idx) * cos(p.phac) - fy0_ary(idx) * sin(p.phac)) * IX_dr - (fx0_ary(idx) * sin(p.phac) + fy0_ary(idx) * cos(p.phac)) * IY_dr );

end

function out = fAc_x(t,p)
global fx0_ary
idx = 1 + round((p.t_num - 1) * (t - p.t_I) / (p.t_F - p.t_I));
out = p.B * fx0_ary(idx);
end

function out = fAc_y(t,p)
global fy0_ary
idx = 1 + round((p.t_num - 1) * (t - p.t_I) / (p.t_F - p.t_I));
out = p.B * fy0_ary(idx);
end


%% A, B

function out = A(t, xi, t_measure, v, u)
theta = 2*xi*(t - t_measure);
out = ((v * sin(theta))^2 + (u * cos(theta))^2)^.5;
end

function out = B(t, xi, t_measure, v, u)
theta = 2*xi*(t - t_measure);
out = ((u * sin(theta))^2 + (v * cos(theta))^2)^.5;
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