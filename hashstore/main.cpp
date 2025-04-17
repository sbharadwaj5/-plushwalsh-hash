#include <iostream>
#include "Bucket.h"
#include "PersistentTable.h"

// Print the contents of all buckets at all levels recursively
void printBuckets(const PersistentTable& table, size_t level = 0) {
    const auto& directory = table.getDirectory();

    std::cout << "\n[Level " << level << "] Directory Dump:\n";
    for (size_t i = 0; i < directory.size(); ++i) {
        const auto& entry = directory[i];
        if (!entry) continue;

        std::cout << "Entry in [key, value] format" << i << ":\n";
        size_t bucket_id = 0;
        for (const auto& bucket : entry->getBuckets()) {
            std::cout << "  Bucket " << bucket_id++ << ": ";
            for (size_t j = 0; j < bucket->getSize(); ++j) {
                uint64_t val;
                uint64_t key = bucket->getKeyAt(j);
                if (bucket->lookup(key, val))
                    std::cout << "[" << key << " -> " << val << "] ";
            }
            std::cout << "\n";
        }
    }

    if (table.getNextLevel())
        printBuckets(*table.getNextLevel(), level + 1);
}

int main() {
    std::cout << "Testing Bucket behavior...\n";
    Bucket b;
    b.insert(1, 100);
    b.insert(2, 200);
    b.insert(3, 300);

    uint64_t value;
    if (b.lookup(2, value))
        std::cout << "Found key 2: " << value << "\n";

    b.remove(2);
    if (!b.lookup(2, value))
        std::cout << "Key 2 deleted successfully.\n";

    std::cout << "\nTesting PersistentTable with fixed-size directories...\n";

    const size_t dir_size = 4;
    PersistentTable table(/*level=*/0, dir_size);

    // Insert enough records to trigger overflows and migrations
    for (uint64_t i = 0; i < 64; ++i) {
        table.insert(i, i * 10);
    }

    std::cout << "\nLookup and Remove Checks...\n";
    uint64_t test_val;

    if (table.lookup(30, test_val))
        std::cout << "Lookup key 30: " << test_val << "\n";
    else
        std::cout << "Failed to find key 30\n";

    table.remove(30);
    if (!table.lookup(30, test_val))
        std::cout << "Key 30 removed successfully.\n";

    std::cout << "\nFinal Bucket Contents:\n";
    printBuckets(table);

    return 0;
}
