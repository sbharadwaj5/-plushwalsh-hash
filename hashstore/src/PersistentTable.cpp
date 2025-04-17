#include "PersistentTable.h"
#include <iostream>
#include <cmath>

PersistentTable::PersistentTable(int level, int dir_size)
    : level(level), directory_size(dir_size), next_level(nullptr) {
    directory.resize(directory_size);
}

size_t PersistentTable::hash_key(uint64_t key) const {
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

void PersistentTable::migrate_entry(size_t dir_index) {
    if (!next_level)
        next_level = std::make_unique<PersistentTable>(level + 1, directory_size * 2); // or same size if preferred

    std::vector<std::pair<uint64_t, uint64_t>> contents;
    directory[dir_index]->collect_all(contents);

    for (const auto& [k, v] : contents)
        next_level->insert(k, v);

    directory[dir_index]->clear();
}

void PersistentTable::remove(uint64_t key) {
    size_t index = hash_key(key);
    if (directory[index])
        directory[index]->remove(key);
    else if (next_level)
        next_level->remove(key);
}

