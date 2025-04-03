#include "Bucket.h"

Bucket::Bucket() : size(0) {
    std::memset(keys, 0, sizeof(keys));
    std::memset(values, 0, sizeof(values));
}

bool Bucket::insert(uint64_t key, uint64_t value) {
    if (size >= RECORDS_PER_BUCKET) return false;

    
    for (size_t i = 0; i < size; ++i) {
        if (keys[i] == key) {
            values[i] = value;  // update existing
            return true;
        }
    }

    keys[size] = key;
    values[size] = value;
    size++;
    return true;
}

bool Bucket::lookup(uint64_t key, uint64_t& value) const {
    for (size_t i = 0; i < size; ++i) {
        if (keys[i] == key) {
            value = values[i];
            return true;
        }
    }
    return false;
}

bool Bucket::remove(uint64_t key) {
    for (size_t i = 0; i < size; ++i) {
        if (keys[i] == key) {
            // Compact the bucket
            keys[i] = keys[size - 1];
            values[i] = values[size - 1];
            size--;
            return true;
        }
    }
    return false;
}

size_t Bucket::getSize() const {
    return size;
}
