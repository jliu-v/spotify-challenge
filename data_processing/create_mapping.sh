#!/usr/local/bin/bash

data_dir='../spotify_million_playlist_dataset/data/'

# remove temp file
rm temp_*.txt;

## grep frequencies of each uri in each file
#for file in $(ls ${data_dir})
#do
#  echo $file
#  # grep data for each uri
#  for type in album_uri artist_uri track_uri
#  do
#    grep "\"${type}\":" ${data_dir}/${file} | awk '{print $2}' | perl -pe 's/,//g' | sort | uniq -c >> temp_${type}.txt;
#  done
#
#  # grep data for playlist name
#  grep "\"name\":" ${data_dir}/${file} | perl -pe 's/\"name\"://g; s/,\s$//g; s/\s\"/\"/g; s/^\s+//g' >> temp_playlist_name.txt;
#  grep "\"pid\":" ${data_dir}/${file} | perl -pe 's/\"pid\"://g; s/,\s$//g; s/^\s+//g' >> temp_playlist_pid.txt;
#done

# create mapping
for type in album_uri artist_uri track_uri
do
#  # sum up frequencies
#  sort -k2 temp_${type}.txt | \
#  awk 'BEGIN{count=0; id=""}{if($2!=id){print count"\t"id; id=$2; count=0} count+=$1;}END{print count"\t"id;}' | \
#  tail -n +2 > temp_${type}2.txt;
#
#  # order by total frequency and generate ID
#  sort -k1rn temp_${type}2.txt | \
#  awk 'BEGIN{print "\"'${type}'\",\"id\",\"freq\""}{print $2","NR","$1}' > mappings_${type}.csv;

  awk -F',' '{if($3>5 || NR == 1){print $0}}' mappings_${type}.csv > mappings_prune_${type}.csv;
done

## create playlist name
#echo "\"name\",\"pid\"" > playlist_name.csv;
#paste -d"," temp_playlist_name.txt temp_playlist_pid.txt >> playlist_name.csv;

# remove temp file
rm temp_*.txt;
