import 'hLinkedList.dart';

class HashTable<K, V> {
  int capacity;
  late List<HLinkedList<dynamic>> buckets;
  HashTable(this.capacity) {
    buckets =
        List<HLinkedList<dynamic>>.generate(capacity, (index) => HLinkedList());
  }

  int _hash(K key) {
    int hash = 0;
    hash += key.hashCode % capacity;
    return hash;
  }

  void insert(K key, V value) {
    int index = _hash(key);
    buckets[index].insert(key, value);
  }

  V? get(K key) {
    int index = _hash(key);
    return buckets[index].get(key);
  }

  void remove(K key) {
    int index = _hash(key);
    buckets[index].deleteNodeAt(key);
  }
}
