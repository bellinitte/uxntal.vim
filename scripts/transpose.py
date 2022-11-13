# Transforms lines that look like
# ```
# ,&amp;<span class="Type">sublabel</span> <span class="Keyword">JMP</span>
# ```
# into
# ```
# ,&sublabel JMP
#   ^^^^^^^^ Type
#            ^^^ Keyword
# ```

import fileinput
import html
import re

for line in fileinput.input():
    splits = re.split(r'<span class="([^"]*)">([^<]*)</span>', line.rstrip())

    spans = [(html.unescape(splits[0]), '')]

    for i in range(1, len(splits), 3):
        spans.append((html.unescape(splits[i + 1]), splits[i]))
        spans.append((html.unescape(splits[i + 2]), ''))
    
    print(''.join(text for (text, _) in spans))
    
    for i in range(len(spans)):
        (span_text, span_class) = spans[i]

        if span_text != '' and span_class != '':
            print(' ' * sum(len(text) for (text, _) in spans[:i]), end='')
            print('^' * len(spans[i][0]), end='')
            print(f' {spans[i][1]}', end='')
            print()
