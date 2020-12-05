%{
      #include<stdio.h>
      #include<stdlib.h>
      int result;
%}

%token DIGIT
%left '+' '-'
%left '/' '%' '*'

%%

start: expr {
              printf("\nResult =%d\n",$$);
              return 0;
  }
  ;

expr: DIGIT {$$=$1;}
  | expr '-' expr    {$$=$1-$3;}
  | expr '+' expr    {$$=$1+$3;}
  | expr '*' expr   {$$=$1*$3;}
  | expr '/' expr   {$$=$1/$3;}
  | expr '%' expr   {$$=$1%$3;}
  | '(' expr ')'  {$$=$2;}
  | '-' expr  {$$=-$2;}
  ;

%%

int yyerror(char const *s)
{
    printf("yyerror  %s\n",s);
    return ;
}
int main()
{
  yyparse();
  return 1;
}