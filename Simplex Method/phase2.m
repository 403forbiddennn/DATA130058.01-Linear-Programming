function [x_opt,optimal_val,basic_index,x_b] = phase2(basic_index, A, c, x, eps, phase, mute)
    [m,n] = size(A);
    c_b = c(basic_index);
    B = A(:,basic_index);
    x_b = x(basic_index);
    optimal_cost = -c_b' * x_b;
    if B == eye(m)
        tableau = A;
    else
        tableau = B\A;
    end
    reduced_cost = c' - c_b'*tableau;
    iter_count = 0;
    while min(reduced_cost)<0 && abs(min(reduced_cost))>eps
        tableau(abs(tableau)<eps) = 0;
        [~,in_basis] = max(reduced_cost<0);
        min_val = Inf;
        out_basis = -1;
        for i = 1:m
            if tableau(i,in_basis)>0 && x_b(i)/tableau(i,in_basis)<min_val
                out_basis = i;
                min_val = x_b(i)/tableau(i,in_basis);
            end
        end
        if out_basis == -1
            x_opt = [];
            optimal_val = -Inf;
            return
        end
        basic_index(out_basis) = in_basis;
        x_b(out_basis) = x_b(out_basis)/tableau(out_basis, in_basis);
        tableau(out_basis,:) = tableau(out_basis,:)/tableau(out_basis, in_basis);
        for i = 1:m
            if i == out_basis
                continue
            end
            x_b(i) = -x_b(out_basis)*(tableau(i, in_basis)/tableau(out_basis, in_basis)) + x_b(i);
            tableau(i,:) = -tableau(out_basis,:)*(tableau(i, in_basis)/tableau(out_basis, in_basis)) + tableau(i,:);
        end
        optimal_cost = -x_b(out_basis)*(reduced_cost(in_basis)/tableau(out_basis, in_basis)) + optimal_cost;
        reduced_cost = -tableau(out_basis,:)*(reduced_cost(in_basis)/tableau(out_basis, in_basis)) + reduced_cost;
        iter_count = iter_count+1;
        if phase == 2 && ~mute
            fprintf('--------------------Iteration: %d------------------------\n', iter_count)
            bfs_cur = zeros(n,1);
            bfs_cur(basic_index) = x_b;
            fprintf('extreme point:')
            disp(bfs_cur')
            fprintf('oject value:')
            disp(-optimal_cost)
            fprintf('reduced cost:')
            disp(reduced_cost)
        end
    end
    if phase == 1 && abs(optimal_cost) < eps
        for i = 1:m
            if basic_index(i) > n-m
                out_basis = i;
                for j = 1:n-m
                    if abs(tableau(out_basis,j)) > eps
                        basic_index(out_basis) = j;
                        tableau(out_basis,:) = tableau(out_basis,:)/tableau(out_basis, j);
                        for k = 1:m
                            if k == out_basis
                                continue
                            end
                            tableau(k,:) = -tableau(out_basis,:)*(tableau(k, j)/tableau(out_basis, j)) + tableau(k,:);
                        end
                        break
                    end
                end
            end
        end
    end
    x_opt = zeros(n,1);
    x_opt(basic_index) = x_b;
    optimal_val = -optimal_cost;
end