function [update_x, update_lambda, update_s] = solve_eq(A, x, s, rb, rc, ...
    rxs)
    D_square = diag(x./s);
    lhs = A*D_square*A';
    rhs = -rb - A*((x./s).*rc) + A*(rxs./s);
    opts.SYM = true;
    opts.TRANSA = false;
    update_lambda = linsolve(lhs, rhs, opts);
    update_s = -rc - A'*update_lambda;
    update_x = -rxs./s - (x./s).*update_s;
end