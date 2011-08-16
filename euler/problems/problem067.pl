use strict;
use List::Util qw(max);

open FI, '../data/triangle_67.txt';
my @array = <FI>;
close FI;
chomp(@array);

my @best = split(/ /, $array[$#array]);
for (my $i = $#array-1; $i >= 0; $i--) {
#   for (@best) {
#     printf "%04d", $_;
#     print ' ';
#   }
#   print "\n";
  my @new_best = split(/ /, $array[$i]);
  for (my $j = 0; $j < $#new_best+1; $j++) {
    $new_best[$j] += max($best[$j], $best[$j+1]);
  }
  @best = @new_best;
}
print @best[0];
