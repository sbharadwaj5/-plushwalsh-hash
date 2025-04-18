#include <iostream>
#include "Bucket.h"
#include "PersistentTable.h"
#include <fstream>
#include <sstream>


// Print the contents of all buckets at all levels recursively
void printBuckets(const PersistentTable& table, size_t level = 0) {
    const auto& directory = table.getDirectory();

    std::cout << "\n[Level " << level << "] Directory Dump:\n";
    for (size_t i = 0; i < directory.size(); ++i) {
        const auto& entry = directory[i];
        if (!entry) continue;

        std::cout << "Directory Entry " << i << ":\n";
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


void runYCSBWorkload(const std::string& file_path, PersistentTable& table) {
    std::ifstream file(file_path);
    std::string line;

    while (std::getline(file, line)) {
        std::istringstream iss(line);
        std::string op;
        uint64_t key, value;

        iss >> op >> key;

        if (op == "INSERT" || op == "UPDATE") {
            iss >> value;
            table.insert(key, value);
        } else if (op == "DELETE") {
            table.remove(key);
        }
    }

    std::cout << "Finished processing " << file_path << "\n";
}


int main() {
     const size_t dir_size1 = 16;
    PersistentTable table1(/*level=*/0, /*directory_size=*/16);

    // Process generated file
    runYCSBWorkload("test/ycsb_load.txt", table1);  // Adjust path if needed

    std::cout << "\nFinal Bucket Contents After YCSB Load:\n";
    printBuckets(table1);
    std::cout << "\n\n\n\n";

    std::cout << "Testing Bucket behavior using custom test cases\n";
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

    std::cout << "\nInserting values to cause overflow and rehashing...\n";

    // Insert enough keys into same index to fill all buckets in a directory entry
    // Force overflow and level promotion
    size_t base_key = 0;
    for (uint64_t i = 0; i < 300; ++i) {
        table.insert(base_key + i * dir_size, i * 10);  // Same index pattern: keys % dir_size == 0
    }

    std::cout << "\nLooking up a few known keys to verify...\n";
    uint64_t test_val;

    if (table.lookup(base_key + 20 * dir_size, test_val))
        std::cout << "Found key: " << base_key + 20 * dir_size << " -> " << test_val << "\n";
    else
        std::cout << "Key not found!\n";

    std::cout << "\nFinal Bucket Contents:\n";
    printBuckets(table);


    std::cout << "Running PLUSH-based PersistentTable with YCSB workload...\n";

   
    return 0;
}
