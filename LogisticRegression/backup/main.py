from train import *


def main():
    train()

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

if __name__ == "__main__":
    main()