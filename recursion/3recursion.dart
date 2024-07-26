import 'dart:io';

int fibonacci(int n) {
  if (n == 0) {
    return 0;
  } else if (n == 1) {
    return 1;
  } else {
    final result = fibonacci(n - 1) + fibonacci(n - 2); //
    print(result);
    return result;
  }
}

void main() {
  print('Enter the number for Fibanocci');
  int? n = int.parse(stdin.readLineSync()!);
  int result = fibonacci(n);
  print("Fibonacci($n) = $result");
}
