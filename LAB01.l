%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>
#include "LAB02.h"
int count = 0;
int ecount = 0;
char names[80][80];
int found = 0;
#define YY_USER_ACTION yylloc.first_line = yylloc.last_line = yylineno;
%}
%option caseless
%option yylineno
CREATE CREATE(" ")+TABLE
DROP DROP(" ")+TABLE
INSERT INSERT(" ")+INTO
DELETE DELETE(" ")+FROM
SELECT SELECT
GROUP GROUP(" ")+BY
ORDER ORDER(" ")+BY
SET SET
FROM FROM
FUNCTION MAX|MIN|AVG|COUNT
RESERVED ASC|DESC
EXTYPE DECIMAL|VARCHAR
INTEGER INTEGER
DIGIT [0-9]
INT {DIGIT}+
FLOAT {DIGIT}+\.{DIGIT}+
ID [[:alpha:]áéíóúàèìòùâêîôûäëïöü][[:alnum:]áéíóúàèìòùâêîôûäëïöü]*
STRING (\")[^"]*(\")|(\')[^']*(\')
COMPARE "<>"|"<="|">="|"<"|">"|"=="	
%%
{CREATE}    {
    return CREATE;
}
{DROP}  {
    return DROP;
}
{INSERT}    {
    return INSERT;
}
{DELETE}    {
    return DELETE;
}
{EXTYPE} {
    return EXTYPE;
}
{INTEGER}   {
    return INT;
}
{SET}   {

}
WHERE   {
    return WHERE;
}
update  {
    return UPDATE;
}
values    {
    return VALUES;
}
and  {
//   printf("conjunción=%s", yytext);
    return AND;
}
or  {
//   printf("disyunción=%s", yytext); 
    return OR;
}
{COMPARE}   {
    return CMP;
}
{STRING}   { 
//    printf(" cadena=%s", yytext); 
    return STR;
}
{FLOAT} {
//    printf(" decimal=%s", yytext);
    return FNUM;
}
{INT} {
//    printf(" entero=%s", yytext);
    return NUM;
}
({INT}\.?|{FLOAT})+[[:alpha:]]* {
//    printf("error=%s", yytext); 
//    ecount++;
    return ERROR;
}
{ID}   { 
//    int i = 0;
//    while ( i < count && !found) {
//        if (strcmp(names[i], yytext) == 0) {
//            found = 1;
//            printf("id%d=%s",i, yytext);
//        }
//        i++;
//    }
//    if (!found) {
//        strcpy(names[count], yytext);
//        printf("id%d=%s",count, yytext);
//        count++;
//    }
//    found = 0;
return ID;
}
"+"  {
//   printf(" suma=%s", yytext);
    return PLUS;
}
"-"  {
//   printf(" resta=%s", yytext); 
    return MINUS;
}
"/"  {
//   printf(" división=%s", yytext); 
    return DIV;
}
"="  {
//   printf(" asign=%s", yytext); 
}
"(" {
//    printf(" parabre=%s", yytext);
 return AP;
}
")" {
//    printf(" parcierr=%s", yytext);
return CP;
}
,	{
//	printf(" coma=%s", yytext);
return COMA;
}
;\n	{
//	printf(" puntcoma=%s",yytext);
return PC;
}
;(" ")*	{  
//	printf(" puntcoma=;\n");
return PC;
}
"*" {
//    printf(" asterisco=%s", yytext);
return AST;
}
\n {
//    printf(" ");
}
" " {
//    printf(" ");
}
.    { 
//    printf("error=%s", yytext); 
//    ecount++;
    return ERROR;
}
%%


