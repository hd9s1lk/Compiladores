%{
#include <stdio.h>
int nerros=0;
int yyerror(char *s);
int yylex();
%}
%union{
char *id;
int inteiro;
float real;}
%token <id> RECOLHE PARI PARF VIRGULA METODO METODOREP RECTI RECTF
%start inicio
%%
inicio:
| RECOLHE PARI RECTI METODO METODOREP RECTF PARF  {printf ("Frase do Recolhe");}
;
%%
int main(){
yyparse();
if(nerros==0){ printf("FRASE VÁLIDA!\n"); }
else{ printf ("FRASE NAO ACEITE %d \n",nerros); }
}
int yyerror(char *s){
nerros++;
}
