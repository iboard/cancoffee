#
#  Class Geometry is responsible to setup CSS properties
#  to the the canvas-element on the HTML-page.
#
class @Geometry

  constructor: (canvas_element) ->
    @setupBody()
    canvas_element.css @canvasStyle()
    @left  = @top = 0
    @width =  canvas_element.innerWidth()
    @height= canvas_element.innerHeight()

  setupBody: ->
    ($ "body").css @bodyStyle()

  canvasStyle: ->
    position: "fixed"
    top: 0
    left: 0
    right: 0
    bottom: 0
    width: "100%"
    height: "100%"
    padding: 0
    margin: 0

  bodyStyle: ->
    width: "100%"
    height: "100%"
    padding: 0
    margin: 0
