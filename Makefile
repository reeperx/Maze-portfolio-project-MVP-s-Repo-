# Makefile for compiling main.cpp with SDL2 and SDL2_image

# Compiler and linker
CXX = g++
CXXFLAGS = -Wall -g

# SDL2 and SDL2_image flags
SDL2_FLAGS = `sdl2-config --cflags --libs`
IMG_FLAGS = `pkg-config --cflags --libs sdl2_image`

# Source files and executable
SRC = main.cpp
OBJ = $(SRC:.cpp=.o)
EXE = main

# Default target
all: $(EXE)

# Link the executable
$(EXE): $(OBJ)
	$(CXX) $(CXXFLAGS) -o $@ $(OBJ) $(SDL2_FLAGS) $(IMG_FLAGS)

# Compile the source file
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@ $(SDL2_FLAGS) $(IMG_FLAGS)

# Clean the build files
clean:
	rm -f $(OBJ) $(EXE)
