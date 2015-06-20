# Deck.js

<img src="https://raw.githubusercontent.com/Kequc/deckjs/master/images/cards.jpg" alt="Cards" width="300" height="225" />

### Usage

Include `deck.js` into your page:
```html
<script src="deck.js"></script>
```

Instantiate a new deck:
```javascript
var deck = new Deck();
```

Pick any card and put it back:
```javascript
deck.pick();
#=> {suit: "diamonds", rank: "6"}
```

Draw a card:
```javascript
deck.draw();
#=> {suit: "clubs", rank: "10"}
```

All cards left in the deck:
```javascript
deck.cards;
#=> [{suit: "spades", rank: "ace"}...]
```

Number of cards left:
```javascript
deck.count();
#=> 51
```

Last drawn card:
```javascript
deck.last();
#=> {suit: "clubs", rank: "10"}
```

All drawn cards:
```javascript
deck.spent;
#=> [{suit: "clubs", rank: "10"}]
```

Reset:
```javascript
deck.shuffle();
```

### Options

Deck takes an options attribute:
```javascript
var deck = new Deck({
  multiply: 2,
  extend: [
    {rank: "joker", suit: "black"},
    {rank: "joker", suit: "red"},
    {rank: "blank", suit: "none", limit: 1}
  ]
});
```

This deck has:

* 52 cards from 2 decks.
* 4 jokers.
* 1 blank card.
* A total of 109 cards.

### Cards

By default your deck will consist of 52 cards with the following suits and ranks:

```
spades hearts diamonds clubs
ace king queen jack 10 9 8 7 6 5 4 3 2
```
