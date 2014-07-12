#Instacod.esPluginView = require './instacod.es-plugin-view'
open = require 'open'
module.exports =
  instacod.esPluginView: null

  activate: (state) ->
    #@instacod.esPluginView = new Instacod.esPluginView(state.instacod.esPluginViewState)
    atom.workspaceView.command "instacod:upload-selection", => @upload_selection()

  deactivate: ->
    #@instacod.esPluginView.destroy()

  serialize: ->
    #instacod.esPluginViewState: @instacod.esPluginView.serialize()

  upload_selection: ->
    editor = atom.workspace.activePaneItem.getActiveEditor()
    selection = editor.getSelection()

    @open "http://InstaCod.es/?post_code="+ selection +"&post_lang="

  upload_file: ->
    editor = atom.workspace.activePaneItem.getActiveEditor()
    file_text = editor.getText()


    @open "http://InstaCod.es/?post_code="+ file_text +"&post_lang="
