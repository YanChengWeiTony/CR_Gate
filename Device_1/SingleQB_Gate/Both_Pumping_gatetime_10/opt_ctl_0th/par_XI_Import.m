function  [g, p_g] = par_XI_Import(myx)
format long
%% Spec

% input is an {fx0, fy0}

% Assume pi pulse and active cancellation pulse are ideal. 

% Big U = {U; parital U}

% Big H = {H 0; par_H H}

%% Fixed input

not_optimal_parms = 0;

ak_basis_num = 5;
bk_basis_num = 5;
ck_basis_num = 0;
dk_basis_num = 5;
ek_basis_num = 5;
fk_basis_num = 0;

%% Handle input {ak, bk, ck, dk, ek, fk}

input = myx(1:end);

% fPi {ak, bk, ck}
an = input(1:ak_basis_num);
bn = input(ak_basis_num+1:ak_basis_num+bk_basis_num);
cn = input(ak_basis_num+bk_basis_num+1:ak_basis_num+bk_basis_num+ck_basis_num);

dn = input(ak_basis_num+bk_basis_num+ck_basis_num+1: ak_basis_num+bk_basis_num+ck_basis_num+dk_basis_num);
en = input(ak_basis_num+bk_basis_num+ck_basis_num+dk_basis_num+1: ...
    ak_basis_num+bk_basis_num+ck_basis_num+dk_basis_num+ek_basis_num);
fn = input(ak_basis_num+bk_basis_num+ck_basis_num+dk_basis_num+ek_basis_num+1:end-2);

dp_offset = input(end-1);
dp_offset2 = input(end);

%% Parms

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
xi  = 4.3377e-04;

% omegap = 30.8760;
% omegap = 30.8751; %second Qubit's dressed Freq
omegap = 32.1327 ; %first Qubit's  dressed  Freq



% timeMeasure
t_measure = -0;

%% pulse
ts = -10;
tf = 0;
tgPi = tf - ts;

%% Settings
% t_I = t_CR-2 * t_len - 2 * tgPi - 20;
% t_F = t_CR + 20;

t_I = -12;
t_F = 2;

t_num = 2000;
lev = 6;

t = linspace(t_I, t_F, t_num);


%% get fCR, CRPhase from {pn, qn}

global Pi_fx0_ary Pi_fy0_ary Pi_dp_ary
global Pi_fx0_ary_trgt Pi_fy0_ary_trgt Pi_dp_ary_trgt

% transfer to ary
Pi_fx0_ary = myf0_sin(an, ts, tf, t_num, t);
Pi_fy0_ary = myf0_cos(bn, ts, tf, t_num, t);
Pi_dp_ary = myf0_sin(cn, ts, tf, t_num, t);

Pi_fx0_ary_trgt = myf0_sin(dn, ts, tf, t_num, t);
Pi_fy0_ary_trgt = myf0_cos(en, ts, tf, t_num, t);
Pi_dp_ary_trgt = myf0_sin(fn, ts, tf, t_num, t);


%% Useful Matrix

% 4 x 4 matrix
global x y z zx zy x1 x2 y2 zz z1 a a1
x = [0, 1;1 0];
y = [0, -1j; 1j, 0];
z = [1, 0; 0, -1];
a = (x + 1i * y) / 2;
zx = kron(z,x);
zy = kron(z,y);
x1 = kron(x,eye(2));
x2 = kron(eye(2),x);
y2 = kron(eye(2),y);
zz = kron(z,z);
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
global II XI YI IX IY XI_dr YI_dr aI_dr Ia_dr IX_dr IY_dr D_dr Perf_dr_XI Perf_dr_aI Perf_dr_IX Perf_dr_IY
global Nq1 Nq2 Num1_dr Num2_dr

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

%% Hamiltonian

% Lab Interacting frame
H_lab_ud = Diagq1 + Diagq2 + J * (aq1'*aq2 + aq1*aq2');

% transfer all to dressed basis
[S_dr, D_dr] = dress(H_lab_ud, lev);

XI_dr = S_dr' * XI * S_dr;
YI_dr = S_dr' * YI * S_dr;
aI_dr = S_dr' * aq1 * S_dr;

IX_dr = S_dr' * IX * S_dr;
IY_dr = S_dr' * IY * S_dr;
Num1_dr = S_dr' * Nq1 * S_dr;

