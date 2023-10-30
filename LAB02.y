%{
#include <stdio.h>
#include <stdlib.h>
extern FILE *yyin;
%}
%token NUMBER LETTER
%%
expr: NUMBER '+' NUMBER { printf("%d\n", $1 + $3); }
    | LETTER           { printf("%c\n", $1); }
    ;
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