
#pragma once
#include "DirectoryEntry.h"
#include <vector>
#include <memory>

class PersistentTable {
public:
    explicit PersistentTable(int level = 0, int directory_size = 16);
    void insert(uint64_t key, uint64_t value);
    bool lookup(uint64_t key, uint64_t& value);

    const std::vector<std::shared_ptr<DirectoryEntry>>& getDirectory() const {
        return directory;
    }

    PersistentTable* getNextLevel() const {
        return next_level.get();
    }

    void remove(uint64_t key);

private:
    int level;
    int directory_size;
    std::vector<std::shared_ptr<DirectoryEntry>> directory;
    std::unique_ptr<PersistentTable> next_level;

    size_t hash_key(uint64_t key) const;
    void migrate_entry(size_t dir_index);

    
};


