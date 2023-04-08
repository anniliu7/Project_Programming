# Extract the base filenames (without the .tsv.gz extension) of the input files specified by the first and second arguments 
r1=$(basename $1 .tsv.gz)
r2=$(basename $2 .tsv.gz)
echo $r1 $r2
# bash Filename.sh barcodes1.tsv.gz barcodes2.tsv.gz


# Remove files with specific shared base filenames
# More info: https://unix.stackexchange.com/questions/306940/what-is-the-purpose-of-the-do-keyword-in-bash-for-loops
for i in `ls | grep .fastq`
do
  basename=$(echo $i | sed 's/\50K_2_bowtie2//g')
  rm $basename.sam
done
