class @Background

  constructor: (_geometry) ->
    @geometry = _geometry
    @fillStyle = "rgb(10,40,30)"

  draw: (context) ->
    context.save()
    context.fillStyle = @fillStyle
    context.fillRect( @geometry.top, @geometry.left, @geometry.width, @geometry.height )
    context.restore()
