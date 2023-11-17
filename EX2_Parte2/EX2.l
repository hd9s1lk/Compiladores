%{
#include <stdio.h>
#include "strForm.h"
#include "strForm1.h"
#include <string.h>
int n=0;
char localizacao[50];
%}

R "Recolhe"
M "Manutencao"
C "Carrega-Bateria"
E "Estado"
L "Entrega"
PARI "("
RECTI "["
RECTF "]"
PARF ")"
METODO "("[a-zA-Z0-9]{5}","[1-9][0-9]*")"
METODOREP (",""("[a-zA-Z0-9]{5}","[1-9][0-9]*")")*
VIRGULA ","
MANU ","[0-2]
MONTAGEM [A-Z]{2}(100|[1-9]|[1-9][0-9])","
MATERIAL [a-zA-Z0-9]{5}
QUANTIDADE (","[1-9][0-9]*)

%%

{M}{PARI}0{PARF}	n++;strcpy(localizacao,"Posto de Manutencao");
{M}{PARI}1{PARF}	n++;strcpy(localizacao,"Posto de Manutencao");
{M}{PARI}2{PARF}	n++;strcpy(localizacao,"Posto de Manutencao");
{C}{PARI}0{PARF}	printf("Bateria <= 20");strcpy(localizacao,"Carregamento");
{C}{PARI}1{PARF}	printf("Bateria <= 50");strcpy(localizacao,"Carregamento");
{C}{PARI}2{PARF}	printf("Bateria >50");strcpy(localizacao,"Carregamento");
{L}{PARI}{MONTAGEM}{MATERIAL}{QUANTIDADE}{PARF} strform1(yytext);printf("!!Entregue!!\n");strcpy(localizacao,strform1(yytext));
{R}{PARI}{RECTI}{METODO}{METODOREP}{RECTF}{PARF} printf("Para Recolha:\n");strform(yytext);strcpy(localizacao,"Armazem");

%%
void main(){
	yylex();
	printf("Foi %d vezes a manutencao\n",n);
	printf("O camiao esta %s\n",localizacao);
}