Ia_dr = S_dr' * aq2 * S_dr;
Num2_dr = S_dr' * Nq2 * S_dr;

%% Solve

p.omegap = omegap;
% p.omega1 = omega1
% p.alpha = alpha1
p.omega1 = (D_dr(3,3)+D_dr(4,4))/2 - (D_dr(1,1) + D_dr(2,2))/2 + omegap + dp_offset;
p.omega2 = (D_dr(4,4)-D_dr(3,3))/2 + (D_dr(2,2) - D_dr(1,1))/2 + omegap + dp_offset2;

p.alpha = -1 * ((D_dr(6,6) + D_dr(1,1) - 2*D_dr(3,3))/2 + (D_dr(8,8) +  D_dr(2,2) - 2* D_dr(4,4))/2);
p.t_measure = t_measure;
p.tgPi = tgPi;
p.t_I = t_I;
p.t_F = t_F;
p.ts = ts;
p.tf = tf;
p.t_num = t_num;
p.ak_basis_num = ak_basis_num;
p.bk_basis_num = bk_basis_num;
p.ck_basis_num = ck_basis_num;
p.dk_basis_num = dk_basis_num;
p.ek_basis_num = ek_basis_num;
p.fk_basis_num = fk_basis_num;
p.tot_basis_num = ak_basis_num + bk_basis_num + ck_basis_num + dk_basis_num + ek_basis_num + fk_basis_num + 1 + 1;

Init = expm(-1i * D_dr * (t_I - t_measure));
[t, sol] = ode45(@(t, u) odefun(t, u, p, lev), t, [Init;zeros([lev^2 * p.tot_basis_num, lev^2])]);

%% Retrieve data
% Ideal
Ideal = (x1);

% retrieve
fid = zeros([1, t_num]);
myg = zeros([1, t_num]);
fid_p = zeros([p.tot_basis_num, t_num]);


