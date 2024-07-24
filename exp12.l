%{
#include <stdio.h>
%}

/* Definitions for regular expressions */
word        [a-zA-Z]+
relop       (==|!=|<=|>=|<|>)

%%

{word}      { printf("Word: %s\n", yytext); }
{relop}     { printf("Relational Operator: %s\n", yytext); }
.           { /* Ignore other characters */ }

%%

int main(void) {
    printf("Enter text (words and relational operators):\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}