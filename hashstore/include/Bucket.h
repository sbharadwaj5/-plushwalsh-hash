#pragma once
#include <cstdint>
#include <cstddef>
#include <cstring>

constexpr size_t RECORDS_PER_BUCKET = 16;
constexpr size_t BUCKET_SIZE = 256;

class Bucket {
public:
    Bucket();
    uint64_t getKeyAt(size_t index) const {
    if (index < size) {
        return keys[index];
    }
    return UINT64_MAX; // 
    }


    bool insert(uint64_t key, uint64_t value);
    bool lookup(uint64_t key, uint64_t& value) const;
    bool remove(uint64_t key);

    size_t getSize() const;

private:
    uint64_t keys[RECORDS_PER_BUCKET];
    uint64_t values[RECORDS_PER_BUCKET];
    size_t size;
};
