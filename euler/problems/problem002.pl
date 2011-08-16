use strict;

my $prev_1 = 1;
my $prev_2 = 2;
my $current = 3;
my $total = 2;
while (($current = $prev_1 + $prev_2) < 1_000_000) {
  $prev_1 = $prev_2;
  $prev_2 = $current;
  $current = $prev_1 + $prev_2;
  if ($current % 2 == 0) {
    $total += $current;
  }
}
print '$total: '.$total."\n";
