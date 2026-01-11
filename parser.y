%{
#include <stdio.h>
#include <stdlib.h>

extern int line_num;
extern char* yytext;
int yylex();
void yyerror(const char *s);

%}

/* Yaha wo sab tokens define karein jo scanner.l main return kiye hain */
%token KEYWORD_INT KEYWORD_FLOAT KEYWORD_CHAR KEYWORD_VOID 
%token KEYWORD_IF KEYWORD_ELSE KEYWORD_FOR KEYWORD_WHILE 
%token KEYWORD_RETURN KEYWORD_CIN KEYWORD_COUT KEYWORD_BREAK KEYWORD_CONTINUE 
%token KEYWORD_MAIN KEYWORD_TRUE KEYWORD_FALSE

%token OP_PLUS OP_MINUS OP_MULTIPLY OP_DIVIDE OP_ASSIGN OP_EQUALS 
%token OP_GREATER OP_LESS OP_STREAM_IN OP_STREAM_OUT

%token PUNC_LPAREN PUNC_RPAREN PUNC_LBRACE PUNC_RBRACE PUNC_SEMICOLON PUNC_COMMA

%token IDENTIFIER NUMBER_INT NUMBER_FLOAT STRING_LITERAL CHAR_LITERAL
%define parse.error verbose

/* Operator Precedence (Maths ke rules) */
%left OP_PLUS OP_MINUS
%left OP_MULTIPLY OP_DIVIDE

%%

/* ==========================================================================
   GRAMMAR RULES START HERE
   ========================================================================== */

/* Program ka structure: wila wadda() { statements } */
program: 
    start_func 
    { 
        printf("\n====================================\n");
        printf("Syntax Analysis Successful! (Mubarak Ho)\n");
        printf("====================================\n");
    }
    ;

start_func: 
    KEYWORD_VOID KEYWORD_MAIN PUNC_LPAREN PUNC_RPAREN block
    | KEYWORD_INT KEYWORD_MAIN PUNC_LPAREN PUNC_RPAREN block
    ;

block: 
    PUNC_LBRACE statement_list PUNC_RBRACE
    ;

statement_list: 
    statement statement_list
    | /* empty - recursion khatam karne ke liye */
    ;

statement: 
      declaration_stmt
    | assignment_stmt
    | io_stmt
    | if_stmt
    | loop_stmt
    | return_stmt
    | break_stmt
    | block  /* Nested block handling */
    ;

/* --- 1. Variable Declaration (e.g., adad x = 10; ya adad x;) --- */
declaration_stmt:
    type IDENTIFIER OP_ASSIGN expression PUNC_SEMICOLON
    | type IDENTIFIER PUNC_SEMICOLON
    ;

type: 
    KEYWORD_INT | KEYWORD_FLOAT | KEYWORD_CHAR
    ;

/* --- 2. Assignment Statement (e.g., x = x + 1;) --- */
assignment_stmt:
    IDENTIFIER OP_ASSIGN expression PUNC_SEMICOLON
    ;

/* --- 3. Input/Output (likh << "text";) --- */
io_stmt:
    KEYWORD_COUT OP_STREAM_OUT output_chain PUNC_SEMICOLON
    | KEYWORD_CIN OP_STREAM_IN IDENTIFIER PUNC_SEMICOLON
    ;

output_chain:
    expression
    | expression OP_STREAM_OUT output_chain
    ;

/* --- 4. Conditional (jay / natan) --- */
if_stmt:
    KEYWORD_IF PUNC_LPAREN condition PUNC_RPAREN block
    | KEYWORD_IF PUNC_LPAREN condition PUNC_RPAREN block KEYWORD_ELSE block
    ;

/* --- 5. Loops (valval / jitna) --- */
loop_stmt:
    KEYWORD_FOR PUNC_LPAREN for_init condition PUNC_SEMICOLON for_update PUNC_RPAREN block
    | KEYWORD_WHILE PUNC_LPAREN condition PUNC_RPAREN block
    ;

for_init:
    declaration_stmt 
    | assignment_stmt
    | PUNC_SEMICOLON
    ;

for_update:
    IDENTIFIER OP_ASSIGN expression
    | /* empty */
    ;

/* --- 6. Return & Break --- */
return_stmt:
    KEYWORD_RETURN expression PUNC_SEMICOLON
    ;

break_stmt:
    KEYWORD_BREAK PUNC_SEMICOLON
    ;

/* --- Expressions & Conditions Logic --- */
condition:
    expression rel_op expression
    ;

rel_op:
    OP_GREATER | OP_LESS | OP_EQUALS
    ;

expression:
    term
    | expression OP_PLUS term
    | expression OP_MINUS term
    ;

term:
    factor
    | term OP_MULTIPLY factor
    | term OP_DIVIDE factor
    ;

factor:
    IDENTIFIER
    | NUMBER_INT
    | NUMBER_FLOAT
    | CHAR_LITERAL
    | STRING_LITERAL
    | PUNC_LPAREN expression PUNC_RPAREN
    ;

%%

/* ==========================================================================
   C CODE SECTION
   ========================================================================== */

/* Error Handling Function */
void yyerror(const char *s) {
    fprintf(stderr, "Error at Line %d: %s (Token: %s)\n", line_num, s, yytext);
}

int main() {
    /* Parser start karein */
    yyparse();
    return 0;
}
