#include <stdio.h>
#include <string.h>

void removeChar(char *str, char garbage) {

    char *src, *dst;
    for (src = dst = str; *src != '\0'; src++) {
        *dst = *src;
        if (*dst != garbage) dst++;
    }
    *dst = '\0';
}

int strform1(char* yytext)
{
    char* found;

    while( (found = strsep(&yytext,"(")) != NULL ){
	while( (found = strsep(&yytext,",")) != NULL ){
                removeChar(found,')');
                printf("%s\n",found);
                }

	}
    printf("\n");    
    return(0);
}


