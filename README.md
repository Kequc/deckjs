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

Draw a card:
```javascript
deck.draw();
#=> { rank: "10", suit: "clubs" }
```

Cards not yet drawn:
```javascript
deck.cards;
#=> [ { rank: "ace", suit: "spades" }, etc. ]
```

Number:
```javascript
deck.count();
#=> 51
```

Reset:
```javascript
deck.shuffle();
```

Return a card to the deck so that it can be drawn again:
```javascript
var card = deck.draw();
deck.inlay(card);
#=> { rank: "6", suit: "hearts" }
```

### Options

Deck accepts options:
```javascript
var deck = new Deck({
  multiply: 2,
  extend: [
    { rank: "joker", suit: "black" },
    { rank: "joker", suit: "red" },
    { rank: "blank", suit: "none", limit: 1 }
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

Override if desired:
```javascript
var deck = new Deck({
  suits: ["spades", "diamonds", "clubs"],
  ranks: ["raccoon", "10", "9", "8", "7", "6", "5", "4", "3", "2"]
});
deck.count();
#=> 30
```
