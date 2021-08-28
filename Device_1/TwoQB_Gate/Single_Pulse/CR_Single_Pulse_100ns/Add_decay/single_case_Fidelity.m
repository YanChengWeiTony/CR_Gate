function [ output_args ] = single_case_Fidelity( input_args )

%% Parms
phip = -0.090;
phac = 3.13;

input0 = [    
       0.2667227740
     0.0015766939
     0.0628411096
     0.0026545427
     -0.0048836012
     -0.0000483304
     -0.0299404237
     
     0.0316206248
     0.0028568920
     -0.0030375420
     -0.0130287819
     0.0051860688
     0.0024082959
     -0.0059280940
     
     -0.0067211950
     0.0338522841
     0.0429787143
     0.0046057440
     -0.0109991782
     0.0060465919
     0.0017893677
     
     0.0000066283
     0.0016084321
     0.0020415771
     -0.0007485553
     -0.0033182626
     -0.0000477608
     0.0009937508
     
     -1.3984919504
 phip
 phac
 ];


p_g = zeros([size(input0, 1),1]);

%% Ideal 
C = Find_Coef();


%% Prepare Basis
% state
E = eye(4);
state = zeros([4, 16]);

for a=1:4
    state(:,a) = E(:,a);
end

state(:,5) = 1/sqrt(2) * (E(:,1) + E(:,2));
state(:,6) = 1/sqrt(2) * (E(:,1) + 1i*E(:,2));

state(:,7) = 1/sqrt(2) * (E(:,1) + E(:,3));
state(:,8) = 1/sqrt(2) * (E(:,1) + 1i*E(:,3));

state(:,9) = 1/sqrt(2) * (E(:,1) + E(:,4));
state(:,10) = 1/sqrt(2) * (E(:,1) + 1i*E(:,4));

state(:,11) = 1/sqrt(2) * (E(:,2) + E(:,3));
state(:,12) = 1/sqrt(2) * (E(:,2) + 1i*E(:,3));

state(:,13) = 1/sqrt(2) * (E(:,2) + E(:,4));
state(:,14) = 1/sqrt(2) * (E(:,2) + 1i*E(:,4));

state(:,15) = 1/sqrt(2) * (E(:,3) + E(:,4));
state(:,16) = 1/sqrt(2) * (E(:,3) + 1i*E(:,4));

% rho
rho_in = zeros(16, 16);
rho_out = zeros(16, 16);

for a=1:16
    buf_s = state(:,a);
    buf_rho = buf_s * buf_s';
    rho_in(:,a) = transfer_matrix(buf_rho);
end


%% Run-probe

% T
T = 1E3 * 3000 *[1, 1, 1, 1];

for a=1:16
%     rho_out(:,a) = C(:,:) * rho_in(:,a);
    a
    [rho_out(:, a), g_out] = T1_T2_Import(input0, state(:,a), T);
    g_out
end



%% IO
fileID_r = fopen('Fid_r_3000.txt','w');
for a=1:16
    fprintf(fileID_r,'%2.6f',real(rho_out(a,:)));
    fprintf(fileID_r, '\n');
end
fclose(fileID_r);

fileID_i = fopen('Fid_i_3000.txt','w');
for a=1:16
    fprintf(fileID_i,'%2.6f',imag(rho_out(a,:)));
    fprintf(fileID_i, '\n');
end
fclose(fileID_i);
%% Derive C
rho_out
C_der = rho_out * (rho_in)^-1;

Fid_rho = trace(C'*C_der)/sqrt(trace(C'*C) * trace(C'*C))
g_rho = 1 - Fid_rho
end

function rho_out = transfer_matrix(rho_in)
rho_out = reshape(transpose(rho_in), [16,1]);
end


function[C] = Find_Coef()
E = eye(4);

x = [0, 1;1 0];
y = [0, -1j; 1j, 0];
z = [1, 0; 0, -1];
zx = kron(z,x);

U_I = (eye(4) + 1j * zx) / 2^.5;

C = zeros([16, 16]);
for i=1:4
    for j=1:4
        for a=1:4
            for b=1:4
                C(4*(a-1) + b, 4*(i-1) + j) = (E(a, :) * U_I * E(:, i)) * (E(j, :) * (U_I)' * E(:, b));
            end
        end
    end
end

end

