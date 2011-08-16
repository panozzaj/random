use strict;

my $STRAIGHT_FLUSH = 80000000000;
my $FOUR_OF_A_KIND = 70000000000;
my $FULL_HOUSE     = 60000000000;
my $FLUSH          = 50000000000;
my $STRAIGHT       = 40000000000;
my $TRIPS          = 30000000000;
my $TWO_PAIR       = 20000000000;
my $PAIR           = 10000000000;
my $HIGH_CARD      = 0;
my @ranks = ('2', '3', '4', '5', '6', '7', '8', '9', 'T', 'J', 'Q', 'K', 'A');
my @suits = ('C', 'D', 'H', 'S');

open FI, '../data/poker.txt';
my @array = <FI>;
close FI;
chomp(@array);

my @player1;
my @player2;
for (@array) {
  my @cards = split(/ /, $_);
  push(@player1, [@cards[0..4]]);
  push(@player2, [@cards[5..9]]);
}

my $total = 0;
for (my $i = 0; $i < scalar(@player1); $i++) {
  print "P1: ";
  for (@{$player1[$i]}) {
    print $_.' ';
  }
  print "\nP2: ";
  for (@{$player2[$i]}) {
    print $_.' ';
  }
  print "\n";
  my $value = whoWins($player1[$i], $player2[$i]);
  $total += $value;
  print '$value: '.$value."\n";
}
print '$total: '.$total."\n";

exit;

# returns 0 for loss, 1 for win, 0.5 for tie (correct?)
sub whoWins() {
  my $my_cards = shift;
  my $opp_cards = shift;

  my @my_cards = @$my_cards;
  my @opp_cards = @$opp_cards;

  my @my_hand = @my_cards;
  my @opp_hand = @opp_cards;

  my $my_score = getScore(\@my_hand);
  my $opp_score = getScore(\@opp_hand);

  if ($my_score == $opp_score) {
    return 0.5;
  }
  if ($my_score > $opp_score) {
    return 1;
  }
  return 0;
}

sub getScore() {
#  my @rank_present = shift;  # already contains board information
#  my @suit_present = shift;  # already contains board information
  my $cards = shift;
  my @cards = @$cards;

  #                   0  1  2  3  4  5  6  7  8  9 10 11 12 13
  #                   A  2  3  4  5  6  7  8  9  T  J  Q  K  A
  my @rank_present = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  #                   0  1  2  3
  #                   C  D  H  S
  my @suit_present = (0, 0, 0, 0);

  # for straight flush comparisons (might want to do only when $flush_present and $straight_present)
  my @card_present = ([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
		      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
		      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
		      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
  foreach my $card (@cards) {
    my $suit;
    if ($card =~ /C/) {
      $suit = 0;
    } elsif ($card =~ /D/) {
      $suit = 1;
    } elsif ($card =~ /H/) {
      $suit = 2;
    } elsif ($card =~ /S/) {
      $suit = 3;
    }
    @suit_present[$suit]++;

    if ($card =~ /(\d)/) {
      @rank_present[$1-1]++;
      @card_present[$suit]->[$1-1]++;
    } elsif ($card =~ /T/) {
      @rank_present[9]++;
      @card_present[$suit]->[9]++;
    } elsif ($card =~ /J/) {
      @rank_present[10]++;
      @card_present[$suit]->[10]++;
    } elsif ($card =~ /Q/) {
      @rank_present[11]++;
      @card_present[$suit]->[11]++;
    } elsif ($card =~ /K/) {
      @rank_present[12]++;
      @card_present[$suit]->[12]++;
    } elsif ($card =~ /A/) {
      @rank_present[0]++;
      @rank_present[13]++;
      @card_present[$suit]->[0]++;
      @card_present[$suit]->[13]++;
    }
  }

  my $straight_present = 0;
  my $sum = 0;
  my $index = 13;
  # go through backwards so the highest straight is found
  foreach my $rank (reverse(@rank_present)) {
    if ($rank > 0) {
      $sum++;
      if ($sum == 5) {
	$straight_present = $index + 4;
	last;
      }
    } else {
      $sum = 0;
    }
    $index--;
  }

  my $flush_present = 0;
  my $index = 0;
  foreach my $num (@suit_present) {
    if ($num > 4) {
      $flush_present = $index + 1;
      last;
    }
    $index++;
  }

  my $index = 13;
  my @trips;
  my @pairs;

  foreach my $rank (reverse(@rank_present)) {
    if ($rank == 3) {
      push (@trips, $index);
    }
    if ($rank == 2) {
      push (@pairs, $index);
    }
    $index--;
  }

  # check for straight flush
  my $suit = 0;
  if ($straight_present && $flush_present) {
    foreach my $row (@card_present) {
      my $total = 0;
      my $index = 13;
      foreach my $num (reverse(@$row)) {
	if ($num) {
	  $total++;
	  if ($total == 5) {
	    return $STRAIGHT_FLUSH + $index + 4;
	  }
	} else {
	  $total = 0;
	}
	$index--;
      }
    }
  }

  # check for four of a kind
  my $index = 13;
  foreach my $rank (@rank_present) {
    if ($rank == 4) {
      @rank_present[$index] = 0;
      return $FOUR_OF_A_KIND + $index * 10000 + getHighest(\@rank_present, 1);
    }
    $index--;
  }

  # check for full house
  if (scalar(@trips) >= 2) {
    return $FULL_HOUSE + @trips[0] * 100 + @trips[1];
  }
  if (@trips && @pairs) {
    return $FULL_HOUSE + @trips[0] * 100 + @pairs[0];
  }

  # check for flush
  if ($flush_present) {
    @suits = ('C', 'D', 'H', 'S');
    for (my $i = 1; $i < scalar(@cards); $i++) {
      if (!(@cards[$i] =~ @suits[$flush_present-1])) {
	@rank_present[$i]--;
      }
    }
    return $FLUSH + getHighest(\@rank_present, 5);
  }

  # check for straight
  if ($straight_present) {
    return $STRAIGHT + $straight_present;
  }

  # check for three of a kind
  if (@trips) {
    @rank_present[@trips[0]] = 0;
    return $TRIPS + @trips[0] * 100000000 + getHighest(\@rank_present, 2);
  }

  # check for two pair
  if (scalar(@pairs) > 1) {
    @rank_present[@pairs[0]] -= 2;
    @rank_present[@pairs[1]] -= 2;
    return $TWO_PAIR + 10000 * @pairs[0] + 100 * @pairs[1] + getHighest(\@rank_present, 1);
  }

  # check for pair
  if (@pairs) {
    @rank_present[@pairs[0]] = 0;
    return $PAIR + @pairs[0] * 100000000 + getHighest(\@rank_present, 3);
  }

  # check for high cards
  return getHighest(\@rank_present, 5);
}

# Given a set of cards, returns the $goal highest cards in terms of rank
sub getHighest() {
  my $rank_present = shift;
  my @rank_present = @$rank_present;
  my $goal = shift;

  my $index = 13;
  my $total = 0;
  my $score = 0;

  foreach my $rank (reverse(@rank_present)) {
    if ($rank) {
      $score += 100**(($goal-1)-$total) * $index;
      $total++;
    }
    if ($total == $goal) {
      return $score;
    }
    $index--;
  }

  # should not get here
  return 0;
}
