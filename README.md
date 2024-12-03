# Graph-partitioning

## Documentation

### Problem description

The graph partitioning problem asks whether it is possible to partition a into $k$ subsets while minimising cuts (edges between the subsets) for a given graph and a $k > 0$.

An example of a valid input formal is:

```
3
4
1 2 5
2 1 3 4
3 2 4
4 2 3 5
5 1 2 4
```
where the first line is the number of subsets $k$, the second number is the maximal number of cuts $C$ and the folowing lines represent each vertex (first number) and it's neighbours (here, vertex $1$ is connected to vertices $2$ and $5$).

This particular example gives the following result:

```
Vertex 1 is in subset 3.
Vertex 2 is in subset 1.
Vertex 3 is in subset 2.
Vertex 4 is in subset 1.
Vertex 5 is in subset 1.
Edge (1, 2) is a cut.
Edge (1, 5) is a cut.
Edge (2, 3) is a cut.
Edge (3, 4) is a cut.
```

### Encoding

The problem is encoded using two sets of variables. Variables $Vertex(u, i)$ represent that vertex $u$ is in subset $i$. Variables $Cut(u, v)$ represent that there is an edge between vertices $u$ and $v$ that is a cut.

To represent the decision problem if there is a solution to partitioning a given graph into $k$ subsets with less than $c$ cuts, we use the following constrains:

- Vertex $u$ is in at least one subset:

    $\bigvee_{i<k} Vertex_{u,i}$
    
    where $k$ represents the number of subsets.

- Vertex $u$ is at most in one subset:

    $\forall{\ (1\le i< j\le k)}:(\neg Vertex_{u,i} \vee \neg Vertex_{u,j})$

    where $j$ and $l$ represent subsets.

- Every subset must be non-empty:

    $\forall{i}:\ \bigvee_{u\in V} Vertex_{u,i}$

    where $V$ represents the set of vertices in a graph.

- Edge $e$ connecting vertices $u$ and $v$ is a cut, if and only if $u$ and $v$ are in different subsets:

    $Cut(u,v) \leftrightarrow \bigvee_{i < k} (Vertex(u, i) \land \neg Vertex(v, i))$ 
    
    where $k$ represents the number of subsets.

- The number of cuts $\le C$:

    $\forall (M\subseteq E, |M| = C + 1):\bigvee_{e \in M}\neg e$

    where $E$ represents the set of edges in a graph.

## User documentaion
Basic usage:
```
python3 graph_partitioning.py [-h] [-i INPUT] [-o OUTPUT] [-s SOLVER] [-v {0,1}]
```

Command-line options:

* `-h`, `--help`: Show a help message and exit.
* `-i INPUT`, `--input INPUT` : The instance file. Default: "input.in".
* `-o OUTPUT`, `--output OUTPUT` : Output file for the DIMACS format (i.e. the CNF formula).
* `-s SOLVER`, `--solver SOLVER` : The SAT solver to be used.
*  `-v {0,1}`, `--verb {0,1}` :  Verbosity of the SAT solver used.
