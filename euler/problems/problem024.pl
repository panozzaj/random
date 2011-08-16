use strict;

my $value = 1_000_000;
my @left = (0..9);
my @order;
my %factorials = (1 => 1,
                  2 => 2,
                  3 => 6,
                  4 => 24,
                  5 => 120,
                  6 => 720,
                  7 => 5040,
                  8 => 40320,
                  9 => 362880);

for (my $i = 9; $i; $i--) {
  my $evenly_divides = int($value / $factorials{$i});
  $value -= $evenly_divides * $factorials{$i};
  push(@order, splice(@left, $evenly_divides, 1));
  print '$evenly_divides: '.$evenly_divides."\n";
  print '$value: '.$value."\n";
}
push(@order, $left[0]);
for (@order) {
  print '$_: '.$_."\n";
}
