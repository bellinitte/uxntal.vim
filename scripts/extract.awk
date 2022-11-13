# Prints all lines between `<pre id='vimCodeElement'>` and `</pre>`

/<pre id='vimCodeElement'>/ {
    isbetween = 1;
    next
}

/<\/pre>/ {
    isbetween = 0
}

isbetween
