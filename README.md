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

Pick a card:
```javascript
deck.pick();
#=> {suit: "diamonds", rank: "6"}
```

Pick and discard a card:
```javascript
deck.draw();
#=> {suit: "hearts", rank: "ace"}
```

Review last drawn card:
```javascript
deck.last();
#=> {suit: "hearts", rank: "ace"}
```

Count cards left in deck:
```javascript
deck.count();
#=> 51
```

### Options

Deck takes optional attributes:
```javascript
var deck = new Deck({
  count: 2,
  extras: [
    {
      suit: "black",
      rank: "joker"
    },
    {
      suit: "red",
      rank: "joker"
    },
    {
      suit: "none",
      rank: "blank",
      limit: 1
    }
  ]
});
```
Creates a deck from 2 packs of cards, includes two jokers from each pack, and one blank card.
