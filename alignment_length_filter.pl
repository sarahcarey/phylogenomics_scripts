#!/usr/bin/perl -w

# usage = "perl <script_name> <file name or file extension for >1 file (.fa or .fasta)> <minimum_length>"

## perl script to filter fasta files by a user input minimum number of nucleotides or amino acids
## written by Sarah B. Carey

$file_ext = $ARGV[0]; 
@file_array = glob "*$file_ext";
$cutoff = $ARGV[1];


for $file (@file_array)
{
	open IN, "<$file";
	
	if ($file =~ m /([\s\S]+)(\.fa|.fasta)/)
		{
			$file_name = $1;
			open OUT, ">$file_name\.filtered.fa";
		}
			
	while (<IN>)
	{
			$line = $_;
	
			if ($line =~ m/(\>[\s\S]+)/)
			{ 
				$fasta_header = $1;
				$original_seq = <IN>;
				chomp $original_seq;
				$original_seq2 = $original_seq;
				$original_seq2 =~ s/-//g;
				$nuc_length = length $original_seq2;
								
				if ($nuc_length > $cutoff)
					{	
					print OUT "$fasta_header$original_seq\n";	
					}
				}	
		}
}				
	
close IN;
close OUT;

