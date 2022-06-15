function [new_x, new_lambda, new_s, rb_new, rc_new] = update_step(old_x, ...
    old_lambda, old_s, A, b, c, eta)
    
    %------------------predictor step-----------------------
    rc = A'*old_lambda + old_s - c;
    rb = A*old_x - b;
    predictor_duality_measure = old_x.*old_s;
    [predictor_update_x, ~, predictor_update_s] = ...
        solve_eq(A, old_x, old_s, rb, rc, predictor_duality_measure);
    [predictor_step_pri, predictor_step_dual] = step_length(old_x, old_s, ...
        predictor_update_x, predictor_update_s);
    old_mu = old_x'*old_s / numel(old_s);
    aff_mu = (old_x + predictor_step_pri*predictor_update_x)'* ...
        (old_s+predictor_step_dual*predictor_update_s);
    center_measure = (aff_mu/old_mu)^3;
    %------------------corrector step-----------------------
    corrector_duality_measure = predictor_duality_measure + ...
        predictor_update_x.*predictor_update_s - center_measure*old_mu*ones(numel(old_x),1);
    [corrector_update_x, corrector_update_lambda, corrector_update_s] = ...
        solve_eq(A, old_x, old_s, rb, rc, corrector_duality_measure);
    [corrector_step_pri, corrector_step_dual] = step_length(old_x, old_s, ...
        corrector_update_x, corrector_update_s, eta);
    %----------------------update---------------------------
    new_x = old_x + corrector_step_pri*corrector_update_x;
    new_lambda = old_lambda + corrector_step_dual*corrector_update_lambda;
    new_s = old_s + corrector_step_dual*corrector_update_s;
    %----------------------feasibility flag-----------------
    rc_new = A'*new_lambda + new_s - c;
    rb_new = A*new_x - b;
end

