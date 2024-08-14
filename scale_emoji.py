
import fontforge
import sys

fontfile = sys.argv[1]

# We take the values from NotoSans-Regular.ttf
ASCENT = 800
DESCENT = 200

font = fontforge.open(fontfile)
# the order matters first em, then ascent and descent
font.em = ASCENT + DESCENT
font.ascent = ASCENT
font.descent = DESCENT
newName = fontfile.replace('-', '{}em-'.format(ASCENT + DESCENT))
font.generate(newName)
font.close()
print(newName)
