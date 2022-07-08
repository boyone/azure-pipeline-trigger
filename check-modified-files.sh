# $files=$(git diff HEAD HEAD~ --name-only)
#         $temp=$files -split ' '
#         $count=$temp.Length
#         echo "Total changed $count files"
#         For ($i=0; $i -lt $temp.Length; $i++)
#         {
#           $name=$temp[$i]
#           echo "this is $name file"
#           if ($name -like 'ServerFolder/*')  #if ServerFolder is a subfolder under a folder use "- like '*/ServerFolder/*'"
#           {
#             # Write-Host "##vso[task.setvariable variable=severFolder;isOutput=true]True"
#           }
#           if ($name -like 'ClientFolder/*')
#           {
#             Write-Host "##vso[task.setvariable variable=clientFolder;isOutput=true]True"
#           }
#         }

# git --git-dir="./.git" diff-tree ORIG_HEAD.. | \
#     while read srcmode dstmode srcsha dstsha status srcfile dstfile
#     do
#         echo $srcfile
#     done

files=$(git diff HEAD HEAD~ --name-only)
# echo $files

containsFirstFile=false
containsSecondFile=false
# echo $containsFirstFile

# git diff HEAD HEAD~ --name-only | \
#     while read file
#     do
#         echo $file
#         if [ "first-pipeline.yml" == $file ] && [ "1" == "1" ]
#         then
#             containsFirstFile=true
#         fi
#     done
for file in $files
do
    # echo $file
    if [ "first-pipeline.yml" == $file ] && [ "1" == "1" ]
    then
        echo $file
        containsFirstFile=true
    fi
    if [ "second-pipeline.yml" == $file ]
    then
        echo $file
        containsSecondFile=true
    fi

    if [[ $file == *"-pipeline"* ]]; then
        echo "It's there!"
    fi
done

echo $containsFirstFile
echo $containsSecondFile
if [ $containsFirstFile == true ] || [ $containsSecondFile == true ]
then
    echo 'got it'
fi

