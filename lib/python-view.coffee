{$, $$$, ScrollView, BufferedProcess} = require 'atom'

module.exports =
class PythonView extends ScrollView
  atom.deserializers.add(this)

  @deserialize: ({code}) ->
    new PythonView(code)

  serialize: ->
    deserializer: 'PythonView'

  getTitle: -> "Python"

  @content: ->
    @div class: 'python', tabindex: -1, =>
      @div class: 'output'

  addLine: (line) ->
    console.log(line)
    @find("div.output").append("<pre class='line'>#{line}</pre>")

  runSelection: ->
    # This assumes the active pane item is an editor
    # TODO: Make sure this makes sense as an assumption
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

    console.log("Running " + command + " " + args)

    stdout = (output) => @addLine(output)
    stderr = (output) => @addLine(output)
    exit = (return_code) -> console.log("Exited with #{return_code}")

    process = new BufferedProcess({command, args, options, stdout, stderr, exit})
