function [w,util] = cal_w_util(k,n,meu,landa)


% calculate R
R = zeros(1,n);
for i = 1 : n
    if i <= k
        R(i) = ((landa/meu)^i)/factorial(i);
    else
        R(i) = ((landa/meu)^k)/factorial(k)*((landa/(k*meu))^(i-k));
    end
end

% calculate Po & Pi
P0 = 1/(1+sum(R));
Pi = P0 * R; 

% calculate taw, taw_i & taw_s
i = 0 : n-1;
taw = sum(Pi.*i);

taw_i = zeros(1,n);
for i = 1 : n
    if i < k
        taw_i(i) = (i) * Pi(i);
        %taw_i(i) = (i-1) * Pi(i);
    else
        taw_i(i) = k * Pi(i);
    end
end

taw_s = sum(taw_i);

w = taw / landa;
util = taw_s / k;

end