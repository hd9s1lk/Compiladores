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
%token <id> ENTREGA PARI PARF MATERIAL MONTAGEM VIRGULA
%token <inteiro> QUANTIDADE 
%start inicio
%%
inicio:
| ENTREGA PARI MONTAGEM QUANTIDADE VIRGULA MATERIAL VIRGULA QUANTIDADE PARF  {printf ("Frase da Entrega");}
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
