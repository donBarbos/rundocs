# Example of a large amount of code in markdown

- without lang name

  ```
  bash ./script
  ```

  ```
  bash ./script
  ```

- Bash code

  ```bash
  history | grep "ssh"
  ```

- Php code

  ```php
  <?php function add($x, $y) {
      $total = $x + $y;
      return $total;
  }
  echo "1 + 16 = " . add(1, 16);
  ```

- Ruby code

  ```ruby
  cities = %w[London Oslo Paris Amsterdam Berlin]
  visited = %w[Berlin Oslo]
  puts "I still need to visit:", cities - visited
  ```

- Perl code

  ```perl
  $str = "Hello Perl!";
  print "$str\n";
  ```

- JavaScript code

  ```js
  console.log("Hhhey...");
  ```

  ```js
  const a = "tytyty";
  console.log(a);
  ```

- Python code

  ```python
  print('Hello Python!')
  ```

  ```python
  a = 7 + 6 / 3
  print(a)
  ```

  ```python
  import csv
  a = [5, 1, 43, 67, 1, 9, 6, 3, 7, 8, 2, 76, 22, 0]
  for i in a:
      print(i**2)
  ```

- Visual Basic code

  ```basic
  Private Sub Form_Load()
      MsgBox "Hello Basic!"
  End Sub
  ```

- Objective-C code

  ```objective-c
  - (int)method:(int)i {
      return [self square_root:i];
  }
  ```

- C code

  ```c
  #include <stdio.h>

  typedef struct Bert Bert;
  typedef struct Wilma Wilma;
  struct Bert {
      Wilma *wilma;
  };
  struct Wilma {
      Bert *bert;
  };

  int main()
  {
      printf("Hello C!\n");
      return 0;
  }
  ```

- C++ code

  ```c++
  #include <iostream>

  int main() {
      std::cout << "Hello C++!";
      return 0;
  }
  ```

- C# code

  ```cs
  class Foo {
      public int Value;
      public static explicit operator Foo(int value) {
          return new Foo(value);
      }
  }
  Foo foo = (Foo)2;
  ```

- Java code

  ```java
  class HelloWorldApp {
      public static void main(String[] args) {
          System.out.println("Hello Java!");
      }
  }
  ```

- Go lang code

  ```go
  // You can edit this code!
  // Click here and start typing.
  package main

  import "fmt"

  func main() {
      fmt.Println("Hello Go!")
  }
  ```

- Scala code

  ```scala
  object Hello {
      def main(args: Array[String]) = {
          println("Hello Scala!")
      }
  }
  ```
