class window.ProbabilityView extends Backbone.View

  className: 'recommend'

  #todo: switch to mustache
  template: _.template '<h2>Ace recommends you: <span class="recommend"></span></h2>'

  initialize: ->
    @model.on('change', => @render())
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @model
    @$('.recommend').text @model.get('recommend')