with open("input") as file:
    a, b = zip(*[[int(x) for x in l.split()] for l in file.readlines()])
print(min(a), min(b), max(a), max(b))
