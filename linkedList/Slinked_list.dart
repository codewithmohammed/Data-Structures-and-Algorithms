class Node<T> {
  T value;
  Node<T>? next;

  Node({required this.value, this.next});
}

class SLinkedList<E> extends Iterable<E> {
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

// adding the element in the head or for the first time
  void push(E value) {
    //if we want to put the value in the head ,then we have to make the head = node with the value and it's reference to the next of the head(that's the head of the previous head)
    head = Node(
        value: value,
        next:
            head); //the next can be null too when it's adding the element for the first time.

    // if tail is null that is when we are adding the element for the first time then the tail will be null , then the head and tail will be the same since it's only one element in the entire list
    tail ??= head;
  }

  // adding the element in the last

  void append(E value) {
    //if there is no value in the head that means the value is adding for the first time,then we have to call push to add the element in the head,tail
    if (isEmpty) {
      push(value);
      return;
    }

    //if we want to add in the last the we have to add the node in the tail.next(tail.next was null,after adding the node with only value the tail.next's next will be null)

    tail!.next = Node(value: value);

    //and then we have to make the tail to tail.next(which have the next value as null)
    tail = tail!.next;
  }

  Node<E>? nodeAt(int index) {
    //index to keep the track on the node
    int currentIndex = 0;
    // it's made the currentNode to head because head has all the node reference
    Node<E> currentNode = head!;

    // while loop as long as the currentnode.next becomes null that's when it reaches the tail or when the currentindex become more than or equal to the index that's when we found the node at the index
    while (currentNode.next != null && currentIndex < index) {
      currentNode = currentNode.next!;
      currentIndex += 1;
    }

    //Either we will send the last node that is the tail or we will sent the node at the index
    return currentNode;
  }

  // inseting a node after a specific node
  Node<E> insertAfter(Node<E> node, E value) {

    //if we are inserting a node after a specific node there is a chance that it can be the node of tail so we have to call append to insert the node after the tail or at the last or the list

    if (tail == node) {
      append(value);
      return tail!;
    }

    // if it's not tail then we have to insert the value after the specified node, that's the next of the specified node

    node.next = Node(
        value: value,
        next: node
            .next); // this node.next is the nodes of the previos linked list before inserting
    return node.next!;
  }

//removing the value from the head/front of the list
  E? pop() {
    //since we are popping from the head we have to remove the reference from the current head and make the head.next to head
    final value = head?.value;
    //this is the main operation
    head = head?.next;
    if (isEmpty) {
      tail = null;
    }
    // just returning the popped value
    return value;
  }

  E? removeLast() {
    //if we want to remove the element of the tail/last by removing the reference to the tail from the previous node from the tail.

    //if the value in the node next to the head node is null that's there is only one node which is both as the head and tail then just remove the first node by calling pop.
    if (head?.next == null) return pop();
    //make the head to a variable which hold the reference to the whole node
    var current = head;

    //until the current.next become tail we have to make the current to the next node of the current its because we are finding the node which is before the tail
    while (current!.next != tail) {
      current = current.next;
    }
    //just for returning the value that we are removing
    final value = tail?.value;
    //make the tail to the founded current ,that is we just made the tail as the node before the tail node
    tail = current;
    //making the tail as usuall that is removing the reference to the next node
    tail?.next = null;
    
    return value;
  }

//removing the value after the particular node in the list
  E? removeAfter(Node<E> node) {
    // Store the value of the node to be removed (the one after the specified node)
    final value = node.next?.value;

    // Check if the node to be removed is the current tail
    if (node.next == tail) {
      // If so, update the tail to be the specified node, as it will become the new tail
      tail = node;
    }

    // Update the reference of the specified node to skip the node that is being removed
    node.next = node.next?.next;

    // Return the value of the removed node
    return value;
  }

  E? deleteNode(E value) {
    //if we want to delete a node that contains a specified value then we have to iterate through all the linked list
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
  Iterator<E> get iterator => _SLinkedListIterator(this);

  // @override
  // String toString() {
  //   if (isEmpty) return 'Empty list';
  //   return head.toString();
  // }
}

class _SLinkedListIterator<E> implements Iterator<E> {
  _SLinkedListIterator(SLinkedList<E> list) : _list = list;
  final SLinkedList<E> _list;

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
