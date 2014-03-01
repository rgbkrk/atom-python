{View} = require 'atom'

module.exports =
class PythonView extends View
  @content: ->
    @div class: 'python overlay from-top', =>
      @div "The Python package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->
    atom.workspaceView.command "python:toggle", => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    console.log "PythonView was toggled!"
    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this)
