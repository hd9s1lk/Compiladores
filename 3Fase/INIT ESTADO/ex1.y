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
%token <id> INIT PARI LOCAL VIRGULA BATERIAMANUT MATERIAL PARF
%start inicio
%%
inicio:
| INIT PARI LOCAL VIRGULA BATERIAMANUT VIRGULA MATERIAL VIRGULA BATERIAMANUT PARF {printf ("Frase do INIT ESTADO");}
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
