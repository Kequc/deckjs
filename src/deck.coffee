class Deck

  VALUES: ['ace', 'king', 'queen', 'jack', '10', '9', '8', '7', '6', '5', '4', '3', '2']
  SUITS:  ['spades', 'hearts', 'diamonds', 'clubs']

  constructor: (@opt={}) ->
    # Instantiate a new deck

    @opt.extras ?= []

    @opt.count ?= 1
    if @opt.count < 1
      @opt.count = 1

    @shuffle()

  count: =>
    # How many cards are in the deck

    @cards.length

  shuffle: =>
    # Prepare cards

    @cards = []
    @discard = []

    for i in [1..@opt.count]
      for suit in @SUITS
        for value in @VALUES
          @cards.push
            suit: suit
            value: value
      for extra in @opt.extras
        unless extra.limit && i > extra.limit
          @cards.push
            suit: extra.suit
            value: extra.value

    true

  pick: =>
    # Pick a card

    i = @_random()
    @cards[i] || null

  draw: =>
    # Draw a card

    i = @_random()
    card = null
    if i > -1
      card = @cards.splice(i, 1)[0] || null
    if card
      @discard.push card
    card

  _random: =>
    # Return a random index

    count = @count()
    if count > 0
      Math.floor(Math.random() * count)
    else
      -1
