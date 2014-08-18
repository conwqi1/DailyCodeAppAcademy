# Blackjack

## Game Rules

* Players play against the dealer; multiple players can win each
  round.
* Players win if they don't "bust" and either:
    1. their hand is worth more points than the dealer's hand.
    2. the dealer busts.
* To compute a hand's value, add the value of each numbered card, and
  ten for face cards. An ace is worth 11 if the total score would be
  <= 21. If an ace value of 11 would result in a bust, it is worth 1.
* A score of >21 is a bust.
* Players are first dealt two cards; they can request additional cards
  ("hit") until they pass ("stay") or bust.
* The dealer must hit on a hand worth <17, otherwise he must stay.
