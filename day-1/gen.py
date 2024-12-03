with open("input") as file:
    source = file.read()

for exp in range(1, 8):
    n = 2**exp
    with open(f"input.{n}k", "w") as file:
        file.write(source * n)
