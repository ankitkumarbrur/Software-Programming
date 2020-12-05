%%
[a-zA-Z]* {
    printf("\n");
    int i=yyleng-1;
    for(;i>=0;i--)
    {
        int j;
        for(j=0;j<=i;j++)
        {
            printf("%c ",yytext[j]);
            
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
int yywrap()
{
    return 1;
}