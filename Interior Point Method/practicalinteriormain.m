function [x_cur, opt_val] = practicalinteriormain(A, b, c, eta, eps)
    [x_cur, lambda_cur, s_cur] = find_start(A, b, c);
    exit_flag = false;
    rc = A'*lambda_cur + s_cur - c;
    rb = A*x_cur - b;
    while ~exit_flag
        [x_cur, lambda_cur, s_cur, rb_cur, rc_cur] = update_step(x_cur, ...
            lambda_cur, s_cur, A, b, c, eta);
%         fprintf('duality gap:%f\n', duality_gap)
%         if duality_gap > old_duality_gap
%             x_cur = [];
%             opt_val = [];
%             fprintf('This problem is infeasible or unbounded!')
%             return
%         end
        if norm(rb_cur) > norm(rb)*1e2
            x_cur = [];
            opt_val = -Inf;
            fprintf('This problem is unbounded!\n')
            return
        end
        if norm(rc_cur) > norm(rc)*1e2
            x_cur = [];
            opt_val = [];
            fprintf('This problem is infeasible!\n')
            return
        end
        duality_gap = x_cur'*s_cur / numel(x_cur);
        if duality_gap < eps
            exit_flag = true;
        end
    end
    opt_val = c'*x_cur;
end