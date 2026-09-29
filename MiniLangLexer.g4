// MiniLangLexer.g4
// Lexical analyzer for MiniLang+ (CSC 340 - Project, Second Term 2025-26)
// This file defines all token rules for the MiniLang+ language.
// ANTLR processes these rules top-to-bottom; more specific rules should appear
// before general ones to avoid incorrect token matches (e.g., keywords before ID).

lexer grammar MiniLangLexer;

// KEYWORDS
// Must be listed BEFORE the ID rule, otherwise 'if' would be tokenized as an
// identifier. ANTLR picks the first matching rule when there is ambiguity.

IF      : 'if' ;
ELSE    : 'else' ;
WHILE   : 'while' ;
FOR     : 'for' ;
PRINT   : 'print' ;

//  Identifiers
// An identifier starts with a letter (a-z or A-Z), followed by zero or more
// letters or digits. Underscore is not included per the spec.

ID      : [a-zA-Z][a-zA-Z0-9]* ;

// nteger Literals
// Non-negative integers only (no negative sign, no floats, no hex).
// The sign, if needed, is handled at the expression level by the parser.

INT     : [0-9]+ ;

// Arithmetic Operators
PLUS    : '+' ;
MINUS   : '-' ;
MULTIPLY    : '*' ;
SLASH   : '/' ;
PERCENT : '%' ;

// Boolean/Comparison Operators 
// Two-character operators (==, !=, <=, >=) must appear before their
// single-character counterparts to ensure ANTLR matches the longest token.

EQ      : '==' ;
NEQ     : '!=' ;
LTE     : '<=' ;
GTE     : '>=' ;
LT      : '<' ;
GT      : '>' ;
AND     : '&&' ;
OR      : '||' ;
NOT     : '!' ;

// Assignment 
// Single '=' for assignment; listed after '==' to avoid conflict.

ASSIGN  : '=' ;

// Delimiters 
SEMI    : ';' ;
OPAREN  : '(' ;
CPAREN  : ')' ;
OBRACE  : '{' ;
CBRACE  : '}' ;

// Comments 
// Single-line comments start with '//' and extend to the end of the line 'skip' tells ANTLR to discard these tokens entirely; they are not passed to the parser.

LINE_COMMENT : '//' ~[\r\n]* -> skip ;

// Whitespace 
// Spaces, tabs, and newlines are all skipped.

WS      : [ \t\r\n]+ -> skip ;
