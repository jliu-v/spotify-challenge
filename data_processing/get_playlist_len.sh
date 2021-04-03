#!/usr/local/bin/bash

data_dir='../spotify_million_playlist_dataset/data/'

# remove temp file
rm num_tracks.txt;

# grep frequencies of each uri in each file
for file in $(ls ${data_dir})
do
  echo $file
  grep "\"num_tracks\":" ${data_dir}/${file} | perl -pe 's/\"num_tracks\"://g; s/,\s$//g; s/\s\"/\"/g; s/^\s+//g' >> num_tracks.txt;
done


