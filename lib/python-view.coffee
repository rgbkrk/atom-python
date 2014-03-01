{ScrollView, BufferedProcess} = require 'atom'

module.exports =
class PythonView extends ScrollView

  @content: ->
    @div class: 'editor editor-colors', =>
      @div class: 'lines'

  addLine: (line) ->
    console.log(line)
    @find("div.lines").append("<div class='line'>#{line}</div>")

  runSelection: ->
    # This assumes the active pane item is an editor
    editor = atom.workspace.activePaneItem
    code = editor.getSelectedText()

    if ! code?
      return

    @runit(code)

  runit: (code) ->
    command = 'python'
    args = ['-c', code]

    options =
      cwd: atom.project.getPath()

    stdout = (output) => @addLine(output)
    stderr = (output) => @addLine(output)
    exit = (return_code) -> console.log("Exited with #{return_code}")

    process = new BufferedProcess({command, args, options, stdout, stderr, exit})
