%{
#include "ex1.tab.h"
%}
%option nounput
%option noinput
%option noyywrap
%%
Carrega-Bateria return CARREGA;
[0-2]	   yylval.inteiro=atoi(yytext);return INTPEQUENOS;
"("	   return PARI;
")"	   return PARF;
[ \t] ;
[ \s] ;
\n return 0;
<<EOF>> return 0;
%%
