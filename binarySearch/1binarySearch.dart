void main() {
  //   List<int> array = [];

  // print("Enter the Limit of the array");
  // int? limit = int.parse(stdin.readLineSync()!);
  // print('Enter the values into the array');
  // for (int i = 0; i < limit; i++) {
  //   var value = int.parse(stdin.readLineSync()!);
  //   array.add(value);
  // }
  // print("Enter the number to Search the Index");
  // int? target = int.parse(stdin.readLineSync()!);
  // int numberfound = binarySearch(array, target);

  List<int> array = [1, 2, 3, 4, 5, 6, 7, 8];
  int target = 5;

  int numberfound = binarySearch(array, target);


  print("The number is found at $numberfound");
}

int binarySearch(List<int> array, int target) {
  int length = array.length;
  int high = length - 1;
  int low = 0;

  while (low <= high) {
    int middle = (low + (high - low) / 2).toInt();
    int middleValue = array[middle];
    if (middleValue < target) {
      low = middle + 1;
    } else if( middleValue > target){
          high = middle - 1;
    }else{
      return middle;
    }
  }
  return -1;
}