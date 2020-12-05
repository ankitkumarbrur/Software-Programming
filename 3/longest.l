%{
    #include<string.h>
    #include<conio.h>
    int count=0;
    char s[100];
%}

%%
[a-zA-Z]+ {
    if(yyleng>count)
    {
        count=yyleng;
        strcpy(s,yytext);
        printf("%d   %s\n",count,s);
    }
}
. ;
%%


int main()
{
    yylex();
//    printf("here");
    printf("\nLongest word is %s with %d length \n",s,count);
	return 0;
}
int yywrap()
{
    return 1;
}