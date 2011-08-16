use strict;

my %memory;
$memory{1} = 1;

my $max_length;
my $max_number;
for (1..1_000_000) {
  if ($_ % 10000 == 0) {
    print '$_: '.$_."\n";
  }
  my $length = getLength($_);
  if ($length > $max_length) {
    $max_length = $length;
    $max_number = $_;
  }
}
print '$max_length: '.$max_length."\n";
print '$max_number: '.$max_number."\n";
exit;

sub getLength {
  my $current = shift;
  if ($memory{$current}) {
    return $memory{$current};
  }
  my $next;
  if ($current % 2 == 0) {
    $next = $current / 2;
  } else {
    $next = 3 * $current + 1;
  }
  $memory{$current} = 1 + getLength($next);
  return $memory{$current};
}
