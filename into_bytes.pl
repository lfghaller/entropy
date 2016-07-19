#!/usr/bin/perl

#Takes a binary string as input and outputs it as bytes.

my $input = $ARGV[0];
my $output = $ARGV[1];

into_bytes($input,$output);

sub into_bytes{
    my ($in,$out) = @_;

open READ, $in or die "Cant open";
my $input = <READ>;
close READ;

my @bitstring = split(//,$input);
my $i = 0;
my $offset = 0;

open(WRITE, ">$out") or die "\nCan't create txt file";  

do {
   $bit = $bitstring[$offset];
   if ($i < 8){
      print WRITE $bit;
   }
   else{
      print WRITE " ";
      $i = 0;
   }
   $i++; 
}while ($bitstring[$offset++] ne '');
 
# Save the binary code into txt file
   
 
close WRITE; 

}

