
%{
#include <stdio.h>
#include <ctype.h>

extern FILE *yyin;
int yylex();
int yyerror(char *s);

%}

%token ID NUM PLUS_OPERATOR MINUS_OPERATOR MUL_OPERATOR XOR_OPERATOR DIV_OPERATOR LESS_THAN_OPERATOR LESS_THAN_OR_EQUAL_OPER GREATER_THAN_OPERATOR GREATER_THAN_OR_EQUAL_OPERATOR EQUAL_OPERATOR OBJ_EQUAL_OPERATOR NOT_EQUAL_OPERATOR COMMA_SYMBOL SEMI_COLON_SYMBOL LEFT_BRAC_SYMBOL RIGHT_BRAC_SYMBOL LEFT_SQUARE_BRAC_SYMBOL RIGHT_SQUARE_BRAC_SYMBOL LEFT_CURLY_BRAC_SYMBOL RIGHT_CURLY_BRAC_SYMBOL LEFT_COMMENT RIGHT_COMMENT ELSE IF INT RETURN VOID WHILE BOOL

%%

program: declaration_list
;

declaration_list: declaration_list declaration
    | declaration
;

declaration : var_declaration 
    | fun_declaration               { printf("Function declaration.\n");}
;

var_declaration : type_specifier ID SEMI_COLON_SYMBOL	{printf("Declaration of variable.\n"); }
    | type_specifier ID LEFT_SQUARE_BRAC_SYMBOL NUM RIGHT_SQUARE_BRAC_SYMBOL COMMA_SYMBOL       { printf("Declaration of array variable.\n"); }
;

type_specifier : INT        
    | VOID                  { printf("VOID");}
    | BOOL
;

fun_declaration : type_specifier ID LEFT_BRAC_SYMBOL params RIGHT_BRAC_SYMBOL compound_stmt
;

params :  
	| param_list 
    | VOID
;

param_list : param_list COMMA_SYMBOL param
    | param
;

param : type_specifier ID 
    | type_specifier ID LEFT_SQUARE_BRAC_SYMBOL RIGHT_SQUARE_BRAC_SYMBOL
;
compound_stmt : LEFT_CURLY_BRAC_SYMBOL local_declarations statement_list RIGHT_CURLY_BRAC_SYMBOL
;

local_declarations : local_declarations var_declaration
    | /* empty */
;

statement_list : statement_list statement
    |/* empty */
;

statement : expression_stmt /* Mai trebuie adaugate cazuri*/
    | compound_stmt
    | selection_stmt  { printf("If statement.\n"); }
    | iteration_stmt  {printf("While statement.\n"); }
    | return_stmt
    | var_declaration
;

expression_stmt : expression SEMI_COLON_SYMBOL
    | SEMI_COLON_SYMBOL
;

selection_stmt : IF LEFT_BRAC_SYMBOL  expression RIGHT_BRAC_SYMBOL  statement
    | IF LEFT_BRAC_SYMBOL  expression RIGHT_BRAC_SYMBOL statement ELSE statement
;

iteration_stmt : WHILE LEFT_BRAC_SYMBOL  expression RIGHT_BRAC_SYMBOL  statement
;

return_stmt : RETURN SEMI_COLON_SYMBOL
    | RETURN expression SEMI_COLON_SYMBOL
;

expression:  var EQUAL_OPERATOR expression 
    | simple_expression
;

var : ID
     | ID LEFT_SQUARE_BRAC_SYMBOL expression RIGHT_SQUARE_BRAC_SYMBOL
;

simple_expression : additive_expression relop additive_expression
    | additive_expression
;

relop : LESS_THAN_OR_EQUAL_OPER
    | LESS_THAN_OPERATOR
    | GREATER_THAN_OPERATOR
    | GREATER_THAN_OR_EQUAL_OPERATOR
    | OBJ_EQUAL_OPERATOR 
    | NOT_EQUAL_OPERATOR
;

additive_expression : additive_expression addop term
        | term          
;

addop : PLUS_OPERATOR
    | MINUS_OPERATOR    { printf("Minus operator.\n"); }
    | XOR_OPERATOR      { printf("Xor operator.\n"); }
;

term : term mulop factor     { $$ = $1 + $3; }
    | factor
;

mulop : MUL_OPERATOR
    | DIV_OPERATOR
;

factor : LEFT_BRAC_SYMBOL  expression RIGHT_BRAC_SYMBOL 
    | var
    | call
    | NUM
;

call : ID LEFT_BRAC_SYMBOL  args RIGHT_BRAC_SYMBOL 
;

args : arg_list
    |/* empty */
;

arg_list : arg_list COMMA_SYMBOL expression
    | expression
;



%%

int main()
{
	yyin=fopen("input.cpp","r");
	yyparse();
    return 0;
}

int yyerror(char * s)
{
	printf("Syntax Error: %s\n", s);
	return 0;
}
