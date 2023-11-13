/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_LAB02_H_INCLUDED
# define YY_YY_LAB02_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    ID = 258,                      /* ID  */
    NUM = 259,                     /* NUM  */
    FNUM = 260,                    /* FNUM  */
    STR = 261,                     /* STR  */
    EXTYPE = 262,                  /* EXTYPE  */
    INT = 263,                     /* INT  */
    AP = 264,                      /* AP  */
    CP = 265,                      /* CP  */
    COMA = 266,                    /* COMA  */
    PC = 267,                      /* PC  */
    CREATE = 268,                  /* CREATE  */
    DROP = 269,                    /* DROP  */
    VALUES = 270,                  /* VALUES  */
    INSERT = 271,                  /* INSERT  */
    DELETE = 272,                  /* DELETE  */
    UPDATE = 273,                  /* UPDATE  */
    WHERE = 274,                   /* WHERE  */
    AND = 275,                     /* AND  */
    OR = 276,                      /* OR  */
    ERROR = 277,                   /* ERROR  */
    CMP = 278,                     /* CMP  */
    PLUS = 279,                    /* PLUS  */
    MINUS = 280,                   /* MINUS  */
    DIV = 281,                     /* DIV  */
    ASIGN = 282,                   /* ASIGN  */
    SELECT = 283,                  /* SELECT  */
    GROUP = 284,                   /* GROUP  */
    ORDER = 285,                   /* ORDER  */
    AST = 286,                     /* AST  */
    RESERVED = 287,                /* RESERVED  */
    FUNCTION = 288,                /* FUNCTION  */
    FROM = 289,                    /* FROM  */
    SET = 290                      /* SET  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif

/* Location type.  */
#if ! defined YYLTYPE && ! defined YYLTYPE_IS_DECLARED
typedef struct YYLTYPE YYLTYPE;
struct YYLTYPE
{
  int first_line;
  int first_column;
  int last_line;
  int last_column;
};
# define YYLTYPE_IS_DECLARED 1
# define YYLTYPE_IS_TRIVIAL 1
#endif


extern YYSTYPE yylval;
extern YYLTYPE yylloc;

int yyparse (void);


#endif /* !YY_YY_LAB02_H_INCLUDED  */
