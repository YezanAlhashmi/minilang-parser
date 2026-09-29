# MiniLang+ Compiler — README
**CSC 340 | Second Term 2025–26**

---

## Project Structure

```
MiniLangPlus_Project_YourName/
├── MiniLangLexer.g4         # Lexical analyzer (ANTLR4 lexer grammar)
├── MiniLangParser.g4        # Parser (ANTLR4 parser grammar)
├── test1_valid.ml           # Valid test: if/else, comparisons
├── test2_valid.ml           # Valid test: for loop, boolean expressions
├── test3_invalid.ml         # Invalid test: missing semicolon
├── test4_invalid.ml         # Invalid test: unclosed brace
├── Report.md                # Project report (design decisions + AI reflection)
└── README.md                # This file
```

---

## Expected Output

**Valid programs** (test1, test2): ANTLR prints the parse tree with no error messages.

**Invalid programs** (test3, test4): ANTLR reports a syntax error with the line number where the error was detected.

---

## AI Usage Disclosure

AI tools were used to assist with generating the project report. All output was reviewed and verified by the students. See `Report.md` for the full reflection.
