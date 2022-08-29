/* Mini Calculator */
/* calc.lex */

%{
int yyerror(char *s);
int yylex(void);

using namespace std;

#include <iostream>
#include <stdio.h>
#include <string>



#include "parser.h"
int yyerror(char *s);
// int yylineno = 1;
%}

digit		[0-9]
int_const	{digit}+

%option noyywrap
%%

{int_const}	{ yylval.int_val = atoi(yytext); return INTEGER_LITERAL; }
"+"		{ yylval.op_val = new std::string(yytext); return PLUS; }
"*"		{ yylval.op_val = new std::string(yytext); return MULT; }

[ \t]*		{}
[\n]		{ yylineno++;	}

.		{ std::cerr << "SCANNER "; yyerror(""); exit(1);	}
