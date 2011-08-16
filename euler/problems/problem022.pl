use strict;

open FI, '../data/names.txt';
my @array = <FI>;
close FI;
chomp(@array);

my $len = scalar(@array);
my $total = 0;
for (my $i = 0; $i < $len; $i++) {
  my $value = 0;
  for (split('', $array[$i])) {
    $value += ord($_) - 65 + 1;
  }
  $total += $value * ($i + 1);
}

print '$total: '.$total."\n";
