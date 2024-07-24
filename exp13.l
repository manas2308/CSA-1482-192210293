%{
#include <stdio.h>
#include <string.h>

#define OLD_WORD "oldword"
#define NEW_WORD "newword"

void replace_word(const char *old_word, const char *new_word);

%}

/* Define regular expressions for words and whitespace */
word    [a-zA-Z]+
ws      [ \t\n]+

%%

{word}  {
    if (strcmp(yytext, OLD_WORD) == 0) {
        printf("%s", NEW_WORD); // Print replacement word
    } else {
        printf("%s", yytext);   // Print the matched word
    }
}

{ws}    {
    printf("%s", yytext); // Print whitespace
}

.       {
    // Print other characters as-is
    putchar(yytext[0]);
}

%%

int main(void) {
    printf("Processing input file...\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}