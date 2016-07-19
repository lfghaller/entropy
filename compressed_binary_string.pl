#!/usr/bin/perl

#encodes a binary string into a unique real number and gives a newer version.
#this is useful for compressing files.



my $byte = "1110111110111011101111110101010101101101011000010010000001100110";
print "\ninitial length", length $newcode, "\n";@bits = split //, $byte;

my $number;

my $n = 0;

my $zero = 0;

do{ 
    
     $u = $bits[$n];
     
      $number = $number + $u*(1/(2**$n));
      
       ++$n;
     
    
   }while($n <= length $byte);
$number = $number - int($number);
$number = (10**7)*$number;   
$number = int($number);

my $newcode = unpack 'B*', $number;

print $byte;
print "encoding number=", "$number", "\n";
print $newcode;
print "\nlength: ", length $newcode;

print "\n################################DECODING############################\n";



@bits = split //, $newcode;

#$number = int($number);

$number = (10**-7)*$number;   
$number = 1 + $number;


do{ 
    
     $u = $bits[$n];
     
      
       $number = $number + $u*2**$n;
      
       ++$n;
     
    
   }while($n <= length $newcode);

my $newcode = unpack 'B*', $number;

print $newcode;
print "\nlength: ", length $newcode;
print "\n encoding number=", "$number", "\n";


print "\nDONE\n";
