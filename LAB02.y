%{
#include <stdio.h>
#include <stdlib.h>
extern FILE *yyin;
%}
%token ID PC
%token NUM
%token EXTYPE INT
%token AP CP COMA
%token CREATE DROP
%token ERROR
%%
input: line PC input| line PC;
line: create
    | drop | error {printf("Error en linea\n");};
drop: DROP ID;
create:  CREATE ID AP dec CP;
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
  //fprintf(stderr, "error: %s\n", s);
}