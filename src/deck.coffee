class Deck

  constructor: (@opt={}) ->
    # Instantiate a new deck

    @cards =
      hearts: {}
      diamonds: {}
      spades: {}
      clubs: {}
