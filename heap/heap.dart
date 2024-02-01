// Heap
//A heap is a specialized tree-based data structure that satisfies the heap property. Heaps are commonly used to implement priority queues, which are data structures that efficiently maintain the maximum or minimum element in a set

//there are two main types of heaps: max heaps and min heaps

//Max heap:
//in a max heap ,for any given node 'i' other than the root, the value of 'i' is less than or equal to the value of it's parent. This ensures that the maximum element is always at the root.

//Min heap:
//In a min heap , for any given node 'i' other than the root, the value of 'i' is more than or equal to the value of it's parent. This ensures that the minimum element os always at the root.

//these are enums (constants which cannot a have a value assigned to it can only be selected)
enum Priority { max, min }

class Heap<E extends Comparable<E>> {
  late final List<E> elements;
  final Priority priority;

  bool get isEmpty => elements.isEmpty;

  int get size => elements.length;

  E? get peek => (isEmpty) ? null : elements.first;
  //A heap constructor which may be takes
  Heap({List<E>? elements, this.priority = Priority.max}) {
    this.elements = (elements == null) ? [] : elements;
    _buildHeap();
  }

  void _buildHeap() {
    if (isEmpty) return;
    final start = elements.length ~/ 2 - 1;
    // print(start);
    for (var i = start; i >= 0; i--) {
      _siftDown(i);
    }
  }

//this is to insert the value in the list according to heap
  void insert(E value) {
    //after adding the element in the array
    elements.add(value);
    //we have to call this function which is used to make a complete binary heap(comparing between children of the parents and compare the max or min from that children to the parent and swaping them if necessary ).
    ///////////FIRST INSERTION//////////////
    // a list [1]/length = 1;
    //elements.length -1 = 0
    ///////////SECOND INSERTION//////////////
    // a list [1,2]/length = 1;
    //elements.length -1 = 1
    _siftUp(elements.length - 1);
  }

  void _siftUp(int index) {
    ///////////FIRST INSERTION//////////////
    //child and parent index is zero at first.
    //so it will not enter into the while loop coz the condition will become false
    ///////////SECOND INSERTION//////////////
    //child index will be = 1;
    //parent index will be  = 0
    //since the child is greater than 0 and child(1) == 1,
    //now it will swap the child with the parent.
    //parent = 2,
    // child = 1,
    //now child index = 0,
    //parent index = 1,
    //now since the child index is not greater than 0,the funtion will exit.
    var child = index;
    var parent = _parentIndex(child);
    //the condition child>0 is to check there exist more than 1 element that is the index must be greater than 0
    while (child > 0 && child == _higherPriority(child, parent)) {
      _swapValues(child, parent);
      child = parent;
      parent = _parentIndex(child);
    }
    // a list will be now[2,1]
  }

  //this is to remove the last element from the list.

  E? remove() {
    //list = [2,1]
    //if the list is empty then return null
    //swaping the values of the first index(0) with the first index
    //and will remove the value from the last which came from the 0th index
    //sift it down from the 0th element

    //list = [6,5,4,3,2,1],length = 6

    //if we want to remove 6 from the top then we have to swap 6 with the last element and remove 6 from the last so now the elements.length = 5,
    //after swapping the list = [1,5,4,3,2]
    //now we have to arrange the position of the first element so we call siftdown on the position 0 where the first element in situated
    if (isEmpty) return null;
    _swapValues(0, elements.length - 1);
    final value = elements.removeLast();
    _siftDown(0);
    return value;
  }

  E? removeAt(int index) {
    //remove an element from an index
    final lastIndex = elements.length - 1;
    //if the index the user entering is greater than 0 and index > the lastIndex then we will return null
    if (index < 0 || index > lastIndex) {
      return null;
    }
    //if the index is equal to lastIndex then remove the last element from the array
    if (index == lastIndex) {
      return elements.removeLast();
    }
    //swap the values with the index and the last index then remove the element from the last
    _swapValues(index, lastIndex);
    final value = elements.removeLast();
    //siftDown the index which was the last element but now is in the index
    _siftDown(index);
    _siftUp(index);
    return value;
  }

