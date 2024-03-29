void main() {
  List<int> array = [5, 1, 4, 2, 8, 3];
  List<int> sortedarray = insertionSort(array);
  print(sortedarray);
}

List<int> insertionSort(List<int> array) {
  for (int i = 1; i < array.length; i++) {
    int temp = array[i];
    int j = i - 1;
    while (j >= 0 && array[j] > temp) {
      array[j + 1] = array[j];
      j = j - 1;
    }
    array[j + 1] = temp;
  }
  return array;
}
