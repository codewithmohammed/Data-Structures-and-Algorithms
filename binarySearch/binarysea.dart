// void main() {
//   List<int> array = [1, 2, 3, 4, 5, 6];
//   int target = 4;
//   int result = binarySearch3(array, target);
// }

// int binarySearch3(List<int> array, int target) {
//   int high = array.length - 1;
//   int low = 0;
//   while (low <= high) {
//     int middle = (low + (high - low) / 2).toInt();
//     int middleValue = array[middle];
//     if (target > middleValue) {
//       low = middle - 1;
//     } else if (target < middleValue) {
//       high = middle + 1;
//     } else {
//       return middle;
//     }
//   }
// }

// import 'dart:io';

// class Node<T> {
//   T value;
//   Node<T>? next;

//   Node({required this.value, this.next});
// }

// class SLinkedList<E> {
//   Node<E>? head;
//   Node<E>? tail;

//   bool get isEmpty => head == null;

//   void push(value) {
//     head = Node(value: value, next: head);
//     tail ??= head;
//   }

//   void append(value) {
//     if (isEmpty) {
//       push(value);
//       return;
//     }
//     tail!.next = Node(value: value);
//     tail = tail!.next;
//   }

// }

void main() {
  String word = 'hello';
  List<String> list = word.split('');

}
