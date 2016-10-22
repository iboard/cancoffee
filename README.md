# Canvas Application Template And Example

... is a template you can use to start your [Jasmine-driven][jasmine] [Coffeescript]
HTML5-Canvas application. (Based on [coffeemine])

It comes with a _Cakefile_ to watch your source- and spec-files in
`src/coffee` and `spec/units`. Once you fetched the repository from
Github, cd into the project's root and start

    cake assets:watch

Then

  * open `spec/suite.html` in your brower to run the tests.
  * open `public/index.html` in your brower to run the application.

You can see a running implementation at

  * [The Application](https://s3.eu-central-1.amazonaws.com/iboard.core/static/cancoffee/public/index.html)
  * [The Jasime Suite](https://s3.eu-central-1.amazonaws.com/iboard.core/static/cancoffee/spec/suite.html)


# The Application

## index.html

The job of `index.html` is to

  * Load all source-files
  * Define a canvas-element (initially hidden)
  * Define any HTML elements used by the application nested under a div-tag
  with ID 'html-elements' (also hidden first)
  * and finally instantiate the application-object.

## Class CanvasApp

See file `src/app/canvas_app.coffee`. The class is supposed to
initialize a standard HTML5 application using a Canvas-object
and a Gemoetry-object.

It depends on a canvas-element in the html-index-file which you
provide when you instantiate the application. In this example
the canvas-element has a CSS-id of 'main-canvas'.

    app = new CanvasApp( "main-canvas")

This line at the bottom of `public/index.html` does this job.

On top of `canvas_app.coffee` you define an Actor. A coffeescript-class
which responds to `execute()`

Also, you define a method named `installActions` which sets up
jQuery-Callbacks on your individual HTML5-elements/-inputs.

This example-application defines a 'LineDrawActor' which draws a number
of random lines on the canvas. The number of lines can be selected from
the select-element in index.html.
As defined in `CanvasApp.installActions()` the application will run
the Actor's `execute()`-function each time the user selects from the
dropdown.

If you want to write your own Canvas-Application, just write your
own Actor-class and instantiate it in `CanvasApp.initializeActor()`.

All you have to do is to replace 'LineDrawActor' in `index.html` and
`suite.html`.

## Background, and Geometry

### Background

is a coffeescript-class responsible to draw the background of the
application. It is defined in `src/app/background.coffee`. You can change
the behavior of the `draw()`-function to draw any background you want
in your application.

### Geometry

`app/geometry.coffee` sets the size of the canvas-element to the full
size of the html-body. Also, it sets the position to 'fixed', thus
you can place your HTML-elements above the background.

### Lines

is just a helper-class for our example-actor.




[coffeemine]:    https://github.com/iboard/coffeemine
[Jasmine]:       http://jasmine.github.io/
[Coffeescript]:  http://coffeescript.org/
