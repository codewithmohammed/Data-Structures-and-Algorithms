class Node<K> {
  K key;
  K value;
  Node<K>? next;

  Node({required this.key, required this.value, this.next});
}

class HLinkedList<E> extends Iterable<E> {
  Node<E>? head;
  Node<E>? tail;

  @override
  bool get isEmpty => head == null;

  @override
  String toString() {
    if (isEmpty) return 'Empty list';

    Node<E>? current = head;
    String result = '';

    while (current != null) {
      result += current.value.toString();
      if (current.next != null) {
        result += ' -> ';
      }
      current = current.next;
    }

    return result;
  }

  String reverseList() {
    if (isEmpty) return 'Empty list';

    List<E> values = [];

    Node<E>? current = head;

    while (current != null) {
      values.insert(0, current.value);
      current = current.next;
    }
    return values.join(' -> ');
  }

  void push(E key, E value) {
    head = Node(key: key, value: value, next: head);
    tail ??= head;
  }

  void append(E key, E value) {
    if (isEmpty) {
      push(key, value);
      return;
    }

    tail!.next = Node(key: key, value: value);

    tail = tail!.next;
  }

  void insert(E key, E value) {
    var current = head;
    while (current != null) {
      if (current.key == key) {
        deleteNode(current.value);
        break;
      }
      current = current.next;
    }
    append(key, value);
  }

  E? pop() {
    final value = head?.value;
    head = head?.next;
    if (isEmpty) {
      tail = null;
    }
    return value;
  }

  E? removeLast() {
    if (head?.next == null) return pop();
    var current = head;

    while (current!.next != tail) {
      current = current.next;
    }

    final value = tail?.value;

    tail = current;

    tail?.next = null;

    return value;
  }

  E? removeAfter(Node<E> node) {
    final value = node.next?.value;

    if (node.next == tail) {
      tail = node;
    }

    node.next = node.next?.next;

    return value;
  }

  E? deleteNode(E value) {
    E? deletedValue = value;
    if (head!.value == value) {
      return deletedValue = pop();
    }
    if (tail!.value == value) {
      return deletedValue = removeLast();
    }

    var current = head;

    while (current!.next != null) {
      if (current.next!.value == value) {
        deletedValue = current.next!.value;
        break;
      }
      current = current.next;
    }
    current.next = current.next!.next;
    return deletedValue;
  }

  @override
  Iterator<E> get iterator => _HLinkedListIterator(this);

  dynamic get(E key) {
    Node<E>? current = head;
    while (current != null) {
      if (current.key == key) {
        return current.value;
      }
      current = current.next;
    }
    return null;
  }

  void deleteNodeAt(key) {
    Node<E>? current = head;
    while (current != null) {
      if (current.key == key) {
        deleteNode(current.value);
        return;
      }
      current = current.next;
    }
  }
}

class _HLinkedListIterator<E> implements Iterator<E> {
  _HLinkedListIterator(HLinkedList<E> list) : _list = list;
  final HLinkedList<E> _list;

  Node<E>? _currentNode;

  @override
  E get current => _currentNode!.value;

  bool _firstPass = true;

  @override
  bool moveNext() {
    if (_list.isEmpty) return false;
    if (_firstPass) {
      _currentNode = _list.head;
      _firstPass = false;
    } else {
      _currentNode = _currentNode?.next;
    }
    return _currentNode != null;
  }
}
