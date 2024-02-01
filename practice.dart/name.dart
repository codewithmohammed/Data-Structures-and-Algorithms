class BinaryNode2<E> {
  E name;
  BinaryNode2<E>? leftNode;
  BinaryNode2<E>? rightNode;
  BinaryNode2(this.name);
}

class BinarySearchTree2<E extends Comparable<E>> {
  BinaryNode2? root;
  void insert(E name) {
    root = _insert(name, root);
  }

  BinaryNode2? _insert(E name, BinaryNode2? node) {
    if (node == null) {
      return BinaryNode2(name);
    }
    if (name.compareTo(node.name) > 0) {
      node.rightNode = _insert(name, node.rightNode);
    } else {
      node.leftNode = _insert(name, node.leftNode);
    }
    return node;
  }

  String? search(E value) {
    var current = root;
    while (current != null) {
      if (current.name == value) {
        return value.toString();
      }
      if (value.compareTo(current.name) > 0) {
        current = current.rightNode;
      } else {
        current = current.leftNode;
      }
    }
    return 'current.name';
  }
  @override
  String toString() => root.toString();
}
