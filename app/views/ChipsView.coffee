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
      console.log(@model.get('bet'))
      @model.set('bet', $('.bet').val())
      console.log(@model.get('bet'))

  initialize: ->
    @model.on('change', => @render())
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @model
    @$('.chips').text @model.get('chips')
