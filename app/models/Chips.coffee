#CHIPS

class window.Chips extends Backbone.Model

  initialize: ->
    @set 'chips', 10000
    @set 'bet', 0

  win: ->
    @set('chips', parseFloat( @get('chips') ) + parseFloat( @get('bet') ))

  lose: ->
    @set('chips', parseFloat( @get('chips') ) -  parseFloat( @get('bet') ))