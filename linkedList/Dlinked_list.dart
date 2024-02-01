class Node<T> {
  Node<T>? prev;
  T value;
  Node<T>? next;

  Node({this.prev, required this.value, this.next});
}

class DLinkedList<E> extends Iterable<E> {
  Node<E>? head;
  Node<E>? tail;

  
  @override
  bool get isEmpty => head == null;

  @override
  String toString() {
    if (isEmpty) return 'Empty list';

    // Start with the head of the list
    Node<E>? current = head;
    String result = '';

    // Iterate through the list and concatenate the string representation of each node
    while (current != null) {
      result += current.value.toString();
      if (current.next != null) {
        result += ' <-> ';
      }
      current = current.next;
    }

    return result;
  }
  String reverseList() {
    if (isEmpty) return 'Empty list';

    // Start with the head of the list
    Node<E>? current = tail;
    String result = '';

    // Iterate through the list and concatenate the string representation of each node
    while (current != null) {
      result += current.value.toString();
      if (current.prev != null) {
        result += ' <-> ';
      }
      current = current.prev;
    }

    return result;
  }

  void push(E value) {
    head = Node(value: value, next: head);
    tail?.prev ??= head;
    tail ??= head;
    head!.next?.prev = head;
  }

  void append(E value) {
    if (isEmpty) {
      push(value);
      return;
    }
    var temp = tail;
    tail!.next = Node(value: value);
    tail = tail!.next;
    tail!.prev = temp;
  }

  Node<E>? nodeAt(int index) {
    var currentNode = head;
    int currentIndex = 0;

    while (currentNode!.next != null && currentIndex < index) {
      currentIndex += 1;
      currentNode = currentNode.next;
    }
    return currentNode;
  }

  Node<E> insertAfter(Node<E> node, E value) {
    if (node == tail) {
      append(value);
      return tail!;
    }
    var current = head;
    while (current != node) {
      current = current!.next;
    }
    current!.next = Node(prev: current, value: value, next: current.next);
    current.next?.next!.prev = current.next;
    return current.next!;
  }

  Node<E> insertBefore(Node<E> node, E value) {
    if (node == head) {
      push(value);
      return head!;
    }

    var current = tail;

    while (current != node) {
      current = current!.prev;
    }

    current!.prev = Node(prev: current.prev, value: value, next: current);
    current.prev?.prev!.next = current.prev;
    return current.prev!;
  }

  E? pop() {
    final value = head?.value;
    head = head?.next;
    if (isEmpty) {
      tail = null;
    }
    head!.prev = null;
    return value;
  }

  E? removeLast() {
    if (head!.next == null) {
      return pop();
    }
    final value = tail!.value;
    tail = tail!.prev;
    tail!.next = null;

    return value;
  }

  E? removeAt(Node<E> node) {
    if (node == tail) {
      return removeLast();
    }

    if (node == head) {
      return pop();
    }

    var current = head;
    while (current!.next != node) {
      current = current.next;
    }

    final value = current.next!.value;
    current.next = current.next!.next;
    current.next!.prev = current;
    return value;
  }

  E? removeAfter(Node<E> node) {
    var current = head;
    while (current != node) {
      current = current!.next;
    }

    final value = current!.next!.value;
    current.next = current.next?.next;
    current.next?.prev = current;
    return value;
  }

  E? removeBefore(Node<E> node) {
    var current = tail;

    if (node.prev == head) {
      return pop();
    }

    while (current != node) {
      current = current!.prev;
    }

    final value = current!.prev!.value;
    current.prev = current.prev?.prev;
    current.prev?.next = current;
    return value;
  }

  @override
  Iterator<E> get iterator => _DLinkedListIterator(this);
}

class _DLinkedListIterator<E> implements Iterator<E> {


  _DLinkedListIterator(DLinkedList<E> list) : _list = list;

  final DLinkedList<E> _list;

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
