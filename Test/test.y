%{
      #include<stdio.h>
      #include<stdlib.h>
%}

%token DIGIT NEWLINE
%left '+' '-'
%left '*' '/'

%%

start: expr NEWLINE  {
                        printf("\nComplete\n");
                        exit(1);
                      }
  ;

expr: DIGIT             {printf("%d ",$1);} 
  | expr '-' expr        {printf("- ");}
  | expr '+' expr     {printf("+ ");}
  | '(' expr ')' 
  ;

%%

int yyerror(char const *s)
{
    printf(" yyerror  %s\n",s);
    return ;
}
int main()
{
  yyparse();
  return 1;
}