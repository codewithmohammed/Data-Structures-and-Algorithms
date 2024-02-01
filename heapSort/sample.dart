import 'heap_sort.dart';

void main() {
  heapsortUsingHeap();
}

void heapsortUsingHeap() {
  final sorted = heapsort<num>([6, 12, 2, 26, 8, 18, 21, 9, 5]);
  print(sorted);
}
