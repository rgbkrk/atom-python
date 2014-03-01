sys = require('sys')
exec = require('child_process').exec;

module.exports =

  activate: ->
    atom.workspaceView.command "python:command", => @command()

  command: ->
    # This assumes the active pane item is an editor
    editor = atom.workspace.activePaneItem
    code = editor.getSelectedText()

    puts = (error, stdout, stderr) ->
      if stdout?
        console.log(stdout)

      if error?
        console.log(error)

      if stderr?
        console.log(stderr)

    exec("python -c '" + code + "'", puts)
