use strict;

my @through_9 = ('one',
                 'two',
                 'three',
                 'four',
                 'five',
                 'six',
                 'seven',
                 'eight',
                 'nine',);

my @through_100 = (@through_9,
                   'ten',
                   'eleven',
                   'twelve',
                   'thirteen',
                   'fourteen',
                   'fifteen',
                   'sixteen',
                   'seventeen',
                   'eighteen',
                   'nineteen',
                  );

for my $outer ('twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety') {
  push(@through_100, $outer);
  for (@through_9) {
    push(@through_100, $outer.$_);
  }
}

my @through_1000 = @through_100;

for my $outer (@through_9) {
  push(@through_1000, $outer.'hundred');
  for (@through_100) {
    push(@through_1000, $outer.'hundredand'.$_);
  }
}
push(@through_1000, 'onethousand');

my $total;
for (@through_1000) {
  $total += length($_);
}
print '$total: '.$total."\n";