for a=1:t_num
    tmp_0 = kron( eye(1+p.tot_basis_num), (My_U_ud(t(a), p))' ) * reshape(sol(a,:), [(1 + p.tot_basis_num)*lev^2,lev^2]);
    tmp_U = tmp_0(1:4, 1:4);
    Buf_U = tmp_U(1:4, 1:4) / (1/(2^2) * trace(tmp_U' * tmp_U))^.5;
    fid(a) = abs(trace(Ideal' * Buf_U))/4;
    myg(a) = trace(Ideal' * Buf_U);    
    
    tmp_pU = tmp_0(lev^2+1:(1+p.tot_basis_num)*lev^2, 1:lev^2);
    for b=1:p.tot_basis_num
        Buf_pU = tmp_pU(1 + (b-1) * lev^2 : 4 + (b-1) * lev^2 , 1:4);
        fid_p(b, a) = trace(Ideal' * Buf_pU)/4;
    end
end


% find g, p_g
g = 1 - fid(end);
mygoal = myg(end);
p_g = zeros([p.tot_basis_num+not_optimal_parms,1]);

for a=1:p.tot_basis_num
    p_g(a) = -real(conj(mygoal) / abs(mygoal) * fid_p(a,end));
end

return;

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
plot(t, Pi_fx0_ary /(2*pi), '-', 'linewidth', 1,'Color', [1 .6 0]); hold on
plot(t, Pi_fy0_ary /(2*pi), '-', 'linewidth', 1, 'Color', [0 0 1]); hold on
plot(t, (Pi_dp_ary + dp_offset) /(2*pi), '-', 'linewidth', 1, 'Color', [0 1 0]); hold on
plot(t, Pi_fx0_ary_trgt /(2*pi), '--', 'linewidth', 1,'Color', [1 .6 0]); hold on
plot(t, Pi_fy0_ary_trgt /(2*pi), '--', 'linewidth', 1, 'Color', [0 0 1]); hold on
plot(t, (Pi_dp_ary_trgt + dp_offset2) /(2*pi), '--', 'linewidth', 1, 'Color', [0 1 0]); hold on

xlabel('time(ns)')
ylabel('Amp/(2\pi)(GHz)')
grid on
legend('fx', 'fy', 'detune', 'fx-2', 'fy-2', 'detune-2')

% Plot fidelity
figure(2)
plot(t, fid, 'linewidth', 1);
xlabel('time(ns)')
ylabel('fidelity')
grid on


end
















%% U_ud
function out = My_U_ud(t, p)
global D_dr
out = expm(-1i * D_dr * (t - p.t_measure));
end


%% Pi Pumping
function out = myf0_sin(an, ts, tf, t_num, t)

basis_num = size(an,1);

tgPi = tf - ts;


Buf = heaviside(t - ts) -  heaviside(t - tf);

out = zeros([1, t_num]);

for idx=1:basis_num
    out = out + an(idx) * (sin(idx * pi / tgPi * (t - ts))) .* Buf;
end

end

function out = myf0_cos(an, ts,tf,  t_num, t)

basis_num = size(an,1);

tgPi = tf - ts;


Buf = heaviside(t - ts) -  heaviside(t - tf);

out = zeros([1, t_num]);

for idx=1:basis_num
    out = out + an(idx) * (cos(idx * pi / tgPi * (t - ts))) .* Buf;
end

end




%% ode

function dudt = odefun(t,u,p, lev)

%reshape
Big_U = reshape(u, [(1 + p.tot_basis_num) * lev^2,lev^2]);


% H, partial_H, and combined matrix

H = Hm(t,p); %lev^2 * lev^2
pH = par_Hm(t,p); %(lev^2 * tot_basis_num) * lev

Big_H = kron(eye(1 + p.tot_basis_num), H);

Big_H(lev^2+1:end,1:lev^2) = pH;

% Evolve
dBig_U_dt = -1i * (Big_H * Big_U);


%reshape
dudt = reshape(dBig_U_dt, [(1 + p.tot_basis_num) * lev^4, 1]);

end
%% Hm, p_Hm


function out = Hm(t,p)
% global D_dr XI_dr YI_dr phip_ary
global D_dr XI_dr YI_dr fx0_ary fy0_ary

idx = 1 + round((p.t_num - 1) * (t - p.t_I) / (p.t_F - p.t_I));

Hm = D_dr + ...
    xtermpi(t, p) + xtermpi_trget_QB(t, p);

out = Hm;
end


function out = par_Hm(t,p)
global aI_dr Num1_dr 
global Ia_dr Num2_dr
global Pi_fx0_ary Pi_fy0_ary Pi_dp_ary
global Pi_fx0_ary_trgt Pi_fy0_ary_trgt Pi_dp_ary_trgt

ts = p.ts;
tf = p.tf;

Buf = heaviside(t - ts) -  heaviside(t - tf);

idx_a=(1:p.ak_basis_num)';
idx_b=(1:p.bk_basis_num)';
idx_c=(1:p.ck_basis_num)';
idx_d=(1:p.dk_basis_num)';
idx_e=(1:p.ek_basis_num)';
idx_f=(1:p.fk_basis_num)';

dfx_dan = (sin(idx_a * pi / p.tgPi * (t - ts))) .* Buf;
dfy_dbn = (cos(idx_b * pi / p.tgPi * (t - ts))) .* Buf;
ddp_dcn = (sin(idx_c * pi / p.tgPi * (t - ts))) .* Buf;
dfx_ddn = (sin(idx_d * pi / p.tgPi * (t - ts))) .* Buf;
dfy_den = (cos(idx_e * pi / p.tgPi * (t - ts))) .* Buf;
ddp_dfn = (sin(idx_f * pi / p.tgPi * (t - ts))) .* Buf;

ph = p.omega1 * (-p.t_measure);
ph2 = p.omega2 * (-p.t_measure);
ph_p = p.omegap * (-p.t_measure);

% control qb
par_fx = 2*cos(p.omega1 * t + ph) * (aI_dr * exp(-1i * (p.omegap * t + ph_p)) + (aI_dr)' * exp(1i * (p.omegap * t + ph_p)));
par_fy = 2*sin(p.omega1 * t + ph) * (aI_dr * exp(-1i * (p.omegap * t + ph_p)) + (aI_dr)' * exp(1i * (p.omegap * t + ph_p)));
par_an = kron(dfx_dan, par_fx);
par_bn = kron(dfy_dbn, par_fy);
par_cn = kron(ddp_dcn, Num1_dr);

idx_t = 1 + round((p.t_num - 1) * (t - p.t_I) / (p.t_F - p.t_I));
fx = Pi_fx0_ary(idx_t);
fy = Pi_fy0_ary(idx_t);

par_offset = fx * (-2) * t *sin(p.omega1 * t + ph) * ...
    (aI_dr * exp(-1i * (p.omegap * t + ph_p)) + (aI_dr)' * exp(1i * (p.omegap * t + ph_p))) + ...
    fy * (2) * t * cos(p.omega1 * t + ph) * ...
    (aI_dr * exp(-1i * (p.omegap * t + ph_p)) + (aI_dr)' * exp(1i * (p.omegap * t + ph_p)));


% target qb
par_fx2 = 2*cos(p.omega2 * t + ph2) * (Ia_dr * exp(-1i * (p.omegap * t + ph_p)) + (Ia_dr)' * exp(1i * (p.omegap * t + ph_p)));
par_fy2 = 2*sin(p.omega2 * t + ph2) * (Ia_dr * exp(-1i * (p.omegap * t + ph_p)) + (Ia_dr)' * exp(1i * (p.omegap * t + ph_p)));
par_dn = kron(dfx_ddn, par_fx2);
par_en = kron(dfy_den, par_fy2);
par_fn = kron(ddp_dfn, Num2_dr);

fx2 = Pi_fx0_ary_trgt(idx_t);
fy2 = Pi_fy0_ary_trgt(idx_t);
par_offset2 = fx2 * (-2) * t * sin(p.omega2 * t + ph2) * ...
    (Ia_dr * exp(-1i * (p.omegap * t + ph_p)) + (Ia_dr)' * exp(1i * (p.omegap * t + ph_p))) + ...
    fy2 * (2) * t * cos(p.omega2 * t + ph2) * ...
    (Ia_dr * exp(-1i * (p.omegap * t + ph_p)) + (Ia_dr)' * exp(1i * (p.omegap * t + ph_p)));


% out
out = [par_an;par_bn;par_cn;par_dn;par_en;par_fn;par_offset; par_offset2];

end




%% Pi Pulse Pumping
function out = xtermpi(t, p)
global aI_dr Num1_dr
global Pi_fx0_ary Pi_fy0_ary Pi_dp_ary

ph = p.omega1 * (-p.t_measure);
ph_p = p.omegap * (-p.t_measure);

idx = 1 + round((p.t_num - 1) * (t - p.t_I) / (p.t_F - p.t_I));
fx = Pi_fx0_ary(idx);
fy = Pi_fy0_ary(idx);
detune = Pi_dp_ary(idx);


x_term = fx * 2*cos(p.omega1 * t + ph) * (aI_dr * exp(-1i * (p.omegap * t + ph_p)) + (aI_dr)' * exp(1i * (p.omegap * t + ph_p)));
y_term = fy * 2*sin(p.omega1 * t + ph) * (aI_dr * exp(-1i * (p.omegap * t + ph_p)) + (aI_dr)' * exp(1i * (p.omegap * t + ph_p)));

Detune_term = detune * Num1_dr;
out = x_term + y_term + Detune_term;
end






function out = xtermpi_trget_QB(t, p)
global Ia_dr Num2_dr
global Pi_fx0_ary_trgt Pi_fy0_ary_trgt Pi_dp_ary_trgt

ph2 = p.omega2 * (-p.t_measure);
ph_p = p.omegap * (-p.t_measure);

idx = 1 + round((p.t_num - 1) * (t - p.t_I) / (p.t_F - p.t_I));
fx = Pi_fx0_ary_trgt(idx);
fy = Pi_fy0_ary_trgt(idx);
detune = Pi_dp_ary_trgt(idx);


x_term = fx * 2*cos(p.omega2 * t + ph2) * (Ia_dr * exp(-1i * (p.omegap * t + ph_p)) + (Ia_dr)' * exp(1i * (p.omegap * t + ph_p)));
y_term = fy * 2*sin(p.omega2 * t + ph2) * (Ia_dr * exp(-1i * (p.omegap * t + ph_p)) + (Ia_dr)' * exp(1i * (p.omegap * t + ph_p)));

Detune_term = detune * Num2_dr;
out = x_term + y_term + Detune_term;
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