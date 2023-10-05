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
TABLE [Tt][Aa][Bb][Ll][Ee]
CREATE [Cc][Rr][Ee][Aa][Tt][Ee](" ")+{TABLE}
DROP [Dd][Rr][Oo][Pp](" ")+{TABLE}
SELECT [Ss][Ee][Ll][Ee][Cc][Tt]
WHERE [Ww][Hh][Ee][Rr][Ee]
BY [Bb][Yy]
GROUP [Gg][Rr][Oo][Uu][Pp](" ")+{BY}
ORDER [Oo][Rr][Dd][Ee][Rr](" ")+{BY}
INSERT [Ii][Nn][Ss][Ee][Rr][Tt]
DELETE [Dd][Ee][Ll][Ee][Tt][Ee]
UPDATE [Uu][Pp][Dd][Aa][Tt][Ee]
MAX [Mm][Aa][Xx]
MIN [Mm][Ii][Nn]
AVG [Aa][Vv][Gg]
COUNT [Cc][Oo][Uu][Nn][Tt]
INTO [Ii][Nn][Tt][Oo]
VALUES [Vv][Aa][Ll][Uu][Ee][Ss]
FROM [Ff][Rr][Oo][Mm]
SET [Ss][Ee][Tt]
ASC [Aa][Ss][Cc]
DESC [Dd][Ee][Ss][Cc]
SEARCH {SELECT}|{WHERE}|{GROUP}|{ORDER}
MANIPULATE {INSERT}|{DELETE}|{UPDATE}
FUNCTION {MAX}|{MIN}|{AVG}|{COUNT}
RESERVED {INTO}|{VALUES}|{FROM}|{SET}|{ASC}|{DESC}
COMMAND	{CREATE}|{DROP}|{SEARCH}|{MANIPULATE}|{FUNCTION}|{RESERVED}
INTEGER [Ii][Nn][Tt][Ee][Gg][Ee][Rr]
DECIMAL [Dd][Ee][Cc][Ii][Mm][Aa][Ll]
VARCHAR [Vv][Aa][Rr][Cc][Hh][Aa][Rr]
TYPE {INTEGER}|{DECIMAL}|{VARCHAR}
DIGIT [0-9]
INT {DIGIT}+
FLOAT {DIGIT}+("."|,){DIGIT}+
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
({INT}(\.|,)*|{FLOAT})+[[:alpha:]]+ {
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
"*"/(" "*{DIGIT}) {
    printf(" multiplicación=%s", yytext);
}
"*" {
    printf("asterisco=%s", yytext);
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
