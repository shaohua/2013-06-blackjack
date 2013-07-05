#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    (@get 'playerHand').on 'stand', =>
      console.log('stand')
      (@get 'dealerHand').hit()
    (@get 'dealerHand').on 'decide_winner', =>
      if (@get 'playerHand').scores() > (@get 'dealerHand').scores()
        console.log 'You win!'
      else
        console.log 'You lose!'