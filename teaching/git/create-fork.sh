git init
echo a > a
git add .
git commit -m”commit1”
git checkout -b f1
echo c > c
git add .
git commit -m”commit3”
git checkout -b f2
echo d > d
git add .
git commit -m”commit4”
git checkout master
echo b > b
git add .
git commit -m”commit2”


