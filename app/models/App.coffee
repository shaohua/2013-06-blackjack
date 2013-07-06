#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'recommend', recommend = new Probability()
    @set 'chips', chips = new Chips()
    @on 'win', =>
      @get('chips').win()
    @on 'lose', =>
      @get('chips').lose()

    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    (@get 'playerHand').on 'stand', =>
      (@get 'dealerHand').hit()

    (@get 'playerHand').on 'decide_winner', =>
      #this means player is busted
      alert 'You lose! Player is busted.'
      @trigger 'lose', @

    (@get 'dealerHand').on 'decide_winner', =>
      if (@get 'dealerHand').getS() > 21
        alert 'You win! Dealer busted.'
        @trigger 'win', @
        # @model.get('chips').set(chips+bet)
      else if (@get 'playerHand').getS() > (@get 'dealerHand').getS()
        alert "You win! Your score #{(@get 'playerHand').getS()}! Dealer score #{(@get 'dealerHand').getS()}"
        @trigger 'win', @
      else if (@get 'playerHand').getS() == (@get 'dealerHand').getS()
        alert 'Tie! Horray.'
      else
        alert 'You lose!'
        @trigger 'lose', @

    (@get 'playerHand').on 'recommend', =>
      (@get 'recommend').onRecommend( (@get 'playerHand').getS(),
                                      (@get 'dealerHand').getS() )
      # (@get 'recommend')
