# cp img from sketch file to shimo.im
# download imgs with names ~/Desktop/1.jpeg 2.jpeg ... first
dirname=$1
if [[ ! $dirname ]]
then
  echo 'plz provide dirname'
  exit
fi

# plz run script in project root dir
cd imgs
echo create dir $dirname
mkdir $dirname && cd $dirname
mv ~/Desktop/*.jpeg .
for f in *.jpeg; do
  filename=${f%.jpeg}
  echo ![]\(${filename}.jpg\)>>index.md
  convert "$f" -resize 50% "${filename}.jpg"
  echo $f converted...
  rm $f
done

echo "adding img link to index.md"
cd ../..
echo "### $dirname\n[imgs](imgs/$dirname/)\n\n$(cat index.md)" >index.md
echo 'done'
