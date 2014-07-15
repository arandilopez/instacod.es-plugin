module.exports =
  instacodesView: null

  activate: (state) ->
    atom.workspaceView.command "instacodes:upload_selection", => @upload_selection()

  upload_selection: ->
    # console.log('uploading...')
    editor = atom.workspace.getActiveEditor()
    selection = editor.getSelection().getText()
    path = require 'path'
    grammar_name = editor.getGrammar().name
    open = require 'open'
    open "http://InstaCod.es/?post_code=#{selection}&post_lang=#{grammar_name}"
