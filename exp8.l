%{
#include <stdio.h>
%}

/* Definitions for vowels and non-vowel characters */
%%
^[aeiouAEIOU][a-zA-Z]* {
    printf("Accepted: %s\n", yytext);
}

[a-zA-Z]+ {
    printf("Rejected: %s\n", yytext);
}

[ \t\n]+ {
    // Ignore whitespace
}

. {
    // Ignore other characters
}

%%

int main(void) {
    printf("Enter strings to check if they start with a vowel (Ctrl+D to end):\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
