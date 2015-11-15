import math


def multiplication(first, second):
    fRows = len(first)
    fCell = len(first[0])
    sRows = len(second)
    sCell = len(second[0])
    result = []
    k = 0
    for i in range(0, fRows):
        result.append(0)
        for j in range(0, fCell):
            print first[i][j]
            print second[j][i]
            print result[k]
            result[k] += first[i][j] * second[j][i]
        k += 1
    print result


def transponent(arr):
    cRows = len(arr)
    cCell = len(arr[0])
    result = range(0, cCell)
    i = 0
    for i in result:
        result[i] = range(0, cRows)
        i += 1
    i = 0
    for row in arr:
        j = 0
        for cell in row:
            result[j][i] = cell
            j += 1
        i += 1
    print result


transponent([[1, 2], [3, 4]])
