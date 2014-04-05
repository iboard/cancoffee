describe "HTML5 Canvas Application", ->

  app = null
  actor=null

  beforeEach ->
    app = new CanvasApp('main-canvas')
    spyOn  app, 'initializeGeometry'
    spyOn  app, 'initializeBackground'
    spyOn  app, 'initializeCanvas'
    spyOn  app, 'setupHTMLElements'

    actor = app.actor
    for n in [0..9]
      actor.addLine lineFactory(1)
    spyOn  actor, 'execute'

  it "initialize the canvas' context", ->
    expect( app.canvas.context ).toBeDefined()

  it "sets size of canvas to that of the body", ->
    expect( app.canvas.element.width ).toEqual( ($ "#main-canvas").width() )
    expect( app.canvas.element.height ).toEqual( ($ "#main-canvas").height() )

  it "initialize a Geometry-object", ->
    app.initialize()
    expect( app.initializeGeometry ).toHaveBeenCalled()

  it "initialize a Background-object", ->
    app.initialize()
    expect( app.initializeBackground ).toHaveBeenCalled()

  it "initialize the main canvas", ->
    app.initialize()
    expect( app.initializeCanvas ).toHaveBeenCalled()

  it "sets up HTML elements", ->
    app.initialize()
    expect( app.setupHTMLElements ).toHaveBeenCalled()


  it "reports initComplete() as true when done", ->
    expect( app.initComplete ).toBeTruthy()

  it "draws the background before run", ->
    spyOn app.background, "draw"
    app.run()
    expect( app.background.draw ).toHaveBeenCalled()

  it "draws lines through LineDrawActor", ->
    app.run()
    expect( actor.execute ).toHaveBeenCalled()

  it "draws lines when select changes", ->
    ($ "#number-of-lines" ).val(100)
    ($ "#number-of-lines" ).change()
    expect( app.actor.execute ).toHaveBeenCalled()


