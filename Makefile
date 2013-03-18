.PHONY: all
.DEFAULT: all

all:
	@/usr/bin/env npm install

ca-bundler:
	@cd ca-bundle && ../tools/mk-ca-bundle.pl
	@tools/mk-ca-bundle.js

lint:
	@tools/lint.sh

publish: all
	@/usr/bin/env npm publish

tests: test
check: test
test: all lint
	@tools/mocha.sh

doc:
	jsdoc --destination docs lib README.md
	cd docs && git commit --all --message "Auto generated documentation" && git push origin gh-pages
