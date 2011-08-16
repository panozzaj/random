use strict;
use integer;
require Math::BigInt;

my $base = Math::BigInt->new(2);
my $exp = Math::BigInt->new(1000);
my $i = $base**$exp;
print '$i: '.$i."\n";
my @array = split('', $i);
my $total = 0;
for (@array) {
  $total += $_;
}
print '$total: '.$total."\n";
