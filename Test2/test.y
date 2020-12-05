%{
#include<stdio.h>
#include<stdlib.h>
void yyerror(char const *s)
{
    printf("yyerror  %s\n",s);
}
%}

%token DIGIT NEWLINE SEMI
%right '+' '-'
%right '*' '/'

%%

start:expr {
               printf("\nComplete\n");
            }
  ;
expr: DIGIT             {printf("%d ",$1);} 
  | expr '-' expr        {printf("- ");}
  | expr '+' expr     {printf("+ ");}
  | '(' expr ')'
  ;

%%

int main()
{
  printf("\nEnter an exp:");
  while(1)
    yyparse();
  return 1;
}