clear;
close all;
home;

L = 100;
error = 10e-5;
M = 50;
N = 100;
D = rand(M,N);
x = zeros(100,1);

for k = 1:L
    x(1:k) = rand(k,1);
    y = D*x;
    gamma_max = norm(D'*y,'inf');
    gamma = 0.01*gamma_max;
    cvx_begin quiet
        cvx_precision low
        variable xhat(N)
        minimize(norm(D*xhat - y,2) + gamma*norm(xhat,1))
    cvx_end
    xh(:,k) = xhat;
    X(:,k) = x;
    normx(k) = norm(xh(:,k)-X(:,k),2);
    if(normx(k) > error)
        normx(k) = 0;
    else
        normx(k) = 1;
    end
end
figure
plot(1:L,normx);
