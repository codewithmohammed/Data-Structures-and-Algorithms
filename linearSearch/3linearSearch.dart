

void main() {
  // List<int> array = [];

  // print("Enter the Limit of the array");
  // int? limit = int.parse(stdin.readLineSync()!);
  // print('Enter the values into the array');
  // for (int i = 0; i < limit; i++) {
  //   var value = int.parse(stdin.readLineSync()!);
  //   array.add(value);
  // }
  // print("Enter the number to Search the Index");
  // int? number = int.parse(stdin.readLineSync()!);
  // int index = linearSearch(array, number);

  List<int> array = [1,2,4,3,4,6,9,8];
  List<int> index = linearSearch(array, 3);
  print("Element that can be divided by 3:");
  for (var element in index) {
    if (element != -1) {
      print(" $element");
    } else {
      print("The Element is not Found");
      break;
    }
  }
}

List<int> linearSearch(List<int> array, int value) {
  List<int> indexes = [];
  for (int i = 0; i < array.length; i++) {
    if (array[i] % value == 0) {
      indexes.add(array[i]);
    }
  }
  if(indexes.isEmpty){
      indexes.add(-1);
      return indexes;
  }else{
  return indexes;
  }
}
