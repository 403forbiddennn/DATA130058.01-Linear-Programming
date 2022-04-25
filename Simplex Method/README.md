+ [phase1.m](./phase1.m) is the implementation of the first phase of simplex method, also known as finding the inital basic feasible solution, where we have three inputs: 

    + A: input matrix
    + b: the right hand of equality constraints
    + eps: the tolerance to set zero

    And the outputs are:

    + basic_index: basic_index found by solving auxiliary problem
    + x_b: non-zero parts of BFS corresponding with basic_index
    + flag: flag == 1 means that this prolem is infeasible, and no need to run the second phase

+ [phase2.m](./phase2.m) is the implementation of the second phase of simplemx method, which is used to update the tableau. Here the inputs are:

    + basic_index: indices of basic variables
    + A: input matrix
    + c: object variable
    + x: starting point
    + eps: tolerance same as above
    + phase: a flag used to identify if this is the first phase call or the second phase call, as in the first phase call, we have to drive artificial variables out of basis if necessary
    + mute: a flag used to control solving history. Specifically, if mute is false, then the solver will print out every extreme point it reached during the process, and will print out nothing if it is true

    And the outputs are:

    + x_opt: optimal solution
    + optimal_val: optimal value
    + basic_index: this is for the first phase, return the basic indices of the inital extreme point
    + x_b: this is for the first phase, return the basic feasible solution

+ [simplex_self.m](./simplex_self.m) is my implementation of the simplex method. It has five inputs:

    + A: input matrix
    + b: right hand of equality constraint
    + c: objective variable
    + eps: tolerance, same as above
    + mute: same as above

    And the outputs are:

    + x_opt: optimal solution, specifically, if the problem is **infeasible** or unbounded, then it will be returned as *[]*
    + optimal_val: optimal value, specifically, if the problem is **infeasible**, it will be returned as *[]*, and if the problem is **unbounded**, it will be returned as *-Inf*

+ [test.m](./test.m) is a test file that contains five problems. The first problem is a normal case from the textbook; the second problem is a degenerate case to test if this program will run into cycling; the third problem is an infeasible case, where the program will output **"No feasible solution found!"** as Gurobi does; the fourth problem is an unbounded case, where the program will print **"This LP problem is unbounded!"**; the last problem is a random case, where we don't set a seed so that you can feel free to test my program, besides, we use the Gurobi solver so that you can find if my output is right.

> **Notice that in this version of my implementation, the assumption of input matrix A is full rank always holds, and the input problem is in standard form!!!**

