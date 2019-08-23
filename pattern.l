%{
    #undef yywrap
    #define yywrap() 1
    #include<stdio.h>
    #include<string.h>
    char* a;
%}

%%
[a-zA-Z]* {
    printf("\n");
    a=(char*)malloc(sizeof(char)*yyleng);
    strcpy(a,yytext);
    int i=yyleng-1;
    for(i;i>=0;i--)
    {
        int j;
        for(j=0;j<=i;j++)
        {
            printf("%c ",a[j]);
            
        }
        printf("\n");
    }
}
. ;
%%

int main()
{
    yylex();
    return 0;
}
