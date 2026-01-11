# S++ (Siraiki++) Compiler

![Language](https://img.shields.io/badge/Language-C-blue.svg)
![Tools](https://img.shields.io/badge/Tools-Flex%20%7C%20Bison-green.svg)
![Status](https://img.shields.io/badge/Status-Phase%201%20%26%202%20Completed-orange.svg)

## 📌 Project Overview
**S++ (Siraiki++)** is a custom programming language compiler designed to bridge the gap between computer science education and the **Siraiki language**. This project demonstrates the construction of a compiler front-end, including **Lexical Analysis** and **Syntax Analysis**, allowing users to write code using Siraiki keywords.

This repository contains the source code for:
- **Phase 1:** Lexical Analyzer (Scanner) using **Flex**.
- **Phase 2:** Syntax Analyzer (Parser) using **YACC/Bison**.

## 🚀 Key Features
* **Localized Syntax:** Replaces standard C++ keywords with native Siraiki words.
* **Tokenization:** Efficiently recognizes keywords, identifiers, operators, and literals.
* **Syntax Validation:** Validates grammatical structure (loops, conditions, declarations) using Context-Free Grammar (CFG).
* **Error Handling:** Reports syntax errors with precise line numbers and expected tokens.

## 📖 S++ Language Keywords (Dictionary)

| English (C++) | S++ (Siraiki) | Description |
| :--- | :--- | :--- |
| `int` | **adad** | Integer data type |
| `float` | **isharia** | Floating-point data type |
| `char` | **akhar** | Character data type |
| `void` | **wila** | Void return type |
| `main` | **wadda** | Main function |
| `if` | **jay** | Conditional statement |
| `else` | **natan** | Else statement |
| `for` | **valval** | For loop |
| `while` | **jitna** | While loop |
| `cout <<` | **likh <<** | Output stream |
| `cin >>` | **ghin >>** | Input stream |
| `return` | **wapas** | Return statement |
| `break` | **khal** | Break loop |
| `true` | **sahi** | Boolean True |
| `false` | **ghalat** | Boolean False |

## 🛠️ Project Structure
* `scanner.l` - Flex file for Lexical Analysis (Token generation).
* `parser.y` - Bison/YACC file for Syntax Analysis (Grammar rules).
* `code.txt` - Sample source code written in S++ for testing.
* `SiraikiCompiler` (or `a.out`) - The compiled executable.

## 💻 How to Compile & Run

### Prerequisites
You need **GCC**, **Flex**, and **Bison** installed on your system.

### on Linux (Ubuntu/Debian)
```bash
# 1. Install Tools (if not installed)
sudo apt-get install flex bison gcc

# 2. Compile the Parser (Bison)
bison -d parser.y

# 3. Compile the Scanner (Flex)
flex scanner.l

# 4. Compile C files
gcc lex.yy.c parser.tab.c -o SiraikiCompiler

# 5. Run the Compiler with Input File
./SiraikiCompiler < code.txt
```
on Windows
Make sure you have win_flex and win_bison configured in your path, or use MinGW. The commands are similar.
🧪 Example Code (S++)
```bash
wila wadda() {
    adad x = 10;
    likh << "Program shuru";
    
    jay (x < 20) {
        likh << "X chota hai";
    } natan {
        likh << "X wadda hai";
    }

    wapas 0;
}
```

👨‍💻 Author
Hafiz Abdul Hannan

Registration: L1F22BSCS0322

University: University of Central Punjab (UCP)

Course: Compiler Construction
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
If you find this project interesting, please give it a ⭐ star!
