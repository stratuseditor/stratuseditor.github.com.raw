./build.sh
jekyll

if [ ! -d _deploy ]; then
  git clone git://github.com/stratuseditor/stratuseditor.github.com.git _deploy
fi

cp -r _site/* _deploy
touch _deploy/.nojekyll
