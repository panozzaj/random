use strict;
require Math::BigInt;
my $a = Math::BigInt->new(1);
my $b = Math::BigInt->new(1);
my $term = 2;

for (my $i = 0; $i< 10000; $i++) {
  my $temp = $a + $b;
  $term++;
  print '$term: '.$term."\n";
  print 'length $temp: '.(length $temp)."\n";
  $a = $b;
  $b = $temp;
}
