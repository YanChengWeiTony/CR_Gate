function [ output_args ] = Read_Fid( input_args )
%% Find C
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

for a=1:16
    buf_s = state(:,a);
    buf_rho = buf_s * buf_s';
    rho_in(:,a) = transfer_matrix(buf_rho);
end

% for a=1:16
%     rho_out(:,a) = C(:,:) * rho_in(:,a);
% end

% rho_out(:,1)
%% IO
rho_out = zeros([16, 16]);

fileI = fopen('Fid_r_30000.txt','r');
data = fscanf(fileI, '%f', [16, 16]);
rho_out_r = transpose(data);
fclose(fileI);

fileI = fopen('Fid_i_30000.txt','r');
data = fscanf(fileI, '%f', [16, 16]);
rho_out = rho_out_r + 1j * transpose(data);
fclose(fileI);

%% Derive C
% for a=1:16
%     fprintf('%2.6f ', real(rho_out(a, :)))
%     fprintf('\n')
% end
% fprintf('\n\n')
% for a=1:16
%     fprintf('%2.6f ', imag(rho_out(a, :)))
%     fprintf('\n')
% end

C_der = rho_out / (rho_in);

Fid_rho = ( abs(trace(C'*C_der))/sqrt(trace(C'*C) * trace(C'*C)) )
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
