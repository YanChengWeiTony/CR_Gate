function [ output_args ] = Scan_Find_Min_test( input_args )
%% Spec

%% Scan index
scan_idx = 41:-1:40;

%% Calculate gate total time
tgPi = 20;
GateTime = 160;

t_len = (GateTime - 2 * tgPi) /2;

%% Parms
% fCR0 = 0.198;
phip = 3.060;
B = 0.0545;
phac = -0.047;

t_CR = -0;


%% init
%{p,s,q,r}
% resolution: 1E-3/2/pi GHz ~ 0.16 MHz
tot_basis_num = 8 + 8 + 10 + 13 + 1 + 1;
not_optimal_parms = 4;

x0 = [    0.1238
   -0.0019
   -0.0003
   -0.0290
    0.0002
    0.0000
   -0.0004
    0.0001
   
    0.0047
   -0.0002
   -0.0001
   -0.0035
    0.0030
   -0.0015
   0.0010
   -0.0001
   
  -0.0000
  -0.0018
   0.0000
  -0.0012
  -0.0000
  0.0105
  0.0000
 -0.0110
 -0.0001
  0.0180
   
   0.0045
  -0.0160
   0.0015
  -0.0065
   0.0010
   0.0420
  -0.0095
  -0.0310
  -0.0110
  0.0085
 -0.003
  0.0015
 -0.0005
   
   0.0001
   
  -0.0020];



myx0 = [x0;phip;B;phac;t_CR];
p_g = zeros([tot_basis_num+not_optimal_parms,1]);

myx = myx0;
for a = 1:size(scan_idx,2)
    fprintf('scan id = %d\n', scan_idx(a));
    id = scan_idx(a);
    [ans_x, ans_val] = To_find_min(myx, id);
    myx(id) = ans_x;
    myx(1:tot_basis_num)
end
myx(1:tot_basis_num)
XI_Import(myx)
%% substitute into Numerical Simulation
% [g] = Perf_XI_plot_Import(myx0)
% [g] = DRAG_XI_plot_Import(myx0)
% [g] = XI_Import(myx0)
% [g, p_g] = par_XI_plot_Import(myx0)


end

function [ans_x, ans_val] = To_find_min(myx0, idx)
Buf = XI_Import(myx0);

center = myx0(idx);
myxL = myx0;
myxL(idx) = center - 5E-4;
BufL = XI_Import(myxL);

myxLL = myx0;
myxLL(idx) = center - 10E-4;
BufLL = XI_Import(myxLL);

[ans_x, ans_val] = To_left_find_min(center-10E-4, center-5E-4, center, BufLL, BufL, Buf, myx0, idx);

if(ans_x ~= center)
    return
end

myxR = myx0;
myxR(idx) = center + 5E-4;
BufR = XI_Import(myxR);

myxRR = myx0;
myxRR(idx) = center + 10E-4;
BufRR = XI_Import(myxRR);
[ans_x, ans_val] = To_right_find_min(center, center+5E-4, center+10E-4, Buf, BufR, BufRR, myx0, idx);

end



function [ans_x, ans_val] = To_left_find_min(L, M, R, L_val, M_val, R_val, myx0, idx)
fprintf('To_left: (L,M,R) = (%f, %f, %f); (L_val,M_val,R_val) = (%e, %e, %e)\n', L, M, R, L_val, M_val, R_val);
LMR_min = min([L_val, M_val, R_val]);

if(LMR_min == R_val)
    ans_x = R;
    ans_val = R_val;
    return;
end

if(LMR_min == M_val)
    myx = myx0;
    myx(idx) = M - 10E-4;
    Buf = XI_Import(myx);
   [ans_x, ans_val] = To_left_find_min(M - 10E-4, M - 5E-4, M, Buf, L_val, M_val, myx0, idx); 
   return;
end

myx = myx0;
myx(idx) = L - 5E-4;
Buf = XI_Import(myx);

myx1 = myx0;
myx1(idx) = L - 10E-4;
Buf1 = XI_Import(myx1);

[ans_x, ans_val] = To_left_find_min(L - 10E-4, L - 5E-4, L, Buf1, Buf, L_val, myx0, idx); 

return
end


function [ans_x, ans_val] = To_right_find_min(L, M, R, L_val, M_val, R_val, myx0, idx)
fprintf('To_right: (L,M,R) = (%f, %f, %f); (L_val,M_val,R_val) = (%e, %e, %e)\n', L, M, R, L_val, M_val, R_val);
LMR_min = min([L_val, M_val, R_val]);

if(LMR_min == L_val)
    ans_x = L;
    ans_val = L_val;
    return;
end

if(LMR_min == M_val)
    myx = myx0;
    myx(idx) = M + 10E-4;
    Buf = XI_Import(myx);
   [ans_x, ans_val] = To_right_find_min(M, M + 5E-4, M + 10E-4, M_val, R_val, Buf, myx0, idx); 
   return;
end

myx = myx0;
myx(idx) = R + 5E-4;
Buf = XI_Import(myx);

myx1 = myx0;
myx1(idx) = L + 10E-4;
Buf1 = XI_Import(myx1);

[ans_x, ans_val] = To_right_find_min(R, R + 5E-4, R + 10E-4, R_val, Buf, Buf1, myx0, idx); 

return
end


