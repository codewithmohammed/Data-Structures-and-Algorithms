import 'dart:io';

int fibonacci(int n) {
  if (n <= 0) {
    return 0;
  } else if (n == 1) {
    return 1;
  } else {
    return fibonacci(n - 1) + fibonacci(n - 2); //
  }
}

void main() {
  print('Enter the number for Fibanocci');
  int? n = int.parse(stdin.readLineSync()!);
  int result = fibonacci(n);
  print("Fibonacci($n) = $result");
}
