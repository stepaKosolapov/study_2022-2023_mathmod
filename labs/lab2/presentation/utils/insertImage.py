import os
import shutil

sourceDirectory = './image/'

files = os.listdir(sourceDirectory)
files.sort(key=lambda x: os.stat(os.path.join(sourceDirectory, x)).st_ctime)

refPointer = '@REF_IMAGE'
refPointerLen = len(refPointer)
insertPointer = '@INSERT_IMAGE'
insertPointerLen = len(insertPointer)

markdownFile = 'presentation.md'

currentFileIndex = 0

def getNextFile():
    global currentFileIndex, currentImageIndex, currentLabel, files

    if currentFileIndex > len(files)-1:
        if currentFileIndex - (len(files)-1) > 1:
            print('Too many images to insert')
        currentFileIndex += 1
        return ''

    nextFile = files[currentFileIndex]

    while os.fsdecode(nextFile).startswith('.'):
        currentFileIndex += 1
        nextFile = files[currentFileIndex]

    currentFileIndex += 1
    currentImageIndex += 1
    currentLabel = 'fig:' + str(currentImageIndex).zfill(3)
    return nextFile


currentImageIndex = -1
currentLabel = ''
currentImage = getNextFile()

modifiedLines = []

with open(markdownFile) as f:
    lines = f.readlines()

    for line in lines:
        newLine = line

        while newLine.find(insertPointer) >= 0:
            insertIndex = newLine.find(insertPointer)

            toInsert = sourceDirectory + os.fsdecode(currentImage) + '){#' + currentLabel + ' width=70%}'

            newLine = newLine[:insertIndex] + toInsert + newLine[insertIndex+insertPointerLen+1:]

            currentImage = getNextFile()
            break

        while newLine.find(refPointer) >= 0:
            insertIndex = newLine.find(refPointer)

            toInsert = '@' + currentLabel

            newLine = newLine[:insertIndex] + toInsert + newLine[insertIndex+refPointerLen:]
            break

        modifiedLines.append(newLine)

with open(markdownFile, 'w', encoding='utf-8') as file:
    file.writelines(modifiedLines)
