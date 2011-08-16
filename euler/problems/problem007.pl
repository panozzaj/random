use strict;

my $start_time = time;
my $count = 0;
my @array = (2..200_000);
my $current_prime;
my $gen_time;
while ($count < 1000 && scalar(@array)) {
  if (!($count % 100)) {
    my $total_time = time - $gen_time;
    print '$total_time: '.$total_time."\n";
    print '$count: '.$count."\n" if ($count % 100 == 0);
    $gen_time = time;
  }
  $count++;
  $current_prime = shift(@array);
  my $array_size = scalar(@array);
  for (my $i = 0; $i < $array_size; $i++) {
    if ($array[$i] % $current_prime == 0) {
      splice(@array, $i, 1);
      $i--;
      $array_size--;
    }
  }
}

print '$current_prime: '.$current_prime."\n";
my $total_time = time - $start_time;
print 'Program time: '.$total_time."\n";
