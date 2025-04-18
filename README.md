# -plushwalsh-hash

## Run the command chmod +x run.sh to give change access
## ./run.sh to run the executable 
## The intended file structure for implementation is in place


## Features
- DB is supposed to be in Persistent Memory, PLUSH is an optimized algorithm for Persistent memory that uses a multi-level hash table to store the variable length key-value pairs.
- Data is KV pair stored in buckets.
- DirectoryEntry manages a vector of buckets.
- PersistentTable implements a level-based hash table
- Each level contains a fixed-size directory of DirectoryEntry pointers
- Keys are rehashed and moved to the next level when a directory entry overflows using dynamic hashing


## Implementation
- load_gen.py generates cub run
- hashstore/test/ycsb_load.txt has simulated Load
- /src/Bucket.cpp - creating Buckets that will store the KV pairs, a basic class that has an insert, remove, and lookup
- /src/PersistentTable.cpp 
    - PersistentTable is an implementation of one hash level
    - Each table has a directory entry pointing to a list of buckets into which the keys are hashed
    - When these buckets overflow the next level of abstraction we'll handle rehashing it further
- Each bucket is 256B and holds 16 records (8B key, 8B value)
- hash store/main.cpp is used to integrate and test
- YCSB is used to generate test/ycsb_load.txt to check for 
- main.cpp has tests to check for the correctness of the implementation
- DirectoryEntry
    - Holds a vector of buckets (shared_ptr<Bucket>)
    - Supports up to MAX_BUCKETS per entry
    - insert(key, value) adds to the latest bucket or creates a new one if needed
    - is_full() checks if all buckets are full (triggers rehash)
    - lookup(key) searches across all buckets
    - remove(key) deletes the key from all buckets
    - collect_all() gathers all key-value pairs for migration
    - clear() resets the entry by clearing all buckets
    - get buckets() provides access for debugging/printing
- In Persistent Table
    - On overflow, all records in a full directory entry are collected using collect_all
    - Then it is rehashed using more bits and then pushed to an upper level using the migrate_entry function
- printBuckets recursively moves through different levels to print the entries in each bucket of the directory
- runYCSBWorkload in main.cpp takes in the YCSB load, parses it, and adds it to the PersistentTable with the hash implementation already set up
- The implementation is tested using generating a random YCSB workload and using INSERT, UPDATE, and DELETE operations to later see the levels and directory contents. To verify a small custom data is also used to check the implementation.

## Extract From the paper Plush: A Write-Optimized Persistent Log-Structured Hash-Table inspiring the project

- In contrast, we exploit that on PMem, it is unnecessary to gener- ate large sequential runs by sorting records as it already reaches full bandwidth with just 256-byte writes. We instead propose gathering records in a list of unsorted 256-byte buckets, which we address through a hash table. Whenever such a bucket list is full, we propose re-hashing its contents and recursively merging them into a bigger hash table (the “next level”). We thus adapt the LSM tree’s merging approach to a PMem-aware hash table. This was previously not workable, as the throughput of conventional block storage devices is too low for writes that small. Larger buckets to accommodate 4 KiB pages were also infeasible as search time would dominate for such large unsorted buckets. We call our approach Persistent Log- strUctured haSH-table, or Plush for short. In all other aspects, Plush takes proven approaches by LSM trees but adapts them for a PMem-native data structure:
Batch writes to PMem. Like an LSM tree, Plush gathers new data in DRAM before moving it to PMem in batches, minimizing write amplification so that PMem does not have to deal with spurious writes which would increase latency and lower throughput. How- ever, it uses a hash table instead of a skip list. Plush allows a config- urable amount of DRAM buffer. Established hybrid data structures, in contrast, cannot control their DRAM consumption as it grows with the record count. This puts a limit on record count before running out of DRAM. Plush has no such limit.
Store large records out of place. In contrast to many other PMem data structures, Plush supports variable-length keys and values. It employs a similar approach to LSM trees like WiscKey [33], which stores values in a separate log that periodically collects garbage. This approach reduces write amplification, since Plush does not have to copy values when merging them into the next level.

