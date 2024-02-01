//a graph will have a vertex and a edge . a vertex consist of a data and a index

//a edge consist of a source ,destination and A weighted graph is a graph in which each edge has an associated numerical value called a "weight." This weight often represents some measure of distance, cost, time, or any other relevant metric depending on the specific application of the graph.

class Vertex<T> {
  final int index;
  final T data;
  const Vertex({
    required this.index,
    required this.data,
  });
  @override
  String toString() => data.toString();
}

class Edge<T> {
  const Edge(
    this.source,
    this.destination, [
    this.weight,
  ]);

  final Vertex<T> source;
  final Vertex<T> destination;
  final double? weight;
}

//the edge type can be directed and undirected
enum EdgeType { directed, undirected }

// an abstract class which can be implemented by AdjacencyList and also AdjacenecyMatrix

abstract interface class Graph<E> {
  Iterable<Vertex<E>> get vertices;

  Vertex<E> createVertex(E data);

  void addEdge(
    Vertex<E> source,
    Vertex<E> destination, {
    EdgeType edgeType,
    double? weight,
  });

  List<Edge<E>> edges(Vertex<E> source);

  double? weight(
    Vertex<E> source,
    Vertex<E> destination,
  );
}

class AdjacencyList<E> implements Graph<E> {
  //we create a map of vertexs and for each vertex there will be a List of Edges these are connections
  final Map<Vertex<E>, List<Edge<E>>> _connections = {};
  //we make _nextIndex = 0
  var _nextIndex = 0;
//we get all the keys of connections that is all the vertices of the graph with this method
  @override
  Iterable<Vertex<E>> get vertices => _connections.keys;

//inorder to create a vertex we need a data and we put that data inside th vertex and the index too and we increase the nextindex by 1 for the next vertex's index then we add the vertex which is a key to the map with it's corresponding list as empty
  @override
  Vertex<E> createVertex(E data) {
    final vertex = Vertex(
      index: _nextIndex,
      data: data,
    );
    _nextIndex++;
    _connections[vertex] = [];
    return vertex;
  }

  //this is to addEdge to the connected vertices

  @override
  void addEdge(
    Vertex<E> source,
    Vertex<E> destination, {
    EdgeType edgeType = EdgeType.undirected,
    double? weight,
  }) {
    //we add the edges to the list of edges in the map like this, we will send the source and we will add it in the souce list in the case of directed

    // and we will add into the destination in the case of undirected so there will have reference to the both source and destination
    _connections[source]?.add(
      Edge(source, destination, weight),
    );
    if (edgeType == EdgeType.undirected) {
      _connections[destination]?.add(
        Edge(destination, source, weight),
      );
    }
  }

  //this is to get all the edges from the map

  @override
  List<Edge<E>> edges(Vertex<E> source) {
    return _connections[source] ?? [];
  }

  //this is to search the weight of the edge

  @override
  double? weight(
    Vertex<E> source,
    Vertex<E> destination,
  ) {
    final match = edges(source).where((edge) {
      return edge.destination == destination;
    });
    if (match.isEmpty) return null;
    return match.first.weight;
  }

  @override
  String toString() {
    final result = StringBuffer();
    _connections.forEach((vertex, edges) {
      final destinations = edges.map((edge) {
        return edge.destination;
      }).join(', ');
      result.writeln('$vertex --> $destinations');
    });
    return result.toString();
  }
}

//

class AdjacencyMatrix<E> implements Graph<E> {
  //this is adjacency matrix which contains vertices and the connection between them is defined by a matrix of 1 and 0
  final List<Vertex<E>> _vertices = [];
  final List<List<double?>?> _weights = [];
  var _nextIndex = 0;

  @override
  Iterable<Vertex<E>> get vertices => _vertices;

  @override
  Vertex<E> createVertex(E data) {
    final vertex = Vertex(
      index: _nextIndex,
      data: data,
    );
    _nextIndex++;
    _vertices.add(vertex);
    for (var i = 0; i < _weights.length; i++) {
      _weights[i]?.add(null);
    }
    final row = List<double?>.filled(
      _vertices.length,
      null,
      growable: true,
    );
    _weights.add(row);
    // print(_weights);
    return vertex;
  }

  @override
  void addEdge(
    Vertex<E> source,
    Vertex<E> destination, {
    EdgeType edgeType = EdgeType.undirected,
    double? weight,
  }) {
    _weights[source.index]?[destination.index] = weight;
    if (edgeType == EdgeType.undirected) {
      _weights[destination.index]?[source.index] = weight;
    }
    // print(_weights);
  }

  @override
  List<Edge<E>> edges(Vertex<E> source) {
    List<Edge<E>> edges = [];
    for (var column = 0; column < _weights.length; column++) {
      final weight = _weights[source.index]?[column];
      if (weight == null) continue;
      final destination = _vertices[column];
      edges.add(Edge(source, destination, weight));
    }
    return edges;
  }

  @override
  double? weight(Vertex<E> source, Vertex<E> destination) {
    return _weights[source.index]?[destination.index];
  }

  @override
  String toString() {
    final output = StringBuffer();
    for (final vertex in _vertices) {
      output.writeln('${vertex.index}: ${vertex.data}');
    }
    for (int i = 0; i < _weights.length; i++) {
      for (int j = 0; j < _weights.length; j++) {
        final value = (_weights[i]?[j] ?? '.').toString();
        output.write(value.padRight(6));
      }
      output.writeln();
    }
    return output.toString();
  }
}
