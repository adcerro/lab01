%{
#include <stdio.h>
#include <stdlib.h>
extern FILE *yyin;
%}
%locations
%token ID NUM
%token EXTYPE INT
%token AP CP COMA PC
%token CREATE DROP INSERT
%token VALUES
%token ERROR
%%
input: line PC input| line PC;
line: create
    | drop 
    | insert
    | error {printf("Error en linea @n\n");};
drop: DROP ID;
create:  CREATE ID AP dec CP;
insert: INSERT ID VALUES AP ID ids CP
    | INSERT ID AP ID ids CP VALUES AP ID ids CP;
ids: COMA ID ids
    | ;
dec: ID comp decs;
comp: EXTYPE AP NUM CP
    |   INT;
decs: COMA dec
    | ;
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
    yyparse();
    fclose(inputFile);

    return 0;
}
int yyerror(char *s)
{
  fprintf(stderr, "error: %s\n", s);
}