use strict;

my $max = 0;
my $max_a = 0;
my $max_b = 0;
for my $a (100..999) {
  for my $b ($a..999) {
    if ($a*$b == reverse($a*$b)) {
      if ($max < $a*$b) {
        $max = $a*$b;
        $max_a = $a;
        $max_b = $b;
      }
#       print '$a: '.$a."\n";
#       print '$b: '.$b."\n";
#       print '($a*$b): '.($a*$b)."\n";
    }
  }
}

print '$max: '.$max."\n";
print '$max_a: '.$max_a."\n";
print '$max_b: '.$max_b."\n";
