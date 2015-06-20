mocha  = require('mocha')
expect = require('chai').expect
assert = require('chai').assert
Deck   = require('../src/deck')

describe 'deck.js', ->

  deck = null
  card = null

  describe 'basic', ->

    beforeEach ->
      deck = new Deck()

    it 'creates a deck', ->
      expect(deck.cards.length).to.equal(52)
      expect(deck.spent.length).to.equal(0)
      expect(deck.cards[0]).to.eql({suit: "spades", rank: "ace"})
      expect(deck.cards[deck.cards.length-1]).to.eql({suit: "clubs", rank: "2"})

    it 'picks a card', ->
      card = deck.pick()
      expect(card).to.have.all.keys('suit', 'rank')
      expect(deck.cards).to.contain(card)
      expect(deck.spent).to.not.contain(card)

    it 'draws a card', ->
      for i in [1..52]
        card = deck.draw()
        expect(card).to.have.all.keys('suit', 'rank')
        expect(deck.cards).to.not.contain(card)
        expect(deck.spent).to.contain(card)
        true
      expect(deck.draw()).to.be.null
      expect(deck.cards.length).to.equal(0)
      expect(deck.spent.length).to.equal(52)

    it 'counts cards', ->
      for i in [52..1]
        expect(deck.count()).to.equal(i)
        deck.draw()
        true
      expect(deck.count()).to.equal(0)
      deck.draw()
      expect(deck.count()).to.equal(0)

    it 'shuffles', ->
      card = deck.draw()
      expect(deck.cards.length).to.equal(51)
      expect(deck.spent.length).to.equal(1)
      deck.shuffle()
      expect(deck.cards.length).to.equal(52)
      expect(deck.spent.length).to.equal(0)
      expect(deck.cards).to.contain(card)
      expect(deck.spent).to.not.contain(card)

  describe 'advanced', ->
    it 'manages multiple decks', ->
      for i in [-2..1]
        deck = new Deck({multiply: i})
        expect(deck.count()).to.equal(52)
        true
      for i in [2..5]
        deck = new Deck({multiply: i})
        expect(deck.count()).to.equal(52 * i)
        true

    it 'extends the deck', ->
      deck = new Deck({
        multiply: 3,
        extend: [
          {suit: "black", rank: "joker"},
          {suit: "red", rank: "joker"},
          {suit: "none", rank: "blank", limit: 1}
        ]
      });
      expect(deck.count()).to.equal(((52 + 2) * 3) + 1)
      found = [0,0,0]
      for card in deck.cards
        if card.rank == "joker" and card.suit == "black"
          found[0]++
        if card.rank == "joker" and card.suit == "red"
          found[1]++
        if card.rank == "blank" and card.suit == "none"
          found[2]++
        true
      expect(found).to.eql([3,3,1])
