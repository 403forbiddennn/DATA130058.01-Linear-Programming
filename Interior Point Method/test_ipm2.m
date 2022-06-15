clear
clc
warning('off','all')
eta = 0.95; eps = 1e-10;
diary("test_ipm2_logs.txt")
%-------------------Problem 1-------------------
fprintf('-----------------Problem 1: scrs8-----------------\n')
example = load('scrs8.mat');
A = example.A;
b = example.b;
c = example.c;

tic
[~, f_val] = practicalinteriormain(A, b, c, eta, eps);
elapsed_time1 = toc;
fprintf('optimal value by my solver: %f\n', f_val)
tic
[~, f_val_gurobi] = linprog(c, [], [], A, b, zeros(numel(c),1), []);
elapsed_time2 = toc;
fprintf('optimal value by Gurobi: %f\n', f_val_gurobi)
fprintf('time cost of my solver: %f\n', elapsed_time1)
fprintf('time cost of gurobi: %f\n', elapsed_time2)

%-------------------Problem 2-------------------
fprintf('-----------------Problem 2: nug08-----------------\n\n')
example = load('nug08.mat');
A = example.A;
b = example.b;
c = example.c;

tic
[~, f_val] = practicalinteriormain(A, b, c, eta, eps);
elapsed_time1 = toc;
fprintf('optimal value by my solver: %f\n', f_val)
tic
[~, f_val_gurobi] = linprog(c, [], [], A, b, zeros(numel(c),1), []);
elapsed_time2 = toc;
fprintf('optimal value by Gurobi: %f\n', f_val_gurobi)
fprintf('time cost of my solver: %f\n', elapsed_time1)
fprintf('time cost of gurobi: %f\n', elapsed_time2)

%-------------------Problem 3-------------------
fprintf('-----------------Problem 3: e226-----------------\n\n')
example = load('e226.mat');
A = example.A;
b = example.b;
c = example.c;

tic
[~, f_val] = practicalinteriormain(A, b, c, eta, eps);
elapsed_time1 = toc;
fprintf('optimal value by my solver: %f\n', f_val)
tic
[~, f_val_gurobi] = linprog(c, [], [], A, b, zeros(numel(c),1), []);
elapsed_time2 = toc;
fprintf('optimal value by Gurobi: %f\n', f_val_gurobi)
fprintf('time cost of my solver: %f\n', elapsed_time1)
fprintf('time cost of gurobi: %f\n', elapsed_time2)

diary("off")