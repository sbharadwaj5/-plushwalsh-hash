#include "DirectoryEntry.h"

DirectoryEntry::DirectoryEntry() {}

bool DirectoryEntry::is_full() const {
    return buckets.size() >= MAX_BUCKETS && buckets.back()->getSize() >= RECORDS_PER_BUCKET;
}

void DirectoryEntry::insert(uint64_t key, uint64_t value) {
    if (buckets.empty() || buckets.back()->getSize() >= RECORDS_PER_BUCKET) {
        if (buckets.size() < MAX_BUCKETS)
            buckets.push_back(std::make_shared<Bucket>());
        else
            return;  // Full 
    }
    buckets.back()->insert(key, value);
}

bool DirectoryEntry::lookup(uint64_t key, uint64_t& value) const {
    for (const auto& bucket : buckets) {
        if (bucket->lookup(key, value))
            return true;
    }
    return false;
}

void DirectoryEntry::collect_all(std::vector<std::pair<uint64_t, uint64_t>>& out) const {
    for (const auto& bucket : buckets) {
        for (size_t i = 0; i < bucket->getSize(); ++i) {
            uint64_t k = bucket->getKeyAt(i);
            uint64_t v;
            if (bucket->lookup(k, v)) {
                out.emplace_back(k, v);
            }
        }
    }
}

void DirectoryEntry::clear() {
    buckets.clear();
}
void DirectoryEntry::remove(uint64_t key) {
    for (const auto& bucket : buckets)
        bucket->remove(key);
}
