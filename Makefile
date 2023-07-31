# part of the makefile
fb1-5: fb1-5.l fb1-5.y
# fb1-5.l과 fb1-5.y를 이용해서 fb1-5를 만들어줘
	bison -d fb1-5.y
	flex fb1-5.l
	gcc -o $@ fb1-5.tab.c lex.yy.c -lfl
# 직접 칠때는 아래처럼
# gcc -o fb1-5 fb1-5.tab.c lex.yy.c -lfl
