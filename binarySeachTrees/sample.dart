import 'binary_node.dart';

void main() {
  checkBinarySearchTree();
  binaryTree();
  inOrderTraversal();
  preOrderTraversal();
  postOrderTraversal();
}

void checkBinarySearchTree() {
  final tree = createBinaryTree();
  print(tree.isBST(tree));
}

BinaryNode<int> createBinaryTree() {
  final zero = BinaryNode(0);
  final one = BinaryNode(1);
  final five = BinaryNode(5);
  final seven = BinaryNode(7);
  final eight = BinaryNode(8);
  final nine = BinaryNode(9);

  seven.leftChild = one;
  one.leftChild = zero;
  one.rightChild = five;
  seven.rightChild = nine;
  nine.leftChild = eight;

  return seven;
}

void binaryTree() {
  final tree = createBinaryTree();
  print(tree);
}

void inOrderTraversal() {
  print('traverseInOrder');
  final tree = createBinaryTree();
  tree.traversalInOrder(print);
}

void preOrderTraversal() {
  print('traversePreOrder');
  final tree = createBinaryTree();
  tree.traversalPreOrder(print);
}

void postOrderTraversal() {
  print('traversePostOrder');
  final tree = createBinaryTree();
  tree.traversalPostOrder(print);
}
