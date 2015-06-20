class Deck

  constructor: (@opt={}) ->
    # Instantiate a new deck

    @opt.extend ?= []

    @opt.suits ?= ['spades', 'hearts', 'diamonds', 'clubs']
    @opt.ranks ?= ['ace', 'king', 'queen', 'jack', '10', '9', '8', '7', '6', '5', '4', '3', '2']

    @opt.multiply ?= 1
    if @opt.multiply < 1
      @opt.multiply = 1

    @shuffle()

  shuffle: =>
    # Prepare cards

    @cards = []

    for i in [1..@opt.multiply]
      for suit in @opt.suits
        for rank in @opt.ranks
          @inlay
            suit: suit
            rank: rank
      for card in @opt.extend
        unless card.limit and i > card.limit
          @inlay card

    true

  count: =>
    # How many cards are in the deck

    @cards.length

  draw: =>
    # Draw a card

    count = @count()
    if count > 0
      @cards.splice(Math.floor(Math.random() * count), 1)[0] || null
    else
      null

  inlay: (card={}) =>
    # Add card to deck

    if card.suit and card.rank
      card =
        suit: card.suit
        rank: card.rank
      @cards.push card
      card
    else
      false

# Export
if typeof module == "object" and typeof module.exports == "object"
  module.exports = Deck
else
  window.Deck = Deck
