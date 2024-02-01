import 'Slinked_list.dart';

void main() {
  final list = SLinkedList<int>();
  list.push(3);
  list.push(2);
  list.push(1);
  list.push(40);
  list.push(26);
  list.push(19);
  print('Before: ${list}');

  int deletedValue = list.deleteNode(19)!;

  print('After:  $list');
  print('deleted value: ${deletedValue}');
}
