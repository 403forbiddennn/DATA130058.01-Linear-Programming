**This is my implementation of Interior Point Method following the pseudocode of alg 14.3 presented in textbook Numerical Optimization.** 

+ [find_start.m](./find_start.m) is a function returning the starting point of IPM;
+ [solve_eq.m](./find_start.m) is able to solve the linear system. The Matlab function <tt>linsolve</tt> is used to solve this system with symmetry property used;
+ [step_length.m](./step_length.m) is used to compute the step length of both predictor and corrector step;
+ [update_step.m](./update_step.m) implements one iteration of IPM;
+ [practicalinteriormain.m](./practicalinteriormain.m) is the main body of my IPM solver;
+ [test_ipm.m](./test_ipm.m) is the test script of our program, containing five test problems;
+ [test_logs.txt](./test_logs.txt) is the log of [test_ipm.m](./test_ipm.m) running in my computer (MacOS Monterey M1 Pro).