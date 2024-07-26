

import '../graph/graph.dart';
import '../stack/stack.dart';


extension DepthFirstSearch<E> on Graph<E> {
  List<Vertex<E>> depthFirstSearch(Vertex<E> source) {
    //we create a stack 
    //we create a pushed
    //we create a visited list  
    final stack = Stack<Vertex<E>>();
    final pushed = <Vertex<E>>{};
    final visited = <Vertex<E>>[];


//pushing the vertex in to the stack
//adding the vertex into the pushed
//adding the vertex into the source
    stack.push(source);
    pushed.add(source);
    visited.add(source);

// 
    outerLoop:
    while (stack.isNotEmpty) {
      final vertex = stack.peek;
      final neighbors = edges(vertex);
      for (final edge in neighbors) {
        if (!pushed.contains(edge.destination)) {
          stack.push(edge.destination);
          pushed.add(edge.destination);
          visited.add(edge.destination);
          continue outerLoop;
        }
      }
      stack.pop();
    }
    return visited;
  }
}