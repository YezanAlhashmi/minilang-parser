// test4_invalid.ml
// Error: missing closing brace '}' for the while block
// Expected: syntax error reported near end of file

x = 1;

while (x < 5) {
    print(x);
    x = x + 1;
// <-- missing closing '}' here

print(x);
