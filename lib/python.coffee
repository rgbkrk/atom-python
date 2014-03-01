PythonView = require './python-view'

configUri = "atom://python"

module.exports =

  activate: ->
    atom.project.registerOpener (uri) =>
      @pythonView = new PythonView if uri is configUri

    atom.workspaceView.command "python:run-selection", =>
      editor = atom.workspace.getActiveEditor()
      code = editor.getSelectedText()

      if ! code?
        return

      atom.workspaceView.open(configUri, split: 'right')
      @pythonView.runit(code)
