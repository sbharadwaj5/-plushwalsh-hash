# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.31

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
CMAKE_COMMAND = /opt/homebrew/bin/cmake

# The command to remove a file.
RM = /opt/homebrew/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/shrads/Desktop/ADB/-plushwalsh-hash/hashstore

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/shrads/Desktop/ADB/-plushwalsh-hash/hashstore

# Include any dependencies generated for this target.
include CMakeFiles/hashstore.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/hashstore.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/hashstore.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/hashstore.dir/flags.make

CMakeFiles/hashstore.dir/codegen:
.PHONY : CMakeFiles/hashstore.dir/codegen

CMakeFiles/hashstore.dir/main.cpp.o: CMakeFiles/hashstore.dir/flags.make
CMakeFiles/hashstore.dir/main.cpp.o: main.cpp
CMakeFiles/hashstore.dir/main.cpp.o: CMakeFiles/hashstore.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/shrads/Desktop/ADB/-plushwalsh-hash/hashstore/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/hashstore.dir/main.cpp.o"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/hashstore.dir/main.cpp.o -MF CMakeFiles/hashstore.dir/main.cpp.o.d -o CMakeFiles/hashstore.dir/main.cpp.o -c /Users/shrads/Desktop/ADB/-plushwalsh-hash/hashstore/main.cpp

CMakeFiles/hashstore.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/hashstore.dir/main.cpp.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/shrads/Desktop/ADB/-plushwalsh-hash/hashstore/main.cpp > CMakeFiles/hashstore.dir/main.cpp.i

CMakeFiles/hashstore.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/hashstore.dir/main.cpp.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/shrads/Desktop/ADB/-plushwalsh-hash/hashstore/main.cpp -o CMakeFiles/hashstore.dir/main.cpp.s

CMakeFiles/hashstore.dir/src/Bucket.cpp.o: CMakeFiles/hashstore.dir/flags.make
CMakeFiles/hashstore.dir/src/Bucket.cpp.o: src/Bucket.cpp
CMakeFiles/hashstore.dir/src/Bucket.cpp.o: CMakeFiles/hashstore.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/shrads/Desktop/ADB/-plushwalsh-hash/hashstore/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/hashstore.dir/src/Bucket.cpp.o"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/hashstore.dir/src/Bucket.cpp.o -MF CMakeFiles/hashstore.dir/src/Bucket.cpp.o.d -o CMakeFiles/hashstore.dir/src/Bucket.cpp.o -c /Users/shrads/Desktop/ADB/-plushwalsh-hash/hashstore/src/Bucket.cpp

CMakeFiles/hashstore.dir/src/Bucket.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/hashstore.dir/src/Bucket.cpp.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/shrads/Desktop/ADB/-plushwalsh-hash/hashstore/src/Bucket.cpp > CMakeFiles/hashstore.dir/src/Bucket.cpp.i

CMakeFiles/hashstore.dir/src/Bucket.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/hashstore.dir/src/Bucket.cpp.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/shrads/Desktop/ADB/-plushwalsh-hash/hashstore/src/Bucket.cpp -o CMakeFiles/hashstore.dir/src/Bucket.cpp.s

CMakeFiles/hashstore.dir/src/DirectoryEntry.cpp.o: CMakeFiles/hashstore.dir/flags.make
CMakeFiles/hashstore.dir/src/DirectoryEntry.cpp.o: src/DirectoryEntry.cpp
CMakeFiles/hashstore.dir/src/DirectoryEntry.cpp.o: CMakeFiles/hashstore.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/shrads/Desktop/ADB/-plushwalsh-hash/hashstore/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/hashstore.dir/src/DirectoryEntry.cpp.o"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/hashstore.dir/src/DirectoryEntry.cpp.o -MF CMakeFiles/hashstore.dir/src/DirectoryEntry.cpp.o.d -o CMakeFiles/hashstore.dir/src/DirectoryEntry.cpp.o -c /Users/shrads/Desktop/ADB/-plushwalsh-hash/hashstore/src/DirectoryEntry.cpp

CMakeFiles/hashstore.dir/src/DirectoryEntry.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/hashstore.dir/src/DirectoryEntry.cpp.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/shrads/Desktop/ADB/-plushwalsh-hash/hashstore/src/DirectoryEntry.cpp > CMakeFiles/hashstore.dir/src/DirectoryEntry.cpp.i

