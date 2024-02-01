import '../heap/heap.dart';

//this is heap sort 

//heap sort is a sorting algorithm in which the heap tree is sorted 
//in this sort we will remove the elements from the heap and add that into a list which will give a sorted list

List<E> heapsort<E extends Comparable<E>>(List<E> list) {
  final heap = Heap<E>(
    elements: list.toList(),
    priority: Priority.min,
  );

  final sorted = <E>[];
  while (!heap.isEmpty) {
    final value = heap.remove();
    sorted.add(value!);
  }
  return sorted;
}

