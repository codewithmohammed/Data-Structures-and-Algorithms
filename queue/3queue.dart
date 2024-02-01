//queue using doubleStack

import 'queue.dart';


void main() {
  queueDoubleStackExample();
}

void queueDoubleStackExample() {
  final queue = QueueStack<String>();
  queue.enqueue("Ray");
  queue.enqueue("Brian");
  queue.enqueue("Eric");
  print(queue);

  queue.dequeue();
  print(queue);

  queue.peek;
  print(queue);
}
