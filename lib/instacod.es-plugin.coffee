
open = require 'open'
path = require 'path'

module.exports =
  instacod.esPluginView: null

  activate: (state) ->
    atom.workspaceView.command "instacod:upload-selection", => @upload_selection()
    atom.workspaceView.command "instacod:upload-file", => @upload_file()

  deactivate: ->

  serialize: ->

  upload_selection: ->
    editor = atom.workspace.activePaneItem.getActiveEditor()
    selection = editor.getSelection()

    @open "http://InstaCod.es/?post_code="+ selection +"&post_lang="

  upload_file: ->
    editor = atom.workspace.activePaneItem.getActiveEditor()
    file_text = editor.getText()

    file_name = editor.getTitle()
    syntax = @path file_name
    @open "http://InstaCod.es/?post_code="+ file_text +"&post_lang=" + syntax
