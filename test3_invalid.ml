// test3_invalid.ml
// Error: missing semicolon after assignment on line 5
// Expected: syntax error reported at line 5 or 6

x = 10;
y = 20          // <-- missing semicolon here
z = x + y;
print(z);
