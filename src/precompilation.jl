using PrecompileTools: @compile_workload, @setup_workload

@setup_workload begin
    @compile_workload begin
        # Precompile the most common LCP workflow:
        # Creating a problem with Float64 matrices and solving it

        # Simple 2x2 LCP problem
        M = [2.0 1.0; 1.0 2.0]
        q = [-1.0, -1.0]

        # Create LCP problem (most common entry point)
        prob = LinearComplementarityProblem(M, q)

        # Solve with default solver (NonlinearReformulation with SimpleNewtonRaphson)
        sol = solve(prob)

        # Common explicit solvers
        solve(prob, PGS())
        solve(prob, RPSOR())
        solve(prob, BokhovenIterativeAlgorithm())
    end
end
