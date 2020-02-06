S64_VERSION=$(mojo get https://sqlite.org/download.html 'table tr:nth-last-child(2) a' text | grep zip | egrep -o '[0-9]{7}')
S64_SHA1=$(mojo get https://sqlite.org/download.html 'table tr:nth-last-child(2) td:last-child' text | grep sha1 | egrep -o '[0-9a-f]{40}')
S64_PATH=$(mojo get https://sqlite.org/download.html script | egrep -o "[0-9]{4}/sqlite-src-$S64_VERSION.zip")
echo "S64_VERSION=$S64_VERSION" > env
echo "$S64_SHA1  sqlite-src-$S64_VERSION.zip" > sqlite-src.sha1
echo "https://www.sqlite.org/$S64_PATH" > sqlite-src.url
git commit -am "[release] $S64_VERSION" && git push
