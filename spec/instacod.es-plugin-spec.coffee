{WorkspaceView} = require 'atom'
Instacod.esPlugin = require '../lib/instacod.es-plugin'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "Instacod.esPlugin", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('instacod.es-plugin')

  describe "when the instacod.es-plugin:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.instacod.es-plugin')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.workspaceView.trigger 'instacod.es-plugin:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.instacod.es-plugin')).toExist()
        atom.workspaceView.trigger 'instacod.es-plugin:toggle'
        expect(atom.workspaceView.find('.instacod.es-plugin')).not.toExist()
