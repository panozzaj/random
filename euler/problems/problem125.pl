use strict;

my $total = 0;
i: for (my $i = 1; $i < 100000; $i++) {
  my $value = 0;
  my $number = 0;
  j: for (my $j = $i; $j < 100000; $j++) {
    $value += $j*$j;
    $number++;
    next i if ($value > 100000000);
    if ($value == reverse($value) && $number > 1) {
      print "$i\t$j\t".'$value: '.$value."\n";
      $total += $value;
    }
  }
}
print '$total: '.$total."\n";
