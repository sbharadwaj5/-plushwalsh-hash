#include "PersistentTable.h"
#include "DirectoryEntry.h"
#include <iostream>
#include <cmath>

PersistentTable::PersistentTable(int level, int dir_size)
    : level(level), directory_size(dir_size), next_level(nullptr) {
    directory.resize(directory_size);
}

// size_t PersistentTable::hash_key(uint64_t key) const {
//     int bits = std::log2(directory_size);
//     return (key >> (4 * level)) & ((1ULL << bits) - 1);
// }
size_t PersistentTable::hash_key(uint64_t key) const {
    // Use (log2 of directory size) bits from key, shifted based on level
    int bits = std::log2(directory_size);
    return (key >> (4 * level)) & ((1ULL << bits) - 1);
}


void PersistentTable::insert(uint64_t key, uint64_t value) {
    size_t index = hash_key(key);

    if (!directory[index])
        directory[index] = std::make_shared<DirectoryEntry>();

    auto& entry = directory[index];

    if (entry->is_full()) {
        migrate_entry(index);
        insert(key, value); // Retry after migration
    } else {
        entry->insert(key, value);
    }
}

bool PersistentTable::lookup(uint64_t key, uint64_t& value) {
    size_t index = hash_key(key);
    if (directory[index] && directory[index]->lookup(key, value))
        return true;
    return next_level ? next_level->lookup(key, value) : false;
}

// void PersistentTable::migrate_entry(size_t dir_index) {
//     if (!next_level)
//         next_level = std::make_unique<PersistentTable>(level + 1, directory_size * 2); // or same size if preferred

//     std::vector<std::pair<uint64_t, uint64_t>> contents;
//     directory[dir_index]->collect_all(contents);

//     for (const auto& [k, v] : contents)
//         next_level->insert(k, v);

//     directory[dir_index]->clear();
// }
// PLUSH LOGIC
void PersistentTable::migrate_entry(size_t dir_index) {
    // 1. Lazy init of next level with doubled directory size
    if (!next_level)
        next_level = std::make_unique<PersistentTable>(level + 1, directory_size * 2); // increase resolution

    // 2. Gather all key-value pairs from full buckets
    std::vector<std::pair<uint64_t, uint64_t>> contents;
    directory[dir_index]->collect_all(contents);

    // 3. Promote all entries to the next level
    for (const auto& [key, value] : contents) {
        next_level->insert(key, value);
    }

    // 4. Clear this directory entry
    directory[dir_index]->clear();

    // Optional: mark entry as "migrated" if you add flags later
}



void PersistentTable::remove(uint64_t key) {
    size_t index = hash_key(key);
    if (directory[index])
        directory[index]->remove(key);
    else if (next_level)
        next_level->remove(key);
}

