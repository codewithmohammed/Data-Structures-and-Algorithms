import '../linkedList/Dlinked_list.dart';


void main() {
  final list = DLinkedList<int>();
  list.append(503);
  list.push(3);

  list.push(2);
  list.append(899);
  list.push(1);

  list.push(40);
  list.push(26);
  list.push(19);
  List<int> array = [
    1,
    2,
    2,
    3,
    4,
    5,
  ];
  for (int i = 0; i < array.length; i++) {
    list.append(array[i]);
  }

  print('Before: $list');

  print(list.length);
  print(list.nodeAt(1)!.value);
  for (int i = 0; i < list.length; i++) {
    // print(list.nodeAt(i + 1)!.value);
    if (list.nodeAt(i)!.value == list.nodeAt(i + 1)!.value) {
      print(true);
      list.removeAt(list.nodeAt(i)!);
    }
  }
  print('${list.reverseList()}');
// final firstNode = list.nodeAt(0);
  // final removedValue = list(40);
  list.pop();
  list.removeLast();
  list.removeAt(list.nodeAt(2)!);
  print(list.removeBefore(list.nodeAt(1)!));
  list.removeAfter(list.nodeAt(6)!);
  list.insertAfter(list.nodeAt(0)!, 40);
  list.insertBefore(list.nodeAt(0)!, 23);
  print('After:  ${list}');
  print('${list.reverseList()}');
  // print('Removed value: $removedValue');
  for (final element in list) {
    print(element);
  }
}
