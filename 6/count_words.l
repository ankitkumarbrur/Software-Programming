%{
    int words,characters,space,line;
%}
%%
[\n] {
    line++;
}
[ \t] {
    space++;
}
[a-zA-Z0-9]+ {
    words++;
    characters+=yyleng;
}
. ;
%%
int main()
{
    yyin=fopen("input.txt","r");
    yylex();
    printf("\nNo. of words : %d\nNo. of characters : %d\nNo. of spaces : %d\nNo. of lines : %d\n",words,characters,space,line);
}
int yywrap()
{
    return 1;
}