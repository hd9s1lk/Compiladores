%{
#include "ex1.tab.h"
%}
%option nounput
%option noinput
%option noyywrap
%%
Manutencao return MANUTENCAO;
[0-2]	   yylval.inteiro=atoi(yytext);return INTPEQUENOS;
"("[a-zA-Z0-9]{5}","[1-9][0-9]*")"	   yylval.inteiro=atoi(yytext);return METODO;
(",""("[a-zA-Z0-9]{5}","[1-9][0-9]*")")*			   return METODOREP;
"("	   return PARI;
")"	   return PARF;
[1-9][0-9]*	   yylval.inteiro=atoi(yytext);return QUANTIDADE;
[a-zA-Z0-9]{5} return MATERIAL;
[A-Z]{2}       return MONTAGEM;
Carrega-Bateria return C;
Estado return E;
Recolhe return R;
Entrega return ENTREGA;
","				   return VIRGULA;
"["				   return RECTI;
"]"				   return RECTF;
[ \t] ;
[ \s] ;
[ \n] ;
<<EOF>> return 0;
%%
