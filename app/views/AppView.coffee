class window.AppView extends Backbone.View

  template: _.template '
    <button class="hit-button">Hit</button>
    <button class="stand-button">Stand</button>
    <button class="newgame-button">New Game</button>
    <div class="recommend-container"></div>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
    <div class="chips-container"></div>
  '

  events:
    "click .hit-button": -> @model.get('playerHand').hit()
    "click .stand-button": -> @model.get('playerHand').stand()
    "click .newgame-button": ->
      chip_number = @model.get('chips')
      @model = new window.App()
      @model.set('chips', chip_number)
      @render()

  initialize: -> @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.recommend-container').html new ProbabilityView(model: @model.get 'recommend').el
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
    @$('.chips-container').html new ChipsView(model: @model.get 'chips').el