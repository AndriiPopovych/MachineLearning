from fileSystem import *


def train():
    print "start training"


def transposed(array):
    rowCounter = len(array)
    cellCounter = len(array[0])
    newArr = range(0, cellCounter)
    for i in range(0, len(newArr)):
        newArr[i] = range(0, rowCounter)
    for i in range(0, rowCounter):
        for j in range(0, cellCounter):
            newArr[j][i] = array[i][j]
    return newArr
