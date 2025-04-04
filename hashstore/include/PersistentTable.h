
#include <vector>
#include "Bucket.h"

struct DirectoryEntry {
    std::vector<Bucket> buckets;
    // Optional:
    // BloomFilter filter;
    // uint64_t epoch;
};
class PersistentTable {
public:
    PersistentTable(size_t directory_size);
    const std::vector<DirectoryEntry>& getDirectory() const {
    return directory;
}

    bool insert(uint64_t key, uint64_t value);
    bool lookup(uint64_t key, uint64_t& value);
    bool remove(uint64_t key);

private:
    std::vector<DirectoryEntry> directory;
    size_t directory_size;
    size_t bucket_capacity = 1; // could support bucket chaining or fixed count

    size_t hash(uint64_t key) const;
};
