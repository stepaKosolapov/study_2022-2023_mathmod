import os
import shutil

sourceDirectory = '/Users/stepa-kos/Documents/'
targetDirectory = os.getcwd()+ "/image/"

files = os.listdir(sourceDirectory)
files.sort(key=lambda x: os.stat(os.path.join(sourceDirectory, x)).st_ctime)

i = 0

for file in files:
    filename = os.fsdecode(file)
    sourceFilePath = sourceDirectory + filename

    if filename.endswith(".png"):
        if 'small' in filename:
            os.remove(sourceFilePath)
            continue

        targetFilePath = targetDirectory + str(i) + '.png'
        shutil.copyfile(sourceFilePath, targetFilePath)
        i += 1