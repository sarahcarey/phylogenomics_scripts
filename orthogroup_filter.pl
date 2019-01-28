#!/usr/bin/perl -w

# usage = "perl <script_name> <name_of_orthogroup_file> <num_of_species_required>"

## perl script to filter orthogroups from Orthofinder for a minimum number 
## of species
## written by Sarah B. Carey

$file = $ARGV[0];
$num_species = $ARGV[1];

open IN, "<$file";
open OUT, ">Orthogroups_filtered.txt";

while (<IN>)

{
$line = $_;
	 if ($line =~ m/^OG\d+\:\s([a-zA-Z]+\_[a-zA-Z]+)(\_[\s\S]+)\s/)
	{	
	 $data = "$1$2";
	 my @names = ($data =~ m/([a-zA-Z]+\_[a-zA-Z]+\_)/g);
	 
	my $count;
    my %hash;
    @hash{@names} = 1;
    foreach  (keys %hash){
           $count++; 
      }
      
  if ($count >= $num_species)
  {
   $output = $line;
 
  	if ($output  =~ m/^OG\d+\:\s([a-zA-Z]+\_[a-zA-Z]+)(\_[\s\S]+)/)
  	{
  		$desired_output = "$1$2";
  		$desired_output_tab = $desired_output;
  		$desired_output_tab =~ s/ /\t/g;
  		print OUT "$desired_output_tab";
  	}
  
  }
     
      }
  				
}
close IN;
close OUT;


