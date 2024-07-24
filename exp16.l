%{
#include <stdio.h>
#include <string.h>
%}

/* Define regular expression for the substring 'abc' */
ABC_SUBSTR  abc

%%

{ABC_SUBSTR} {
    // Replace 'abc' with 'ABC'
    printf("ABC");
}

. {
    // Print other characters as they are
    putchar(yytext[0]);
}

%%

int main(void) {
    printf("Enter a string (to be processed):\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}