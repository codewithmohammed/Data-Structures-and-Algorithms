//queue using linkedlist

import 'queue.dart';


void main() {
  queueUsingLList();
}

void queueUsingLList() {
  final queue = QueueLinkedList<String>();
  queue.enqueue('Ray');
  queue.enqueue('Brian');
  queue.enqueue('Eric');
  print(queue);

  queue.dequeue();
  print(queue);

  queue.peek;
  print(queue);
}
