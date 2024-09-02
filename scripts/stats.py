import sys
from fontTools import ttLib;
font = ttLib.TTFont(sys.argv[1])
try:
    print('{:d}\t{:d}'.format(font['maxp'].numGlyphs, font['GSUB'].table.LookupList.LookupCount))
except:
    # GSUB doesn't exist
    print('{:d}\t{:d}'.format(font['maxp'].numGlyphs, 0))
font.close()
