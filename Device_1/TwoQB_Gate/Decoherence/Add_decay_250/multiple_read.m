function multiple_read()
g = [];
T = []

g(1) = Read_Fid( 'Fid_r_30.txt', 'Fid_i_30.txt' );
T(1) = 30;

g(2) = Read_Fid( 'Fid_r_100.txt', 'Fid_i_100.txt' );
T(2) = 100;

g(3) = Read_Fid( 'Fid_r_300.txt', 'Fid_i_300.txt' );
T(3) = 300;

g(4) = Read_Fid( 'Fid_r_1000.txt', 'Fid_i_1000.txt' );
T(4) = 1000;

g(5) = Read_Fid( 'Fid_r_3000.txt', 'Fid_i_3000.txt' );
T(5) = 3000;

g(6) = Read_Fid( 'Fid_r_10000.txt', 'Fid_i_10000.txt' );
T(6) = 10000;

g(7) = Read_Fid( 'Fid_r_30000.txt', 'Fid_i_30000.txt' );
T(7) = 30000;


%% plot
figure(20)
plot(T, g, 'o', 'markersize', 10);
set(gca, 'yscale', 'log')
set(gca, 'xscale', 'log')
set(gca, 'Fontsize', 20)
xlabel('T (\mus)')
ylabel('1-F')

grid on
set(gca,'xminorgrid','off','yminorgrid','off')
ax = gca
ax.GridLineStyle = '-';
ax.GridColor = 'k';
ax.GridAlpha = 1;

end


function [ g_rho] = Read_Fid( path_r, path_i )
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

fileI = fopen(path_r,'r');
data = fscanf(fileI, '%f', [16, 16]);
rho_out = transpose(data);
fclose(fileI);

fileI = fopen(path_i,'r');
data = fscanf(fileI, '%f', [16, 16]);
rho_out = rho_out + 1j * transpose(data);
fclose(fileI);

%% Derive C

C_der = rho_out * inv(rho_in);

Fid_rho = ( abs(trace(C'*C_der))/sqrt(trace(C'*C) * trace(C'*C)) );
g_rho = 1 - Fid_rho;

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
