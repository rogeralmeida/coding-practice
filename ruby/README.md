# Ruby examples

## Linked Lists

There are 3 implementations of linked lists in ruby

### SinglyHeadPointerLinkedList

This class has a pointer to the head and the nodes have only a pointer to the next node
For all the procedure that depend on something different from the head it will have to iterate over the list
The ``` push_back ``` has a cost O(n)

``` shell
Performance for class 'SinglyHeadPointerLinkedList
       user     system      total        real
Inserting a million items in head list  8.040000   0.020000   8.060000 (  8.084959)
list.reverse  0.000000   0.000000   0.000000 (  0.006055)
list.push_back  0.010000   0.000000   0.010000 (  0.001662)
list.pop_back  0.000000   0.000000   0.000000 (  0.001595)
list.erase  0.000000   0.000000   0.000000 (  0.000014)
```

### SinglyHeadAndTailPointerLinkedList

This class has two pointers one for the head and other for the tail of the list.
This allow the class to avoid iterating when appending a value to the list
The ``` push_back ``` has a cost O(1)
But to remove a item from the end of the list it still have to iterate over the list, as there is no way to know the previous node

``` shell
  Performance for class 'SinglyHeadAndTailPointerLinkedList
         user     system      total        real
  Inserting a million items in head list  0.010000   0.000000   0.010000 (  0.007023)
  list.reverse  0.000000   0.000000   0.000000 (  0.004972)
  list.push_back  0.000000   0.000000   0.000000 (  0.000014)
  list.pop_back  0.000000   0.000000   0.000000 (  0.001451)
  list.erase  0.000000   0.000000   0.000000 (  0.000024)
```

### DoublyLinkedList

This class has two pointers one for the head and other for the tail of the list.
This allow the class to avoid iterating when appending a value to the list
This class is able to pop a item from the end of the list with cost O(1) as it doesn't have to iterate anymore

``` shell
Performance for class 'DoublyLinkedList
       user     system      total        real
Inserting a million items in head list  0.010000   0.000000   0.010000 (  0.008314)
list.reverse  0.010000   0.000000   0.010000 (  0.010400)
list.push_back  0.000000   0.000000   0.000000 (  0.000005)
list.pop_back  0.000000   0.000000   0.000000 (  0.001443)
list.erase  0.000000   0.000000   0.000000 (  0.000038)
```
