#!usr/bin/perl -w

## perl script written to take a fasta file containing all pep (or corresponding cds)
## used in an OrthoFinder run and the text file containing the clustered orthogroups
## (the default output for this file is called Orthogroups.txt) and
## output a fasta file for each cluster.
## The orthogroups file will need to have the column with "OG\d+: " removed
## and will need to be converted from space delimited to tab delimited
## Script written by Sarah B. Carey and Adam C. Payton

$usage = "perl <script_name> <name_of_fasta_file> <name_of_orthomcl_file> <cds_or_pep_alns>\n\n";

$fastafile = $ARGV[0];
$orthomclfile = $ARGV[1];
$aln_type = $ARGV[2];

open IN, "$fastafile" or die "\n\n$fastafile not found program terminated\n\nusage: $usage\n\n";

%fastahash = ();

while (<IN>)
	{	if (/^>([\s\S]+)/)
			{	$seqname = $1;
				chomp $seqname;
				$fastahash{$seqname} = "";
			}
		elsif (/^(\S+)/)
			{	$fastahash{$seqname} = $fastahash{$seqname} . $1;	}
	}

close IN;

open IN2, "$orthomclfile" or die "/n/nERROR    $orthomclfile not found in same directory program terminated\n\nusage: $usage\n\n";


@minningarray = ();

while (<IN2>)
	{	$line = $_;
		chomp $line;
		push (@minningarray, $line);
		my @sequences = split(/\t/, $line);
		
		for ($line)
			{	
				open OUT, ">cluster$.\.$aln_type.fa";
			}

foreach my $name (@sequences)

	{	if (exists $fastahash{$name})
			{	print OUT ">$name\n$fastahash{$name}\n";	
			
			}
		else	
			{	print "WARNING: $name was not found in Hash\n";	
			
			}
			
	}
	}

close IN2;
@minningarray = ();
%fastahash = ();
