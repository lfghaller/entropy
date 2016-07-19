#!/usr/bin/perl

#code for converting a text file into a file containing its binary representation as a string of bit. This is useful for streaming purposes.

my $input = $ARGV[0];
my $output = $ARGV[1];

text_to_bin($input,$output);

sub text_to_bin{
    my ($in,$out) = @_;

open READ, $in or die "Cant open";
my $input = <READ>;
close READ;

# Convert file into binary code
my $bit = unpack 'B*',$input; 


# Display how much file were converted
print "\nRead ", length($bit)/8000000, ' Mbytes'; 

# Save the binary code into txt file
open(WRITE, ">$out") or die "\nCan't create txt file";     
print WRITE "$bit"; 
close WRITE; 

}

