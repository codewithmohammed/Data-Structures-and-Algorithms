// Import the necessary library if needed
import 'hashtable.dart';

void main() {
  // Create a hash table with a capacity of 10
  HashTable<String, int> hashTable = HashTable<String, int>(10);

  // Insert key-value pairs into the hash table
  hashTable.insert("apple", 10);
  hashTable.insert("banana", 20);
  hashTable.insert("orange", 30);

  // Retrieve values using keys
  int? appleValue = hashTable.get("apple");
  int? bananaValue = hashTable.get("banana");
  int? orangeValue = hashTable.get("orange");

  print("Value of 'apple': $appleValue");   // Output: Value of 'apple': 10
  print("Value of 'banana': $bananaValue"); // Output: Value of 'banana': 20
  print("Value of 'orange': $orangeValue"); // Output: Value of 'orange': 30

  // Remove a key-value pair from the hash table
  hashTable.remove("banana");

  // Check if the value associated with "banana" is removed
  int? removedValue = hashTable.get("banana");
  print("Value of 'banana' after removal: $removedValue"); // Output: Value of 'banana' after removal: null
}
