# A simple line has a start and an end point, a stroke-width,
# and a color
class @Line

  constructor: (@x0,@y0,@x1,@y1,@width,@color) ->

  draw: (canvas) ->
    canvas.context.beginPath()
    canvas.context.lineWidth=@width
    canvas.context.moveTo(@x0,@y0)
    canvas.context.strokeStyle= @color
    canvas.context.lineTo(@x1,@y1)
    canvas.context.stroke()

# A LinesArray generates Lines by calling the given callback n times
class @LinesArray

  constructor: ( numberOfLines, _initLineFunc ) ->
    @lines = []
    if numberOfLines > 0
      @lines.push _initLineFunc(n) for n in [0..numberOfLines-1]

