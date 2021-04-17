# a million commits
for Y in {2002..2025}
do
  mkdir $Y
  cd $Y
  for M in {01..12}
  do
    mkdir $M
    cd $M
    for D in {01..31}
    do
      mkdir $D
      cd $D
      for i in {01..12}
      do
        export GIT_AUTHOR_DATE="$Y-$M-$D $i:00:00" 
        export GIT_COMMITTER_DATE="$Y-$M-$D $i:00:00" 
        git commit --allow-empty -m "$i on $M $D $Y"
      done
      cd ../
    done
    cd ../
  done
  cd ../
done
git push origin master