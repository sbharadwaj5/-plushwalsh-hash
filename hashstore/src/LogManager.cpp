#include "LogManager.h"
#include <iostream>

LogManager::LogManager(size_t numChunks) {
    chunks.resize(numChunks);
    currentChunk = 0;
}

void LogManager::logInsert(uint64_t key, uint64_t value, uint64_t epoch) {
    std::lock_guard<std::mutex> guard(lock);

    LogChunk& chunk = chunks[currentChunk];
    if (chunk.size >= LOG_ENTRIES_PER_CHUNK) {
        currentChunk = (currentChunk + 1) % chunks.size();
        chunk = chunks[currentChunk];  // Overwrite old chunk
        chunk.size = 0;
    }

    LogEntry& entry = chunk.entries[chunk.size++];
    entry.key = key;
    entry.value = value;
    entry.epoch = epoch;

    entry.persist();  // simulate RAWL flush
}

void LogManager::recover(std::vector<LogEntry>& recoveredEntries) {
    for (auto& chunk : chunks) {
        for (size_t i = 0; i < chunk.size; ++i) {
            recoveredEntries.push_back(chunk.entries[i]);
        }
    }
    std::cout << "Recovered " << recoveredEntries.size() << " entries.\n";
}
