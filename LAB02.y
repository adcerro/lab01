%{
#include <stdio.h>
#include <stdlib.h>
extern FILE *yyin;
int eLine =-1;
%}
%locations
%token ID NUM
%token EXTYPE INT
%token AP CP COMA PC
%token CREATE DROP
%token VALUES
%token INSERT DELETE UPDATE
%token WHERE AND OR
%token ERROR
%token CMP
%token SELECT GROUP ORDER AST
%token RESERVED FUNCTION
%token FROM
%%
input: line PC input| line PC;
line: create
    | drop 
    | insert
    | delete
    | select
    | error {if(eLine==-1){printf("Incorrecto\n\n");}if(eLine!=@1.first_line){eLine=@1.first_line;printf("Error en linea %d\n",eLine);}};
drop: DROP ID;
create:  CREATE ID AP dec CP;
insert: INSERT ID VALUES AP ID ids CP
    | INSERT ID AP ID ids CP VALUES AP ID ids CP;
delete: DELETE ID WHERE condiciones;
condiciones: condicion AND condiciones
    | condicion OR condiciones
    | condicion;
condicion: ID CMP ID
    | ID CMP NUM
    | NUM CMP ID;
ids: COMA ID ids
    | ;
dec: ID comp decs;
comp: EXTYPE AP NUM CP
    |   INT;
decs: COMA dec
    | ;
select: SELECT bfc
    | SELECT cao;
bfc: busq FROM ID
    | FUNCTION AP funcs CP FROM ID;
busq: AST
    | ID ids;
funcs: ID
    | ID COMA FUNCTION AP funcs CP;
cao: busq FROM ID WHERE condiciones
    | busq FROM ID GROUP ID
    | busq FROM ID ORDER ID ids RESERVED
    | busq FROM ID WHERE condiciones GROUP ID ORDER ID ids RESERVED;
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
    if(eLine==-1){
        printf("Correcto");
    }
    fclose(inputFile);
    return 0;
}
int yyerror(char *s)
{
  //fprintf(stderr, "error: %s\n", s);
}
