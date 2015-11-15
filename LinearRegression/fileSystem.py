import json


def getDataFromCSV(fileName="DataSets/multiple_linear_regression.csv"):
    fileContent = getFileContents(fileName).split("\n")
    x = []
    y = []
    i = 0
    for row in fileContent:
        arr = row.split(',')
        lenArr = len(arr)
        j = 0
        xRow = [1]
        # for item in arr:
        #     if j != lenArr - 1:
        #         xRow.append(int(item))
        #     else:
        #         y.append(int(item))
        #     j += 1
        for item in arr:
            if j > 1:
                xRow.append(int(item))
            else:
                if j == 1:
                    y.append(int(item))
            j += 1
        x.append(xRow)
        i += 1
    return x, y


def getFileContents(fileName):
    fileDataSet = open(fileName)
    fileContent = fileDataSet.read()
    return fileContent


def saveData(data, fileName="tetta.csv"):
    fileData = open(fileName, 'w+')
    resultString = ""
    comma = ""
    for d in data:
        resultString += comma + str(d)
        comma = ","
    fileData.write(resultString)


def saveToJSONFile(data, fileName):
    resultStr = json.dumps(data)
    fileData = open(fileName, 'w+')
    fileData.write(resultStr)


def getFileJSONContents(fileName):
    content = getFileContents(fileName)
    result = json.loads(content)
    return  result