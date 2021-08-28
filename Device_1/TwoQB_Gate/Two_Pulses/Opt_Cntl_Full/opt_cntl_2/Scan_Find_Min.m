function [ output_args ] = Scan_Find_Min( input_args )
%% Spec

global step
step = 2.5E-4;
%% Scan index
tot_basis = 10 + 5*2 + 3;
scan_idx = 1:tot_basis;
testNum = 3;
%% Calculate gate total time
tgPi = 20;
GateTime = 160;

t_len = (GateTime - 2 * tgPi) /2;


%% Parms
% fCR0 = 0.198;
phip = 3.0735;
B = 0.0495;
phac = -0.2035;

t_CR = -0;


%% init - CR
%{p,s,q,r}
% resolution: 1E-3/2/pi GHz ~ 0.16 MHz
tot_basis_num = 10 + 5*2;
not_optimal_parms = 4;

x0_CR = zeros(tot_basis_num,1);

x0_CR = [ 
    0.2381
   -0.0442
    0.0135
    0.0010
   -0.0245
         0
   -0.0005
         0
         0
         0.
         
    0.0045
   -0.0040
   -0.0040
   -0.0005
         0
         
   -0.0035
    0.0085
    0.0080
   -0.0010
   -0.0015
];

myx0_CR = [x0_CR;phip;B;phac;t_CR];


p_g = zeros([tot_basis_num+not_optimal_parms,1]);

myx = myx0_CR;
for b = 1:testNum
    for a = 1:size(scan_idx,2)
        fprintf('test idx = %d, scan id = %d\n', b, scan_idx(a));
        id = scan_idx(a);
        [ans_x, ans_val] = To_find_min(myx, id);
        myx(id) = ans_x;
        myx(1:tot_basis_num)
        Only_g_AC_Import(myx)
    end
end
myx(1:tot_basis_num)
myx(tot_basis_num+1:end)
Only_g_AC_Import(myx)


end

function [ans_x, ans_val] = To_find_min(myx0, idx)
global step
Buf = Only_g_AC_Import(myx0);

center = myx0(idx);
myxL = myx0;
myxL(idx) = center - step;
BufL = Only_g_AC_Import(myxL);

myxLL = myx0;
myxLL(idx) = center - 2*step;
BufLL = Only_g_AC_Import(myxLL);

[ans_x, ans_val] = To_left_find_min(center-10E-4, center-5E-4, center, BufLL, BufL, Buf, myx0, idx);

if(ans_x ~= center)
    return
end

myxR = myx0;
myxR(idx) = center + step;
BufR = Only_g_AC_Import(myxR);

myxRR = myx0;
myxRR(idx) = center + 2*step;
BufRR = Only_g_AC_Import(myxRR);
[ans_x, ans_val] = To_right_find_min(center, center+5E-4, center+10E-4, Buf, BufR, BufRR, myx0, idx);

end



function [ans_x, ans_val] = To_left_find_min(L, M, R, L_val, M_val, R_val, myx0, idx)
global step
fprintf('To_left: (L,M,R) = (%f, %f, %f); (L_val,M_val,R_val) = (%e, %e, %e)\n', L, M, R, L_val, M_val, R_val);
LMR_min = min([L_val, M_val, R_val]);

if(LMR_min == R_val)
    ans_x = R;
    ans_val = R_val;
    return;
end

if(LMR_min == M_val)
    myx = myx0;
    myx(idx) = M - 2*step;
    Buf = Only_g_AC_Import(myx);
   [ans_x, ans_val] = To_left_find_min(M - 10E-4, M - 5E-4, M, Buf, L_val, M_val, myx0, idx); 
   return;
end

myx = myx0;
myx(idx) = L - step;
Buf = Only_g_AC_Import(myx);

myx1 = myx0;
myx1(idx) = L - 2*step;
Buf1 = Only_g_AC_Import(myx1);

[ans_x, ans_val] = To_left_find_min(L - 10E-4, L - 5E-4, L, Buf1, Buf, L_val, myx0, idx); 

return
end


function [ans_x, ans_val] = To_right_find_min(L, M, R, L_val, M_val, R_val, myx0, idx)
global step
fprintf('To_right: (L,M,R) = (%f, %f, %f); (L_val,M_val,R_val) = (%e, %e, %e)\n', L, M, R, L_val, M_val, R_val);
LMR_min = min([L_val, M_val, R_val]);

if(LMR_min == L_val)
    ans_x = L;
    ans_val = L_val;
    return;
end

if(LMR_min == M_val)
    myx = myx0;
    myx(idx) = M + 2*step;
    Buf = Only_g_AC_Import(myx);
   [ans_x, ans_val] = To_right_find_min(M, M + 5E-4, M + 10E-4, M_val, R_val, Buf, myx0, idx); 
   return;
end

myx = myx0;
myx(idx) = R + step;
Buf = Only_g_AC_Import(myx);

myx1 = myx0;
myx1(idx) = L + 2*step;
Buf1 = Only_g_AC_Import(myx1);

[ans_x, ans_val] = To_right_find_min(R, R + 5E-4, R + 10E-4, R_val, Buf, Buf1, myx0, idx); 

return
end


