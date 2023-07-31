/* simplest version of calculator */
%{
#include <stdio.h>
%}
/* declare tokens */
%token NUMBER
%token ADD SUB MUL DIV ABS
%token EOL
%token OP CP
/* 괄호 닫고 여는 토큰값 추가 */
%%
/* 계산식 시작 */
calclist: /* nothing */ 
 | calclist exp EOL { printf("= %d\n", $2); }
 | calclist EOL { }
 ; /* ;(세미콜론) 이 조건이 끝남을 의미; $2 : 2번째 인자 ; 공백도 처리 */
exp: factor 
 | exp ADD factor { $$ = $1 + $3; }
 | exp SUB factor { $$ = $1 - $3; }
 ; /*$$: 자기 자신을 표현함 */
factor: term
 | factor MUL term { $$ = $1 * $3; }
 | factor DIV term { $$ = $1 / $3; }
 ;
term: NUMBER 
 | ABS term { $$ = $2 >= 0? $2 : - $2; }
 | OP exp CP { $$ = $2;}
;  /* term 은 절대값을 의미함 */
%%
int main(int argc, char **argv)
{
 yyparse();
 return 0;
}
yyerror(char *s)
{
 fprintf(stderr, "error: %s\n", s);
}/* stderr : 표준 에러: -> 에러의 내용을 출력해주도록 함 */
