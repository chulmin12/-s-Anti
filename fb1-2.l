/* English -> American */

/*구역 나누기용 %%*/
%%
"colour" { printf("color"); }
"flavour" { printf("flavor"); }
"clever" { printf("smart"); }
"smart" { printf("elegant"); }
"conservative" { printf("liberal"); }


. { printf("%s", yytext); }
%%

/* 위 단어를 제외한 단어들 은 yytext로 들어감 */
