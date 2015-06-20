class Deck

  SUITS: ['spades', 'hearts', 'diamonds', 'clubs']
  RANKS: ['ace', 'king', 'queen', 'jack', '10', '9', '8', '7', '6', '5', '4', '3', '2']

  constructor: (@opt={}) ->
    # Instantiate a new deck

    @opt.extend ?= []

    @opt.count ?= 1
    if @opt.count < 1
      @opt.count = 1

    @shuffle()

  count: =>
    # How many cards are in the deck

    @cards.length

  last: =>
    # Last drawn card

    @discard[@discard.length-1] || null

  shuffle: =>
    # Prepare cards

    @cards = []
    @discard = []

    for i in [1..@opt.count]
      for suit in @SUITS
        for rank in @RANKS
          @cards.push
            suit: suit
            rank: rank
      for card in @opt.extend
        unless card.limit and i > card.limit
          @cards.push
            suit: card.suit
            rank: card.rank

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

# Export
if typeof module == "object" and typeof module.exports == "object"
  module.exports = Deck
else
  window.Deck = Deck
