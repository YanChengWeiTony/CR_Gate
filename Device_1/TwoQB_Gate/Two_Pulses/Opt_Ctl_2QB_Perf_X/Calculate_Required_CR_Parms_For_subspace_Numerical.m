function  [fCR0, phip, myB, phac] = Calculate_Required_CR_Parms_For_subspace_Numerical()
clear all;
%% Spec
% handle pi continuous problem
%% Parms

%omega,  J
omega1 = 2*pi * 5.114;
omega2 = 2*pi * 4.914;
alpha1 = 2*pi * 0.330;
alpha2 = 2*pi * 0.330;

J = 2*pi*0.0038;


% pumping parms
tL = 80;
tg = 30;
tsigma = 5;
tgPi = 20;
t_dist = tgPi/2 + 2*tsigma + tg/2 + 10;


% dress
detune12 = omega1 - omega2;
omega1_dress = omega1 + J^2 / detune12;
omega2_dress = omega2 - J^2 / detune12;

detuneDress12 = omega1_dress - omega2_dress;

% timeStart, timeMeasure
t_Center = -tL;
t_measure = 0;


%% Settings
t_I = -10000;
t_F = 000;
t_num = 4800;
lev = 3;

%% Useful Matrix

% 4 x 4 matrix
global x y z z1 zx x1 x2 y2 zz zy
x = [0, 1;1 0];
y = [0, -1j; 1j, 0];
z = [1, 0; 0, -1];
z1 = kron(z,eye(2));
zx = kron(z,x);
zy = kron(z,y);
x1 = kron(x,eye(2));
x2 = kron(eye(2),x);
y2 = kron(eye(2),y);
zz = kron(z,z);

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
omega_diag1 = diag((ary - 1) * (omega1) - (ary - 1) .* (ary - 2)/2 * alpha1);
omega_diag2 = diag((ary - 1) * (omega2) - (ary - 1) .* (ary - 2)/2 * alpha2);

% two qubits
global II XI YI IX IY drive_dr XI_dr YI_dr D_dr sub_drive_dr sub_D_dr
Nq1 = kron(N_oneq, I);
Nq2 = kron(I, N_oneq);
aq1 = kron(a_oneq, I);
aq2 = kron(I, a_oneq);
Diagq1 = kron(omega_diag1, I);
Diagq2 = kron(I, omega_diag2);
XI = kron(X_oneq, I);
YI = kron(Y_oneq, I);
IX = kron(X_oneq, I);
IY = kron(Y_oneq, I);
II = eye(lev^2);





%% Hamiltonian: calculate xi, omegap

% Lab frame
H_lab_ud0 = Diagq1 + Diagq2 + J * (aq1'*aq2 + aq1*aq2');

% transfer all to dressed basis
[S_dr0, D_dr0] = dress(H_lab_ud0, lev);

sub_D_dr0 = D_dr0(1:4,1:4);

% Calculate xi
xi = real(trace(zz * sub_D_dr0))/4;

% Required omegap;
omegap = (sub_D_dr0(4,4) - sub_D_dr0(3,3) + sub_D_dr0(2,2) - sub_D_dr0(1,1))/2; 


%% Hamiltonian (Interacting picture)

H_lab_ud = Diagq1 + Diagq2 + J * (aq1'*aq2 + aq1*aq2') - omegap * Nq1 - omegap * Nq2;

% transfer all to dressed basis
[S_dr, D_dr] = dress(H_lab_ud, lev);
XI_dr = S_dr' * XI * S_dr;
YI_dr = S_dr' * YI * S_dr;

% sub-matrix
sub_D_dr = D_dr(1:4,1:4);


sub_D_dr  = sub_D_dr - 1*(detuneDress12/2 - 1*xi) * eye(4);



%% Calculate u,v

u = -real(trace(zx * XI_dr(1:4,1:4)))/4;
% u = J/detune12 * (-alpha2) / (detune12 - alpha2)


v = -real(trace(x2 * XI_dr(1:4,1:4)))/4;
% v = J/detune12 * (detune12) / (detune12 - alpha2)



%% Required uEff, fCR0, phac, fac
% fCR0s
uEff = A(t_Center, xi, t_measure, v, u);
fCR0 = Req_fCR0(uEff, tg, tsigma);
phip = phi0(t_Center, xi, t_measure, v, u);

% Active Cancellation
phac = phi0(t_Center, xi, t_measure, v, u) - phi1(t_Center, xi, t_measure, v, u);
fac = B(t_Center, xi, t_measure, v, u) * fCR0;

%% Display all parms
% u,v,xi
u
v
xi

% omegap
omegap

%CR
fCR0
phip

myB = B(t_Center, xi, t_measure, v, u);
myB
phac

% run
% run
[czx czy cix ciy] = run(t_I, t_F, t_num, t_Center, t_measure, phip, tg, tsigma, tgPi, fCR0, fac, phac, t_dist, u, uEff, 2);


