#    Lightestbox - dependency free lightboxes
#    http://github.com/fitnr/lightestbox
#    Copyright (C) 2015-6 Neil Freeman
#    @license GPL v3

main = lightestbox
UGLIFYFLAGS = -c --screw-ie8 --comments

.PHONY: all
all: dist/$(main).cjs.js \
	dist/$(main).min.css \
	dist/$(main).bundle.js \
	dist/$(main).jquery.min.js \
	dist/$(main).zepto.min.js \
	dist/$(main).bundle.min.js

dist/$(main).bundle.min.js: dist/$(main).bundle.js
	node_modules/.bin/uglifyjs $< $(UGLIFYFLAGS) > $@

dist/$(main).bundle.js: $(main).js | dist
	rollup -i $< -f iife -n Lightestbox > $@

dist/$(main).cjs.js: $(main).js | dist
	rollup -i $< -f cjs -n Lightestbox > $@

dist/$(main).%.min.js: lib/%.js $(main).js | dist
	rollup -i $< -f iife -n Lightestbox | node_modules/.bin/uglifyjs $(UGLIFYFLAGS) > $@

dist/%.min.css: css/%.css | dist
	node_modules/.bin/cleancss $^ > $@

dist:; mkdir -p $@
