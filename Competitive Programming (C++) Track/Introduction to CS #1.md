# Introduction to CS #1 (Revision on the two offline sessions)

<p align="right">
<font size="5">By Sadek Mohammed</font>
</div>

CS consists of many branches, where the Hack Club discusses:

- Mobile Apps

- Games

- Cybersecurity

- Python

Although CS may look broad, you ought to learn some basics.

This intro gives you the basics, where we will use the c++ programming language.

To start coding c++, use the [codeblocks editor](https://www.codeblocks.org)

There is a template code you find in the editor once you click **create new project**.

> remember to set the path for the project

The template code is as follows

```cpp
#include <iostream>

using namespace std;

int main()
{
    // Your Code Goes here
}
```

Neglect those statements, we will explain them later. 

To output a statement add the following statement between the curly bracket.

```cpp
cout << "Hello World" << endl; // Output is: Hello World
```

You shall see the words "Hello World" in the console. 

It is notable to say that the phrase after the two back slashes are called "comments", and they are not compiled by the compiler.

Try changing the statement to

```cpp
cout << "Hello World" << "\n"; // Output is: Hello World
```

Do you feel any difference? Does that mean they are equivalent?

**Yes**, they are equal; **however,** the difference is with efficiency. endl is less efficient than \n. 

---

### Basic Data Types

**boolean**: means a true or false, and it can be represented as 0 or 1. It occupies one  byte of memory.

**int**: means an integer and is any number that lies between $-2^{31}$ and $2^{31} - 1$. It normally occupies about 4 bytes of memory but differs according to the processor and architecture. 

**unsigned int**: means a positive integer and is any number that lies between 0 and $2^{32} - 1$. It normally occupies about 4 bytes of memory but differs according to the processor and architecture.

**short**: means a short integer and is any number that lies between $-2^{16}$ and $2^{16} - 1$. It normally occupies about 2 bytes of memory but differs according to the processor and architecture.

**long long**: means a long integer and is any number that lies between $-2^{63}$ and $2^{63} - 1$. It normally occupies about 8 bytes of memory but differs according to the processor and architecture.

**float**: means a short decimal and stores about 7 decimal digits, occupying about 4 bytes of memory.

**double**: means a long decimal and stores about 15 decimal digits, occupying about 8 bytes of memory.

**char**: means a letter, and it occupies a single byte in the memory. See the ASCII chart here.!["ASCII table"](/home/sadek/Desktop/asci-table.png "ASCII Table image from asciichart.com")

```cpp
cout << (char)73 << endl; // The output is the letter "I"
```

Notice the use of the spreading operator to change from integer to char which will be discussed in the next lecture.

---

### Proof of the limits of the DataTypes

The reason of the $2^{31}$ limit of the integer is due to the nature of the memory of the computer. Imagine the 4 bytes limit, each Byte contains **8 bits**, and each bit is a transistor. That transistor has an "on" signal and "off" one. The on is represented as 1; on the other hand, off is represented as 0. Since each bit could be any of two values, and according to simple combinatorics, that implies $2^{n}$ probabilities. That directly translates to the $2^{32}$ limit of the unsigned integer. 

Since the integer contains negative values, too, we have to store an equal number of positive and negative values, so the number of values should be divided by 2. This is represented by the following formula.

$$
\frac{2^{32}}{{2^1}} = 2 ^ {32-1} = 2 ^ {31} \; (property\;of \; division \; of \; common \; bases)
$$

The reason of the recurrent $-1$ is the consideration of 0 as a positive number. (i.e. If you have space for 16 number, you, basically, have spaces for numbers from 0-15 inclusive)

---

### Operations on datatypes

#### Addition

Datatypes could be added like the ordinary mathematics sign ($+$). However, if you added two integers that exceed the limit (i.e. imagine adding $2^{31} + 2^{31}$) that causes overflow in the value of the datatype. That introduces as to the importance of **casting**.

#### Subtraction

Datatypes could be subtracted, too, using the regular subtraction sign ($-$). Remember that all datatypes (except booleans, chars, and unsigned variables) have negative values.

#### Multiplication

Datatypes could be multiplied, too, using the aestrix $(*)$. Remember that multiplication reach the maximum value quickly. 

#### Division

Datatypes could be be divided, too, using the slash ($/$). Remember to take care of decimals through casting.

#### Modulus

To check whether a number is divisible by another number. Modulus gives the remainder using a . If a number is divided by another number, it gives a remainder (modulus) of 0. 

## Run the program.

The program is simple; however, there are some steps that should be followed.

1. click *create new project*

2. choose c++

3. use *console application*

4. choose a name for the project

5. Do not edit any of the file extension stuff.

6. Remember to add a path to the project in order to avoid empty projects.

## Casting

### Definition & Syntax

Changing of a datatype into another one for a specific reason.

It is written by enclosing the target datatype with parenthesis.

```cpp
cout << (char) 73 << endl;
```

### Uses

#### The decimal division syndrome.

In the last lecture, the basic datatypes and their operations were discussed. One of the operations was the division. For example, imagine dividing 5 by 2.

```cpp
cout << 5 / 2 << endl; // The expected answer is 2.5
```

Since the expected answer is 2.5, it was surprising to see a "2" in the output console.

##### Explanation:

Since both 5 and 2 are integers by default, the compiler assign the datatype "int" to the resultant of their operations. Since integers cannot hold decimal points, the compiler ignores the ".5" part of the number and outputs 2.

##### How to fix?

If we could tell the compiler that we need the output in the decimal point, the problem would be solved. Although it may look weird to do so, the c++ language enables us to change the type of several datatypes into other ones. This is called spreading.

```cpp
cout << (float)(5 / 2) << endl; // The output is 2.5 as expected
```

*Note:* Casting to a double could have been a possible solution.

#### Avoiding overflows

In the normal case, that code will overflow and give random results.

```cpp
    int x = pow(2, 30); // The pow function is in the
    cout << x << endl;
    cout << x * x << endl;
```

To solve that problem, just cast into a long long.

```cpp
cout << (long long)(x * x) << endl;
```

pow is a function in the `<cmath>` and `<math.h>` Although adding `#include<cmath>` into our code may look like a potential solution, it would be both unbearable and time-consuming to include a library for each function we use. That's why competitive programmers use the following include only, where it includes all other includes.

```cpp
#include <bits/stdc++.h>
using namespace std;
int main()
{
    // The new configuration for coding.
}
```

#### Chars

Remember the code `cout << (char)73 << endl` from the last lecture. That line outputs a capital "I" in the console.

## Array

### What is an array?

During the last lectures, variables were used like this:

```cpp
int studentOneMark = 25; // An expression that initializes a variable
```

Imagine that you have 10 students! It would be impossible to keep track of ten different variables, so arrays were invented. The code of an array is like this.

```cpp
int studentsMarks[10] = {25, 24, 23, 22, 21, 18, 22, 16, 25, 17};
```

### Array Operations

In order to access the elements of an array, indices are used. C++ and most programming languages are zero-based. That means that if an array has the length n, it has indices from zero to n-1.

That implies that if we were talking about the element in the second index, we are talking about the third element. If we were talking about the element in the zeroth index, we are talking about the first element and so on.

Arrays cannot be multiplied, divided, added, subtracted, powered, appended to other arrays, or even append other elements to it. The only available operations are accessing certain indices or modify elements at certain indices.

**See the following codes that talk about the above array**

```cpp
cout << studentMarks[3] << endl; // Output is 22
cout << studentMarks[2] - studentMarks[9] << endl; // Output is 6
cout << studentMarks[10] << endl; // Invalid: There is no such index.
```

### Another Useful operation

Sorting an array is an interesting operation, where it puts the array in ascending order according to their value. Imagine the following array.

```cpp
int students[4] = {12, 15, 10, 13};
```

And the teacher wants to know what mark the least students achieved. The f irst thing to do is to examine each and every value storing the minimum; however, we can do better.

```cpp
sort(students, students + 4);
cout << students[0] << endl;
```

If the array is sorted ascendingly, the first element will be the smallest element, and the last one would be the greatest.

### Length of an array

In the normal C-style arrays, knowing the number of elements in an array does not have an implementation; however, there is a trick that you could use.

```cpp
cout << sizeof(marks) << endl; // prints 20 on the screen
cout << sizeof(marks[0]) << endl; // prints 4 on the screen
cout << sizeof(marks) / sizeof(marks[0]) << endl; // prints 5 on the screen
```

Notice that the first print statement gave us 20, which is the size of 5 integers (elements of the array). By dividing the size of the array by the size of a single element, you get the number of elements of the array.

## Boolean Expressions

Through the discussion of data types, Booleans were explained. Booleans are the datatypes that denote true or false. Other expressions are evaluated by the compiler and assigned Boolean values.

- x == 5 (Equality operator; checks whether two quantities are equal or not)

- x != 5 (Inequality operator; checks whether two quantities aren't equal or not)

- x < 5 (Less than operator; checks whether quantity is less than another one or not)

- x > 5 (More than operator; checks whether quantity is more than another one or not)

- x <= 5 (Less than or equal operator; checks whether quantity is less than or equal another one or not)

- x >= 5 (More than or equal operator; checks whether quantity is more than or equal another one or not)

## If conditions

If conditions is a control element that depends on Boolean expressions. it starts with the word if, then a bracket that encloses the booolean expressions. If the boolean expression yields ture, the code block inside the curly braces is done. Otherwise, else statement works. If there are some else if statements, they are checked before executing the else.

```cpp
int num = 0;
if (num < 0)
{
    cout << "num is less than zero";
}
else if (num > 0)
{
    cout << "num is more than zero";
}
else
{
    cout << "num is strictly zero";
}
```

## Scope

To use a variable, it is necessary to declare it, where for each line of code, there is a scope(range of lines of code) that the variable could be manipulated within.

### Examples:

If a variable is declared out of a function, it is visible in all of the program's functions that are below it.

If a variable is declared inside a certain function, it is visible in all of the function's lines that are below it.

If a variable is declared inside a certain code block, such as a loop or if condition (to be explained), it is visible in all of the block's lines of code away from it.

## Loops

Imagine that you have the following piece of code.

```cpp
cout << "Hello" << endl;
cout << "Hello" << endl;
cout << "Hello" << endl;
// Those lines of code output "Hello" three times, each in a line.
```

Imagine that you need to save that effort by writing an easier block of code. Here comes the advantage of loops, which is repetition.

```cpp
//   initialize variable; condition; loop step
for (int i = 0; i < 3; i++)
{
    // body of the loop: orders.
    cout << "Hello" << endl;
}
```

During a loop, the compiler initializes the first value in the expression. After that, it checks the condition, and if that expression yielded true, the statements in the body of the loop are executed. After that, increment operator is used to cause a change in the value of i. After changing the i variable, the compiler checks the condition again. If that condition is true, the loop is continued and so on.

- [ ] The initialized variable is appropriate and does not interfere with any other variables of a higher scope.

- [ ] The step could reach the condition. For example, if i is initialized to 5 and the condition is to stop when i reaches 8. That's why making the loop step to decrement i is meaningless as i won't reach 5 by subtracting ones.

Thanks for attending that session. I'd like to give you a task.
- Solve the first 16 problem of Mostafa Saad's Sheet.
- Write a proof that dividing the sizeof an array by the size of a single element would always yield an integer. 
