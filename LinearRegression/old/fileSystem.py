def getDataFromCSV(fileName="../Datasets/multiple_linear_regression.csv"):
    fileContent = getFileContents(fileName).split("\n")
    x = []
    y = []
    i = 0
    for row in fileContent:
        arr = row.split(',')
        x.append([1, int(arr[0]), int(arr[1])])
        y.append(float(arr[2]))
        i = i + 1
    result = [x, y]
    return result


def getFileContents(fileName):
    fileDataSet = open(fileName);
    fileContent = fileDataSet.read()
    return fileContent


def saveData(data, fileName="teta.csv"):
    fileData = open(fileName, 'w+')
    fileData.write(str(data[0]) + "," + str(data[1]) + "," + str(data[2]))
