#include <stdio.h>
#include <string.h>

void removeChar1(char *str, char garbage) {

    char *src, *dst;
    for (src = dst = str; *src != '\0'; src++) {
        *dst = *src;
        if (*dst != garbage) dst++;
    }
    *dst = '\0';
}


char strform1(char* yytext)
{
    char* found;

    while( (found = strsep(&yytext,",")) != NULL ){
                removeChar1(found,')');
                removeChar1(found,'(');
                removeChar1(found,'E');
                removeChar1(found,'n');
                removeChar1(found,'t');
                removeChar1(found,'r');
                removeChar1(found,'e');
                removeChar1(found,'g');
                removeChar1(found,'a');
                printf("%s\n",found);
                return *found;

	}
}


