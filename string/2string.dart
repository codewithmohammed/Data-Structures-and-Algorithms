import 'dart:io';

void main() {
  print('Enter the word in order to count the number of vowels it contains');

  String? word = stdin.readLineSync()!;

  int contains = countVowels(word, 0);

  if (contains > 0) {
    print("it contains $contains vowels");
  } else if(contains ==0){
    print("It doesn't contain any vowels");
  }
}

int countVowels(String word, int count) {
  for (int i = 0; i < word.length; i++) {
    String ch = word[i];
    if (ch == 'A' ||
        ch == 'E' ||
        ch == 'I' ||
        ch == 'O' ||
        ch == 'U' ||
        ch == 'a' ||
        ch == 'e' ||
        ch == 'i' ||
        ch == 'o' ||
        ch == 'u') {
      count++;
    }
  }
  return count;
}
