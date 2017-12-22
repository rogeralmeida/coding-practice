# Open Addressing

m > n
no chaining

## Probing

> Hash function which order of slots to probe for a key ( for insert/search/delete)
Try to insert, if fail recompute a new key to find a empty slot.
Different hashes for a given key

h : U . { 0, 1, , m - 1} -> {0..m-1}

for an arbitrary key k
h(k, 1), h(k, 2), ... h(k, m - 1)

### Inserting
Insert(k, v):
Keep probing until an empty slot is found, then insert when found.

### Search
Search(k):
Keep probing as long as the slots encountered are occupied by keys != K or find an empty slot

### Delete
delete(k):
If we just delete the entry in the table we would fail the searches, because it might find a empty slot but the next probing would have a value.
Instead, replace deleted item with `DeleteMe` flag

## Probing Strategies

### Linear probing

h(k, i)= (h(k)+1) % m

Cluster: consecutive groups of occupied slots which keep growing

### Double Hashing

h(k, i) = (h1(k) + i h2(k)) % m

* If h2(k) is relatively prime to m => permutation

## Uniform Hashing

!= simple uniform hashing
Each key is equally likely to have anyone of the M factorial permutation as its probe sequence
