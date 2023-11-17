%{
#include <stdio.h>
#include "strForm.h"
#include "strForm1.h"
#include <string.h>
int n=0;
char localizacao[50];
int bateria = 100;
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

{M}{PARI}0{PARF}	if(n==3){n=0;}n++;strcpy(localizacao,"Posto de Manutencao");
{M}{PARI}1{PARF}	if(n==3){n=0;}n++;strcpy(localizacao,"Posto de Manutencao");
{M}{PARI}2{PARF}	if(n==3){n=0;}n++;strcpy(localizacao,"Posto de Manutencao");
{C}{PARI}0{PARF}	if(bateria < 100){printf("Bateria <= 20");strcpy(localizacao,"Carregamento"); bateria = 100;}else{printf("Bateria ja esta a 100");}
{C}{PARI}1{PARF}	if(bateria < 100){printf("Bateria <= 50");strcpy(localizacao,"Carregamento"); bateria = 100;}else{printf("Bateria ja esta a 100");}
{C}{PARI}2{PARF}	if(bateria < 100){printf("Bateria >50");strcpy(localizacao,"Carregamento");bateria = 100;}else{printf("Bateria ja esta a 100");}
{L}{PARI}{MONTAGEM}{MATERIAL}{QUANTIDADE}{PARF} strform1(yytext);printf("!!Entregue!!\n");if(localizacao == "Armazem" || localizacao == "Posto de Manutencao" || localizacao == "Carregamento")
{bateria -= 10;strcpy(localizacao,strform1(yytext));}else{bateria -= 5;}if(bateria <= 20){strcpy(localizacao,"Carregamento");bateria = 100;
printf("\nCarregou Totalmente\n");}
{R}{PARI}{RECTI}{METODO}{METODOREP}{RECTF}{PARF} printf("Para Recolha:\n");if((bateria -10) <= 20){strcpy(localizacao,"Carregamento");bateria = 100;printf("\nCarregou Totalmente\n");}else{strform(yytext);
strcpy(localizacao,"Armazem");bateria -= 10;}

%%
void main(){
	yylex();
	printf("Foi %d vezes a manutencao\n",n);
	printf("O camiao esta %s\n",localizacao);
	printf("O camiao tem %d de bateria", bateria);
}

