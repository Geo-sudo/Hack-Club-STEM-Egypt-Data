# Logarithmic Time & new data structures.

## What does the log function do.

Do you know the $log$ from your school? Do you really know what it does? Imagine the following:

$$
log_2{32} = 5
$$

This means that the base "2" raised to the power 5 is equivalent to 32 (the input to the log function).

Could you stimulate what it does?

```
Set a counter to 0
32 / 2 = 16 (counter becomes 1)
16 / 2 = 8 (counter becomes 2)
8 / 2 = 4 (counter becomes 3)
4 / 2 = 2 (counter becomes 4)
2 / 2 = 1 (counter becomes 5)
output the counter
```

It became apparent that the log always divides the input by the base for a certain number of times, and when the input reaches 1, the log outputs the number of times.

## How can an algorithm have algorithmic efficiency

The easiest example is the binary search algorithm, which you may have previously heard about. 

The algorithm deals with the array like a phone-number guide. To illustrate, the algorithm takes the thing that it searches about along  with checking the middle element.

- **If the middle is equal**: You have found what you are searching about.

- **If the middle is greater**: All of the bigger numbers are usesless. We will limit our search to the first part of the array.

- **If the middle is smaller**: All of the smaller numbers are useless. We will limit our search to the second part of the array. 

It becomes notable that the number of elements is constantly divided by 2 till it reaches one element (the one we are searching for). That stimulates the mechanism of the log. 

## Some quick stuff about constant factors

See this piece of code.

```cpp
#include <bits/stdc++.h>

using namespace std;

int main()
{
    int n = 0;
    cin >> n;
    for (int i = 0; i < n; i++)
    {
        n++;
        n++;
    }
}
```

and this one.

```cpp
#include <bits/stdc++.h>

using namespace std;

int main()
{
    int n = 0;
    cin >> n;
    for (int i = 0; i < n; i++)
    {
        n++;
    }
}
```

If we could talk about the algorithmic time of each of them, we will find that:

- **The first**: Has a loop that works for $n$ times, where each time 2 operations are done.

- **The second**: Has a loop that works for $n$ times, where each time 1 opearation is done. 

The first one has complexity of O(2n), and the second one has efficiency of O(1n).

Any efficiency in the form O(cn), where c is a constant, means that the efficency is O(n) as we neglect the constant factors.

The first and second codes are asymptotically equal.

### Let's do the same for logarithmic codes.

```cpp
#include <bits/stdc++.h>
using namespace std; 
int main()
{
    int n = 0;
    cin >> n;
    for (int i = 0; i < n; i++, n/=3)
    {
        cout << "Hello" << endl;
    }
}
```

```cpp
#include <bits/stdc++.h>
using namespace std; 
int main()
{
    int n = 0;
    cin >> n;
    for (int i = 0; i < n; i++, n/=2)
    {
        cout << "Hello" << endl;
    }
}
```

- In the first code, since the n is divided by 3 each time, the efficiency is $log_3{n}$

- In the second code, since the n is divided by 2 each time, the efficiency is $log_2{n}$

Are they asymptotically equal? That's **your** task.
Prove that they are equal.

$$
Hint: log_{a}{n} = \frac{log\space n}{log\space a}
$$

## Vectors

### What is a vector?

Previously, we have encountered the C-style arrays. That type of arrays was a contiguous block in the memory (each element was immediately following the preceding one). To store an array, you just saved the position of the first element.

On the other hand, vectors are linked lists, where linked lists works as an array, but there is a difference that we can increase or decrease its length (a handful of other properties, too).

### How to use a vector

A vector is implemented in c++ through the STL **(Standard Template Library)**. STL is included in our `bits/stdc++.h` by default, so there is no need for adding other includes. 

```cpp
#include <bits/stdc++.h>
using namespace std; 
int main()
{
    int arr[25]; // Gives a C-style array of zeroes length 25.
    vector <int> v (25); // Does exactly the same
    int arr2[25] = {3}; // Gives an array of 3s of length 25.
    vector <int> v2 (25, 3) // Does exactly the same
    int arr3[]; // Invalid, you must put a length
    vector <int> v3; // Could be done, easily
    v3.resize(20); // The vector is now of length 20
    v3.push_back(20);// The vector is now of length 21: the first 20 elements are zeroes and the last one is 20.
}
```

### Some algorithmic times related to most functions of vectors.

- `v.push_back()`: adds an element to the end of a vector, where the efficiency is $O(1)$ as it takes a constant number of operations to link the last element to the element before it.

- `v.push_front()`: adds an element to the beginning of a vector, where the efficiency is $O(1)$ as it takes a constant number of operations to link the first element to the following one.

## Final notes:

- [ ] During the next time, more things about the vectors and other data structues will be discussed.

- [ ] You have to solve the 3rd Block of Mostafa Saad's sheet.

- [ ] Write the proof that is mentioned in the logarithmic time section.
