# Sintach was here

def webdown():
# not implemented


def cutter(file, cut):
    f = open(file, 'r')
    line = f.readline()
    return line.split(cut)


words = cutter('test4cutter.txt', ' ')
print(words)
