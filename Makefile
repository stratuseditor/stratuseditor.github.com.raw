
build:
	fractus -l HTML -j ./js/fractus.js -c ./css/fractus.css
	jekyll


deploy:	build
	@if [ ! -d _deploy ]; then \
	  git clone git://github.com/stratuseditor/stratuseditor.github.com.git _deploy; \
	fi
	rm -rf _deploy/*
	cp -r _site/* _deploy
	touch _deploy/.nojekyll
	
	(cd _deploy && git add --all && git commit -am "deploy" && git push origin master)


clean:
	rm -rf _site


test:	build
	jekyll --server


.PHONY: build deploy clean test
