#!usr/bin/perl -w

## script to rename headers of Trinity cds and peptide files to species and gene names
## by Sarah B. Carey

### usage = perl <script_name> <file_extension> <species_name> <cds_or_pep>\n\n

## for the species name input, use an underscore to separate genus 
## and specific epithet (not a space)

## it's vital the pep and cds files have the *exact* same header for each gene for 
## later scripts (like running pal2nal)


$file_ext = $ARGV[0]; 
$species = $ARGV[1];
$nuc_type = $ARGV[2]; 


@file_array = glob "*$file_ext";

for $file (@file_array)
{
		open IN, "<$file"; 
		open OUT, ">$species\.$nuc_type\.fasta";

		while (<IN>)
		{

		$line = $_;
			if ($line =~ m/^>(TRINITY\S+)(\sTRINITY[\s\S]+)/)
			 
			{

				print OUT ">$species\_$1\n";

			}

				else
				{
					if ($line =~ m/(\S+)/)
					{
						print OUT "$1\n";
					}
				}
		
			}
}			
	
close IN;
close OUT;