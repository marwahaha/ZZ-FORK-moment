#!/bin/bash
mkdir -p typing-tests/test/moment
mkdir -p typing-tests/test/helpers
mkdir -p typing-tests/lib/utils

cp src/test/qunit.js typing-tests/test/qunit.js
cp -r src/lib/utils/* typing-tests/lib/utils/
cp -r src/test/helpers/* typing-tests/test/helpers/

for filename in src/test/moment/*.js; do
    cp ./typing-tests/ts-start-file typing-tests/test/moment/`basename $filename .js`.ts
    cat $filename |  grep -v "import moment" >> typing-tests/test/moment/`basename $filename .js`.ts
done

echo "moment.d.ts" > typing-tests/test/ts-files.txt
find ./typing-tests -name "*.ts" >> typing-tests/test/ts-files.txt

tsc @typing-tests/test/ts-files.txt --allowJs --out ./typing-tests/test/out.js --module "system"
