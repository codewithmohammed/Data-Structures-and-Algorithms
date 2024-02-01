
  List<int> createTargetArray(List<int> nums, List<int> index) {
    late List<int> target = [];
    for (int i = 0; i < nums.length; i++) {
      target.insert(index[i], nums[i]);
    }
    return target;
  }


void main() {
  final hello = createTargetArray([0,1,2,3,4], [0,1,2,2,1]);
  print(hello);
}
