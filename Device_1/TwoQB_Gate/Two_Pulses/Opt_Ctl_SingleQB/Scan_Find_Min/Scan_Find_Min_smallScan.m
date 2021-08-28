function [ output_args ] = Scan_Find_Min_smallScan( input_args )
%% Spec

%% Scan parms
global scan
scan = 2.5E-4;
scan_idx = 41:-1:1;
testNum = 3;
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

x0 = [ 
    
    0.1238
   -0.0084
   -0.0003
   -0.0335
    0.0002
   -0.0015
    0.0001
   -0.0024
    0.0047
   -0.0002
   -0.0001
   -0.0075
    0.0110
   -0.0025
    0.0005
   -0.0036
         0
   -0.0018
         0
   -0.0077
         0
    0.0100
         0
   -0.0190
   -0.0001
    0.0245
    0.0040
   -0.0210
   -0.0030
   -0.0220
   -0.0040
    0.0410
   -0.0125
   -0.0550
   -0.0235
    0.0260
   -0.0045
    0.0065
    0.0030
    0.0001
   -0.0060];



myx0 = [x0;phip;B;phac;t_CR];
p_g = zeros([tot_basis_num+not_optimal_parms,1]);

myx = myx0;
for b = 1:testNum
    for a = 1:size(scan_idx,2)
        fprintf('test idx = %d, scan id = %d\n', b, scan_idx(a));
        id = scan_idx(a);
        [ans_x, ans_val] = To_find_min(myx, id);
        myx(id) = ans_x;
        myx(1:tot_basis_num)
        XI_Import(myx)
    end
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
global scan
Buf = XI_Import(myx0);

center = myx0(idx);
myxL = myx0;
myxL(idx) = center - scan;
BufL = XI_Import(myxL);

myxLL = myx0;
myxLL(idx) = center - scan * 2;
BufLL = XI_Import(myxLL);

[ans_x, ans_val] = To_left_find_min(center-2*scan, center-scan, center, BufLL, BufL, Buf, myx0, idx);

if(ans_x ~= center)
    return
end

myxR = myx0;
myxR(idx) = center + scan;
BufR = XI_Import(myxR);

myxRR = myx0;
myxRR(idx) = center + 2*scan;
BufRR = XI_Import(myxRR);
[ans_x, ans_val] = To_right_find_min(center, center+scan, center+2*scan, Buf, BufR, BufRR, myx0, idx);

end



function [ans_x, ans_val] = To_left_find_min(L, M, R, L_val, M_val, R_val, myx0, idx)
global scan
fprintf('To_left: (L,M,R) = (%f, %f, %f); (L_val,M_val,R_val) = (%e, %e, %e)\n', L, M, R, L_val, M_val, R_val);
LMR_min = min([L_val, M_val, R_val]);

if(LMR_min == R_val)
    ans_x = R;
    ans_val = R_val;
    return;
end

if(LMR_min == M_val)
    myx = myx0;
    myx(idx) = M - 2*scan;
    Buf = XI_Import(myx);
   [ans_x, ans_val] = To_left_find_min(M - 2*scan, M - scan, M, Buf, L_val, M_val, myx0, idx); 
   return;
end

myx = myx0;
myx(idx) = L - scan;
Buf = XI_Import(myx);

myx1 = myx0;
myx1(idx) = L - 2*scan;
Buf1 = XI_Import(myx1);

[ans_x, ans_val] = To_left_find_min(L - 2*scan, L - scan, L, Buf1, Buf, L_val, myx0, idx); 

return
end


function [ans_x, ans_val] = To_right_find_min(L, M, R, L_val, M_val, R_val, myx0, idx)
global scan
fprintf('To_right: (L,M,R) = (%f, %f, %f); (L_val,M_val,R_val) = (%e, %e, %e)\n', L, M, R, L_val, M_val, R_val);
LMR_min = min([L_val, M_val, R_val]);

if(LMR_min == L_val)
    ans_x = L;
    ans_val = L_val;
    return;
end

if(LMR_min == M_val)
    myx = myx0;
    myx(idx) = M + 2*scan;
    Buf = XI_Import(myx);
   [ans_x, ans_val] = To_right_find_min(M, M + scan, M + 2*scan, M_val, R_val, Buf, myx0, idx); 
   return;
end

myx = myx0;
myx(idx) = R + scan;
Buf = XI_Import(myx);

myx1 = myx0;
myx1(idx) = L + 2*scan;
Buf1 = XI_Import(myx1);

[ans_x, ans_val] = To_right_find_min(R, R + scan, R + 2*scan, R_val, Buf, Buf1, myx0, idx); 

return
end


