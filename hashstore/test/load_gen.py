import random

ops = ['INSERT', 'UPDATE', 'DELETE']
record_count = 1000
keys = [f"user{random.randint(1, 500)}" for _ in range(record_count)]
output = []

for key in keys:
    op = random.choices(ops, weights=[0.5, 0.3, 0.2])[0]  # 50% INSERT, 30% UPDATE, 20% DELETE
    if op in ['INSERT', 'UPDATE']:
        value = random.randint(10000, 99999)
        output.append(f"{op} {key} field0={value}")
    else:
        output.append(f"{op} {key}")

with open("ycsb_load.txt", "w") as f:
    f.write("\n".join(output))

print("ycsb_load.txt generated with 1000 mixed operations.")
