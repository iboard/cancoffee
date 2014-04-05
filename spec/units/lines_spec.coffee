describe "Lines", ->

  describe "Single line object", ->

    it "initialize with x0,y0, x1,y1, width, and color", ->
      line = new Line( 0,0,10,10, 2, "white" )
      expect(line.x0).toEqual( 0 )
      expect(line.x1).toEqual( 10 )
      expect(line.y0).toEqual( 0 )
      expect(line.y1).toEqual( 10 )
      expect(line.width).toEqual( 2 )
      expect(line.color).toEqual( "white" )

  describe "List of lines", ->

    linesArray = null

    beforeEach ->
      linesArray = new LinesArray(10, lineFactory)

    it "holds a list of lines in an array", ->
      for n in [0..9]
        expect( linesArray.lines[n].x0 ).toEqual( n )
        expect( linesArray.lines[n].y0 ).toEqual( n )
        expect( linesArray.lines[n].x1 ).toEqual( 10*n )
        expect( linesArray.lines[n].y1 ).toEqual( 10*n )
        expect( linesArray.lines[n].width ).toEqual( n )
        expect( linesArray.lines[n].color ).toEqual( "blue" )

