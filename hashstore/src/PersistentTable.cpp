#include "PersistentTable.h"
#include <iostream>
#include <functional> // for std::hash

// Constructor
PersistentTable::PersistentTable(size_t directory_size)
    : directory_size(directory_size), directory(directory_size) {
    
    // Initialize each DirectoryEntry with 2 buckets
    for (auto& entry : directory) {
        entry.buckets.resize(2);
    }
}

// Insert a key-value pair
bool PersistentTable::insert(uint64_t key, uint64_t value) {
    size_t index = hash(key);
    auto& entry = directory[index];

    // Try inserting into existing buckets
    for (auto& bucket : entry.buckets) {
        if (bucket.insert(key, value)) {
            return true;
        }
    }

    // All buckets full → create a new bucket and insert
    Bucket new_bucket;
    new_bucket.insert(key, value);
    entry.buckets.push_back(new_bucket);
    return true;
}

// Lookup a key; return true and set value if found
bool PersistentTable::lookup(uint64_t key, uint64_t& value) {
    size_t index = hash(key);
    auto& entry = directory[index];

    for (const auto& bucket : entry.buckets) {
        if (bucket.lookup(key, value)) {
            return true;
        }
    }

    return false; // Not found
}

// Remove a key if it exists
bool PersistentTable::remove(uint64_t key) {
    size_t index = hash(key);
    auto& entry = directory[index];

    for (auto& bucket : entry.buckets) {
        if (bucket.remove(key)) {
            return true;
        }
    }

    return false; // Not found
}

// Basic hash function
size_t PersistentTable::hash(uint64_t key) const {
    return std::hash<uint64_t>{}(key) % directory_size;
}
