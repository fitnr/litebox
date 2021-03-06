# Lightestbox

Create simple lightboxes to pop up images. Lightestbox is library-agnostic, has no dependencies and weighs in at only 3 KB of Javascript and 1 KB of CSS.

Use it with jQuery, Zepto or Ender; or compile it in with Browserify and your favorite tools.

## Boxing

First off, you'll need to include the CSS and JS:

````html
<link rel="stylesheet" href="lightestbox.min.css">
<link rel="stylesheet" href="lightestbox.min.js">
````

Let's say we have this html:

````html
<a id="foo" class="boxy" href="img1.png">Link 1</a>
<a id="bar" class="boxy" href="img2.png">Link 2</a>
<span id="baz" class="boxy" data-img="img3.png">Link 3</span>
````

Once Lightestbox and the DOM are loaded, we can run:

````javascript
var elements = document.getElementsByClassName('lightbox');

var L = new lightestbox(elements);
var more_elements = document.getElementsByClassName('other-elements')
L.add(more_elements);
````

Note that we're not limited to `<a>` tags. Setting a `data-img` attribute will let Lightestbox work nicely with most elements.

## Libraries

But wait, you probably don't want to deal with all that getElementById junk. If you're running Zepto or jQuery, just include the appropriate `lightestbox.*.min.js` file and you can do this:

````javascript
<link rel="stylesheet" href="lightestbox.jquery.min.js">
<script>
$(document).ready(function(){
    $('.boxy').lightestbox();
});
</script>
````

Note that you don't have to include `lightestbox.min.js` if you're using the jQuery or Zepto modules. You will need the CSS, though.

See the `examples` directory for examples using vanilla JS, jQuery and Zepto.

## Captions

Want your image to have a caption? Add a `title` attribute to your link, and that text will be your caption. Don't like the way the caption looks? Write some CSS - the selector is `.lightestbox-wrapper figcaption`.

Don't want your `title` attribute used that way? Read on!

## Options

Lightestbox is a purposefully minimal tool, but there are a few options:

* prefix: By default, the elements created have CSS classes with the prefix 'ltbx'. Useful if you want multiple styles of lightboxes on a single page?
* maxWidth: The maximum width of the images.
* useTitle: When false, Lightestbox ignores the title element and looks for a `data-caption` attribute instead.

Pass arguments just like you would imagine:

````javascript
$('#foo').lightestbox({
    maxWidth: 600, // in pixels
    useTitle: false,
    prefix: 'special'
});
````

If you're using Lightestbox without a library, pass the options as the second argument when you create the Lightestbox object:

````javascript
var L = new lightestbox(false, {useTitle: false});
L.add(elem);
````

## Display style

Lightestbox comes with a bare-bones style for the pop-ups, with the expectation is that developers will customize it. For reference, here are the elements it adds to the DOM:

````html
<div class="ltbx-wrapper" style="width: <dynamic>; height: <dynamic>;">
<!-- lightestbox-wrapper dynamically expands fit the window -->
    <div class="ltbx-loading" style="display: block;">
    <!-- by default, lightestbox-loading has a simple css animation. Grab another one or add a animated gif background-image -->
        <div>Loading...</div>
    </div>
    <figure style="display: block; width: <dynamic>; height: <dynamic>;">
        <img src="img.png">
        <figcaption>Caption</figcaption>
    </figure>
</div>
````
