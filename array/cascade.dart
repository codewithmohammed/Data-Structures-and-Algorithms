void main() {}

bool palindrome(String word) {
  int j = word.length;
  for (int i = 0; i < word.length; i++) {
    if (word[i] != word[j]) {
      return false;
    }
    j--;
  }
  return true;
}
