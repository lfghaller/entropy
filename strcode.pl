#!/usr/bin/perl

#encodes a binary string into a unique real number and gives a newer version.
#this is useful for compressing files.

my $byte = "011000000101110001101010011011100111000001100010011001000110101";

@bits = split //, $byte;

my $number = 0.0;

do{ 
    
     $u = $bits[$n];
     
     if ($u ne " " ) {
       if ($u eq '0'){
         $u = 0;
       }else{
           $u = 1;
        }
       $number = $number + $u*(1/2**$n);
       #print $partial;
       ++$n;
     }
    
   }while($n < 8);
  
my $newcode = unpack 'B*', $number;

print "encoding number=", "$number \n";
print $newcode;
print "\nDONE\n";
