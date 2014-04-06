#
#  A demo-actor which draws a punch of random lines
#  measures the time it takes to calculate random coordinates and
#  drawing the lines. At the end it updates HTML-inputs with the
#  measured times.
#
class @LineDrawActor

  constructor: (@canvas, @geometry) ->
    @lines = []

  addLine: (line) ->
    @lines.push(line)

  execute: ->
    @drawingStartedAt = new Date
    line.draw(@canvas) for line in @lines
    @drawingFinishedAt = @finishedAt = new Date
    @displayTimes()

  generateLines: (numLines=10) ->
    @startedAt = new Date
    x=y=0
    _scp = this
    @lines = []
    @generatingLinesStartedAt = new Date
    for cnt in [0..numLines-1]
      x1 = Math.round( Math.random() *  _scp.geometry.width )
      y1 = Math.round( Math.random() *  _scp.geometry.height )
      _scp.addLine( new Line(x,y,x1,y1,1+Math.random()*4,randomColor('transparent')) )
      x=x1
      y=y1
    @generatingLinesFinishedAt= new Date

  displayTimes: ->
    ($ "#time-randomizer").val( @timeSpentInRandomizer() )
    ($ "#time-drawing").val( @timeSpentForDrawing() )
    ($ "#time-total").val( @totalTime() )

  timeSpentInRandomizer: -> @generatingLinesFinishedAt -  @generatingLinesStartedAt
  timeSpentForDrawing:   -> @drawingFinishedAt - @drawingStartedAt
  totalTime:             -> @finishedAt - @startedAt




