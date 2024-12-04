#! /usr/bin/env python

import subprocess
from itertools import product, combinations
from argparse import ArgumentParser

def load_instance(input_file_name):
    global SUBSETS_COUNT, MAXCUTS_COUNT, VERTEX_COUNT, EDGE_COUNT
    vertices = []
    edges = []
    with open(input_file_name, "r") as file:
        SUBSETS_COUNT = int(next(file))
        MAXCUTS_COUNT = int(next(file))
        for line in file:
            line = line.split()
            if line:
                vertex = int(line[0])
                vertices.append(vertex)
                for i in range(1, len(line)):
                    edge = (vertex, int(line[i]))
                    if (edge[1], edge[0]) not in edges:
                        edges.append(edge)
        VERTEX_COUNT = len(vertices)
        EDGE_COUNT = len(edges)
    return vertices, edges

def vertex_in_setID(v, j):
    return (v - 1) * SUBSETS_COUNT + j
def edge_is_cutID(edge, edges):
    return VERTEX_COUNT * SUBSETS_COUNT + edges.index(edge) + 1

def encode(vertices, edges):
    cnf = []
    vars_count = VERTEX_COUNT * SUBSETS_COUNT + EDGE_COUNT

    # Every subset must be non-empty
    for j in range(1, SUBSETS_COUNT + 1):
        c = []
        for v in vertices:
            c.append(vertex_in_setID(v, j))
        c.append(0)
        cnf.append(c)

    # Vertex in at least one subset:
    for v in vertices:
        c = []
        for j in range(1, SUBSETS_COUNT + 1):
            c.append(vertex_in_setID(v, j))
        c.append(0)
        cnf.append(c)

    # Vertex in at most one subset:
    for v in vertices:
        for a in range(1, SUBSETS_COUNT + 1):
            for b in range(a + 1, SUBSETS_COUNT + 1):
                cnf.append([-vertex_in_setID(v, a), -vertex_in_setID(v, b), 0])

    # Edge (u, v) is cut if and only if u and v are in different subsets
    for e in edges:
        u, v = e
        for i in range(1, SUBSETS_COUNT + 1):
            # If u and v are in the same subset, the edge (u, v) is not a cut
            cnf.append([-vertex_in_setID(u, i), -vertex_in_setID(v, i), -edge_is_cutID(e, edges), 0])
            
            # If u is in subset i and v is not, the edge (u, v) is a cut
            cnf.append([-vertex_in_setID(u, i), vertex_in_setID(v, i), edge_is_cutID(e, edges), 0])
            
            # If v is in subset i and u is not, the edge is a cut
            cnf.append([vertex_in_setID(u, i), -vertex_in_setID(v, i), edge_is_cutID(e, edges), 0])

    # The number of cuts <= MAXCUTS_COUNT
    edge_subsets = list(combinations(edges, MAXCUTS_COUNT + 1))
    for subset in edge_subsets:
        c = []
        for e in subset:
            c.append(-edge_is_cutID(e, edges))
        c.append(0)
        cnf.append(c)

    return cnf, vars_count

def call_solver(cnf, nr_vars, output_name, solver_name, verbosity):
    # print CNF into formula.cnf in DIMACS format
    with open(output_name, "w") as file:
        file.write("p cnf " + str(nr_vars) + " " + str(len(cnf)) + '\n')
        for clause in cnf:
            file.write(' '.join(str(lit) for lit in clause) + '\n')

    # call the solver and return the output
    return subprocess.run(['./' + solver_name, '-model', '-verb=' + str(verbosity) , output_name], stdout=subprocess.PIPE)

def print_result(result, edges):
    for line in result.stdout.decode('utf-8').split('\n'):
        print(line)                 # print the whole output of the SAT solver to stdout, so you can see the raw output for yourself

    # check the returned result
    if (result.returncode == 20):       # returncode for SAT is 10, for UNSAT is 20
        return

    # parse the model from the output of the solver
    # the model starts with 'v'
    model = []
    for line in result.stdout.decode('utf-8').split('\n'):
        if line.startswith("v"):    # there might be more lines of the model, each starting with 'v'
            vars = line.split(" ")
            vars.remove("v")
            for v in vars:
                model.append(int(v))
    model.pop() # 0 is the end of the model, just ignore it

    print()
    print("##################################################################")
    print("###########[ Human readable result of the tile puzzle ]###########")
    print("##################################################################")
    print()

    for var in model:
        if var > 0:
            if var <= VERTEX_COUNT * SUBSETS_COUNT:
                v = (var - 1) // SUBSETS_COUNT + 1
                subset = (var - 1) % SUBSETS_COUNT + 1
                print("Vertex " + str(v) + " is in subset: " + str(subset) + ".")
            else:
                index = var - VERTEX_COUNT * SUBSETS_COUNT - 1
                print("Edge " + str(edges[index]) + " is a cut.")

if __name__ == "__main__":

    parser = ArgumentParser()

    parser.add_argument(
        "-i",
        "--input",
        default="input.in",
        type=str,
        help=(
            "The instance file."
        ),
    )
    parser.add_argument(
        "-o",
        "--output",
        default="formula.cnf",
        type=str,
        help=(
            "Output file for the DIMACS format (i.e. the CNF formula)."
        ),
    )
    parser.add_argument(
        "-s",
        "--solver",
        default="glucose-syrup",
        type=str,
        help=(
            "The SAT solver to be used."
        ),
    )
    parser.add_argument(
        "-v",
        "--verb",
        default=1,
        type=int,
        choices=range(0,2),
        help=(
            "Verbosity of the SAT solver used."
        ),
    )
    args = parser.parse_args()

    vertices, edges = load_instance(args.input)
    cnf, vars_count = encode(vertices, edges)
    result = call_solver(cnf, vars_count, args.output, args.solver, args.verb)
    print_result(result, edges)
