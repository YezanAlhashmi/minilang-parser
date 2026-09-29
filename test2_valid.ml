// test2_valid.ml
// Tests: for loop, arithmetic expressions, boolean operators, nested print
// Expected: parses successfully, no errors

sum = 0;
flag = 1;

for (i = 0; i < 10; i = i + 1) {
    sum = sum + i;
}

// Print result only if flag is set and sum is not zero
if (flag == 1 && sum != 0) {
    print(sum);
}
