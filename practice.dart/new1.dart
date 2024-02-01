

import '../linkedList/Slinked_list.dart';

class Node<E> {
  E value;
  Node<E>? next;

  Node({required this.value, this.next});
}

class LinkedList<T> {
  Node<T>? head;
  Node<T>? tail;

  bool get isEmpty => head != null;

  void push(T value) {
    head = Node(value: value, next: head);
    tail ??= head;
  }

  void pop(){
    
  }
}

class Stack<E> {
  // Stack() : _list = <E>[];

  final SLinkedList _list = SLinkedList();

  void push(E element) {
    _list.push(element);
  }

  void pop() {
    _list.pop();
  }

  void deleteNode(E value) {}
}
