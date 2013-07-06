#CHIPS

class window.Chips extends Backbone.Model

  initialize: ->
    @set 'chips', 10000
    @set 'bet', 0
    # @on 'winner', (bet)=>
      # @chips + bet*2

  win: ->
    @set('chips', @get('chips') + @get('bet'))
    console.log('after winning', @get('chips'))

  lose: ->
    @set('chips', @get('chips') - @get('bet'))
    console.log('after losing', @get('chips'))

  tie: ->
    #do nothing