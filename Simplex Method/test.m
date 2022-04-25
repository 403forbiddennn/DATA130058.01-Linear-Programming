clear
clc
eps = 1e-10;
%-------------------Problem 1-------------------
A = [1,2,2,1,0,0;2,1,2,0,1,0;2,2,1,0,0,1];
b = [20;20;20];
c=[-10;-12;-12;0;0;0];
fprintf('-----------------Problem 1: Normal Case-----------------\n')
[~, f_val] = simplex_self(A, b, c, eps, true);
fprintf('optimal_value: %f\n', f_val)

%-------------------Problem 2-------------------
A = [1,1,0,1,0;0,-1,1,0,1];
b = [8;0];
c = [-1;-1;-1;0;0];
fprintf('\n-----------------Problem 2: Degenerate Case-----------------\n\n')
[~, f_val] = simplex_self(A, b, c, eps, true);
fprintf('optimal_value: %f\n', f_val)

%-------------------Problem 3-------------------
A =  [1,3,2,1;0,1,2,0;-1,0,2,1];
b =  [3;2;-3];
c = [2;3;1;2];
fprintf('\n-----------------Problem 3: Infeasible Case-----------------\n\n')
[~, ~] = simplex_self(A, b, c, eps, true);

%-------------------Problem 4-------------------
A = [1,0,0,-5,0,-1;0,1,1,-1,0,1;0,0,1,-2,1,0];
b = [5;4;2];
c = [0;0;-3;2;0;-3];
fprintf('\n-----------------Problem 4: Unbounded Case-----------------\n\n')
[~, f_val] = simplex_self(A, b, c, eps, true);
fprintf('optimal_value: %f\n', f_val)

%-------------------Problem 5-------------------
m = 10;
n = 15;
A = randn(m, n);
b = randn(m, 1);
c = randn(n, 1);
fprintf('\n-----------------Problem 5: Random Case-----------------\n\n')
[~, f_val] = simplex_self(A, b, c, eps, true);
[~, f_val_gurobi] = linprog(c, [], [], A, b, zeros(length(c),1), []);
fprintf('my optimal value: %f, gurobi optimal value: %f\n', f_val, f_val_gurobi)
