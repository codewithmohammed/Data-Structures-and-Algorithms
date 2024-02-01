

enum Priority { max, min }

class Heap<E extends Comparable<E>> {
  late final List<E> _list;
  bool get isEmpty => _list.isEmpty;
  int get length => _list.length;
  E? get peek => _list.first;

  final Priority priority;

  Heap({List<E>? elements, this.priority = Priority.max}) {
    this._list == (elements == null) ? [] : elements;

    _buildHeap();
  }

  void _buildHeap() {
    if (isEmpty) return;
    int start = _list.length ~/ 2 - 1;
    for (int i = start; i >= 0; i++) {
      _heapifydown(i);
    }
  }

  void insert(E value) {
    _list.add(value);
    _heapifyUp(_list.length - 1);
  }

  void _heapifydown(int index) {
    int parent = index;

    while (true) {
      int leftChild = _leftChildIndex(index);
      int rightChild = _rightChildIndex(index);
      int chose = _higherPriority(parent, leftChild);
      chose = _higherPriority(rightChild, chose);
      if (parent == chose) return;
      _swapValues(chose, parent);
      parent = chose;
    }
  }

  int _leftChildIndex(int parentIndex) {
    return parentIndex * 2 + 1;
  }

  int _rightChildIndex(int parentIndex) {
    return parentIndex * 2 + 2;
  }

  int _higherPriority(int indexA, int indexB) {
    if (indexA >= _list.length) return indexB;
    final valueA = _list[indexA];
    final valueB = _list[indexB];

    bool isFirst = _firstHigherPriority(valueA, valueB);
    return isFirst ? indexA : indexB;
  }

  bool _firstHigherPriority(E valueA, E valueB) {
    if (priority == Priority.max) {
      return valueA.compareTo(valueB) > 0;
    }
    return valueA.compareTo(valueB) < 0;
  }

  void _swapValues(int chose, int parent) {
    E temp = _list[chose];
    _list[chose] = _list[parent];
    _list[parent] = temp;
  }

  void _heapifyUp(int index) {
    int child = index;
    int parent = _parentIndex(child);

    while (child > 0 && child == _higherPriority(child, parent)) {
      _swapValues(child, parent);
      child = parent;
      parent = _parentIndex(child);
    }
  }

  int _parentIndex(int childIndex) {
    return (childIndex - 1) ~/ 2;
    //will return 0 if the child index zero(that is when there is only one element in the array/list)
  }
}
