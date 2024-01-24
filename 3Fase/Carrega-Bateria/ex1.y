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
%token <id> CARREGA PARI PARF
%token <inteiro> INTPEQUENOS
%start inicio
%%
inicio:
| CARREGA PARI INTPEQUENOS PARF {printf ("Frase de Carrega-Bateria");}
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
