%{
#include "ex1.tab.h"
%}
%option nounput
%option noinput
%option noyywrap
%%
Manutencao return MANUTENCAO;
[0-2]	   yylval.inteiro=atoi(yytext);return INTPEQUENOS;
"("	   return PARI;
")"	   return PARF;
[ \t] ;
[ \s] ;
\n return 0;
<<EOF>> return 0;
%%