CMakeFiles/hashstore.dir/src/DirectoryEntry.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/hashstore.dir/src/DirectoryEntry.cpp.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/shrads/Desktop/ADB/-plushwalsh-hash/hashstore/src/DirectoryEntry.cpp -o CMakeFiles/hashstore.dir/src/DirectoryEntry.cpp.s

CMakeFiles/hashstore.dir/src/HashStore.cpp.o: CMakeFiles/hashstore.dir/flags.make
CMakeFiles/hashstore.dir/src/HashStore.cpp.o: src/HashStore.cpp
CMakeFiles/hashstore.dir/src/HashStore.cpp.o: CMakeFiles/hashstore.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/shrads/Desktop/ADB/-plushwalsh-hash/hashstore/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/hashstore.dir/src/HashStore.cpp.o"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/hashstore.dir/src/HashStore.cpp.o -MF CMakeFiles/hashstore.dir/src/HashStore.cpp.o.d -o CMakeFiles/hashstore.dir/src/HashStore.cpp.o -c /Users/shrads/Desktop/ADB/-plushwalsh-hash/hashstore/src/HashStore.cpp

CMakeFiles/hashstore.dir/src/HashStore.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/hashstore.dir/src/HashStore.cpp.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/shrads/Desktop/ADB/-plushwalsh-hash/hashstore/src/HashStore.cpp > CMakeFiles/hashstore.dir/src/HashStore.cpp.i

CMakeFiles/hashstore.dir/src/HashStore.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/hashstore.dir/src/HashStore.cpp.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/shrads/Desktop/ADB/-plushwalsh-hash/hashstore/src/HashStore.cpp -o CMakeFiles/hashstore.dir/src/HashStore.cpp.s

CMakeFiles/hashstore.dir/src/LogManager.cpp.o: CMakeFiles/hashstore.dir/flags.make
CMakeFiles/hashstore.dir/src/LogManager.cpp.o: src/LogManager.cpp
CMakeFiles/hashstore.dir/src/LogManager.cpp.o: CMakeFiles/hashstore.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/shrads/Desktop/ADB/-plushwalsh-hash/hashstore/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/hashstore.dir/src/LogManager.cpp.o"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/hashstore.dir/src/LogManager.cpp.o -MF CMakeFiles/hashstore.dir/src/LogManager.cpp.o.d -o CMakeFiles/hashstore.dir/src/LogManager.cpp.o -c /Users/shrads/Desktop/ADB/-plushwalsh-hash/hashstore/src/LogManager.cpp

CMakeFiles/hashstore.dir/src/LogManager.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/hashstore.dir/src/LogManager.cpp.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/shrads/Desktop/ADB/-plushwalsh-hash/hashstore/src/LogManager.cpp > CMakeFiles/hashstore.dir/src/LogManager.cpp.i

CMakeFiles/hashstore.dir/src/LogManager.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/hashstore.dir/src/LogManager.cpp.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/shrads/Desktop/ADB/-plushwalsh-hash/hashstore/src/LogManager.cpp -o CMakeFiles/hashstore.dir/src/LogManager.cpp.s

CMakeFiles/hashstore.dir/src/PersistentTable.cpp.o: CMakeFiles/hashstore.dir/flags.make
CMakeFiles/hashstore.dir/src/PersistentTable.cpp.o: src/PersistentTable.cpp
CMakeFiles/hashstore.dir/src/PersistentTable.cpp.o: CMakeFiles/hashstore.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/shrads/Desktop/ADB/-plushwalsh-hash/hashstore/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/hashstore.dir/src/PersistentTable.cpp.o"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/hashstore.dir/src/PersistentTable.cpp.o -MF CMakeFiles/hashstore.dir/src/PersistentTable.cpp.o.d -o CMakeFiles/hashstore.dir/src/PersistentTable.cpp.o -c /Users/shrads/Desktop/ADB/-plushwalsh-hash/hashstore/src/PersistentTable.cpp

CMakeFiles/hashstore.dir/src/PersistentTable.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/hashstore.dir/src/PersistentTable.cpp.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/shrads/Desktop/ADB/-plushwalsh-hash/hashstore/src/PersistentTable.cpp > CMakeFiles/hashstore.dir/src/PersistentTable.cpp.i

