describe "Line Draw Actor", ->

  actor = null
  canvas = null
  geomentry = null
      
  beforeEach ->
    actor = new LineDrawActor(canvas,geomentry)
    for n in [0..9]
      actor.addLine lineFactory(1)

  it "has a list of lines", ->
    expect( actor.lines.length ).toEqual(10)
