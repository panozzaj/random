use strict;

my $diagonal = 1;
my $current = 1;
my $go_to = 1001 / 2 + 0.5;
for (my $i = 1; $i < $go_to; $i++) {
  for (1..4) {
    $current += $i * 2;
    $diagonal += $current;
  }
}

print '$diagonal: '.$diagonal."\n";

# for (my $i = 1; $i <= 1001; $i++) {
#   if ($i % 2 == 0) {
#     print "\$diagonal += ($i * $i + 1)\n";
#     $diagonal += ($i * $i + 1);
#     print '$diagonal: '.$diagonal."\n";
#   } else {
#     print "\$diagonal += ($i * $i)\n";
#     $diagonal += ($i * $i);
#     print '$diagonal: '.$diagonal."\n";
#   }
# }
# print '$diagonal: '.$diagonal."\n";
