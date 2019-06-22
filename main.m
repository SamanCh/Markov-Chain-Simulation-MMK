%% M/M/K modle simulation 

clear; close all; clc;

%% get inputs: mu, landa and k from user;
landa=input ('please enter landa: ');
meu=input ('please enter meu value: ');
n=input ('please enter number of servers: ');

%% calculate w and meu
w = zeros(1,n);
util = zeros(1,n);

for i = 3 : n
k=i;
if (landa/(k*meu))< 1
    [w(i), util(i)] = cal_w_util(k,n,meu,landa);
end
end

%% Plot results
subplot(1,2,1);
bar(w);
xlabel('n')
ylabel('w')
subplot(1,2,2);
bar(util,'g');
b = length(find(util==0));
a = num2str(b);
legend(a);
xlabel(a)
ylabel('utilization')






