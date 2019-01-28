
#fasta_from_Orthofinder.pl

A perl script to write a separate fasta file for each Orthogroup output by OrthoFinder. Details on running OrthoFinder are found here: https://github.com/davidemms/OrthoFinder

usage = perl fasta_from_Orthofinder.pl <name_of_fasta_file> <name_of_orthomcl_file> <cds_or_pep_alns>

name_of_fasta_file		a fasta formatted file of amino acids or cds sequences (see details below^1). 

name_of_orthmcl_file		a text file containing a modified Orthogroup.txt file from OrthoFinder (see details below^2).

cds_or_pep_alns		indicate whether your fasta files are amino acids or cds. Recommend one use 'pep' for amino acids and 'cds' for cds sequences.


Example command:

```{r}
perl fasta_from_Orthofinder.pl all_pep.fa Orthogroups.txt pep
```

1. To generate the amino acid fasta I suggest having all your amino acid (or cds) sequences in one directory and use the cat command to combine them all. For example, if all your amino acid sequences used in an OrthoFinder run are in your current working directory (and no additional amino acid, cds, or other fasta files are present) and they end in .fa you can use the command

```{r}
cat *.fa > all_pep.fa
```

2. To make the necessary modificiations to your Orthogroup.txt file you will need to get rid of the column containing the orthogroup numbers e.g. "OG0000001: ,OG0000002: ,...OG000000N: " and make the file tab-delimited rather than space-delimited. I recommend using a text editor that can find and replace GREP patterns. If you find OG\d+:  (be sure to include a space after the colon) and replace with nothing you should be able to remove the columns of orthogroup numbers. You can also convert the file from space-delimited to tab-deliminted by using find to find all the spaces and replace with \t (replace with tabs) 
