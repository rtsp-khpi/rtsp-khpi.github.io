#! /bin/bash

if make html; then
	rm -r docs
	mv build/html docs
	touch docs/_static/.nojekyll
fi
