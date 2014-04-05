application = null

class @CanvasApp

  # Create an actor for the application which responds to execute()
  initializeActor: ->
    @actor = new LineDrawActor( @canvas, @geometry )

  # Install jQuery callbacks to run actions on the actor
  # and then re-run the application once the user changed
  # inputs or trigger any other HTML-events
  installActions: ->
    # Draw new lines when select changes
    ($ "#number-of-lines").change (event) ->
      event.preventDefault()
      application.actor.generateLines( parseInt(($ this).val()) )
      application.run()

  constructor: (@canvas_element) ->
    @initialized = false
    @initialize()
    @actor = @initializeActor()
    application = this
    @installActions()

  initialize: ->
    @geometry   = @initializeGeometry()
    @background = @initializeBackground @geometry
    @canvas     = @initializeCanvas()
    @setupHTMLElements()
    @initialized= true

  setupHTMLElements: ->
    ($ "#html-elements").fadeIn(200)


  run: ->
    @background.draw(@canvas.context)
    @actor.execute(@canvas)

  initComplete:         -> @initialized == true
  initializeCanvas:     -> new Canvas( @canvas_element, @geometry, @background )
  initializeGeometry:   -> new Geometry( ($ "##{@canvas_element}") )
  initializeBackground: (_geometry) -> new Background(_geometry)

