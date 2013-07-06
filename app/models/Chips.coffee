#CHIPS

class window.Chips extends Backbone.Model

  initialize: ->
    @chips = 10000
    @bet = 0
    # @on 'winner', (bet)=>
      # @chips + bet*2

  win: ->
    @set('chips', @get('chips') + @get('bet'))

  lose: ->
    @set('chips', @get('chips') - @get('bet'))

  tie: ->
    #do nothing