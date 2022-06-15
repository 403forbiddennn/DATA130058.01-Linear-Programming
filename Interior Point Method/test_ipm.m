clear
clc
warning('off','all')
eta = 0.95; eps = 1e-10;
%-------------------Problem 1-------------------
fprintf('-----------------Problem 1: Feasible Case-----------------\n')
A = [1,2,2,1,0,0;2,1,2,0,1,0;2,2,1,0,0,1];
b = [20;20;20];
c = [-10;-12;-12;0;0;0];
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
fprintf('-----------------Problem 2: Feasible Case-----------------\n')
A = [1,1,0,1,0;0,-1,1,0,1];
b = [8;0];
c = [-1;-1;-1;0;0];
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
fprintf('-----------------Problem 3: Infeasible Case-----------------\n')
A =  [1,3,2,1;0,1,2,0;-1,0,2,1];
b =  [3;2;-3];
c = [2;3;1;2];
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

%-------------------Problem 4-------------------
fprintf('-----------------Problem 4: Unbounded Case-----------------\n')
A = [1,0,0,-5,0,-1;0,1,1,-1,0,1;0,0,1,-2,1,0];
b = [5;4;2];
c = [0;0;-3;2;0;-3];
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

%-------------------Problem 5-------------------
fprintf('-----------------Problem 5: Random Case-----------------\n')
m = 400;
n = 200;
A = rand(m,n);
x_gen = rand(n,1);
b = A*x_gen;
c = rand(n,1);
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