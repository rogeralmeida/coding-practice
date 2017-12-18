# Ruby examples

## Linked Lists

There are 3 implementations of linked lists in ruby

### SinglyHeadPointerLinkedList
This class has a pointer to the head and the nodes have only a pointer to the next node
The ``` push_back ``` has a cost O(n)
The performance of this class is

``` shell
Performance for class 'SinglyHeadPointerLinkedList
       user     system      total        real
Inserting a million items in head list  8.040000   0.020000   8.060000 (  8.084959)
list.reverse  0.000000   0.000000   0.000000 (  0.006055)
list.push_back  0.010000   0.000000   0.010000 (  0.001662)
list.pop_back  0.000000   0.000000   0.000000 (  0.001595)
list.erase  0.000000   0.000000   0.000000 (  0.000014)
```
