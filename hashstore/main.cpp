#include <iostream>
#include "Bucket.h"
#include "PersistentTable.h"

void printBuckets(const PersistentTable& table, size_t directory_size) {
    std::cout << "\n Directory Dump:\n";
    for (size_t i = 0; i < directory_size; ++i) {
        std::cout << "Entry " << i << ":\n";

        // Cast away const (or refactor PersistentTable to expose buckets safely)
        PersistentTable* mutable_table = const_cast<PersistentTable*>(&table);
        // auto& entry = (*mutable_table).directory[i];
        const auto& entry = table.getDirectory()[i];

        size_t bucket_id = 0;
        for (const auto& bucket : entry.buckets) {
            std::cout << "  Bucket " << bucket_id++ << ": ";
            for (size_t j = 0; j < bucket.getSize(); ++j) {
                uint64_t val;
                uint64_t key = bucket.getKeyAt(j);
                bucket.lookup(key, val); 
                std::cout << "[" << key << " → " << val << "] ";
            }
            std::cout << "\n";
        }
    }
}

int main() {
    std::cout << "Hello, World!!" << std::endl;

    std::cout << "TESTING  STEP 1" << std::endl;

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
    std::cout << "" << std::endl;
    std::cout << "" << std::endl;
    std::cout << "" << std::endl;

    std::cout << "TESTING  STEP 2" << std::endl;
    std::cout << "Checking of single lower level with 2 buckets is working" << std::endl;

    size_t directory_size = 4;
    PersistentTable table(directory_size);

    std::cout << "Inserting values...\n";

    // Insert keys that hash to the same directory index
    table.insert(1, 100);
    table.insert(5, 500);
    table.insert(9, 900);  // Likely to hash to the same index as 1, 5

    // Insert keys for other indices
    table.insert(2, 200);
    table.insert(3, 300);

    // Lookup test
    uint64_t val;
    if (table.lookup(5, val)) {
        std::cout << "Lookup key 5: " << val << "\n";
    } else {
        std::cout << "Lookup key 5 failed.\n";
    }

    if (table.lookup(7, val)) {
        std::cout << "Lookup key 7: " << val << "\n";
    } else {
        std::cout << "Lookup key 7 failed (expected).\n";
    }

    // Remove test
    table.remove(2);
    if (!table.lookup(2, val)) {
        std::cout << "Key 2 removed successfully.\n";
    }

    // Print full bucket contents
    printBuckets(table, directory_size);

    return 0;

    // return 0;


    return 0;
}