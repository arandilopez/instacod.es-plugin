InstacodesView = require './instacodes-view'

module.exports =
  instacodesView: null

  activate: (state) ->
    @instacodesView = new InstacodesView(state.instacodesViewState)
    atom.workspaceView.command "instacod:upload_selection", => @upload_selection()
    atom.workspaceView.command "instacod:upload_file", => @upload_file()

  deactivate: ->
    @instacodesView.destroy()

  serialize: ->
    instacodesViewState: @instacodesView.serialize()
