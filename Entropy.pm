package Entropy;

#This is a package to my research code. I'm currently researching on data compression and entropy, and how they
#affect our understanding. My hypothesis is that the grammar rules are transfered to binary data and that a well
#written text has high entropy and cannot be compressed very much.

sub text_to_bin{
    #my ($in,$out) = @_;
    $input = shift;
#open READ, $in or die "Cant open";
#my $input = <READ>;
#close READ;

# Convert file into binary code
my $bit = unpack 'B*',$input;


# Display how much file were converted
print "\nRead ", length($bit)/8000, ' bytes';

# Save the binary code into txt file
#open(WRITE, ">$out") or die "\nCan't create txt file";
#print WRITE "$bit";
#close WRITE;
#print "$bit\n";
return $bit;
}

sub into_block{
    my ($input,$bsize) = @_;

#open READ, $in or die "Cant open";
#my $input = <READ>;
#close READ;

my @bitstring = split(//,$input);
my $i = 0;
my $offset = 0;
my $blocks = "";
open(WRITE, ">bitcode.txt") or die "\nCan't create txt file";

do {
   $bit = $bitstring[$offset];
   if ($i < $bsize){
      print WRITE $bit;
      $blocks = $block . $bit;

   }
   else{
      print WRITE "\n";
      $blocks = $block . "\n";
      $i = 0;
   }
   $i++;

}while ($bitstring[$offset++] ne '');

# Save the binary code into txt file
close WRITE;
print "$blocks\n";
return 1;
}



#encodes a binary string into a unique real number and gives a newer version.
#this is useful for compressing files.

#my $byte = "011000000101110001101010011011100111000001100010011001000110101";

sub str2code {
my $byte = shift;
my $bsize = shift;
my @bits = split //, $byte;
my $zeros = 0;
my $number = 0.0;
print "Encoding string...";
do{

     $u = $bits[$n];

     if ($u ne " " ) {
       if ($u eq '0'){
         $u = 0;
         $zeros++;
       }else{
           $u = 1;
        }
       $number = $number + $u*(1/2**$n);
       #print $partial;
       ++$n;
     }

 }while($n < $bsize);

my $newcode = unpack 'B*', $number;

print "encoding number=", "$number \n";
print $newcode;
print "\nDONE\n";
return $newcode;
}


#encodes a binary string into a unique real number and gives a newer version.
#this is useful for compressing files.

sub entropy{
    my  $block = shift;
    my $bsize = shift;
    my @bits = ();
    my $number = 0.0;
    print "calculating binary data's entropy...\n ";
    print "\ninitial length", length $block, "\n";@bits = split //, $block;
    do{

         $u = $bits[$n];

          $number = $number + $u*(1/(2**$n));

           ++$n


       }while($n < $bsize);
       print "DONE.\n";
    return $number;
}

#my $byte = "1110111110111011101111110101010101101101011000010010000001100110";
#print "\ninitial length", length $newcode, "\n";@bits = split //, $byte;

sub encode{
#my $block = shift;
my $bsize = 64;
print "\n################################ENCODING############################\n";
print "\ninitial length:", length $newcode, "\n";

open READ, "bitcode.txt" or die "Cant open";

do{

my @bits = split //, $_;

my $number;

my $n = 0;

do{

     $u = $bits[$n];

      $number = $number + $u*(1/(2**$n));

       ++$n;


   }while($n < $bsize);

$number = $number - int($number);
$number = (10**7)*$number;
$number = int($number);

my $newcode = unpack 'B*', $number;

print "\nold:", $_, "\n";
print "encoding number=", "$number", "\n";
print "new:", $newcode, "\n";
print "\nlength: ", length $newcode;
}while(<READ>);
close READ;
print "DONE.\n";

return $newcode;

}

sub decode{
my $newcode = shift;
print "\n################################DECODING############################\n";



my @bits = split //, $newcode;

#$number = int($number);

my $number = (10**-7)*$number;
$number = 1 + $number;


do{

     $u = $bits[$n];


       $number = $number + $u*2**$n;

       ++$n;


   }while($n <= length $newcode);

$newcode = unpack 'B*', $number;

print $newcode;
print "\nlength: ", length $newcode;
print "\n encoding number=", "$number", "\n";

print "\nDONE\n";
return $newcode;
}

1;
