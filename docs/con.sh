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
touch aaaaa
mv ~/Desktop/*.jpeg .
for f in *.jpeg; do
  filename=${f%.jpeg}
  echo ![]\(${filename}.jpg\)>>index.md
  convert "$f" -resize 50% "${filename}.jpg"
  echo $f converted...
  rm $f
done

echo 'now add img page link and diary in rootdir/index.md'
