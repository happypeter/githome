# cp img from sketch file to shimo.im
# download imgs with names ~/Desktop/1.png 2.png ... first
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
mv ~/Desktop/*.png .
for f in *.png; do
  filename=${f%.png}
  echo ![]\(${filename}.jpg\)>>index.md
  convert "$f" "${filename}.jpg"
  echo $f converted...
  rm $f
done

echo 'now add img page link and diary in rootdir/index.md'
