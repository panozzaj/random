use strict;
use integer;
require Math::BigInt;

my $total = Math::BigInt->new(1);
for (my $i = 2; $i <= 100; $i++) {
  $total *= Math::BigInt->new($i);
}
print '$total: '.$total."\n";
my @array = split('', $total);
my $total = 0;
for (@array) {
  $total += $_;
}
print '$total: '.$total."\n";
