List<int> mergeSort(List<int> array) {
  if (array.length <= 1) {
    // print(array);
    return array;
  }

  int splitIndex = array.length ~/ 2;
  // print(array.sublist(0, splitIndex));
  // print(array.sublist(splitIndex));
  List<int> leftArray = mergeSort(array.sublist(0, splitIndex));

  List<int> rightArray = mergeSort(array.sublist(splitIndex));
  // print('$leftArray          $rightArray');

  List<int> result = merge(leftArray, rightArray);
  // print('hello$result');
  return result;
}

List<int> merge(List<int> leftArray, List<int> rightArray) {
  List<int> result = [];
  int? i = 0;
  int? j = 0;

  while (i! < leftArray.length && j! < rightArray.length) {
    if (leftArray[i] <= rightArray[j]) {
      result.add(leftArray[i]);
      i++;
    } else {
      result.add(rightArray[j]);
      j++;
    }
    // print(result);
  }
  // print('after first while' + '$result');
  while (i! < leftArray.length) {
    result.add(leftArray[i]);
    i++;
  }

  while (j! < rightArray.length) {
    result.add(rightArray[j]);
    j++;
  }
  // print(result);
  return result;
}

void main() {
  List<int> array = [5, 1, 4, 2, 8, 3];
  List<int> sortedarray = mergeSort(array);
  print(sortedarray);
}
