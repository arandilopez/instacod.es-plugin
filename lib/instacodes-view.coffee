{View} = require 'atom'

module.exports =
class InstacodesView extends View
  initialize: (serializeState) ->
    atom.workspaceView.command "instacodes:upload_selection", => @upload_selection()
    atom.workspaceView.command "instacodes:upload_file", => @upload_file()


  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

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
