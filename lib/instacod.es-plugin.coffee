
module.exports =
  #instacod.esPluginView: null
  activate: (state) ->
    atom.workspaceView.command "instacod:upload-selection", => @upload_selection()
    atom.workspaceView.command "instacod:upload-file", => @upload_file()

  deactivate: ->

  serialize: ->

  upload_selection: ->
    editor = atom.workspace.getActiveEditor()
    selection = editor.getSelection().getText()
    file_name = editor.getTitle()
    path = require 'path'
    syntax = path.extname "#{file_name}"
    syntax = syntax.replace /[.]/, ""
    syntax = syntax.toUpperCase()
    open = require 'open'
    open "http://InstaCod.es/?post_code=#{selection}&post_lang=#{syntax}"

  upload_file: ->
    editor = atom.workspace.getActiveEditor()
    file_text = editor.getText()
    file_name = editor.getTitle()
    path = require 'path'
    syntax = path.extname "#{file_name}"
    syntax.replace /[.]/, ""
    syntax.toUpperCase()
    open = require 'open'
    open "http://InstaCod.es/?post_code=#{file_text}&post_lang=#{syntax}"
