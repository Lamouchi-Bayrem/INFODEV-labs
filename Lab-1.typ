#import "Class.typ": *

#show: ieee.with(
  title: [#text(smallcaps("Lab #1: Getting started with Julia"))],
  /*
  abstract: [
    #lorem(10).
  ],
  */
  authors:
  (
    (
      name: "Abdelbacet Mhamdi",
      department: [Senior-lecturer, Dept. of EE],
      organization: [ISET Bizerte --- Tunisia],
      profile: "a-mhamdi",
    ),

    /*
    (
      name: "Lamouchi BAyrem",
      department: [Dept. of EE],
      organization: [ISET Bizerte --- Tunisia],
      profile: "L-BAyrem",
    ),
    
  */

  )
  // index-terms: (""),
  // bibliography-file: "Biblio.bib",
)

= Exercises
The following exercises will help you practice various aspects of Julia, such as functions, loops, conditionals, arrays, and file processing. Remember to break down the exercises into smaller steps and test your code along the way. You are required to carry out this lab using either of:

#figure(
    stack(
        dir: ltr,       // left-to-right
        spacing: 1cm,   // space between contents
        image("Images/Jupyter.png", width: 10%, fit: "contain"),
        image("Images/Pluto.svg", width: 50%, fit: "contain"),
    ),
)

#exo[Fibonacci Sequence][Write a function that generates the Fibonacci sequence#footnote[The Fibonacci sequence starts with $0$ and $1$, and each subsequent number is the sum of the two preceding numbers.] up to a given number $n$.]

// The function should return an array of the Fibonacci sequence. For example, if $n = 10$, the function should return $[0, 1, 1, 2, 3, 5, 8, 13, 21, 34]$.


$F_(0) = 0 \ F_(1) = 1 \  F_(n) = F_(n-1)+F_(n-2) quad forall n >= 2$

```julia
Fibonacci Sequence (n::Int)
  if n <= 1
    return n
  if n>=2
    return Fibonacci Sequence(n-1) + Fibonacci Sequence(n-2)
  end
end
```

#test[Display the Fibonacci sequence if $n=16$.]

#exo[Prime Number][Write a function that determines if a given number $n$ is prime#footnote[A prime number is a number greater than $1$ that has no positive divisors other than $1$ and itself.]. The function should return true if the number is prime and false otherwise.]

```julia
function is_prime(n::Int)
  if n <= 1
    return false  # Numbers 1 or less are not prime
  elif n <= 3
    return true  # 2 and 3 are prime
  elif n % 2 == 0 || n % 3 == 0
    return false  # Multiples of 2 or 3 are not prime (except 2 and 3)
  end

  i = 5
  while i^2 <= n
    if n % i == 0 || n % (i + 2) == 0
      return false
    end
    i += 6
  end

  return true
end

```

#test[Give the list of prime numbers less than $100$.]

#exo[Palindrome][Write a function that checks if a given string is a palindrome#footnote[A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward.]. The function should return true if the string is a palindrome and false otherwise.]

```julia
function fibonacci(n::Int)
  if n <= 1
    return n
  end

  a, b = 0, 1  # Initialize first two Fibonacci numbers
  for _ in 2:n
    c = a + b
    a, b = b, c  # Update the previous two numbers
  end
  return c
end

# Display Fibonacci sequence for n = 16
n = 16
for i in 1:n
  println(fibonacci(i-1))  # Print each Fibonacci number (0-based indexing)
end
```

#test[Check the sentence "Was it a car or a cat I saw?". Disregard spaces and punctuation marks.] 

#exo[Matrix Operation][Implement functions to perform basic matrix operations such as matrix addition, matrix multiplication, and determinant calculation.]

```julia
# Function for matrix addition (assuming matrices have the same dimensions)
function matrix_add(A::Matrix, B::Matrix)
  if size(A) != size(B)
    error("Matrices must have the same dimensions for addition")
  end

  rows, cols = size(A)
  C = zeros(rows, cols)
  for i in 1:rows
    for j in 1:cols
      C[i, j] = A[i, j] + B[i, j]
    end
  end
  return C
end

# Function for matrix multiplication (assuming compatible dimensions)
function matrix_mul(A::Matrix, B::Matrix)
  rows_A, cols_A = size(A)
  rows_B, cols_B = size(B)
  if cols_A != rows_B
    error("Incompatible dimensions for matrix multiplication")
  end

  C = zeros(rows_A, cols_B)
  for i in 1:rows_A
    for j in 1:cols_B
      for k in 1:cols_A
        C[i, j] += A[i, k] * B[k, j]
      end
    end
  end
  return C
end

# Function for determinant calculation using Gaussian elimination (recursive)
function determinant(A::Matrix)
  n = size(A)[1]  # Get the number of rows/columns (assuming square matrix)
  if n == 1
    return A[1, 1]  # Determinant of a 1x1 matrix is the single element
  end
```

#test[Test your functions with the following matrices
```julia
A = [1 2; 3 4]
B = [5 6; 7 8]
```
]

#exo[File Processing][Write a program that reads a text file and counts the occurrences of each word. Display the word count for each unique word in the file.]

```julia
function count_words(text::String)
  # Open the text file for reading
  file = open(teaxt.txt)

  # Initialize an empty dictionary to store word counts
  word_counts = Dict{String, Int}()

  # Read the file line by line
  for line in eachline(text)
    # Split the line into word 
    words = split(lowercase(replace(line, r"^\W+", "")), r"\W+").filter(x -> x != "")

    # Add word counts to the dictionary
    for word in words
      word_counts[word] = get(word_counts, word, 0) + 1
    end
  end

  # Close the file
  close(file)

  # Display word counts
  println("Word Counts:")
  for (word, count) in word_counts
    println("$word: $count")
  end
end

# Example usage: Replace "your_file.txt" with the actual file path
count_words("your_file.txt")

```

#test[Redirect the output of 'man ls' command to a dummy file and display the word count for 'ls'
```bash
man ls > dummy
```
]

