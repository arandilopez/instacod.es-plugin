Instacod.esPluginView = require './instacod.es-plugin-view'

module.exports =
  instacod.esPluginView: null

  activate: (state) ->
    @instacod.esPluginView = new Instacod.esPluginView(state.instacod.esPluginViewState)

  deactivate: ->
    @instacod.esPluginView.destroy()

  serialize: ->
    instacod.esPluginViewState: @instacod.esPluginView.serialize()
