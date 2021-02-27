.PHONY: all clean

all:  street.csv.gz

clean:
	rm -rf {2010-2021}-{01-12}

2020-12:
	curl -Ls 'https://data.police.uk/data/archive/2020-12.zip' | bsdtar -xf- -C .

2017-12:
	curl -Ls 'https://data.police.uk/data/archive/2017-12.zip' | bsdtar -xf- -C .

2014-12:
	curl -Ls 'https://data.police.uk/data/archive/2014-12.zip' | bsdtar -xf- -C .
