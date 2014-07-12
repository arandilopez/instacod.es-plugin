{View} = require 'atom'

module.exports =
class Instacod.esPluginView extends View
  @content: ->
    @div class: 'instacod.es-plugin overlay from-top', =>
      @div "The Instacod.esPlugin package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->
    atom.workspaceView.command "instacod.es-plugin:toggle", => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    console.log "Instacod.esPluginView was toggled!"
    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this)
