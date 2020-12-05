%{
      #include<stdio.h>
      #include<stdlib.h>
      int result;
%}

%token DIGIT OPERATOR 
%left '-'
%left OPERATOR
%left '(' ')'

%%

start: expr ';' {
              printf("Valid Expression");
              return 0;
  }
  ;

expr: DIGIT {}
  | expr OPERATOR expr {}
  | '(' expr ')'  {}
  | expr '-' expr {}
  | '-' expr
  ;

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