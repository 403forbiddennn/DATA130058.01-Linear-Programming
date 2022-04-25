function [x_opt,optimal_val] = simplex_self(A,b,c,eps,mute)
    [basic_index, x_b, flag] = phase1(A, b, eps);
    if flag == 1
        fprintf('No feasible solution found!\n')
        x_opt = [];
        optimal_val = [];
        return
    end
%     drop_index = [];
%     [~,n] = size(A);
%     for i = 1:length(basic_index)
%         if basic_index > n
%             drop_index(end+1) = i;
%         end
%     end
%     A(drop_index,:) = [];
%     basic_index(drop_index) = [];
    [~,n] = size(A);
    x = zeros(n,1);
    x(basic_index) = x_b;
    [x_opt,optimal_val] = phase2(basic_index, A, c, x, eps, 2, mute);
    if optimal_val == -Inf
        fprintf('This LP problem is unbounded!\n')
        return
    end
end