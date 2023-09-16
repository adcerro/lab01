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
%%
{COMMAND} {
    int len = yyleng;
    for (int i = 0; i < len; i++) {
        yytext[i] = toupper(yytext[i]);
    }
    printf("%s", yytext);
}
.|\n    { printf("%s", yytext); } /* Pass through other characters */
%%

int main() {
    yylex();
    return 0;
}
