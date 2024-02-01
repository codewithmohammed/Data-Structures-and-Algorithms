

//A tree is a Hirarchichal data structure such that it is a list or collection of nodes where each node consist of a value and zero or more child nodes .The top most node is called the 'root' of the tree , the node which doesn't have further node is called the 'leaves' of the tree.The nodes which are in between the root and leaves are called the internal nodes.

// in this we are constructing a tree data structure by creating a Treenode with a value in it and other list of treenodes in which the each treenode consist of the same as previous.

import '../queue/queue.dart';

class TreeNode<T> {
  T value;
  TreeNode(this.value);
  List<TreeNode<T>> children = [];

  //adding a child node into the node.it can be root node or maybe child node.

  void add(TreeNode<T> child) {
    this.children.add(child);
  }

//this is a function for iterating through the nodes we can do anything by giving a body to the performAction function . This function is like a map fuction like in list

//DEPTH FIRST SEARCH
//so in here when we call this function we must call it on a node
  void forEachDepthFirst(void Function(TreeNode<T> node) performAction) {
    // print('before perform action is called');
    //whenever the performAction is called the function which we implmented while calling will be called
    //the 'this' in this points to the current node that this is called whenever the forEachDepthFirst is called.
    performAction(this);
    // print(this);

    //In each child in children the function will be called recursively until the child is no more and if there is no more child for a node it will return to its parent node and go to right node of the parent node and this process is done to the root and from there to right child node and the same to right sections ....
    for (final child in this.children) {
      child.forEachDepthFirst(performAction);
    }
  }

//This is Breadth First Search

//this is breadth first search in which the the node visited is enqueued in to the the queue and is removed from the head is necessary.
  void forEachLevelOrder(void Function(TreeNode<T> node) performAction) {
    //Declaring the queue in which it has the referance of the node we visited
    final queue = QueueStack<TreeNode<T>>();
    //This is for performing the function body that we send while calling the breadth first search.here this is the reference to the first node is the node which we have the reference to at first.

    //the node which have reference before visiting the node is called discovered node
    performAction(this);
    // print(this.value);
    //as it is a breadth first search on non-binary tree we must add the reference of all the child in to the queue

    //once we have the reference to the first node , now we have reference to all children node of the current node so these all are the discovered node and we will add these children to queue and remove the first node reference
    // print(children[0].value);
    //hot will be printed 
    
    this.children.forEach(queue.enqueue);

    //dequeue the first node reference which we no more neeeded.now there is only the children nodes of the removed node.
    var node = queue.dequeue();
    //this process is done until there is no more children for the current node.that is if there is no node left to visit.
    //iterating throught the children node of the child node in the
    while (node != null) {
      //this is for performing the action on the node
      // print(node.value); //hot will be printed
      ////this prints the value which we dequeued.
      performAction(node);
      //the same as before the children of the hot is added into the queue//so this will be added into the right stack queue

      node.children.forEach(queue.enqueue);
      //dequeued the cold from the queue
      node = queue.dequeue();
      //the next queuing will be done in the cold node ,it's children will be enqueued in to the right stack ,the tea will be dequeued which is the 1st children(child) of hot and its (tea's) children will be enqueued and so on this cycle is continued until there is no node left in the queue. 
    }
  }

  // this is for searching a value in the tree which is done using breadth first search.
  TreeNode<T>? search(T value) {
    TreeNode<T>? result;
    forEachLevelOrder((node) {
      if (node.value == value) {
        result = node;
      }
    });
    return result;
  }
}



//       1
//   2      3
// 4 5 6  7 8 9

//first list = 2,3 will be added
// it will be reversed and it will become 3,2
//2 will be removed
// so the it will be 3
// now 456 will be added to right array
//456 will get reversed and will be 654 and will be added to left array fo the left array will become 3654 and 4 will be removed

