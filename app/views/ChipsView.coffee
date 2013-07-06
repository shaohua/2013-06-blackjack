class window.ChipsView extends Backbone.View

  className: 'chips'

  #todo: switch to mustache
  template: _.template '<h2>Chips: <span class="chips"></span></h2>
    <h2><label>Bet: </label><input type="text" name="bet"></input></h2>'

  events:
    onBet: ->
      #do something

  initialize: ->
    # @model.on 'change', => @render()
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @model
    @$('.chips').text @model.chips
