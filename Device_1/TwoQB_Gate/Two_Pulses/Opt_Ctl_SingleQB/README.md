## FRAME: Second's Qubit's dressed state

## Goal: First Qubit X gate

1. Applying fx, fy to 1st qubit (FREQ: 1st qb's dressed state)
2. Also Applying fx, fy to 2nt qubit (FREQ: 2nd qb's dressed state)

## Description:
1. scan_pg: check if the parameter's gradients match the true values
2. Opt_GRAPH_0th: Use graph to tune the parameters
3. Scan_Find_Min: Brute-force searching the optimal parameters that minimizes the infidelity

I eventually use "Scan_Find_Min" here because it gives the smaller infidelity.
