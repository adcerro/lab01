%{
#include <stdio.h>
#include <stdlib.h>
extern FILE *yyin;
int eLine =-1;
%}
%locations
%token ID NUM FNUM STR
%token EXTYPE INT
%token AP CP COMA PC
%token CREATE DROP
%token VALUES
%token INSERT DELETE UPDATE
%token WHERE AND OR
%token ERROR
%token CMP PLUS MINUS DIV ASIGN
%token SELECT GROUP ORDER AST
%token RESERVED FUNCTION
%token FROM SET
%%
input: line PC input| line PC;
line: create
    | drop 
    | insert
    | delete
    | select
    | update
    | error {if(eLine==-1){printf("Incorrecto\n\n");}if(eLine!=@1.first_line){eLine=@1.first_line;printf("Error en linea %d\n",eLine);}};
drop: DROP ID;
create: CREATE ID AP dec CP;
dec: ID comp decs;
comp: EXTYPE AP NUM CP
    |   INT;
decs: COMA dec
    | ;
insert: INSERT ID VALUES AP vals CP
    | INSERT ID AP insertSP CP;
insertSP: ID CP VALUES AP val
    | ID COMA insertSP COMA val;
val: NUM
    | FNUM
    | STR
    | ID;
vals: val COMA vals|val;
delete: DELETE ID WHERE conditions;
conditions: condition AND conditions
    | condition OR conditions
    | condition;
condition: equ CMP equ;
equ: num PLUS equ
    |num MINUS equ
    |num DIV equ
    |num AST equ
    |num;
num: NUM
    | FNUM
    | ID;
update: UPDATE ID SET ID ASIGN num WHERE conditions;
select: SELECT bfc
    | SELECT cao;
bfc: busq FROM ID;
busq: AST
    | ID funcs
    | FUNCTION AP ID CP funcs;
ids: COMA ID ids
    | ;
funcs: 
    | COMA ID funcs
    | COMA FUNCTION AP ID CP funcs;
cao: busq FROM ID WHERE conditions
    | busq FROM ID GROUP ID
    | busq FROM ID ORDER ID ids RESERVED
    | busq FROM ID WHERE conditions GROUP ID ORDER ID ids RESERVED;
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