end



function [czx, czy, cix, ciy] = run(t_I, t_F, t_num, t_CR, t_measure, phip, tg, tsigma, tgPi, fCR0, fac, phac, t_dist, u, uEff, plt_idx)
global drive_dr XI_dr YI_dr sub_drive_dr sub_D_dr
global zx x2 y2 zy


drive_dr = cos(phip) * (XI_dr) - sin(phip) * (YI_dr);
sub_drive_dr = drive_dr(1:4,1:4);


%% Run Hm 

% parms input
p.t_CR = t_CR;
p.t_measure = t_measure;
p.phip = phip;
p.tg = tg;
p.tsigma = tsigma;
p.tgPi = tgPi;
p.fCR0 = fCR0;
p.fac = fac;
p.phac = phac;
p.t_dist = t_dist;


% trace coefs
t = linspace(t_I, t_F, t_num);

coefIX = zeros([1, t_num]);
coefZX = zeros([1, t_num]);
coefIY = zeros([1, t_num]);
coefZY = zeros([1, t_num]);

for a=1:t_num
    buf = Hm(t(a), p);
    coefIX(a) = real(trace(buf' * x2)) / 4;
    coefZX(a) = real(trace(buf' * zx)) / 4;
    coefIY(a) = real(trace(buf' * y2)) / 4;
    coefZY(a) = real(trace(buf' * zy)) / 4;
end

%% Plot

figure(plt_idx)
plot(t, coefIX/(2*pi), '--', 'Color', [0 0 0], 'linewidth',1); hold on
plot(t, coefZX/(2*pi), '-', 'Color', [0 0 0], 'linewidth',1); hold on
plot(t, coefIY/(2*pi), '--', 'Color', [1 0 0], 'linewidth',1); hold on
plot(t, coefZY/(2*pi), '-', 'Color', [1 0 0], 'linewidth',1); hold on

plot(t, u * fCR0 * ones([1, t_num])/(2*pi), '-.', 'Color', [1 .8 .8], 'linewidth',2); hold on
plot(t, -u * fCR0 * ones([1, t_num])/(2*pi), '-.', 'Color', [1 .8 .8], 'linewidth',2); hold on
plot(t, uEff * fCR0 * ones([1, t_num])/(2*pi), '-.', 'Color', [1 .8 .8], 'linewidth',2); hold on
plot(t, -uEff * fCR0 * ones([1, t_num])/(2*pi), '-.', 'Color', [1 .8 .8], 'linewidth',2); hold on

grid on
xlabel('time(ns)')

legend('IX', 'ZX', 'IY', 'ZY')


tmp = Hm(t_CR, p);
czx = real(trace(tmp' * zx)) / 4;
czy = real(trace(tmp' * zy)) / 4;
cix = real(trace(tmp' * x2)) / 4;
ciy = real(trace(tmp' * y2)) / 4;

end





%% Hm

function out = Hm(t,p)
global sub_drive_dr sub_D_dr x2 y2

U_ud = expm(-1j * sub_D_dr * (t - p.t_measure));
Hm = (U_ud' * (p.fCR0 * sub_drive_dr) * U_ud) + p.fac * (cos(p.phac) * x2 - sin(p.phac) * y2);

out = Hm;
end


%% phi0, phi1, A, B
function out = phi0(t, xi, t_measure, v, u)
theta = 2*xi*(t - t_measure);
out = atan(v/(-u) * tan(theta));

% handle pi
add = .5 * pi * (1 + square(theta + pi/2));
out = out + add;
end

function out = phi1(t, xi, t_measure, v, u)
theta = 2*xi*(t - t_measure);
out = atan(-u/(v) * tan(theta));

% handle pi
add = .5 * pi * (1 + square(theta + pi/2));
out = out + add;
end

function out = A(t, xi, t_measure, v, u)
theta = 2*xi*(t - t_measure);
out = ((v * sin(theta))^2 + (u * cos(theta))^2)^.5;
end

function out = B(t, xi, t_measure, v, u)
theta = 2*xi*(t - t_measure);
out = ((u * sin(theta))^2 + (v * cos(theta))^2)^.5;
end

%% fCR0
function out = Req_fCR0(uEff, tg, tsigma)
%  CR Pumping Settings

out = pi / 4 / (((2 * pi)^.5 * tsigma + tg) * uEff)/2;

end


%% diag to dressed state
function [S, D] = dress(H_lab_ud, lev)
% define 
gg = zeros([lev^2,1]);gg(1) = 1;

ge = zeros([lev^2,1]);ge(2) = 1;

eg = zeros([lev^2,1]);eg(lev+1) = 1;

ee = zeros([lev^2,1]);ee(lev+2) = 1;

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

% re-arrange (remaining-states)
buf = 5;
for idx=1:lev^2-4
    S(1:lev^2, buf) = V(1:lev^2, idx);
    D(buf, buf) = F(idx, idx);
    buf = buf + 1;
end

end