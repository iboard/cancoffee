class @LineDrawActor

  constructor: (@canvas, @geometry) ->
    @lines = []

  addLine: (line) ->
    @lines.push(line)

  execute: ->
    line.draw(@canvas) for line in @lines

  generateLines: (numLines=10) ->
    x=y=0
    _scp = this
    @lines = []
    for cnt in [0..numLines-1]
      x1 = Math.round( Math.random() *  _scp.geometry.width )
      y1 = Math.round( Math.random() *  _scp.geometry.height )
      _scp.addLine( new Line(x,y,x1,y1,1+Math.random()*4,randomColor('transparent')) )
      x=x1
      y=y1


