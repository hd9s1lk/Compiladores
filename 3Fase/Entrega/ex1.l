%{
#include "ex1.tab.h"
%}
%option nounput
%option noinput
%option noyywrap
%%
Entrega return ENTREGA;
[1-9][0-9]*	   yylval.inteiro=atoi(yytext);return QUANTIDADE;
[a-zA-Z0-9]{5} return MATERIAL;
[A-Z]{2}       return MONTAGEM;
","	   return VIRGULA;
"("	   return PARI;
")"	   return PARF;
[ \t] ;
[ \s] ;
\n return 0;
<<EOF>> return 0;
%%
