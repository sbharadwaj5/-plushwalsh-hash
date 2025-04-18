#pragma once
#include <vector>
#include <memory>
#include "Bucket.h"
#include "DirectoryEntry.h"

class DirectoryEntry {
public:
    static const size_t MAX_BUCKETS = 2;

    DirectoryEntry();
    bool is_full() const;
    void insert(uint64_t key, uint64_t value);
    bool lookup(uint64_t key, uint64_t& value) const;
    void collect_all(std::vector<std::pair<uint64_t, uint64_t>>& out) const;
    void clear();
    void remove(uint64_t key);
    const std::vector<std::shared_ptr<Bucket>>& getBuckets() const { return buckets; }
    

private:
    std::vector<std::shared_ptr<Bucket>> buckets;
};
