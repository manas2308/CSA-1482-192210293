%{
#include <stdio.h>
#include <stdlib.h>

int operand1 = 0;
int operand2 = 0;
char operator = '\0';

void perform_operation(int op1, char op, int op2);

%}

/* Regular expressions for numbers and operators */
number  [0-9]+
operator [\+\-\*/]

%%

{number} {
    if (operator == '\0') {
        operand1 = atoi(yytext); // First operand
    } else {
        operand2 = atoi(yytext); // Second operand
        perform_operation(operand1, operator, operand2); // Perform the operation
        operator = '\0'; // Reset operator for the next operation
    }
}

{operator} {
    operator = yytext[0]; // Save the operator
}

[ \t\n]+ {
    // Ignore whitespace
}

. {
    // Ignore other characters
}

%%

void perform_operation(int op1, char op, int op2) {
    int result;
    switch (op) {
        case '+':
            result = op1 + op2;
            break;
        case '-':
            result = op1 - op2;
            break;
        case '*':
            result = op1 * op2;
            break;
        case '/':
            if (op2 == 0) {
                printf("Error: Division by zero\n");
                return;
            }
            result = op1 / op2;
            break;
        default:
            printf("Unknown operator: %c\n", op);
            return;
    }
    printf("%d %c %d = %d\n", op1, op, op2, result);
}

int main(void) {
    printf("Enter mathematical expressions (e.g., 3 + 4):\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}