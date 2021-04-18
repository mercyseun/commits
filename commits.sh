echo "Enter year"
read year

echo "Enter month"
read month

for Y in $year
do
  mkdir $Y
  cd $Y
  for M in $month
  do
    mkdir $M
    cd $M
    for D in {01..31}
    do
      mkdir $D
      cd $D
      for i in $(seq 1 $(( ( RANDOM % 59 )  + 1 )))
      do
        export GIT_COMMITTER_DATE="$Y-$M-$D 12:$i:00"
        export GIT_AUTHOR_DATE="$Y-$M-$D 12:$i:00"
        git commit --allow-empty -m "$i on $M $D $Y"
      done
      cd ../
    done
    cd ../
  done
  cd ../
done
git push origin master
rm -rf 20**