{ScrollView, BufferedProcess} = require 'atom'

# Runs Python code through an interpreter and displays it line by line

module.exports =
class PythonView extends ScrollView

  @content: ->
    @div class: 'python', tabindex: -1, =>
      @div class: 'output'

  getTitle: -> "Python"

  addLine: (line, out_type) ->
    console.log(line)
    @find("div.output").append("<pre class='line #{out_type}'>#{line}</pre>")

  runit: (code) ->
    command = 'python'
    args = ['-c', code]

    options =
      cwd: atom.project.getPath()

    console.log("Running " + command + " " + args)

    stdout = (output) => @addLine(output, "stdout")
    stderr = (output) => @addLine(output, "stderr")
    exit = (return_code) -> console.log("Exited with #{return_code}")

    process = new BufferedProcess({command, args, options, stdout, stderr, exit})
