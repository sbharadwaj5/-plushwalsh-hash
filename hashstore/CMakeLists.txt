cmake_minimum_required(VERSION 3.10)

# Declare the project name and language
project(HashStoreProject LANGUAGES CXX)

# Use C++17
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Include header files from include/
include_directories(include)

# Find all .cpp files in src/
file(GLOB SRC_FILES "src/*.cpp")

# Add your executable from main.cpp + all source files
add_executable(hashstore main.cpp ${SRC_FILES})
