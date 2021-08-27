#
# 'make'        build executable file 'main'
# 'make clean'  removes all .o and executable files
#

# define the C compiler to use
CC 		:= gcc

# define any compile-time flags
CFLAGS		:= -Wall -Wextra -g

# define library paths in addition to /usr/lib
#   if I wanted to include libraries not in /usr/lib I'd specify
#   their path using -Lpath, something like:
LFLAGS 		:=

# define output directory
OUTPUT		:= bin

# define source directory
SRC		:= src

#define build directory
BUILD		:= build

# define include directory
INCLUDE		:= inc

# define lib directory
LIB		:= lib

# define application name
APPNAME		:= main


ifeq ($(OS),Windows_NT)
MAIN		:= $(APPNAME).exe
SOURCEDIR	:= $(SRC)
INCLUDEDIR	:= $(INCLUDE)
LIBDIR		:= $(LIB)
FIXPATH 	= $(subst /,\,$1)
RM		:= del /q /f
MD		:= mkdir
NULL		:= nul
else
MAIN		:= $(APPNAME)
SOURCEDIR	:= $(shell find $(SRC) -type d)
INCLUDEDIR	:= $(shell find $(INCLUDE) -type d)
LIBDIR		:= $(shell find $(LIB) -type d)
FIXPATH 	= $1
RM 		:= rm -f
MD		:= mkdir -p
NULL		:= /dev/null
endif

# define any directories containing header files other than /usr/include
INCLUDES	:= $(patsubst %,-I%, $(INCLUDEDIR:%/=%))
INCLUDELIBS 	:= $(patsubst %,-I%, $(LIBDIR:%/=%))

# define the C libs
LIBS		:= $(patsubst %,-L%, $(LIBDIR:%/=%))

# define the C source files
SOURCES		:= $(wildcard $(patsubst %,%/*.c, $(SOURCEDIR)))

# define the C object files
OBJECTS		:= $(patsubst $(SRC)/%,$(BUILD)/%,$(SOURCES:.c=.o))

#
# The following part of the makefile is generic; it can be used to
# build any executable just by changing the definitions above and by
# deleting dependencies appended to the file from 'make depend'
#

OUTPUTMAIN	:= $(call FIXPATH,$(OUTPUT)/$(MAIN))

all: $(OUTPUT) $(MAIN)
	@echo Compilat correctament!

$(OUTPUT):
	@$(MD) $(OUTPUT)
	@$(MD) $(BUILD)
$(MAIN): $(OBJECTS)
	@echo Linkant fitxers
	@$(CC) $(CFLAGS) $(INCLUDES) $(INCLUDELIBS) -o $(OUTPUTMAIN) $(OBJECTS) $(LFLAGS) $(LIBS)

#Compilació
$(BUILD)/%.o: $(SRC)/%.c
	@echo Compilant $<
	@$(CC) $(CFLAGS) $(INCLUDES) $(INCLUDELIBS) -c -o $@ $<

.PHONY: clean
clean:
	@echo Esborrant $(OUTPUTMAIN)...
	@$(RM) $(OUTPUTMAIN) 2> $(NULL)
	@echo Esborrant $(call FIXPATH,$(OBJECTS))
	@$(RM) $(call FIXPATH,$(OBJECTS)) 2> $(NULL)
	@echo Netejat correctament!

run: all
	./$(OUTPUTMAIN)
	@echo Executat correctament!
