class @Canvas

  constructor: (@element_id, @geometry, @background) ->
    @element = document.getElementById(@element_id)
    @element.width = @geometry.width
    @element.height= @geometry.height
    @context = @element.getContext("2d")
    @background.draw( @context, @geometry )



