void main() {
  int n = 11; // Change this to the desired number of Fibonacci numbers
  printFibonacci(n);
}

void printFibonacci(int n) {
  for (int i = 0; i < n; i++) {
    print(fibonacci(i));
  }
}

int fibonacci(int n) {
  if (n <= 1) {
    return n;
  }
  return fibonacci(n - 1) + fibonacci(n - 2);
}