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
%}
%option caseless
%option yylineno
CREATE CREATE(" ")+TABLE
DROP DROP(" ")+TABLE
INSERT INSERT(" ")+INTO
VALUES VALUES
SEARCH SELECT|WHERE|GROUP(" ")+BY|ORDER(" ")+BY
MANIPULATE DELETE|UPDATE
FUNCTION MAX|MIN|AVG|COUNT
RESERVED FROM|SET|ASC|DESC
COMMAND	{SEARCH}|{MANIPULATE}|{FUNCTION}|{RESERVED}
EXTYPE DECIMAL|VARCHAR
INTEGER INTEGER
DIGIT [0-9]
INT {DIGIT}+
FLOAT {DIGIT}+\.{DIGIT}+
ID [[:alpha:]áéíóúàèìòùâêîôûäëïöü][[:alnum:]áéíóúàèìòùâêîôûäëïöü]*
STRING (\")[^"]*(\")|(\')[^']*(\')
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
{VALUES}    {
    return VALUES;
}
{EXTYPE} {
    return EXTYPE;
}
{INTEGER}   {
    return INT;
}
and  {
//   printf("conjunción=%s", yytext); 
}
or  {
//   printf("disyunción=%s", yytext); 
}
{STRING}   { 
//    printf(" cadena=%s", yytext); 
}
{FLOAT} {
//    printf(" decimal=%s", yytext);
    return NUM;
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
}
"-"  {
//   printf(" resta=%s", yytext); 
}
"/"  {
//   printf(" división=%s", yytext); 
}
"=="  {
//   printf(" igualdad=%s", yytext); 
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
"<>"	{
//	printf(" diferencia=%s", yytext);
}
"<="	{
//	printf(" menoroigualq=%s", yytext);
}
">="	{
//	printf(" mayoroigualq=%s", yytext);
}
"<"	{
//	printf(" menorq=%s", yytext);
}
">"	{
//	printf(" mayorq=%s", yytext);
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


