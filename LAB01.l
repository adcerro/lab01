%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>
%}
TABLE [Tt][Aa][Bb][Ll][Ee]
CREATE [Cc][Rr][Ee][Aa][Tt][Ee]" "{TABLE}
DROP [Dd][Rr][Oo][Pp]" "{TABLE}
SELECT [Ss][Ee][Ll][Ee][Cc][Tt]
WHERE [Ww][Hh][Ee][Rr][Ee]
BY [Bb][Yy]
GROUP [Gg][Rr][Oo][Uu][Pp]" "{BY}
ORDER [Oo][Rr][Dd][Ee][Rr]" "{BY}
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
ID [:alpha:][:alnum:]*
INTEGER [Ii][Nn][Tt][Ee][Gg][Ee][Rr]
DECIMAL [Dd][Ee][Cc][Ii][Mm][Aa][Ll]
VARCHAR [Vv][Aa][Rr][Cc][Hh][Aa][Rr]
TYPE {INTEGER}|{DECIMAL}|{VARCHAR}
DIGIT [0-9]
%%
{COMMAND}|{TYPE} {
    int len = yyleng;
    for (int i = 0; i < len; i++) {
        yytext[i] = toupper(yytext[i]);
    }
    printf("%s", yytext);
}
(\")[^"]*(\")   { 
    printf(" cadena=%s", yytext); 
}
(\')[^']*(\')   { 
    printf(" cadena=%s", yytext); 
}
{DIGIT}+("."|,){DIGIT} {
    printf(" decimal=%s", yytext);
}
{DIGIT}+ {
    printf(" entero=%s", yytext);
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
;(" ")+	{
	printf(" puntcoma=;\n");
}
;\n	{
	printf(" puntcoma=%s", yytext);
}
;	{
	printf(" puntcoma=%s\n", yytext);
}
\n {printf(" ");}
.    { printf("%s", yytext); } /* Pass through other characters */
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

    fclose(inputFile);

    return 0;
}
