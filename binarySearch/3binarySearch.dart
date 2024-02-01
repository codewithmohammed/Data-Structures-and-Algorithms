void main() {
  // print("Enter the Limit of the array");
  // int? limit = int.parse(stdin.readLineSync()!);

  int limit = 100000;
  List<int> array = [];

  for (int i = 0; i < limit; i++) {
    array.add(i);
  }
  int target = 45645;

  int numberfound = binarySearch(array, target);

  print("The number is found at $numberfound");
}

int binarySearch(List<int> array, int target) {
  int length = array.length;
  print('$length');
  int high = length - 1;
  int low = 0;

  while (low <= high) {
    int middle = (low + (high - low) / 2).toInt();
    int value = array[middle];
    if (value < target) {
      low = middle + 1;
    } else if (value > target) {
      high = middle - 1;
    } else {
      return middle;
    }
  }
  return -1;
}