  void _siftDown(int index) {
    //list = [1]
    ///////////REMOVING THE ELEMENT//////////////
    ///parent = 0
    ///while(true){
    /// left = 1
    /// right = 2,
    /// chosen = 0, we send 1 and 0
    /// chosen =  0, we send 2 and 0}
    /// since now chosen = parent we just return so it exits the while loop

    /// list = [1,5,4,3,2]
    ///////////REMOVING THE ELEMENT//////////////
    ///parent = 0
    ///while(true){
    /// left = 1
    /// right = 2,
    /// chosen = 1, we send 1 and 0
    /// chosen =  1, we send 2 and 1}
    /// since now chosen != parent we swap values in the parent and chosen(2)
    ///so now list = [5,1,4,3,2]
    ///then we will make parent = chosen 1,that is 1 in the array.
    ///now we do this operation on this parent and it's done until the list is in the heap or when chosen == parent
    var parent = index;
    while (true) {
      final left = _leftChildIndex(parent);
      final right = _rightChildIndex(parent);
      var chosen = _higherPriority(left, parent);
      chosen = _higherPriority(right, chosen);
      if (chosen == parent) return;
      _swapValues(parent, chosen);
      parent = chosen;
    }
  }

  int indexOf(E value, {int index = 0}) {
    //this is for finding or searching the index of the element
    //if the index is greater than the length of the element then just return -1
    if (index >= elements.length) {
      return -1;
    }
    //if the value that is to find and the element in the given index that is given is compared and if the value has higher priority then we will return -1;

    //here since it's a heap we need to check that the element in the index is lesser than the value of the value of the parameter in case of max heap and wise versa in case of min heap.
    if (_firstHasHigherPriority(value, elements[index])) {
      return -1;
    }

    //if value is equal to the element in the  index then we will return that element.
    if (value == elements[index]) {
      return index;
    }

    //we will check in the left subtree of the index then and if the element is found in the index we will assign it into the left and will return it.
    final left = indexOf(value, index: _leftChildIndex(index));
    if (left != -1) return left;

    //else we will check the element in the rightchild of the heap.and we will return a value no matter what it can be a index or -1.
    return indexOf(value, index: _rightChildIndex(index));
  }

  int _leftChildIndex(int parentIndex) {
    return 2 * parentIndex + 1;
  }

  int _rightChildIndex(int parentIndex) {
    return 2 * parentIndex + 2;
  }

  int _parentIndex(int childIndex) {
    return (childIndex - 1) ~/ 2;
    //will return 0 if the child index zero(that is when there is only one element in the array/list)
  }

  bool _firstHasHigherPriority(E valueA, E valueB) {
    ///////////SECOND INSERTION//////////////
    ///valueA = 2
    ///valueB = 1
    ///if its priority.max then will compare 2 and 1 so the result will be 1 since 2 is greater than 1 and it will return true since it's greater then 0.
    if (priority == Priority.max) {
      return valueA.compareTo(valueB) > 0;
    }
    return valueA.compareTo(valueB) < 0;
  }

  int _higherPriority(int indexA, int indexB) {
    ///////////SECOND INSERTION//////////////
    ///indexA = 1,indexB = 0;
    ///if 1>=2(elements.length(2))    X
    ///valueA = 2
    ///valueB = 1
    ///isFirst = true.
    ///if isFirst is true then it will return 1.
    ///////////DELETION////////////////////
    ///if indexA = 1,indexB =0,
    ///FIRST CALLING THE FUNCTION
    ///if(1 >= elements.length(1)) is correct so we return 0;
    ///SECOND CALLING THE FUNCTION
    ///indexA = 2,indexB = 0
    /// if(2 >= elements.lenght(1)) is correct so we return 0;
    ///  ///////////DELETION////////////////////
    ///  list = [1,5,4,3,2]
    /// indexA = 1
    /// indexB = 0
    /// since the length of the list is more than indexA(1)
    /// it will move to next operation
    /// valueA = 5
    /// valueB = 1
    /// checks which has higher priority ,since 5 have higher priority
    /// isFirst = true
    /// so indexA('1') will be returned
    /// next higher pririty check with indexA = 2,indexB = 1
    /// since the length of the list is more than indexA(2)
    /// it will move ro next operation
    /// valueA = 4
    /// valueB = 5
    /// checks which has higher priority, since 4 have higher priotity
    /// isFirst = false
    /// so indexB(1) will be returned
    if (indexA >= elements.length) return indexB;
    final valueA = elements[indexA];
    final valueB = elements[indexB];
    final isFirst = _firstHasHigherPriority(valueA, valueB);
    return (isFirst) ? indexA : indexB;
  }

  void _swapValues(int indexA, int indexB) {
    final temp = elements[indexA];
    elements[indexA] = elements[indexB];
    elements[indexB] = temp;
  }

  @override
  String toString() => elements.toString();
}
