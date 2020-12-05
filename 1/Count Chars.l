%{
    #include<stdio.h>
    int numchar=0, numlines=0,numdigits=0,numalpha=0;
%}

%%

[\n] {numchar++ ; numlines++;}
[0-9] {numdigits++;}
[a-zA-Z] {numalpha++;}
. {numchar++;} 

%%

int main()
{
    yyin=fopen("input.txt","r");
    yylex();
    printf("\n\nThere are %d numbers of line \n%d number of characters \n%d numbers of digits\n%d numbers of alphanumerics\n%d number of special characters\n\n",numlines,numchar,numdigits,numalpha+numdigits,numchar-numalpha+numdigits);
    return 0;
}
int yywrap()
{
    return 1;
}