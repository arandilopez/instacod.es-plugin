module.exports =
  instacodesView: null
  configDefaults:
    open_in_browser: 'Google Chrome'

  activate: (state) ->
    atom.workspaceView.command "instacodes:upload_selection", => @upload_selection()

  upload_selection: ->
    editor = atom.workspace.getActiveEditor()
    selection = editor.getSelection().getText()
    grammar_name = @map_grammar editor.getGrammar().name
    open = require 'open'
    open "http://InstaCod.es/?post_code=#{selection}&post_lang=#{grammar_name}", atom.config.get('instacodes.open_in_browser')

  map_grammar: (grammar) ->
    if (grammar == 'HTML (Ruby - ERB)' || grammar == 'HTML (Rails)')
      'RHTML'
    else
      grammar
