# -plushwalsh-hash

# Run the command chmod +x run.sh to give change access
# ./run.sh to run the executable 
## The intended file structure for implementation is in place


## Features
-  DB is supposed to be in Persistent Memory, PLUSH is an optimised algorithm for Persistent memory that uses multi level hash table to store the variable length key value pairs.
- Data is KV pair stored in buckets.





## Implementation

- load_gen.py generates ycsb run
- hashstore/test/ycsb_load.txt has simulated Load
- /src/Bucket.cpp - creating Buckets that will store the KV pairs, basic class that has insert, remove and lookup
- /src/PersistentTable.cpp 
- - PersistentTable is an im plementation of one hash level
- - Each table has a directory entry pointing to a list of buckets into which the keys are hashed
- - When these buckets overflow the lext leve of abstrction ill handle rehashing it further

- Each bucket is 256B and holds 16 records (8B key, 8B value)

- hashstore/main.cpp is used to integrate and test
- main.cpp has tests to check for the correctness of implementation
- YCSB load test is yet to be done

## Extract From the paper Plush: A Write-Optimized Persistent Log-Structured Hash-Table inspiring the project

- In contrast, we exploit that on PMem, it is unnecessary to gener- ate large sequential runs by sorting records as it already reaches full bandwidth with just 256-byte writes. We instead propose gathering records in a list of unsorted 256-byte buckets, which we address through a hash table. Whenever such a bucket list is full, we propose re-hashing its contents and recursively merging them into a bigger hash table (the “next level”). We thus adapt the LSM tree’s merging approach to a PMem-aware hash table. This was previously not workable, as the throughput of conventional block storage devices is too low for writes that small. Larger buckets to accommodate 4 KiB pages were also infeasible as search time would dominate for such large unsorted buckets. We call our approach Persistent Log- strUctured haSH-table, or Plush for short. In all other aspects, Plush takes proven approaches by LSM trees but adapts them for a PMem-native data structure:
Batch writes to PMem. Like an LSM tree, Plush gathers new data in DRAM before moving it to PMem in batches, minimizing write amplification so that PMem does not have to deal with spurious writes which would increase latency and lower throughput. How- ever, it uses a hash table instead of a skip list. Plush allows a config- urable amount of DRAM buffer. Established hybrid data structures, in contrast, cannot control their DRAM consumption as it grows with the record count. This puts a limit on record count before running out of DRAM. Plush has no such limit.
Store large records out of place. In contrast to many other PMem data structures, Plush supports variable-length keys and values. It employs a similar approach to LSM trees like WiscKey [33], which stores values in a separate log that periodically collects garbage. This approach reduces write amplification, since Plush does not have to copy values when merging them into the next level.

