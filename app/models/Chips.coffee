#CHIPS

class window.Chips extends Backbone.Model

  initialize: ->
    @chips = 10000
    # @on 'winner', (bet)=>
      # @chips + bet*2