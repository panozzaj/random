use strict;

my $small = 0;
my $big = 0;
for (1..100) {
  $small += $_*$_;
  $big += $_
}
$big *= $big;
print '$small: '.$small."\n";
print '$big: '.$big."\n";
$big -= $small;
print '$big: '.$big."\n";
