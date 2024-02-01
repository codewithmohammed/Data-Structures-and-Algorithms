

void main() {
    // List<String> array = [];

//   print("Enter the Limit of the array");
//   int? limit = int.parse(stdin.readLineSync()!);
//   print('Enter the values into the array');
//   for (int i = 0; i < limit; i++) {
//     var value = stdin.readLineSync()!;
//     array.add(value);
//   }
//   print("Enter the name to Search the Index");
//   String? target = stdin.readLineSync()!;
//   int result = binarySearch(array, target);

  List<String> array = ["Alice", "Bob", "Charlie", "David", "Eve"];
  String target = "Charlie";

  int result = binarySearch(array, target);
  if (result != -1) {
    print("Element $target found at index $result");
  }else{
    print("Element not Found");
  }
}

int binarySearch(List<String> array, String target) {
  int high = array.length - 1;
  int low = 0;

  while (low <= high) {
    int middle = (low + (high - low) / 2).toInt();
    int comparison = array[middle].compareTo(target);

    if (comparison < 0) {
      low = middle + 1;
    } else if (comparison > 0) {
      high = middle - 1;
    } else {
      return middle;
    }
  }
  return -1;
}
