LETRAS (B|T|M)(','(B|T|M))*


%%

Estado'('{LETRAS}')' {printf("O Meu estado Atual: %s\n", yytext);}
<<EOF>>		return 0;


%%
void main(){
	yylex();
}

