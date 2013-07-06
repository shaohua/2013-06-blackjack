#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'chips', chips = new Chips()
    @on 'win', =>
      @get('chips').win()
      console.log('captured win event')
    @on 'lose', =>
      @get('chips').lose()
      console.log('captured lose event')

    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    
    (@get 'playerHand').on 'stand', =>
      console.log('stand')
      (@get 'dealerHand').hit()

    (@get 'playerHand').on 'decide_winner', =>
      #this means player is busted
      console.log 'You lose! Player is busted.'
      @trigger 'lose', @

    (@get 'dealerHand').on 'decide_winner', =>
      if (@get 'dealerHand').getS() > 21
        console.log 'You win! Dealer busted.'
        @trigger 'win', @
        # @model.get('chips').set(chips+bet)
      else if (@get 'playerHand').getS() > (@get 'dealerHand').getS()
        console.log "You win! Your score #{(@get 'playerHand').getS()}! Dealer score #{(@get 'dealerHand').getS()}"
        @trigger 'win', @
      else if (@get 'playerHand').getS() == (@get 'dealerHand').getS()
        console.log 'Tie! Horray.'
        @trigger 'tie', @
      else
        console.log 'You lose!'
        @trigger 'lose', @