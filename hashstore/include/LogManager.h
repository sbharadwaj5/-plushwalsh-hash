#pragma once
#include <cstdint>
#include <vector>
#include <mutex>

const int LOG_CHUNK_SIZE = 256;  // bytes
const int LOG_ENTRIES_PER_CHUNK = 16;

struct LogEntry {
    uint64_t key;
    uint64_t value;
    uint64_t epoch;

    // Dummy persist to simulate PMem persistency barrier
    void persist() const {
        asm volatile("" ::: "memory");  //clwb + sfence
    }
};

class LogChunk {
public:
    LogEntry entries[LOG_ENTRIES_PER_CHUNK];
    uint64_t size = 0;  // how many entries are written
};

class LogManager {
public:
    LogManager(size_t numChunks = 64);

    void logInsert(uint64_t key, uint64_t value, uint64_t epoch);
    void recover(std::vector<LogEntry>& recoveredEntries);

private:
    std::vector<LogChunk> chunks;
    std::mutex lock;
    size_t currentChunk;
};
