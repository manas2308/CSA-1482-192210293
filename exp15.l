%{
#include <stdio.h>
#include <string.h>

int valid_email = 0;

int is_valid_domain(const char *domain);
%}

/* Regular expressions for parts of the email address */
local_part  [a-zA-Z0-9._-]+
domain      [a-zA-Z0-9-]+\.[a-zA-Z]{2,}

/* Entire email address */
email       {local_part}@{domain}

%%

{email} {
    valid_email = 1;
    printf("Valid email address: %s\n", yytext);
}

. {
    // Ignore other characters
}

%%

int main(void) {
    printf("Enter email addresses to check (e.g., example@example.com):\n");
    yylex();
    if (!valid_email) {
        printf("No valid email addresses found.\n");
    }
    return 0;
}

int yywrap() {
    return 1;
}