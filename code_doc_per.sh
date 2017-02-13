#!/bin/sh
limit=0.4
doc=`grep "//.*" test.js  | wc -l`
code=`grep -v "//.*" test.js | wc -l`
val=`bc -l <<< "$doc / $code"`

echo "LoC: $code"
echo "LoD: $doc"
echo "Documentation vs Code Ratio: $val"

if ((`bc <<< "$val>$limit"`))
then
    true
else
    false
fi
