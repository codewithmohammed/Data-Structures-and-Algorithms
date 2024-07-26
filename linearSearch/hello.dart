class Hello {
  void printf() {
    print('object');
  }

  void printh() {
    print('hello');
  }
}

void main() {
  Hello hello = Hello();
  hello
    ..printf()
    ..printh();

  List<int> hellos = [];

  List<int> nums = [1, 2, 3];
  List<int> numbers = [3, 4, 5, 6];

  numbers.forEach((element) {
    print(element);
  });

  void fetchData(){
    
  }
}


