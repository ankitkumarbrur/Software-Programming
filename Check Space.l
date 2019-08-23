%%

^[ \t]+ ;
[ \t]+$ { printf("  :   AT LAST\n"); }
[ \t]+ { printf("  :   WITHIN LINE\n"); }

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