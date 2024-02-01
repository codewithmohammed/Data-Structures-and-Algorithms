//queue using list

import 'queue.dart';

void main() {
  queueListExample();
}

void queueListExample() {
  final queue = QueueList<String>();
  queue.enqueue('Ray');
  queue.enqueue('Brian');
  queue.enqueue('Eric');
  print(queue);

  queue.dequeue();
  print(queue);

  queue.peek;
  print(queue);
}
