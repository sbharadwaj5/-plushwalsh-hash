#include <iostream>
#include "Bucket.h"

int main() {
    std::cout << "Hello, World!!" << std::endl;

    std::cout << "Creating buckets and seeing if it works well" << std::endl;
    Bucket b;

    b.insert(1, 100);
    b.insert(2, 200);
    b.insert(3, 300);

    uint64_t value;
    if (b.lookup(2, value)) {
        std::cout << "Found key 2: " << value << "\n";
    }

    b.remove(2);
    if (!b.lookup(2, value)) {
        std::cout << "Key 2 deleted successfully.\n";
    }

    // return 0;
    return 0;
}