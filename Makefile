NODE = node
TEST = vows
TESTS ?= test/*-test.js

test:
	@NODE_ENV=test NODE_PATH=lib $(TEST) $(TEST_FLAGS) $(TESTS)

docs: docs/api.html

docs/api.html: lib/passport-dwolla/*.js
	dox \
		--title Passport-Dwolla \
		--desc "Dwolla authentication strategy for Passport" \
		$(shell find lib/passport-dwolla/* -type f) > $@

docclean:
	rm -f docs/*.{1,html}

.PHONY: test docs docclean
