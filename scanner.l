%{
#include <stdio.h>
#include <stdlib.h>
#include "parser.tab.h" /* Ye file YACC generate karega, isme tokens defined honge */

int line_num = 1;
%}

%option noyywrap

%%

\n          { line_num++; }
[ \t\r]+    ; /* Whitespace ignore */
"//".* ; /* Comments ignore */

    /* =========================================
       1. SIRAIKI KEYWORDS
       ========================================= */

"adad"      { return KEYWORD_INT; }
"isharia"   { return KEYWORD_FLOAT; }
"akhar"     { return KEYWORD_CHAR; }
"wila"      { return KEYWORD_VOID; }
"jay"       { return KEYWORD_IF; }
"natan"     { return KEYWORD_ELSE; }
"valval"    { return KEYWORD_FOR; }
"jitna"     { return KEYWORD_WHILE; }
"wapas"     { return KEYWORD_RETURN; }
"ghin"      { return KEYWORD_CIN; }
"likh"      { return KEYWORD_COUT; }
"khal"      { return KEYWORD_BREAK; }
"agoo"      { return KEYWORD_CONTINUE; }
"wadda"     { return KEYWORD_MAIN; }
"sahi"      { return KEYWORD_TRUE; }
"ghalat"    { return KEYWORD_FALSE; }

    /* =========================================
       2. OPERATORS & PUNCTUATIONS
       ========================================= */

"+"     { return OP_PLUS; }
"-"     { return OP_MINUS; }
"*"     { return OP_MULTIPLY; }
"/"     { return OP_DIVIDE; }
"="     { return OP_ASSIGN; }
"=="    { return OP_EQUALS; }
">"     { return OP_GREATER; }
"<"     { return OP_LESS; }
">>"    { return OP_STREAM_IN; }
"<<"    { return OP_STREAM_OUT; }
"("     { return PUNC_LPAREN; }
")"     { return PUNC_RPAREN; }
"{"     { return PUNC_LBRACE; }
"}"     { return PUNC_RBRACE; }
";"     { return PUNC_SEMICOLON; }
","     { return PUNC_COMMA; }

    /* =========================================
       3. IDENTIFIERS & NUMBERS
       ========================================= */

[a-zA-Z_][a-zA-Z0-9_]* { return IDENTIFIER; }
[0-9]+\.[0-9]+([eE][-+]?[0-9]+)? { return NUMBER_FLOAT; }
[0-9]+                 { return NUMBER_INT; }

    /* =========================================
       4. STRINGS & LITERALS
       ========================================= */

\"([^"\\]|\\[\\"tn])*\" { return STRING_LITERAL; }
\'[^']\'                { return CHAR_LITERAL; }

.                       { printf("Unknown Character on line %d\n", line_num); }

%%
