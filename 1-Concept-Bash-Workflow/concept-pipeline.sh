#!/bin/bash


echo "Created some empty files to simulate what the input might look like:"
mkdir raw-data
touch raw-data/{sample1,sample2,sample3,sample4}.fastq.gz
touch genome.{fna,gff}.gz

ls *

echo -e "\n\n\n\nRun of the conceptual pipeline via bash:"

mkdir clean-data
for i in raw-data/*.fastq.gz ; do
  filename=$(basename $i)
  echo "qcTool $i > clean-data/$filename"
  touch clean-data/$filename
done

echo makeIndex genome.fna.gz index
touch index

mkdir mapping
for i in clean-data/*.fastq.gz ; do
  filename=$(basename $i .fastq.gz)
  echo "mapTool index $i > mapping/$filename.bam"
  touch mapping/$filename.bam
done

echo "countExpression annotation.gff.gz mapping/* > matrix.txt"

touch matrix.txt


echo -e "\n\n\n\nAfter the run, the files are now:"
ls *

# Remove all empty files with
# rm -rf clean-data index mapping raw-data genome*.gz matrix.txt

