# Number Theory

## Prime numbers.

### Definitionz

Prime numbers are the numbers that have no divisors other than themselves and $1$. A quick note is that 1 is not considered a prime number as it has only a single divisor (itself).

### How to know whether a number is prime or not.

Just try to factor the number, and if it had factors other than itself and one, then it is not prime; otherwise it's a prime.

### Testing primes in CS.

Checking whether a number is prime or not using c++ has many approaches.

#### Extremely naive approach.

Iterate through all numbers from $2$ to $n-1$. If any of them divides $n$, n is a compsoite (not prime) number.

```cpp
    int n = 0;
    cin >> n; // Taking a number from the input and looping from 2 
              // to the number
    for (int i = 2; i < n; i++)
    {
        if ((n%i) == 0)
        {
            cout << "not prime";
            return 0;
        }
    }
    cout << "number is prime";
```

Since the solution iterates through all numbers to $n$, the solution has $O(n)$.

#### Slight Optimization

Since we now that even numbers (except 2) are composites, we will exclude even numbers and loop through odd numbers only.

```cpp
    int n = 0;
    cin >> n;
    // Excluding the only even prime number
    if (n == 2)
    {
        cout << "number is prime";
        return 0;
    }
    // If a number is even then it is not prime (as we excluded 2).
    if ((n%2) == 0)
    {
        cout << "not prime";
        return 0;
    }
    // Since the number is odd, there is not point of checking whether an even number divides it.
    for (int i = 3; i < n; i+=2)
    {
        if ((n%i) == 0)
        {
            cout << "not prime";
            return 0;
        }
    }
    cout << "number is prime";
```

This solution works in $O(\frac{1}{2}n)$, which corresponds to O(n) and is not the best modification.

#### Extreme Optimization

##### Solution Explanation

What can you notice about divisors of a number? (Talk 12 as an example)

$$
1 \cdot 12 \newline
2 \cdot 6 \newline
3 \cdot 4 \newline
4 \cdot 3 \newline
6 \cdot 2 \newline
12 \cdot 1 
$$




Still cannot recognize the pattern?
Look at the perfect square, 36! 

$$
1 \cdot 36 \newline
2 \cdot 18 \newline
3 \cdot 12 \newline
4 \cdot 9 \newline
6 \cdot 6 \newline
9 \cdot 4 \newline
12 \cdot 3 \newline
18 \cdot 2 \newline
36 \cdot 1 

$$

Divisors DO repeat, and they do so after the perfect square.

##### Our theorem

To check whether a number $n$ is a prime or not, you have to look upon all values from to 2 to the square root of the number. If no integer in that range divides the number $n$, then no one will do so at all.

```cpp
    int n = 0;
    cin >> n; // Take a number from the input and loop till 
              // its square root.
    for (int i = 2; i <= sqrt(n); i++)
    {
        // If a number divides n, then n is not prime.
        if ((n%i) == 0)
        {
            cout << "not prime";
            return 0;
        }
    }
    // n is prime if no number divides it
    cout << "number is prime";
```

##### The last optimization

The last optimization is to get rid of the sqrt function as sqrt returns a float which is neither memory nor time efficient and sometimes produces errors.

$$
i \le \sqrt{n} \newline
i^2 \le n 
$$

```cpp
    int n = 0;
    cin >> n;
    // Notice getting rid of sqrt
    for (int i = 2; i*i <= n; i++)
    {
        if ((n%i) == 0)
        {
            cout << "not prime";
            return 0;
        }
    }
    cout << "number is prime";
```

### Generating primes in a certain range

Imagine that you need to know all primes from $1$ to $100$. Looping over all numbers needs $O(n)$ operations and checking whether a number is prime or not is $O(\sqrt n)$. That leaves us with a total complexity of $O(n\sqrt n)$.

#### What can we do better.

Imagine that we have an array of $n$ numbers. Each number is not a prime if a number that is before it divides it. That implies that we will do the following:

- Initialize a boolean array with the size of $n+1$ with the value zero. 
- Loop over all numbers in the range of $2$ to $n$.
- We have two cases
  - The number has a state of zero: the number is prime and we should loop over all of its multiples and change their state to 1.
  - The number's state is 1: then the number is composite, and all of its multiples are labelled, so we just skip it.

#### Implementation

The following code prints all primes in the range from 1 to 100000.

```cpp
    // Define the range and intialize an array with every element in
    // the range with zero.
    int n = 100000;
    bool sieve[n + 1] = {0};
    for (int i = 2; i <= n; i++)
    {
        // If no previous number has marked this number as composite, 
        // the number is prime.
        if (sieve[i] == 0)
        {
            // output it.
            cout << i << " is prime" << endl;
            // Loop over all of its multiples and mark them as composite.
            for (int j = i + i; j<= n; j+=i)
            {
                sieve[j] = 1;
            }
        }
    }
```

#### A bit of history

This algorithm is called `The sieve of Erastothenesis`, where that person was a scientist in Alexandria library during the BCE times. He was the first one to measure the radius of earth through collecting data about the motion of camels.

## Divisors

We have seen that primes have no divisors other than themseives and $1$. No we will investigate compsites and their divisors.

### Notation

