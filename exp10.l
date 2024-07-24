%{
#include <stdio.h>
#include <string.h>
%}

%%

"http://" { printf("Protocol: http://\n"); }
"https://" { printf("Protocol: https://\n"); }

[a-zA-Z0-9\-]+\.[a-zA-Z]{2,} {
    printf("Domain: %s\n", yytext);
}

"/"[^ \n\t?]* {
    printf("Path: %s\n", yytext);
}

"?"[a-zA-Z0-9=&]* {
    printf("Query: %s\n", yytext);
}

\n { printf("\n"); }

. { /* Ignore other characters */ }

%%

int main(int argc, char **argv) {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
