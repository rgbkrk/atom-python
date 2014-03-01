PythonView = require './python-view'

configUri = "atom://python"

module.exports =

  activate: ->
    atom.project.registerOpener (uri) =>
      @pythonView = new PythonView if uri is configUri

    atom.workspaceView.command "python:run-selection", =>
      atom.workspaceView.open(configUri)
      @pythonView.runSelection()
