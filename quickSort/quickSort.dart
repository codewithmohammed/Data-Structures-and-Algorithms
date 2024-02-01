void main() {
  List<int> array = [5, 1, 4, 2, 8, 3];
  int high = array.length - 1;
  int low = 0;
  List<int> result = quickSort(array, low, high);
  print(result);
}

List<int> quickSort(List<int> array, low, high) {
  if (low < high) {
    int pi = partition(array, low, high);
    quickSort(array, low, pi - 1);
    quickSort(array, pi + 1, high);
  }
  return array;
}

int partition(List<int> array, low, high) {
  if (array.isEmpty) {
    return 0;
  }
  int pivot = array[high];
  int i = low - 1;
  for (int j = low; j < high; j++) {
    if (array[j] < pivot) {
      i++;
      swap(array, i, j);
    }
  }
  swap(array, i + 1, high);
  return i + 1;
}

void swap(List<int> list, int i, int j) {
  int temp = list[i];
  list[i] = list[j];
  list[j] = temp;
}
