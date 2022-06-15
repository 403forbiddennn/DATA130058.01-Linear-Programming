function [start_x, start_lambda, start_s] = find_start(A, b, c)
    [~, n] = size(A);
    H = inv(A*A');
    tilde_x = A'*H*b;
    tilde_lambda = H*A*c;
    tilde_s = c-A'*tilde_lambda;
    delta_x = max([-1.5*min(tilde_x), 0]);
    delta_s = max([-1.5*min(tilde_s), 0]);
    hat_x = tilde_x + delta_x*ones(n,1);
    hat_s = tilde_s + delta_s*ones(n,1);
    weight_scalar = hat_x'*hat_s;
    delta_x_new = 0.5*weight_scalar/sum(hat_s);
    delta_s_new = 0.5*weight_scalar/sum(hat_x);
    start_x = hat_x + delta_x_new*ones(n,1);
    start_lambda = tilde_lambda;
    start_s = hat_s + delta_s_new*ones(n,1);
end