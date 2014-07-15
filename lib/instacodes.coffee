module.exports =
  instacodesView: null

  activate: (state) ->
    atom.workspaceView.command "instacodes:upload_selection", => @upload_selection()

  upload_selection: ->
    # console.log('uploading...')
    editor = atom.workspace.getActiveEditor()
    selection = editor.getSelection().getText()
    path = require 'path'
    grammar_name = @map_grammar editor.getGrammar().name
    console.log(grammar_name)
    open = require 'open'
    open "http://InstaCod.es/?post_code=#{selection}&post_lang=#{grammar_name}"

  map_grammar: (grammar) ->
    if (grammar == 'HTML (Ruby - ERB)' || grammar == 'HTML (Rails)')
      'RHTML'
    else
      grammar
