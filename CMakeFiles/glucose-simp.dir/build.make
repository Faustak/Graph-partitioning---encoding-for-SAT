# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.28

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/faustak/work/glucose-4.2.1

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/faustak/work/Graph-partitioning---encoding-for-SAT

# Include any dependencies generated for this target.
include CMakeFiles/glucose-simp.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/glucose-simp.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/glucose-simp.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/glucose-simp.dir/flags.make

CMakeFiles/glucose-simp.dir/simp/Main.cc.o: CMakeFiles/glucose-simp.dir/flags.make
CMakeFiles/glucose-simp.dir/simp/Main.cc.o: /home/faustak/work/glucose-4.2.1/simp/Main.cc
CMakeFiles/glucose-simp.dir/simp/Main.cc.o: CMakeFiles/glucose-simp.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/faustak/work/Graph-partitioning---encoding-for-SAT/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/glucose-simp.dir/simp/Main.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/glucose-simp.dir/simp/Main.cc.o -MF CMakeFiles/glucose-simp.dir/simp/Main.cc.o.d -o CMakeFiles/glucose-simp.dir/simp/Main.cc.o -c /home/faustak/work/glucose-4.2.1/simp/Main.cc

CMakeFiles/glucose-simp.dir/simp/Main.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/glucose-simp.dir/simp/Main.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/faustak/work/glucose-4.2.1/simp/Main.cc > CMakeFiles/glucose-simp.dir/simp/Main.cc.i

CMakeFiles/glucose-simp.dir/simp/Main.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/glucose-simp.dir/simp/Main.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/faustak/work/glucose-4.2.1/simp/Main.cc -o CMakeFiles/glucose-simp.dir/simp/Main.cc.s

# Object files for target glucose-simp
glucose__simp_OBJECTS = \
"CMakeFiles/glucose-simp.dir/simp/Main.cc.o"

# External object files for target glucose-simp
glucose__simp_EXTERNAL_OBJECTS =

glucose-simp: CMakeFiles/glucose-simp.dir/simp/Main.cc.o
glucose-simp: CMakeFiles/glucose-simp.dir/build.make
glucose-simp: /usr/lib/x86_64-linux-gnu/libz.so
glucose-simp: libglucose.a
glucose-simp: /usr/lib/x86_64-linux-gnu/libz.so
glucose-simp: CMakeFiles/glucose-simp.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/faustak/work/Graph-partitioning---encoding-for-SAT/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable glucose-simp"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/glucose-simp.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/glucose-simp.dir/build: glucose-simp
.PHONY : CMakeFiles/glucose-simp.dir/build

CMakeFiles/glucose-simp.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/glucose-simp.dir/cmake_clean.cmake
.PHONY : CMakeFiles/glucose-simp.dir/clean

CMakeFiles/glucose-simp.dir/depend:
	cd /home/faustak/work/Graph-partitioning---encoding-for-SAT && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/faustak/work/glucose-4.2.1 /home/faustak/work/glucose-4.2.1 /home/faustak/work/Graph-partitioning---encoding-for-SAT /home/faustak/work/Graph-partitioning---encoding-for-SAT /home/faustak/work/Graph-partitioning---encoding-for-SAT/CMakeFiles/glucose-simp.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/glucose-simp.dir/depend

