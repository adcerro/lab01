%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>
int count = 0;
int ecount = 0;
char names[80][80];
int found = 0;
%}
%option caseless
CREATE CREATE(" ")+TABLE
DROP DROP(" ")+TABLE
SEARCH SELECT|WHERE|GROUP(" ")+BY|ORDER(" ")+BY
MANIPULATE INSERT|DELETE|UPDATE
FUNCTION MAX|MIN|AVG|COUNT
RESERVED INTO|VALUES|FROM|SET|ASC|DESC
COMMAND	{CREATE}|{DROP}|{SEARCH}|{MANIPULATE}|{FUNCTION}|{RESERVED}
TYPE INTEGER|DECIMAL|VARCHAR
DIGIT [0-9]
INT {DIGIT}+
FLOAT {DIGIT}+\.{DIGIT}+
ID [[:alpha:]áéíóúàèìòùâêîôûäëïöü][[:alnum:]áéíóúàèìòùâêîôûäëïöü]*
STRING (\")[^"]*(\")|(\')[^']*(\')
%%
{COMMAND}|{TYPE} {
    int len = yyleng;
    for (int i = 0; i < len; i++) {
        yytext[i] = toupper(yytext[i]);
    }
    printf("%s", yytext);
}
and  {
   printf("conjunción=%s", yytext); 
}
or  {
   printf("disyunción=%s", yytext); 
}
{STRING}   { 
    printf(" cadena=%s", yytext); 
}
{FLOAT} {
    printf(" decimal=%s", yytext);
}
{INT} {
    printf(" entero=%s", yytext);
}
({INT}\.?|{FLOAT})+[[:alpha:]]* {
    printf("error=%s", yytext); 
    ecount++;
}
{ID}   { 
    int i = 0;
    while ( i < count && !found) {
        if (strcmp(names[i], yytext) == 0) {
            found = 1;
            printf("id%d=%s",i, yytext);
        }
        i++;
    }
    if (!found) {
        strcpy(names[count], yytext);
        printf("id%d=%s",count, yytext);
        count++;
    }
    found = 0;
}
"+"  {
   printf(" suma=%s", yytext); 
}
"-"  {
   printf(" resta=%s", yytext); 
}
"/"  {
   printf(" división=%s", yytext); 
}
"=="  {
   printf(" igualdad=%s", yytext); 
}
"="  {
   printf(" asign=%s", yytext); 
}
"(" {
    printf(" parabre=%s", yytext);
}
")" {
    printf(" parcierr=%s", yytext);
}
,	{
	printf(" coma=%s", yytext);
}
"<>"	{
	printf(" diferencia=%s", yytext);
}
"<="	{
	printf(" menoroigualq=%s", yytext);
}
">="	{
	printf(" mayoroigualq=%s", yytext);
}
"<"	{
	printf(" menorq=%s", yytext);
}
">"	{
	printf(" mayorq=%s", yytext);
}
;\n	{
	printf(" puntcoma=%s",yytext);
}
;(" ")*	{
	printf(" puntcoma=;\n");
}
"*" {
    printf(" asterisco=%s", yytext);
}
\n {
    printf(" ");
}
" " {
    printf(" ");
}
.    { 
    printf("error=%s", yytext); 
    ecount++;
}
%%

int main(int argc, char* argv[]) {
     if (argc != 2) {
        printf("Usage: %s <input_file>\n", argv[0]);
        return 1;
    }

    FILE* inputFile = fopen(argv[1], "r");
    if (inputFile == NULL) {
        perror("Error opening input file");
        return 1;
    }

    yyin = inputFile;
    yylex();
    printf("\n%d identificadores\n\n",count);
    int i;
    for (i = 0; i < count; i++) {
        printf("id%d= %s\n",i, names[i]);
    }
    printf("\n%d errores léxicos",ecount);
    fclose(inputFile);

    return 0;
}
