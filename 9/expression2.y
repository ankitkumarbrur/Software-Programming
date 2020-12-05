%{
      #include<stdio.h>
      #include<stdlib.h>
      int result;
%}

%token DIGIT OPERATOR VARIABLE
%left '-'
%left OPERATOR
%left '(' ')'

%%

start: expr ';' {
              printf("Valid Expression");
              return 0;
  }
  ;

expr: DIG {}
  | expr OPERATOR expr {}
  | '(' expr ')'  {}
  | expr '-' expr {}
  | '-' expr
  ;

DIG: DIGIT
  | VARIABLE;

%%

int yyerror(char const *s)
{
    printf("Invalid Expression %s\n",s);
    return ;
}
int main()
{
  yyparse();
  return 1;
}