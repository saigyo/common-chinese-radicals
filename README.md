The 100 most common chinese radicals
====================================

A nicely typeset table of the 100 most common radicals in Chinese characters, 
where all radicals and example characters are hyperlinked to www.archchinese.com.

The original data this work is based on was prepared by Olle Linge, the author of www.hackingchinese.com, for
the article http://www.hackingchinese.com/kickstart-your-character-learning-with-the-100-most-common-radicals/

If you want to recreate the [PDF](https://github.com/saigyo/common-chinese-radicals/raw/with-links/100-most-common-radicals.pdf) from the orginal .txt file you need to
* apply the texify-radicals.awk script to the .txt file to get the .inc file
* xelatex the .tex file with activated -shell-escape

Activated -shell-escape is necessary because for each hyperlinked chinese character xelatex needs to call the urlenc.pl script for url-encoding of the characters, so that we can built correctly encoded URLs.
