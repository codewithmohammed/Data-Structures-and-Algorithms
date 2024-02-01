

import '../linkedList/Slinked_list.dart';

abstract class Queue<E> {
  bool enqueue(E element);
  E? dequeue();
  bool get isEmpty;
  E? get peek;
}

class QueueList<E> implements Queue<E> {
  final _list = <E>[];

  @override
  bool get isEmpty => _list.isEmpty;

  @override
  bool enqueue(E element) {
    _list.add(element);

    return true;
  }

  @override
  E? dequeue() => (isEmpty) ? null : _list.removeAt(0);

  @override
  E? get peek => (isEmpty) ? null : _list.first;

  @override
  String toString() => _list.toString();
}

class QueueLinkedList<E> implements Queue<E> {
  final _linkedList = SLinkedList<E>();

  @override
  bool get isEmpty => _linkedList.isEmpty;

  @override
  bool enqueue(E element) {
    _linkedList.append(element);
    return true;
  }

  @override
  E? dequeue() {
    return _linkedList.pop();
  }

  @override
  E? get peek => _linkedList.head?.value;

  @override
  String toString() => _linkedList.toString();
}

class QueueStack<E> implements Queue<E> {
  final _leftStack = <E>[];
  final _rightStack = <E>[];

  @override
  bool enqueue(E element) {
    _rightStack.add(element);
    return true;
  }

  @override
  E? dequeue() {


    if (_leftStack.isEmpty) {
      _leftStack.addAll(_rightStack.reversed);
      _rightStack.clear();
    }
    if (_leftStack.isEmpty) return null;
    return _leftStack.removeLast();
  }

  @override
  bool get isEmpty => _leftStack.isEmpty && _rightStack.isEmpty;

  @override
  E? get peek => _leftStack.isNotEmpty ? _leftStack.last : _rightStack.first;

  @override
  String toString() {
    final combined = [
      ..._leftStack.reversed,
      ..._rightStack,
    ].join(', ');
    return '[$combined]';
  }
}
