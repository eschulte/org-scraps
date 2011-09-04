#!/bin/sh

cat <<EOF
<?xml version="1.0" encoding="utf-8"?>
<feed xmlns="http://www.w3.org/2005/Atom">
 <title>Org-mode scraps</title>
 <link href="http://eschulte.github.com/org-scraps/atom.xml" rel="self"/>
 <link href="http://eschulte.github.com/org-scraps/"/>
 <updated>$(date +%Y-%m-%d:%H:%M:%S%:z)</updated>
 <id>http://eschulte.github.com/org-scraps/</id>
 <author>
   <name>Eric Schulte</name>
   <email>eric.schulte@gmail.com</email>
 </author>"
EOF
for i in scraps/*; do
    title=$(echo $i|cut -c19-|sed 's/.html//')
    date=$(echo $i|cut -c8-17)
    echo "<entry>
   <title>$title</title>
   <link href=\"http://eschulte.github.com/org-scraps/$i\"/>
   <updated>$(date -d $date +%Y-%m-%d:%H:%M:%S%:z)</updated>
   <id>http://eschulte.github.com/org-scraps/$i</id>
   <content type=\"text\">"
    cat $i|awk 'BEGIN{prnt=0}
                     {if ($0 ~ /^<\/pre>$/) prnt=0;
                      if (prnt == 1) print
                      if ($0 ~ /<pre>/) prnt=1;}'
    echo "   </content>\n</entry>"
done
echo "</feed>"
