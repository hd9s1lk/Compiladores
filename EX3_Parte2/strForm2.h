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

int strform(char* yytext)
{
    char* found;

    while( (found = strsep(&yytext,"[")) != NULL ){
	while( (found = strsep(&yytext,"(")) != NULL ){
                removeChar(found,')');
                removeChar(found,']');
                //printf("\n");
                printf("%s\n",found);
            }
	}  
    return(0);
}


