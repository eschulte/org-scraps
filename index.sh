#!/bin/sh

cat <<EOF
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN">
<!-- Created by htmlize-1.36 in css mode. -->
<html>
  <head>
    <title>index.org</title>
    <style type="text/css">
    <!--
      body {
        color: #E6E1DC;
        background-color: #232323;
      }
      .comment {
        /* font-lock-comment-face */
        color: #BC9458;
        font-style: italic;
      }
      .org-document-info {
        /* org-document-info */
        color: #afeeee;
      }
      .org-document-info-keyword {
        /* org-document-info-keyword */
        color: #BC9458;
        font-weight: bold;
      }
      .org-document-title {
        /* org-document-title */
        color: #BC9458;
        font-size: 144%;
        font-weight: bold;
      }
      .org-link {
        /* org-link */
        color: #00ffff;
        text-decoration: underline;
      }

      a {
        color: inherit;
        background-color: inherit;
        font: inherit;
        text-decoration: inherit;
      }
      a:hover {
        text-decoration: underline;
      }
    -->
    </style>
  </head>
  <body>
    <a id="RSS" href="./atom.xml" title="RSS" style="position: absolute; top: 1em; right: 1em;"><img src="rss.png" alt="RSS"></a>
    <pre>
<span class="org-document-info-keyword">#+Title:</span><span class="comment"> </span><span class="org-document-title">Scraps</span>
<span class="org-document-info-keyword">#+Author:</span><span class="comment"> </span><span class="org-document-info">Eric Schulte</span>
<span class="org-document-info-keyword">#+Date:</span><span class="comment"> </span><span class="org-document-info">&lt;$(date +"%Y-%m-%d %a")&gt;</span>

A collection of short Org-mode snippets demonstrating the usage of
code blocks.

EOF

for i in $(ls -r scraps); do
    echo "- <span class=\"org-link\"><a href=\"scraps/$i\">$(echo $i|cut -c12-)</a></span>"
done

cat <<EOF
</pre>
  </body>
</html>
EOF
