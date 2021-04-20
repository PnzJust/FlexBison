%{

#include <stdio.h>
#include <string.h>
#include "test.tab.h"
extern YYSTYPE yylval;
%}


digit                [0-9]
letter               [a-zA-Z]
NUM              {digit}+
ID               {letter}+
KEY_WORD             else|if|int|return|void|while
PLUS_OPERATOR            "+"
MINUS_OPERATOR               "-"
XOR_OPERATOR               "^"
MUL_OPERATOR                 "*"
DIV_OPERATOR                 "/"
LESS_THAN_OPERATOR           "<"
LESS_THAN_OR_EQUAL_OPER      "<="
GREATER_THAN_OPERATOR            ">"
GREATER_THAN_OR_EQUAL_OPERATOR   ">="
EQUAL_OPERATOR           "="
OBJ_EQUAL_OPERATOR           "=="
NOT_EQUAL_OPERATOR           "!="
COMMA_SYMBOL             ","
SEMI_COLON_SYMBOL        ";"
LEFT_BRAC_SYMBOL         "("
RIGHT_BRAC-SYMBOL        ")"
LEFT_SQUARE_BRAC_SYMBOL          "["
RIGHT_SQUARE_BRAC_SYMBOL     "]"
LEFT_CURLY_BRAC_SYMBOL       "{"
RIGHT_CURLY_BRAC_SYMBOL      "}"
LEFT_COMMENT             "/*"
RIGHT_COMMENT            "*/"
ELSE                "else"
IF              "if"
INT             "int"
RETURN              "return"
VOID                "void"
WHILE               "while"
BOOL                "bool"

SYMBOL               "+"|"-"|"*"|"/"|"<"|"<="|">"|">="|"=="|"!="|"="|";"|","|"("|")"|"{"|"}"|"["|"]"|"/*"|"*/"      

WHITESPACE                [ \t\n]+
COMMENT               "/*"(.)*({WHITESPACE})*(.)*"*/"

ERROR1                {NUM}(({ID}|{KEY_WORD})|{NUM})+
ERROR2                {ID}(({NUM}|{KEY_WORD})|{ID})+
ERROR3                {KEY_WORD}(({ID}|{NUM})|{KEY_WORD})+  

ERROR                 ERROR1|ERROR2|ERROR3


%%


{NUM}            {
                return NUM;
                }

{ELSE}               {
                return ELSE;
                        }

{IF}             {
                return IF;
                        }

{INT}            {
                return INT;
                        }

{BOOL}            {
                return BOOL;
                        }

{RETURN}             {
                return RETURN;
                        }

{VOID}               {
                return VOID;
                        }

{WHILE}              {
                return WHILE;
                        }


{ID}                {
                return ID;
                }

{PLUS_OPERATOR}      {
                return PLUS_OPERATOR;
                     }

{MINUS_OPERATOR}    {
                return MINUS_OPERATOR;
                     }

{XOR_OPERATOR}    {
                return XOR_OPERATOR;
                     }

{MUL_OPERATOR}          {
                return MUL_OPERATOR;
                        }
{DIV_OPERATOR}          {
                return DIV_OPERATOR;
                        }
{LESS_THAN_OPERATOR}    {
                return LESS_THAN_OPERATOR;
                        }
{LESS_THAN_OR_EQUAL_OPER}   {
                return LESS_THAN_OR_EQUAL_OPER;
                        }

{GREATER_THAN_OPERATOR}  {
                return GREATER_THAN_OPERATOR;
                        }

{GREATER_THAN_OR_EQUAL_OPERATOR}   {
                return GREATER_THAN_OR_EQUAL_OPERATOR;
                        }
{EQUAL_OPERATOR}        {
                return EQUAL_OPERATOR;
                        }
{OBJ_EQUAL_OPERATOR}    {
                return NOT_EQUAL_OPERATOR;
                        }
{NOT_EQUAL_OPERATOR}    {
                return NOT_EQUAL_OPERATOR;
                        }
{COMMA_SYMBOL}  {
                return COMMA_SYMBOL;
                        }
{SEMI_COLON_SYMBOL}   {
                return SEMI_COLON_SYMBOL;
                        }

{LEFT_BRAC_SYMBOL}   {
                return LEFT_BRAC_SYMBOL;
                        }
{RIGHT_BRAC-SYMBOL}  {
                return RIGHT_BRAC_SYMBOL;
                        }

{LEFT_SQUARE_BRAC_SYMBOL}   {
                return LEFT_SQUARE_BRAC_SYMBOL;
                        }
{RIGHT_SQUARE_BRAC_SYMBOL}  {
                return RIGHT_SQUARE_BRAC_SYMBOL;
                        }
{LEFT_CURLY_BRAC_SYMBOL}   {
                return LEFT_CURLY_BRAC_SYMBOL;
                                }
{RIGHT_CURLY_BRAC_SYMBOL}  {
                return RIGHT_CURLY_BRAC_SYMBOL;
                                }

{LEFT_COMMENT}  {
                return LEFT_COMMENT;
                                }

{RIGHT_COMMENT}  {
                return RIGHT_COMMENT;
                                }
 {WHITESPACE}   {

                                }

{ERROR}          {

                                }   

%%
