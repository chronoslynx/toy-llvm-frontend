CPP=clang++
CPPFLAGS=-I/usr/local/Cellar/llvm/3.4/include  -D_DEBUG -D_GNU_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS


all: example

example: parser tokens
	$(CPP) $(CPPFLAGS) -o parser parser.cpp tokens.cpp main.cpp

parser: parser.y
	bison -d -o parser.cpp parser.y

tokens: tokens.l
	lex -o tokens.cpp tokens.l