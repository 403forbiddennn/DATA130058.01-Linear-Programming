function [basic_index, x_b, flag] = phase1(A, b, eps)
    [m, n] = size(A);
    flag = 0;
    %----------------------------------------------------------------------
    for i = 1:m
        if b(i) < 0
            A(i,:) = A(i,:) * (-1);
            b(i) = b(i) * (-1);
        end
    end
    % Set b>0
    %----------------------------------------------------------------------
    basic_index_new = n+1:n+m;
    A_tilde = [A, eye(m)];
    c = [zeros(1,n),ones(1,m)];
    c = c';
    x = [zeros(1,n),b'];
    x = x';
    [~,optimal_val,basic_index,x_b] = phase2(basic_index_new, A_tilde, c, x, eps, 1);
    if abs(optimal_val) > eps
        flag = 1;
    end
end