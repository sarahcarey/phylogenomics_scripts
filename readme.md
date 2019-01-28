## orthogroup_filter.pl

A perl script to filter orthogroups output by Orthofinder for a minimum number of species. Details on running OrthoFinder are found here: https://github.com/davidemms/OrthoFinder

usage = perl <script_name> <name_of_orthogroup_file> <num_of_species_required>

**name_of_orthogroup_file**   Orthogroup.txt file from OrthoFinder<br>
**num_of_species_required**   The minimum number of species required in an orthogroup
<br>

Note: this script will also remove the column of orthogroup numbers e.g. "OG0000001: ,OG0000002: ,...OG000000N: " and make the file tab-delimited rather than space-delimited (i.e. formatted to work with fasta_from_Orthofinder.pl below).

Also note: This script is looking for unique species names with genus and specific epithet separated by an underscore (e.g. *Ceratodon_purpureus*). If your sample names do not match this pattern, have digits, or have additional unique IDs for isolates after another underscore it will not work without modifying the pattern it's matching. 

<br><br>

## fasta_from_OrthoFinder.pl

A perl script to write a separate fasta file for each Orthogroup output by OrthoFinder. 

usage = perl fasta_from_OrthoFinder.pl <name_of_fasta_file> <name_of_orthomcl_file> <cds_or_pep_alns>

**name_of_fasta_file**		a fasta file of amino acids or cds sequences (see details below^1)<br>
**name_of_orthmcl_file**		a modified Orthogroup.txt file from OrthoFinder (see details below^2)<br>
**cds_or_pep_alns**		indicate whether your fasta files are amino acids or cds. Recommend one use *pep* for amino acids and *cds* for cds sequences<br>
<br>

Example command:

```{r}
perl fasta_from_OrthoFinder.pl all_pep.fa Orthogroups.txt pep
```
<br>

1. To generate the amino acid fasta I suggest having all your amino acid (or cds) sequences in one directory and use the cat command to combine them all. For example, if all your amino acid sequences used in an OrthoFinder run are in your current working directory (and no additional amino acid, cds, or other fasta files are present) and they end in .fa you can use the command

```{r}
cat *.fa > all_pep.fa
```
<br>

2. To make the necessary modificiations to your Orthogroup.txt file you will need to get rid of the column containing the orthogroup numbers e.g. "OG0000001: ,OG0000002: ,...OG000000N: " and make the file tab-delimited rather than space-delimited. I recommend using a text editor that can find and replace GREP patterns. If you find OG\d+:  (be sure to include a space after the colon) and replace with nothing you should be able to remove the columns of orthogroup numbers. You can also convert the file from space-delimited to tab-deliminted by using find to find all the spaces and replace with \t (replace with tabs) 
<br><br>
