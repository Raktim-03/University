
import heapq

def dijkstra(graph, start):
    distances = {node: float('inf') for node in graph}
    distances[start] = 0
    queue = [(0, start)]
    
    while queue:
        current_dist, node = heapq.heappop(queue)
        
        for neighbor, weight in graph[node].items():
            new_dist = current_dist + weight
            if new_dist < distances[neighbor]:
                distances[neighbor] = new_dist
                heapq.heappush(queue, (new_dist, neighbor))
    
    return distances

graph = {
    1: {2: 500, 3: 500, 13: 300},
    2: {6: 400, 3: 290, 13: 400},
    3: {2: 290, 4: 550, 1: 500},
    4: {3: 550, 5: 220, 10: 290},
    5: {4: 220, 10: 200, 6: 10},
    6: {5: 10, 2: 400},
    7: {13: 350, 8: 130, 10: 500},
    8: {7: 130, 9: 210},
    9: {8: 210, 12: 350, 11: 350},
    10: {7: 500, 4: 290, 5: 200, 11: 500},
    11: {9: 350, 12: 220, 10: 500},
    12: {9: 350, 11: 220},
    13: {1: 300, 2: 400, 7: 350}
}

shortest_paths = dijkstra(graph, 1)

for node, distance in shortest_paths.items():
    print(f"Distance from Hostel (1) to {node}: {distance}m")