- $a \mid b$ means that $a$ is a divisor of $b$.
- $a \nmid b$ means that $a$ is not a divisor of $b$.

### Could you get all divisors of a number

#### Divisors of 48

48 has the following divisors: 

- 1: $\frac{48}{1} = 48$
- 2: $\frac{48}{2} = 24$
- 3: $\frac{48}{3} = 16$
- 4: $\frac{48}{4} = 12$
- 6: $\frac{48}{6} = 8$
- 8: $\frac{48}{8} = 6$
- 12: $\frac{48}{12} = 4$
- 16: $\frac{48}{16} = 3$
- 24: $\frac{48}{24} = 2$
- 48: $\frac{48}{48} = 1$

48 has $10$ divisors: {1, 2, 3, 4, 6, 8, 12, 16, 24, 48}.

#### Divisors of 36

36 has the following divisors:

- 1: $\frac{36}{1} = 36$
- 2: $\frac{36}{2} = 18$
- 3: $\frac{36}{3} = 12$
- 4: $\frac{36}{4} = 9$
- 6: $\frac{36}{6} = 6$
- 9: $\frac{36}{9} = 4$
- 12: $\frac{36}{12} = 3$
- 18: $\frac{36}{18} = 2$
- 36: $\frac{36}{36} = 1$

36 has 9 divisors: {1, 2, 3, 4, 6, 9, 12, 18, 36}.

#### Theorem

Perfect squares have odd number of divisors, where other numbers have even number.

##### Proof

Divisors come in pairs, look:

- 36: {1, 36}, {2, 18}, {3, 12}, {4, 9}, {6, 6}, {9, 4}, {12, 3}, {18, 2}, {36, 1}.
- 48: {1, 48}, {2, 24}, {3, 16}, {4, 12}, {6, 8}, {8, 6}, {12, 4}, {16, 3}, {24, 2}, {48, 1}.

What have you notices?

Perfect squares have a pair that contains the same element.

### How am I that sure that 48 has 10 divisors?

Someone might ask about the reason of me being so sure. Everyone knows that checking whether a number is a divisor is easy, but a person may fear that they forget a divisor or two while getting them. The key to being sure is prime factorizations.

### What is prime factorization?

It is well known that a number could be represented as a multiplication of some prime (You have seen that sieve depended on that). Some examples:

- $4 = 2 \cdot 2 = 2^2$.
- $6 = 2 \cdot 3 = 2^1 \cdot 3^1$.
- $100 = 10 \cdot 10 = 2 \cdot 5 \cdot 2 \cdot 5 = 2^2 \cdot 5^2$.
- $12 = 4 \cdot 3 = 2^2 \cdot 3 = 2^2 \cdot 3^1$
- $36 = 3 \cdot 12 = 3 \cdot 2^2 \cdot 3^1 = 2^2 \cdot 3^2$.
- $48 = 4 \cdot 12 = 2^2 \cdot 2^2 \cdot 3^1 = 2^4 \cdot 3^1$.

But, how do all of that relate to the number of divisors?

#### Relation between prime factors and divisors.

You have seen that the divisors of a number are a mixture of composites and prime numbers. Those composites are always combinations of prime factors of different powers. For example 9 is a composite divisor of 36, where one of the prime factors of 36 is $3^2$. Take another one, 10 is a divisor of $100$, where 10 = $2 \dot 5$, where that is a part of the prime factorization of $100 = 2^2 \dot 5^2$.

Let's define T(n) as the number of divisors of a number $n$ that has $t$ divisors and $a_i$ is the $i$-th prime divisor of $n$.

$$
n = a_{i}^{x_i} \cdot a_{i+1}^{x_i+1} \dots a_{t}^{x_t}
    T(n) = ({x_i} + 1) \cdot ({x_{i+1}} + 1) \dots ({x_t} + 1)
$$

But, what does mean and how did it come from?

If a number, take 48 as an example, has the following factorization: $2^4 \dot 3^1$. Then each of its divisors can have one, two, or all of these terms in its factorization:

- $2^0$
- $2^1$
- $2^2$
- $2^3$
- $2^4$
- $3^0$
- $3^1$ 

That means that a divisor of 48 has $5$ possibilites for the power of $2$ in its factorization and $2$ possibilites for the power of $3$ in its factorization, which gives us a total of $2 \cdot 5 = 10$ possibilities.

#### How to implement a program that gives the prime factorization of a number.

```cpp
    // Initialize a number and take it from the input
    int n = 0;
    cin >> n;
    // Declare a vector to store the prime factors
    vector <int> v;
    // notice that we loop till the sqrt of n as before
    for (int i = 2; i * i <= n; i++)
    {
        // If a number divides n, just divide n by the number 
        // till it is not divisible
        while (n%i == 0)
        {
            // each time add the factor to the vector 
            n/=i;
            v.push_back(i);
        }
    }
    // if n is not equal to one, then n is prime, and 
     // we should add it to the list of factors.
    if (n != 1)
    {
        v.push_back(n);
    }
    // Output the divisors
    for (int i = 0; i < (int)v.size(); i++)
    {
        cout << v[i] << endl;
    }
```

Notice that this code is easily modifiable and could be changed to adapt to other functions as counting all divisors, the distinct prime divisors and others.