# Algorithmic Time

<p style="align-text:left;">
By Sadek Mohammed
</p>

## O(n)

Notice the following piece of code.

```cpp
int n = 0; // Initialize the value of the number
cin >> n; // Take it from the input
long long sum = 0; // Initalize a variable for the sum
for (int i = 1; i <= n; i++) // Loop through all the numbers from 1 to n
{
    sum += i; // Add each number to the sum variable
}
cout << sum << endl; // Print the sum of numbers from 1 to n
```

<u>**constant time:**</u> Time that is independent from the size of the input

### Let's calculate

It is notable that taking the number from the input (2nd line) is independent of the size of n. Imagine taking 100 or 1000 from the input, it will always take one operation only.

On the other hand, imagine the loop that goes from 1 to n: if the n is 100, it will work a hundred time If the n is 1000, it will work for 1000 times (so on).

If you are on a contest and n is at most $n \le {\space5\space\cdot\space10 ^ 6}$, you could easily use a O(n) code.

### But, what if the constraints are something like $10^{12}$

You need to optimize your code, try the following formula.

$$
\frac{n \space\cdot\space (n+1)}{2}
$$

```cpp
long long n = 0, sum = 0;
cin >> n;
sum = n * (n + 1);
sum /= 2;
```

### let's calculate again

We know that initializing variables and taking them from the standard input takes a constant time. But what about the formula.

**Think of it**: If $n = 100$, the formula does 3 calculations: 

$$
n+1, n \cdot n+1, division\space by\space two
$$

**But what if**: $n = 1000$, the formula does 3 calculations, too: 

$$
n+1, n \cdot n+1, division\space by\space two
$$

Finally, formulas are constant time operations: O(1). That was our first code optimization problem.

## Essential Proof

It's important that you always search for proof for new stuff. Adore mathematics because it will help you a lot.

$$
First\space row: 1\space\space\space\space2\space\space\space\space ...\space\space\space\space  n-1 \space\space\space\space  n \newline
Second\space row: n\space\space\space\space n-1\space\space\space\space ... \space\space\space\space2\space\space\space\space1 \newline
Addition\space row: n+1 \space\space\space\space n+1 \space\space\space\space ... \space\space\space\space n+1 \space\space\space\space n+1 
$$

**The first row**: represents numbers from 1 to n in sorted order. 

It's notable that the sum of that row is the sum from the numbers from 1 to n (first observation)

**The second row**: represents numbers from 1 to n in reversed order.

It's notable that the sum of that row is the sum from the numbers from 1 to n (second observation)

The sum of the two rows together gives is $2 \space\cdot \Sigma_{i =1}^{n}\space{i}$

A creative method to some the two rows is too look upon the addition row, where it contains $(n+1)$ , repeated for $n$ times. 

That means that $n \space\cdot (n+1)$ is equal to $2 \space\cdot \Sigma_{i =1}^{n}\space{i}$

That directly implies that $\Sigma_{i =1}^{n}\space{i}$ is equal to $\frac{n \space\cdot\space (n+1)}{2}$

## Task  #1

Each time, I think of a weird proof for you. This time: I would like you to prove that $\frac{n \space\cdot\space (n+1)}{2}$ will always produce an integer not a decimal, although it is a fraction. 

Hints: 

1. You could try to prove that $n \space\cdot (n+1)$ is even.

2. You can use the proof of the formula.

## Loops

Loops are usually the multiplication of the limits of the loops and/or nested loops.

#### See this:

```cpp
for (int i = 0; i < 100; i++)
{
    for (int j = 0; j < 100; j++)
    {
        // Do something
    }
}
```

The first loop moves 100 times; however, the second loop moves 100 times. 

That means that the total number is $100 \cdot 100 = 10000$

Look at this one:

```cpp
int n = 0;
cin >> n;
for (int i = 0; i < n; i++)
{
    for (int j = 0; j < n; j++)
    {
        // Do something
    }
}
```

The loop works at the efficiency of  $O(n^2)$

### Other styles:

```cpp
for (int i = 0; i < 1000; i++)
{
    for (int j = 0; j < 100; j++)
    {
        // Do something
    }
}
```

The first loop moves 100 times; however, the second loop moves 100 times.

That means that the total number is $100 \cdot 1000 = 100000$

Look at this one:

```cpp
int n = 0, m = 0;
cin >> n >> m;
for (int i = 0; i < n; i++)
{
    for (int j = 0; j < m; j++)
    {
        // Do something
    }
}
```

The loop works at the efficiency of $O(n \space\cdot m)$

```cpp
int n = 0;
cin >> n;
for (int i = 0; i < n; i++)
{
    for (int j = i+1; j < n; j++)
    {
        // Do something
    }
}
```

---

Solve the second block of Mostafa Saad's sheet.
