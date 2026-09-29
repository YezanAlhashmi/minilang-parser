// MiniLangParser.g4
// Parser for MiniLang+ — CSC 340, Second Term 2025-26
// We followed the grammar from the project spec and adapted it to work with ANTLR4.

parser grammar MiniLangParser;

// link this parser to our lexer so it knows where the tokens come from
options { tokenVocab = MiniLangLexer; }


// --- Program Structure ---

// the starting rule, a program is just a list of statements
program
    : stmtList EOF
    ;

// stmtList can be empty or have multiple statements
// this is the same as: StmtList -> Stmt StmtList | epsilon
stmtList
    : stmt*
    ;


// --- Statements ---

// a statement can be one of 6 things, we put the control flow ones first
// assignStmt is last because it starts with ID which is very general
stmt
    : ifStmt
    | whileStmt
    | forStmt
    | block
    | printStmt SEMI
    | assignStmt SEMI
    ;

// block is just a group of statements wrapped in curly braces
block
    : OBRACE stmtList CBRACE
    ;

// simple assignment: x = expr
// we dont put the semicolon here so we can reuse this rule inside forStmt
assignStmt
    : ID ASSIGN expr
    ;

// if statement with an optional else part
ifStmt
    : IF OPAREN expr CPAREN stmt elsePart
    ;

// else is optional, so we have two alternatives: with else or without
elsePart
    : ELSE stmt
    |
    ;

// while loop
whileStmt
    : WHILE OPAREN expr CPAREN stmt
    ;

// for loop: for(init; condition; update) body
// the semicolons here are separators, not part of assignStmt
forStmt
    : FOR OPAREN assignStmt SEMI expr SEMI assignStmt CPAREN stmt
    ;

// print statement, semicolon is handled by the stmt rule above
printStmt
    : PRINT OPAREN expr CPAREN
    ;


// --- Expressions ---
// we encode operator precedence by layering the rules
// lower precedence operators are higher up, higher precedence ones are lower down
// expr just points to the top of the precedence chain
expr
    : orExpr
    ;

// OR has the lowest precedence
orExpr
    : andExpr orExprPrime
    ;

// we use a "prime" rule to avoid left recursion, which ANTLR cant handle
// this makes || left-associative: a||b||c becomes (a||b)||c
orExprPrime
    : OR andExpr orExprPrime
    |
    ;

// AND comes before OR in precedence
andExpr
    : equalityExpr andExprPrime
    ;

andExprPrime
    : AND equalityExpr andExprPrime
    |
    ;

// equality operators == and !=
// the spec only allows one equality operator per expression so no prime rule needed
equalityExpr
    : relExpr eqOp relExpr
    | relExpr
    ;

eqOp
    : EQ
    | NEQ
    ;

// relational operators < <= > >=
// same as equality, spec allows at most one so no prime rule needed
relExpr
    : addExpr relOp addExpr
    | addExpr
    ;

relOp
    : LT
    | LTE
    | GT
    | GTE
    ;

// addition and subtraction
addExpr
    : mulExpr addExprPrime
    ;

addExprPrime
    : PLUS  mulExpr addExprPrime
    | MINUS mulExpr addExprPrime
    |
    ;

// multiplication, division, and modulo (higher precedence than + -)
mulExpr
    : unaryExpr mulExprPrime
    ;

mulExprPrime
    : MULTIPLY unaryExpr mulExprPrime
    | SLASH    unaryExpr mulExprPrime
    | PERCENT  unaryExpr mulExprPrime
    |
    ;

// unary NOT operator, right-associative so !!x is valid
// we dont have unary minus because the spec doesnt include it
unaryExpr
    : NOT unaryExpr
    | primary
    ;

// primary is the most basic unit: a variable, an integer, or a grouped expression
primary
    : ID
    | INT
    | OPAREN expr CPAREN
    ;