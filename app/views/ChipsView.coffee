class window.ChipsView extends Backbone.View

  className: 'chips'

  #todo: switch to mustache
  template: _.template '<h2>Chips: <span class="chips"></span></h2>
    <h2>
      <form>
        <label>Bet: </label><input type="text" class="bet" name="bet"></input>
        <input type="button" class="submit" value="Place Bet"></input>
      </form>
    </h2>'

  events:
    'click .submit': ->
      bet = $('.bet').val()
      if @model.get('chips') >= bet then @model.set('bet', bet) else alert "You don't have enough money!"

  initialize: ->
    @model.on('change', => @render())
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @model
    @$('.chips').text @model.get('chips')
