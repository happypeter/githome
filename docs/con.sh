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
cp ~/Desktop/*.png .
for f in *.png; do
  filename=${f%.png}
  echo ![]\(${filename}.jpg\)>>index.md
  convert "$f" "${filename}.jpg"
  echo $f converted...
  rm $f
done
