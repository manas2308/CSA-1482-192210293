%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int is_leap_year(int year);
int is_valid_date(int day, int month, int year);

%}

/* Regular expressions for date components */
day        [0-3][0-9]
month      [0-1][0-9]
year       [0-9]{4}
date       {day}\/{month}\/{year}

%%

{date} {
    int day = atoi(yytext);
    int month = atoi(yytext + 3);
    int year = atoi(yytext + 6);
    
    if (is_valid_date(day, month, year)) {
        printf("Valid date: %s\n", yytext);
    } else {
        printf("Invalid date: %s\n", yytext);
    }
}

. {
    // Ignore other characters
}

%%

int is_leap_year(int year) {
    return (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
}

int is_valid_date(int day, int month, int year) {
    if (month < 1 || month > 12) return 0;
    
    int days_in_month[] = {31, (is_leap_year(year) ? 29 : 28), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
    
    if (day < 1 || day > days_in_month[month - 1]) return 0;
    
    return 1;
}

int main(void) {
    printf("Enter dates in DD/MM/YYYY format:\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}