# Takes the name of the current directory as a the executable and "pr" name
TARGET  := $(shell basename $$PWD | tr '[:upper:]' '[:lower:]')
# Compiler
CC      := g++
# Warning levels
WARN    :=
# Optimisation
OFLAGS  := 
# Link Options
LDFLAGS := 
# Link Libraries
LDLIBS 	:= 

# Source directory
SRCDIR	:= src
# Include directory
INCDIR	:= include
# Object directory
OBJDIR	:= obj

# setting the vpath (additionnal search path for make)
VPATH	:= $(SRCDIR) $(OBJDIR)

CPP_SRCS    = $(wildcard src/*.cpp)
OBJ_FILES   = $(patsubst $(SRCDIR)/%.cpp,$(OBJDIR)/%.o,$(CPP_SRCS))

all: objdir ${TARGET}

$(TARGET): $(OBJ_FILES)
	@echo "Linking..."
	$(CC) $(WARN) $(OFLAGS) $(LDFLAGS) $(OBJ_FILES) -o $@ $(LDLIBS) 
	@echo "Done."

obj/%.o: %.cpp
	@echo "Compiling "$<"..."
	$(CC) -c $(WARN) $(OFLAGS) $(LDFLAGS) $< -o $@

clean: 
	@echo "Cleaning..."
	rm -rf $(OBJDIR)/*.o

objdir:
	@echo "Creating object directory..."
	mkdir -p $(OBJDIR)

mrproper: clean
	rm -rf ${TARGET}

install:
	@echo "Installing..."

doc:
	@echo "Building documentation..."
