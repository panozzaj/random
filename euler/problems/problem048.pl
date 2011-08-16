use strict;
use integer;
require Math::BigInt;

my $total;
for (my $i = 1; $i <= 1000; $i++) {
  $total += Math::BigInt->new($i) ** Math::BigInt->new($i);
}
print '$total: '.$total."\n";

# use strict;
# use warnings;
# use Math::BigInt;

# my $sum = Math::BigInt->bzero();
# $sum->badd( Math::BigInt->new( $_ )->bpow( $_ ) ) for ( 1..1000 );
# print substr $sum->bstr(), -10;
