#
# The class Canvas initialzes a HTML5 2d Canvas
# and set up this HTML-canvas-element to the propper
# style.
#
# It also draws the intial background once context is available
#
class @Canvas

  # element_id - the CSS-id of the canvas element in index.html
  # geomentry - An object of class Geometry
  # background - An object of class Background
  constructor: (@element_id, @geometry, @background) ->
    @element = document.getElementById(@element_id)
    @element.width = @geometry.width
    @element.height= @geometry.height
    @context = @element.getContext("2d")
    @background.draw( @context, @geometry )



