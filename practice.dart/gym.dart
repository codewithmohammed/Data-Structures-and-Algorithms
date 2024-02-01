class BinaryNode1<E> {
  E memberId;
  E name;
  BinaryNode1(this.memberId, this.name);
  BinaryNode1<E>? leftNode;
  BinaryNode1<E>? rightNode;
}

class BinarySearch1<E extends Comparable<E>> {
  BinaryNode1? root;

  void insert(E memberId, E name) {
    root = _insert1(memberId, name, root);

  }

  BinaryNode1? _insert1(E memberId, E name, BinaryNode1? node) {
    if (node == null) {
      return BinaryNode1(memberId, name);
    }
    if (memberId.compareTo(node.memberId) > 0) {
      node.rightNode = _insert1(memberId, name, node.rightNode);
    } else {
      node.leftNode = _insert1(memberId, name, node.leftNode);
    }
    return node;
  }

  String? search(E memberId) {
    var current = root;
    while (current != null) {
      if (current.memberId == memberId) {
        return current.name;
      }

      if (memberId.compareTo(current.memberId) > 0) {
        current = current.rightNode;
      } else {
        current = current.leftNode;
      }
    }
    return 'member not registered';
  }
}
