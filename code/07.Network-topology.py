import igraph as ig
import pandas as pd

edge_file = "Pal_net.txt"

edges = []
directed_edges = []
nodes_set = set()

with open(edge_file, "r") as f:
    for line in f:
        parts = line.strip().split()
        if len(parts) < 4:
            continue
        node1, node2, directed = parts[0], parts[1], parts[3]
        edges.append((node1, node2))
        nodes_set.update([node1, node2])
        directed_edges.append(directed == "1")

nodes_list = list(nodes_set)
node_index = {node: i for i, node in enumerate(nodes_list)}

edges = [(node_index[n1], node_index[n2]) for n1, n2 in edges]

is_directed = any(directed_edges)
G = ig.Graph(edges, directed=is_directed)

total_degree = G.degree()
out_degree = G.outdegree() if is_directed else total_degree
in_degree = G.indegree() if is_directed else total_degree

df = pd.DataFrame({
    "Node": nodes_list,
    "Total Degree": total_degree,
    "Out-degree": out_degree,
    "In-degree": in_degree,
})

df = df.sort_values(by="In-degree", ascending=False)
df.to_csv("network_analysis_results.csv", index=False)
