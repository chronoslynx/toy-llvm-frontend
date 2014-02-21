CPP=clang++ -g
LFLAGS=`/usr/local/Cellar/llvm/3.4/bin/llvm-config --cxxflags --ldflags --libs`


all: example

example: parser tokens
	$(CPP) $(LFLAGS) -o parser parser.cpp tokens.cpp main.cpp

parser: parser.y
	bison -d -o parser.cpp parser.y

tokens: tokens.l
	lex -o tokens.cpp tokens.l