CMakeFiles/hashstore.dir/src/PersistentTable.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/hashstore.dir/src/PersistentTable.cpp.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/shrads/Desktop/ADB/-plushwalsh-hash/hashstore/src/PersistentTable.cpp -o CMakeFiles/hashstore.dir/src/PersistentTable.cpp.s

CMakeFiles/hashstore.dir/src/Utils.cpp.o: CMakeFiles/hashstore.dir/flags.make
CMakeFiles/hashstore.dir/src/Utils.cpp.o: src/Utils.cpp
CMakeFiles/hashstore.dir/src/Utils.cpp.o: CMakeFiles/hashstore.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/shrads/Desktop/ADB/-plushwalsh-hash/hashstore/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object CMakeFiles/hashstore.dir/src/Utils.cpp.o"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/hashstore.dir/src/Utils.cpp.o -MF CMakeFiles/hashstore.dir/src/Utils.cpp.o.d -o CMakeFiles/hashstore.dir/src/Utils.cpp.o -c /Users/shrads/Desktop/ADB/-plushwalsh-hash/hashstore/src/Utils.cpp

CMakeFiles/hashstore.dir/src/Utils.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/hashstore.dir/src/Utils.cpp.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/shrads/Desktop/ADB/-plushwalsh-hash/hashstore/src/Utils.cpp > CMakeFiles/hashstore.dir/src/Utils.cpp.i

CMakeFiles/hashstore.dir/src/Utils.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/hashstore.dir/src/Utils.cpp.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/shrads/Desktop/ADB/-plushwalsh-hash/hashstore/src/Utils.cpp -o CMakeFiles/hashstore.dir/src/Utils.cpp.s

# Object files for target hashstore
hashstore_OBJECTS = \
"CMakeFiles/hashstore.dir/main.cpp.o" \
"CMakeFiles/hashstore.dir/src/Bucket.cpp.o" \
"CMakeFiles/hashstore.dir/src/DirectoryEntry.cpp.o" \
"CMakeFiles/hashstore.dir/src/HashStore.cpp.o" \
"CMakeFiles/hashstore.dir/src/LogManager.cpp.o" \
"CMakeFiles/hashstore.dir/src/PersistentTable.cpp.o" \
"CMakeFiles/hashstore.dir/src/Utils.cpp.o"

# External object files for target hashstore
hashstore_EXTERNAL_OBJECTS =

hashstore: CMakeFiles/hashstore.dir/main.cpp.o
hashstore: CMakeFiles/hashstore.dir/src/Bucket.cpp.o
hashstore: CMakeFiles/hashstore.dir/src/DirectoryEntry.cpp.o
hashstore: CMakeFiles/hashstore.dir/src/HashStore.cpp.o
hashstore: CMakeFiles/hashstore.dir/src/LogManager.cpp.o
hashstore: CMakeFiles/hashstore.dir/src/PersistentTable.cpp.o
hashstore: CMakeFiles/hashstore.dir/src/Utils.cpp.o
hashstore: CMakeFiles/hashstore.dir/build.make
hashstore: CMakeFiles/hashstore.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/Users/shrads/Desktop/ADB/-plushwalsh-hash/hashstore/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Linking CXX executable hashstore"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/hashstore.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/hashstore.dir/build: hashstore
.PHONY : CMakeFiles/hashstore.dir/build

CMakeFiles/hashstore.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/hashstore.dir/cmake_clean.cmake
.PHONY : CMakeFiles/hashstore.dir/clean

CMakeFiles/hashstore.dir/depend:
	cd /Users/shrads/Desktop/ADB/-plushwalsh-hash/hashstore && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/shrads/Desktop/ADB/-plushwalsh-hash/hashstore /Users/shrads/Desktop/ADB/-plushwalsh-hash/hashstore /Users/shrads/Desktop/ADB/-plushwalsh-hash/hashstore /Users/shrads/Desktop/ADB/-plushwalsh-hash/hashstore /Users/shrads/Desktop/ADB/-plushwalsh-hash/hashstore/CMakeFiles/hashstore.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/hashstore.dir/depend

