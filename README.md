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
var card = deck.draw();
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

Return a card to the deck so that it can be drawn again:
```javascript
deck.inlay(card);
#=> { rank: "10", suit: "clubs" }
```

Reset:
```javascript
deck.shuffle();
```

Cards which are added to the deck are expected have both rank and suit.


### Options

New decks accept options:
```javascript
var deck = new Deck({
  extend: [
    { rank: "joker", suit: "black" },
    { rank: "joker", suit: "red" },
    { rank: "blank", suit: "none", limit: 1 }
  ],
  multiply: 2
});
```

This deck has:

* 52 cards from 2 decks.
* 4 jokers.
* 1 blank card.
* A total of 109 cards.

### Cards

By default your deck will consist of 52 cards with the following ranks and suits:

```
ace king queen jack 10 9 8 7 6 5 4 3 2
spades hearts diamonds clubs
```

Override if desired:
```javascript
var deck = new Deck({
  ranks: ["raccoon", "10", "9", "8", "7", "6", "5", "4", "3", "2"],
  suits: ["spades", "diamonds", "clubs"]
});
deck.count();
#=> 30
```
