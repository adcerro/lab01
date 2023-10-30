%{
#include <stdio.h>
#include <stdlib.h>
%}
%%
input: /* empty */
     | input line
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
    if(e)
    fclose(inputFile);
    return 0;
}