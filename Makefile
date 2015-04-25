build: node_modules/ assert

test: node_modules/ build lint
	./script/test

lint: node_modules/
	./node_modules/.bin/jshint *.js test/*.js

assert: node_modules/
	./node_modules/.bin/browserify src/assert.js -s assert > test/assert.js

node_modules/:
	npm install

clean:
	rm -rf ./node_modules

.PHONY: build clean lint test saucelabs travis
